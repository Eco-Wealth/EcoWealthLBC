require 'net/http'
require 'json'

# Define the API endpoint
url = URI('https://jsonplaceholder.typicode.com/posts/1')

# Send a GET request
response = Net::HTTP.get(url)

# Parse JSON response
data = JSON.parse(response)

puts data
