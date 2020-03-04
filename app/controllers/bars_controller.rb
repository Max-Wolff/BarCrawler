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
    if @bar.selected == true || @bar.stops.last.group.bars.where(selected: true).count < 7
      @bar.selected = !@bar.selected
      @bar.save
    end
  end
end
