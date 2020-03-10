require 'rqrcode'
require 'barby'
require 'barby/barcode'
require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'

require_relative '../services/google_maps_directions_api'
require_relative '../services/mapbox_directions_api'

class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @bars = @group.bars

    @markers = @bars.map do |bar|
      {
        lat: bar[:latitude],
        lng: bar[:longitude],
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('golden-marker-fancy.png')
      }
    end
  end

  def shared
    @group = Group.find_by_token(params[:token])
    @bars = @group.bars
    @stops = @group.stops
    @route = directions(@bars)

    @markers = @bars.map do |bar|
      {
        lat: bar[:latitude],
        lng: bar[:longitude],
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('beer-icon.png')
      }
    end

    barcode = Barby::QrCode.new("http://barcrawler.club/group/shared/#{@group.token}/1", level: :q, size: 10)
    base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    @qr_code = "data:image/png;base64,#{base64_output}"
  end

  def edit
    @group = Group.find(params[:id])
    if request.user_agent =~ /Mobile/
      params[:bar][:ids].strip.split(' ').each do |id|
        @bar = Bar.find(id)
        @bar.selected = true
        @bar.save
      end
    end
  end

  def update
    token = ''
    25.times do
      token += ('a'..'z').to_a.sample
    end
    @bars = Group.find(params[:id]).bars.geocoded.where(selected: true)
    @group = Group.new(token: token, name: params[:group][:name])

    scraper = GoogleMapsScraper.new(@bars)
    order = scraper.bar_order[:comb]

    order.each_with_index do |bar, ind|
      stop = Stop.new(rank: (ind + 1))
      stop.group = @group
      stop.bar = bar
      stop.save
    end

    @group.save
    redirect_to unique_group_path(token)
  end

  def leaderboard
    @group = Group.find_by_token(params[:token])
    @drink_stops = @group.drink_stops
    @stops = @group.stops
    @max_drinks = @group.stops.map { |stop| @drink_stops.where(stop: stop).count }.sort.last
  end
end
