require_relative '../services/mapbox_directions_api'

class StopsController < ApplicationController
  def show
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])
    @next_stop = @group.stops.find_by_rank(params[:rank].to_i + 1)
    @last_stop = @group.stops.count

    if params[:rank] == '1'
      prev_stop = {latitude: 52.536821, longitude: 13.394921}
      @markers = [{ lat: prev_stop[:latitude], lng: prev_stop[:longitude], infoWindow: render_to_string(partial: "shared/current_location"), image_url: helpers.asset_url("route-1.png") }]
      @markers << { lat: @stop.bar[:latitude], lng: @stop.bar[:longitude], infoWindow: render_to_string(partial: "groups/info_window", locals: { bar: @stop.bar }), image_url: helpers.asset_url("route-2.png") }
    else
      prev_stop = @group.stops.find_by_rank(params[:rank].to_i - 1).bar
      @markers = [prev_stop, @stop.bar].each_with_index.map do |bar, index|
        {
          lat: bar[:latitude],
          lng: bar[:longitude],
          infoWindow: render_to_string(partial: "groups/info_window", locals: { bar: bar }),
          image_url: helpers.asset_url("route-#{index + 1}.png")
        }
      end
    end

    @route = directions([prev_stop, @stop.bar])
  end

  def select
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])

    @drinks = []
    @drinks_object = []
    Drink.all.each do |drink|
      @drinks << drink.picture_url
      @drinks_object << drink
    end
  end

  def wheel
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])

    @drinks = []
    @drinks_object = []

    params[:drink][:ids].strip.split(' ').each do |id|
      drink = Drink.find(id)
      @drinks << drink.picture_url
      @drinks_object << drink
    end

    @end = rand(360)
    @selected_drink = @drinks_object[@end/(360/@drinks_object.length)]
    DrinkStop.create(drink: @selected_drink, stop: @stop)
  end

  def game
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])
  end

end
