require 'json'
require 'open-uri'


def foursquare_modified_api_call(params)
  @bar_hash = {}
  @filtered_bars = []
  @client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID_KEY'], :client_secret => ENV['CLIENT_SECRET_KEY'])

  search_text = form_params[:address]
  if search_text.empty? == true
    search_text = Bar.last.address
  end

  url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{search_text}.json?access_token=#{ENV['MAPBOX_API_KEY']}"
  url.gsub!(/\P{ASCII}/, 'ss')
  doc = JSON.parse(open(URI.encode(url)).read)
  json_hash = doc["features"]
  coordinates = json_hash[0]["center"].reverse().join(",")

  form_price = form_params[:price_tier]
  form_radius = form_params[:radius].to_i * 500

  final_ids = []

  form_params[:select_bars].nil? ? bar_category = "" : bar_category = form_params[:select_bars]
  form_params[:select_lounges].nil? ? lounges_category = "" : lounges_category = form_params[:select_lounges]
  form_params[:select_nightclubs].nil? ? nightclubs_category = "" : nightclubs_category = form_params[:select_nightclubs]
  form_params[:select_breweries].nil? ? breweries_category = "" : breweries_category = form_params[:select_breweries]

  final_ids << bar_category
  final_ids << lounges_category
  final_ids << nightclubs_category
  final_ids << breweries_category

  final_ids.delete("")

  limit_of_items = 12 / final_ids.count

  @all_locations = []

  final_ids.each do |id|
    location = @client.search_venues(:ll => coordinates, :radius => form_radius, :limit => limit_of_items, :categoryId => id, :v => '20200101')
    @all_locations << location
  end


  @all_locations.each do |location_of_category|

    location_of_category.venues.each do |location|



      # Pulling basic bar information out of foursquare search API
      bar_name = location.name
      bar_address = "#{location.location.address}, #{location.location.postalCode} #{location.location.city}"
      bar_lat = location.location.lat
      bar_lng = location.location.lng
      bar_category = location.categories[0].name

      # Calling the details mehod of new API Call to get
      details = @client.venue(location.id, :v => '20200101')

      if defined?(details.attributes.groups[0].items[0].priceTier)
        price_tier = details.attributes.groups[0].items[0].priceTier
      else
        price_tier = [1, 2, 3].sample
      end

      if price_tier <= form_params[:price_tier].to_i

        if defined?(details.hours)
          weekly_opening_hours = details.hours.timeframes[0].days
          open_until = details.hours.status
          if open_until.scan(/\d\W\d\d.../)[0].nil? == false
            open_hours_until = "Until " + open_until.scan(/\d\W\d\d.../)[0]
          else
            open_hours_until = open_until.split().last
          end
          open_today = details.hours.timeframes[0].includesToday
        else
          weekly_opening_hours = "Mo-So"
          open_hours_until = "Open Until 3am"
          open_today = true
        end

        if defined?(details.rating)
          rating = details.rating / 2
        else
          rating = [1, 2, 3, 4, 5].sample
        end

        if defined?(details.bestPhoto)
          photo_url = "#{details.bestPhoto.prefix}#{details.bestPhoto.height}x#{details.bestPhoto.width}#{details.bestPhoto.suffix}"
        else
          photo_url = ""
        end

        @bar_hash = {name: bar_name, address: bar_address, latitude: bar_lat, longitude: bar_lng, category: bar_category, open_until: open_hours_until, open_weekly: weekly_opening_hours, open_today: open_today, price: price_tier, rating: rating, photo_url: photo_url}
        @filtered_bars << @bar_hash
      end
    end
    @filtered_bars
  end
end
