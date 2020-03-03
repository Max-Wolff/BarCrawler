require 'json'
require 'open-uri'

def directions(bars)
  bar_latlon = ''
  bars.each do |bar|
    bar_latlon += "#{bar.longitude},#{bar.latitude};"
  end
  url = "https://api.mapbox.com/directions/v5/mapbox/walking/#{bar_latlon[0...-1]}?geometries=geojson&access_token=#{ENV['MAPBOX_DIR_API_KEY']}"
  serialized = open(url).read
  result = JSON.parse(serialized)
  coordinates = result['routes'].first['geometry']['coordinates']

  return coordinates
end
