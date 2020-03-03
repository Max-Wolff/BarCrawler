require_relative '../services/foursquare_api'

class BarsController < ApplicationController
  # resources :bars, only: [:index]
  def index
    @bars_array = Bar.all
    # foursquare
  end
end
