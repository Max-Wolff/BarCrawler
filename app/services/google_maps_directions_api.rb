require 'google_maps_service'

gmaps = GoogleMapsService::Client.new(key: ENV['GMAPS_API_KEY'])

routes = gmaps.directions(
    'Ebertystrasse 54, Berlin, Germany',
    'Rudi-Dutschke_strasse 26, Berlin, Germany',
    mode: 'walking',
    alternatives: false)

puts routes
