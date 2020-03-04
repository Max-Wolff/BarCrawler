class StopsController < ApplicationController
  def show
    @stop = Stop.find_by_rank(params[:rank])
    @next_stop = Stop.find_by_rank(params[:rank].to_i + 1)
    @group = @stop.group
    @last_stop = @group.stops.count
  end
end
