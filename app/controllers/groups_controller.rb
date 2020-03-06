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
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar })
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
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar })
      }
    end

    barcode = Barby::QrCode.new("http://barcrawler.club/group/shared/#{@group.token}/1", level: :q, size: 10)
    base64_output = Base64.encode64(barcode.to_png({ xdim: 5 }))
    @qr_code = "data:image/png;base64,#{base64_output}"
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @bars = Group.find(params[:id]).bars.geocoded.where(selected: true)
    @group = Group.new(token: params[:authenticity_token], name: params[:group][:name])

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
