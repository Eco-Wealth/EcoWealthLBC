import requests

# Define the API endpoint
url = 'https://jsonplaceholder.typicode.com/posts/1'

# Send a GET request
response = requests.get(url)

# Check the response status code
if response.status_code == 200:
    data = response.json()
    print(data)
else:
    print('Failed to fetch data.')
