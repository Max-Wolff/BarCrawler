class BarsController < ApplicationController
  # resources :bars, only: [:index]
  def index
    @client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID_KEY'], :client_secret => ENV['CLIENT_SECRET_KEY'])
    @locations = @client.search_venues(:ll => '52.507405,13.392278', :radius => '5000', :limit => '20', :categoryId => '', :v => '20191222')
    raise
    @bars = Bar.all
  end
end
