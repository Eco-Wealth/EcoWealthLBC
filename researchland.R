# Load necessary libraries (install if not already installed)
if (!requireNamespace("httr", quietly = TRUE)) {
  install.packages("httr")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}

library(httr)
library(jsonlite)

# Define the base URL for land listings API (replace with your actual API URL)
LAND_API_URL <- "https://example.com/land-listings-api"

fetch_land_listings <- function(location, max_price, min_size) {
  tryCatch({
    # Define query parameters
    query_params <- list(
      location = location,
      max_price = max_price,
      min_size = min_size
    )

    # Build the complete API URL
    api_url <- modify_url(LAND_API_URL, query = query_params)

    # Send a GET request to the land listings API
    response <- GET(api_url)

    # Check the response status
    if (status_code(response) == 200) {
      land_listings <- content(response, "parsed")
      return(land_listings)
    } else {
      cat("Failed to retrieve land listings. Please try again later.\n")
      return(NULL)
    }
  }, error = function(e) {
    cat(paste("An error occurred: ", e$message, "\n"))
    return(NULL)
  })
}

display_land_listings <- function(land_listings) {
  if (is.null(land_listings) || length(land_listings) == 0) {
    cat("No matching land listings found.\n")
  } else {
    cat("Matching Land Listings:\n")
    for (listing in land_listings) {
      cat("Location: ", listing$location, "\n")
      cat("Price: $", listing$price, "\n")
      cat("Size: ", listing$size, " acres\n")
    }
  }
}

main <- function() {
  cat("Land Research and Location Program\n")
  location <- readline("Enter location: ")
  max_price <- as.numeric(readline("Enter maximum price ($): "))
  min_size <- as.numeric(readline("Enter minimum land size (acres): "))

  land_listings <- fetch_land_listings(location, max_price, min_size)
  display_land_listings(land_listings)
}

main()
