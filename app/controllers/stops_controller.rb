require_relative '../services/mapbox_directions_api'

class StopsController < ApplicationController
  def show
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])
    @next_stop = @group.stops.find_by_rank(params[:rank].to_i + 1)
    @last_stop = @group.stops.count

    if params[:rank] == '1'
      prev_stop = {latitude: 52.5125277, longitude: 13.387167799999999}
      @markers = [{ lat: prev_stop[:latitude], lng: prev_stop[:longitude], infoWindow: render_to_string(partial: "shared/current_location") }]
      @markers << { lat: @stop.bar[:latitude], lng: @stop.bar[:longitude], infoWindow: render_to_string(partial: "groups/info_window", locals: { bar: @stop.bar }) }
    else
      prev_stop = @group.stops.find_by_rank(params[:rank].to_i - 1).bar
      @markers = [prev_stop, @stop.bar].map do |bar|
        {
          lat: bar[:latitude],
          lng: bar[:longitude],
          infoWindow: render_to_string(partial: "groups/info_window", locals: { bar: bar }),
          image_url: helpers.asset_url("beer-icon.png")
        }
      end
    end

    @route = directions([prev_stop, @stop.bar])
  end

  def wheel
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])

    @drinks = []
    drinks_object = []
    Drink.all.each do |drink|
      @drinks << drink.picture_url
      drinks_object << drink
    end
    @end = rand(360)
    @selected_drink = drinks_object[@end/(360/drinks_object.length)]
  end

  def game
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])
  end

end
