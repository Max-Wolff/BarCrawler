class StopsController < ApplicationController
  def show
    @stop = Stop.find_by_rank(params[:rank])
  end
end
