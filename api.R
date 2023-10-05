library(httr)
library(jsonlite)

# Define the API endpoint
url <- 'https://jsonplaceholder.typicode.com/posts/1'

# Send a GET request
response <- GET(url)

# Check the response status code
if (status_code(response) == 200) {
  data <- content(response, 'parsed')
  print(data)
} else {
  cat('Failed to fetch data.\n')
}
