require_relative '../services/foursquare_api'

class BarsController < ApplicationController

  def index
    # foursquare
    bars = Bar.first(10)
    @group = Group.create
    bars.each do |bar|
      Stop.create(group: @group, bar: bar)
    end

    redirect_to show_group_path(@group)
  end

  def update
    @bar = Bar.find(params[:id])
    group = @bar.stops.last.group
    if group.bars.where(selected: true) < 7 || @bar.selected = false
      @bar.selected = !@bar.selected
    end
  end
end
