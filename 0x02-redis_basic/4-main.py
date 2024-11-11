#!/usr/bin/env python3
"""Testing the Cache replay function from exercise.py"""

from exercise import Cache, replay

if __name__ == "__main__":
    cache = Cache()
    cache.store("foo")
    cache.store("bar")
    cache.store(42)

    # Call the replay function to display the history of Cache.store calls
    replay(cache.store)
