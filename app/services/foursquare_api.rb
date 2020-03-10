require 'nokogiri'
require 'open-uri'

def foursquare_api_call(params)
  @bar_hash = {}
  @bars_array = []
  @client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID_KEY'], :client_secret => ENV['CLIENT_SECRET_KEY'])

  search_text = search_params[:search]
  url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{search_text}.json?access_token=#{ENV['MAPBOX_API_KEY']}"
  doc = JSON.parse(open(URI.encode(url)).read)
  json_hash = doc["features"]
  coordinates = json_hash[0]["center"].reverse().join(",")

  @locations = @client.search_venues(:ll => coordinates, :radius => '2000', :limit => '4', :categoryId => '4bf58dd8d48988d116941735', :v => '20200101')

  @locations.venues.each do |location|

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

    if price_tier <= 3

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
      @bars_array << @bar_hash
    end
  end
  @bars_array
end
