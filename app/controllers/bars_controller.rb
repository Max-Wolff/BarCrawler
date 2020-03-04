require_relative '../services/foursquare_api'

class BarsController < ApplicationController

  def index
    # Comment out to use foursquare API --> Only Max as of 04/March
    # foursquare

    # In Progress for altering foursquare dynamically
    # form_params
    # if form_params["commit"] == "Search"
    #   puts "Hello World"
    # end

    bars = Bar.first(10)
    @group = Group.create
    bars.each do |bar|
      Stop.create(group: @group, bar: bar)
    end

    # FOURSQUARE
    # @group = Group.create
    # @bars_array.each do |bar_hash|
    #   bar = Bar.create(bar_hash)
    #   Stop.create(group: @group, bar: bar)
    # end

    redirect_to show_group_path(@group)
  end

  def update
    @bar = Bar.find(params[:id])
    group = @bar.stops.last.group
    if group.bars.where(selected: true) < 7 || @bar.selected = false
      @bar.selected = !@bar.selected
    end
  end

  private

  def form_params
    params.permit(:address, :price_tier, :radius, :select_bars, :select_nightclubs, :select_lounges, :select_breweries, :commit)
  end
end
