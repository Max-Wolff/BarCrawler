class StopsController < ApplicationController
  def show
    @group = Group.find_by_token(params[:token])
    @stop = @group.stops.find_by_rank(params[:rank])
    @next_stop = @group.stops.find_by_rank(params[:rank].to_i + 1)
    @last_stop = @group.stops.count
  end
end
