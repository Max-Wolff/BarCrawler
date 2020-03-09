require_relative '../services/foursquare_api'
require_relative '../services/foursquare_modifier_api'

class BarsController < ApplicationController

  def index
    # <<<< FOURSQUARE >>>>>
    # form_params

    # if form_params["commit"] == "Search"
    #   foursquare_modified_api_call(form_params)
    #   @group = Group.last
    #   @group.stops.delete_all
    #   @filtered_bars.each do |bar_hash|
    #     bar = Bar.create(bar_hash)
    #     Stop.create(group: @group, bar: bar)
    #   end
    # end

    # if @group.nil? == true
    #   search_params
    #   @group = Group.create
    #   foursquare_api_call(search_params)
    #   @bars_array.each do |bar_hash|
    #     bar = Bar.create(bar_hash)
    #     Stop.create(group: @group, bar: bar)
    #   end
    # end
    # <<<< FOURSQUARE >>>>>

    # <<< WITHOUT FOURSQUARE >>>>
    bars = Bar.first(10)
    @group = Group.create
    bars.each do |bar|
      Stop.create(group: @group, bar: bar)
    end
    # <<< WITHOUT FOURSQUARE >>>>

    redirect_to show_group_path(@group)
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.selected == true || @bar.stops.last.group.bars.where(selected: true).count < 7
      @bar.selected = !@bar.selected
      @bar.save
    end
  end

  private

  def form_params
    params.permit(:address, :price_tier, :radius, :select_bars, :select_nightclubs, :select_lounges, :select_breweries, :commit)
  end

  def search_params
    params.permit(:authenticity_token, :search, :button)
  end
end
