require_relative '../services/foursquare_api'

class BarsController < ApplicationController
  def index
    # foursquare
    @bars_array = []
    hash_one = {name: "Ähm",rating: 2.7, address:"Neukölnstrasse 12, 1232 Berlin", price: 1, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: false}
    hash_two = {name: "Muted Horn",rating: 4.2, address:"Flughafenstr 49, 12053 Berlin", price: 2, photo_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 12:00 PM", open_today: true}
    @bars_array << hash_one
    @bars_array << hash_two
  end
end
