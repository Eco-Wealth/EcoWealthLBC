require 'net/http'
require 'json'

# Define the base URL for land listings API (replace with your actual API URL)
LAND_API_URL = 'https://example.com/land-listings-api'

def fetch_land_listings(location, max_price, min_size)
  begin
    # Define query parameters
    query_params = {
      location: location,
      max_price: max_price,
      min_size: min_size
    }

    # Build the complete API URL
    api_url = URI("#{LAND_API_URL}?#{URI.encode_www_form(query_params)}")

    # Send a GET request to the land listings API
    response = Net::HTTP.get(api_url)

    # Parse JSON response
    land_listings = JSON.parse(response)

    return land_listings
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
    return []
  end
end

def display_land_listings(land_listings)
  if land_listings.empty?
    puts 'No matching land listings found.'
  else
    puts 'Matching Land Listings:'
    land_listings.each do |listing|
      puts "Location: #{listing['location']}"
      puts "Price: $#{listing['price']}"
      puts "Size: #{listing['size']} acres"
    end
  end
end

def main
  puts 'Land Research and Location Program'
  print 'Enter location: '
  location = gets.chomp
  print 'Enter maximum price ($): '
  max_price = gets.to_f
  print 'Enter minimum land size (acres): '
  min_size = gets.to_f

  land_listings = fetch_land_listings(location, max_price, min_size)
  display_land_listings(land_listings)
end

main
