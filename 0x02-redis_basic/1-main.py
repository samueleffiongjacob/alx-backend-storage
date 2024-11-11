#!/usr/bin/env python3
"""Testing the Cache class from exercise.py"""

from exercise import Cache


def test_cache():
    """Function to test Cache class methods"""
    cache = Cache()
    TEST_CASES = {
        b"foo": None,
        123: int,
        "bar": lambda d: d.decode("utf-8")
    }

    for value, fn in TEST_CASES.items():
        key = cache.store(value)
        assert cache.get(key, fn=fn) == value
        # below if u want to see result
        """retrieved_value = cache.get(key, fn=fn)
        print(f"Original: {value}, Retrieved: {retrieved_value}")
        assert retrieved_value == value"""


# Only run tests if this script is executed directly
if __name__ == "__main__":
    test_cache()
