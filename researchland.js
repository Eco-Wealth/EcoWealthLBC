const fetch = require('node-fetch');

// Define the base URL for land listings API (replace with your actual API URL)
const LAND_API_URL = 'https://example.com/land-listings-api';

async function fetchLandListings(location, maxPrice, minSize) {
    try {
        // Define query parameters
        const queryParams = new URLSearchParams({
            location,
            maxPrice,
            minSize,
        });

        // Build the complete API URL
        const apiUrl = `${LAND_API_URL}?${queryParams}`;

        // Send a GET request to the land listings API
        const response = await fetch(apiUrl);

        // Check the response status
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        // Parse JSON response
        const landListings = await response.json();

        return landListings;
    } catch (error) {
        console.error(`An error occurred: ${error.message}`);
        return [];
    }
}

function displayLandListings(landListings) {
    if (!landListings.length) {
        console.log('No matching land listings found.');
        return;
    }

    console.log('Matching Land Listings:');
    landListings.forEach(listing => {
        console.log(`Location: ${listing.location}`);
        console.log(`Price: $${listing.price}`);
        console.log(`Size: ${listing.size} acres`);
    });
}

async function main() {
    console.log('Land Research and Location Program');
    const location = prompt('Enter location: ');
    const maxPrice = parseFloat(prompt('Enter maximum price ($): '));
    const minSize = parseFloat(prompt('Enter minimum land size (acres): '));

    const landListings = await fetchLandListings(location, maxPrice, minSize);
    displayLandListings(landListings);
}

main();
