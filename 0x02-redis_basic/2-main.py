#!/usr/bin/env python3
""" Main file """

Cache = __import__('exercise').Cache  # Import Cache class from the module

cache = Cache()

# Store data and check call count
cache.store(b"first")
print(cache.get(cache.store.__qualname__))  # Should print call count as b"1"


cache.store(b"second")
cache.store(b"third")
print(cache.get(cache.store.__qualname__))  # Should print call count as b"3"
