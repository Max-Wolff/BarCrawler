class BarsController < ApplicationController
  # resources :bars, only: [:index]
  def index
    @bars = Bar.where(open_today: true)
  end
end
