require 'google_maps_service'

class GoogleMapsScraper

  # bars will be an array of bars
  def initialize(bars)
    @bars = bars
  end

  def routes
gmaps = GoogleMapsService::Client.new(key: ENV['GMAPS_API_KEY'])

routes = gmaps.directions(
    'Ebertystrasse 54, Berlin, Germany',
    'Rudi-Dutschke_strasse 26, Berlin, Germany',
    mode: 'walking',
    alternatives: false)

end
