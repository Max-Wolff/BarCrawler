require 'google_maps_service'
require_relative 'brute_force_distance'

class GoogleMapsScraper
  attr_reader :bar_order

  # bars will be an array of bars
  def initialize(bars)
    @bars = bars
    @gmaps = GoogleMapsService::Client.new(key: ENV['GMAPS_API_KEY'])
    @distances = request_distances

    # brute_force returns a hash like this: {comb: [bar1, bar2, bar3], dist: 9999 }. dist is the time in seconds for the complete route
    @bar_order = brute_force(@bars, @distances)
  end

  private

  def request_distances
    distances = {}

    @bars[0...-1].each_with_index do |bar, ind|
      temp = {}
      @bars[(ind + 1)..].each do |other|
        # route.first[:legs].first[:duration][:value] returns duration in seconds
        temp[other] = @gmaps.directions({ bar.latitude, bar.longitude }, { other.latitude, other.longitude }, mode: 'walking', alternatives: false).first[:legs].first[:duration][:value]
      end
      distances[bar] = temp
    end

    # will return a hash of hashes: {bar1: {bar2: 803, bar3: 210, bar4: 723}, bar2: {bar3: 605, bar4: 332}, bar3: {bar4: 100}}
    return distances
  end
end
