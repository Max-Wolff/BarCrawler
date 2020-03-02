require_relative '../services/foursquare_api'

class BarsController < ApplicationController
  # resources :bars, only: [:index]
  def index
    foursquare
  end
end
