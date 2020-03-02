class FouresquareScraper
  @client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID_KEY'], :client_secret => ENV['CLIENT_SECRET_KEY'])
  @locations = @client.search_venues(:ll => '52.507405,13.392278', :radius => '5000', :limit => '20', :categoryId => '4d4b7105d754a06376d81259', :v => '20200101')
end
