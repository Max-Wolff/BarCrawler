class StopsController < ApplicationController
  def show
    @stop = Stop.find_by_rank(params[:rank])
    @next_stop = Stop.find_by_rank(params[:rank] + 1)
  end
end
