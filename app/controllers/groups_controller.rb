require_relative '../services/google_maps_directions_api'

class GroupsController < ApplicationController

  def show
    @group = Group.find_by_token(params[:token])
  end

  def new
    @group = Group.new
  end

  def create
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
  end
end
