#!/usr/bin/env python3
'''Testing the get_page function from web.py'''

import time
from web import get_page, redis_store

# URL for testing with a delay (e.g., 2 seconds)
test_url = "http://slowwly.robertomurray.co.uk/delay/2000/url/http://example.com"

# Access the URL multiple times and print out the results
print("Fetching content the first time...")
print(get_page(test_url))  # This should take some time (2 seconds) initially.

print("Fetching content a second time (within cache period)...")
print(get_page(test_url))  # This should be instantaneous if cached.

# Check the access count
count_key = f"count:{test_url}"
print(f"Access count: {redis_store.get(count_key).decode('utf-8')}")

# Wait 10 seconds for cache to expire, then fetch again
time.sleep(10)

print("Fetching content after cache expiration...")
print(get_page(test_url))  # This should take time again since cache expired.

# Final access count after cache expiration and refetch
print(f"Access count: {redis_store.get(count_key).decode('utf-8')}")
