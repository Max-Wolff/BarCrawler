require_relative '../services/google_maps_directions_api'

class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @bars = @group.bars

    @markers = @bars.map do |bar|
      {
        lat: bar[:latitude],
        lng: bar[:longitude],
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar })
      }
    end
  end

  def shared
    @group = Group.find_by_token(params[:token])
    @bars = @group.bars.where(selected: true)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @bars = Bar.geocoded.first(5)
    @group = Group.create(token: params[:authenticity_token], name: params[:group][:name])

    scraper = GoogleMapsScraper.new(@bars)
    order = scraper.bar_order[:comb]

    order.each_with_index do |bar, ind|
      stop = Stop.new(rank: (ind + 1))
      stop.group = @group
      stop.bar = bar
      stop.save
    end

    @group.save
    redirect_to unique_group_path(params[:authenticity_token])
  end
end
