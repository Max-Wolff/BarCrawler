require 'google_maps_service'

class GoogleMapsScraper

  # bars will be an array of bars
  def initialize(bars)
    @bars = bars
    @gmaps = GoogleMapsService::Client.new(key: ENV['GMAPS_API_KEY'])
  end

  def distances
    routes = []
    coordinates = @bars.map { |bar| lat: bar.latitude, lng: bar.longitude }

    (coordinates.length - 1).times do |ind|
      routes << @gmaps.directions(coordinate[ind], coordinate[ind + 1], mode: 'walking', alternatives: false)
    end

    return routes
  end
end
