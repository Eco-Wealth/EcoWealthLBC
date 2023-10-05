import requests

# Define the base URL for land listings API (replace with your actual API URL)
LAND_API_URL = "https://example.com/land-listings-api"

def fetch_land_listings(location, max_price, min_size):
    try:
        # Define query parameters
        params = {
            "location": location,
            "max_price": max_price,
            "min_size": min_size,
        }

        # Send a GET request to the land listings API
        response = requests.get(LAND_API_URL, params=params)

        # Check the response status code
        response.raise_for_status()

        # Parse JSON response
        land_listings = response.json()

        return land_listings

    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
    except ValueError as e:
        print(f"Error parsing JSON response: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

    return []

def display_land_listings(land_listings):
    if not land_listings:
        print("No matching land listings found.")
        return

    print("Matching Land Listings:")
    for listing in land_listings:
        print(f"Location: {listing['location']}")
        print(f"Price: ${listing['price']}")
        print(f"Size: {listing['size']} acres")

def main():
    print("Land Research and Location Program")
    location = input("Enter location: ")
    max_price = float(input("Enter maximum price ($): "))
    min_size = float(input("Enter minimum land size (acres): "))

    land_listings = fetch_land_listings(location, max_price, min_size)
    display_land_listings(land_listings)

if __name__ == "__main__":
    main()
