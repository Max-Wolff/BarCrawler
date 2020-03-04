require_relative '../services/foursquare_api'

class BarsController < ApplicationController

  def index
    # foursquare
    form_params
    if form_params["commit"] == "Search"
      puts "Hello World"
    end
    hash_one = {name: "Ähm",rating: 2.7, address:"Neukölnstrasse 12, 1232 Berlin", price: 1, picture_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 1:00 AM", open_today: false}
    hash_two = {name: "Muted Horn",rating: 4.2, address:"Flughafenstr 49, 12053 Berlin", price: 2, picture_url:"https://www.jaz-hotel.com/cache/images/wolframslider3_008a741a8a741a5d7a33e2-1-1.jpg", category:"Bar", open_until: "Open until 12:00 PM", open_today: true}
    bar1 = Bar.create(hash_one)
    bar2 = Bar.create(hash_two)
    @group = Group.create
    Stop.create(group: @group, bar: bar1)
    Stop.create(group: @group, bar: bar2)

    redirect_to show_group_path(@group)
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.selected = !@bar.selected
  end

  private

  def form_params
    params.permit(:address, :price_tier, :radius, :select_bars, :select_nightclubs, :select_lounges, :select_breweries, :commit)
  end
end
