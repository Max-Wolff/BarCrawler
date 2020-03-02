def foursquare
  @bar_hash = {}
  @bars_array = []
  @client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID_KEY'], :client_secret => ENV['CLIENT_SECRET_KEY'])

  call_foursquare_search_api

  @locations.venues.each do |location|

    # Pulling basic bar information out of foursquare search API
    bar_name = location.name
    bar_address = "#{location.location.address}, #{location.location.postalCode} #{location.location.city}, #{location.location.cc}"
    bar_lat = location.location.lat
    bar_lng = location.location.lng
    bar_category = location.categories[0].name


    # Calling the details mehod of new API Call to get
    details = @client.venue(location.id, :v => '20200101')

    if defined?(details.hours)
      weekly_opening_hours = details.hours.timeframes[0].days
      open_hours_until = details.hours.status
      open_today = details.hours.timeframes[0].includesToday
    else
      weekly_opening_hours = ""
      open_hours_until = ""
      open_today = ""
    end

    if defined?(details.attributes.groups[0].items[0])
      price_tier = details.attributes.groups[0].items[0].priceTier
    else
      price_tier = ""
    end

    if defined?(details.rating)
      rating = details.rating
    else
      rating = 0
    end

    if defined?(details.bestPhoto)
      photo_url = "#{details.bestPhoto.prefix}#{details.bestPhoto.height}x#{details.bestPhoto.width}#{details.bestPhoto.suffix}"
    else
      photo_url = ""
    end


    @bar_hash = {name: bar_name, address: bar_address, latitude: bar_lat, longitude: bar_lng, category: bar_category, open_until: open_hours_until, open_weekly: weekly_opening_hours, open_today?: open_today, price: price_tier, rating: rating, photo_url: photo_url}
    @bars_array << @bar_hash
  end
  @bars_array
end

def call_foursquare_search_api
  @locations = @client.search_venues(:ll => '52.507405,13.392278', :radius => '2000', :limit => '20', :categoryId => '4bf58dd8d48988d116941735', :v => '20200101')
end
