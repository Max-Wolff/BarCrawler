class BarsController < ApplicationController
  # resources :bars, only: [:index]
  def index
    @bars = Bar.all
  end
end
