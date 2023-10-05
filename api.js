const fetch = require('node-fetch');

// Define the API endpoint
const url = 'https://jsonplaceholder.typicode.com/posts/1';

// Send a GET request
fetch(url)
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('Failed to fetch data:', error));
