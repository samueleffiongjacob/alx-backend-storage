#!/usr/bin/env python3
""" Module for Redis db """
import redis  # imports the Redis client library.
from uuid import uuid4  # generates a unique identifier for each key.
from typing import Union, Callable, Optional
from functools import wraps


UnionOfTypes = Union[str, bytes, int, float]
""""is a type alias that lets you handle multiple data types
    (strings, bytes, integers, and floats) in the store and
     get methods."""

# task 2


def count_calls(method: Callable) -> Callable:
    """
    Decorator to count the number of calls to a method.

    Args:
        method (Callable): The method to be decorated.

    Returns:
        Callable: The decorated method with counting functionality.
    """
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """Wrapper function to increment call count
         each time method is called.
         or
         Use method's qualified name for unique count key"""
        key = method.__qualname__
        self._redis.incr(key)  # Increment count in Redis
        return method(self, *args, **kwargs)
    return wrapper

# task 3


def call_history(method: Callable) -> Callable:
    """
    Decorator to store the history of inputs
    and outputs for a particular function.

    Args:
        method (Callable): The method to be decorated.

    Returns:
        Callable: The decorated method with history tracking functionality.
    """
    @wraps(method)
    def wrapper(self, *args, **kwargs):
        input_key = f"{method.__qualname__}:inputs"
        output_key = f"{method.__qualname__}:outputs"

        # Store the input arguments as a string in the inputs list
        self._redis.rpush(input_key, str(args))

        # Execute the original method and store the output
        output = method(self, *args, **kwargs)

        # Store the output in the outputs list
        self._redis.rpush(output_key, str(output))

        return output
    return wrapper

# task 0 and 1


class Cache:
    """ Class for methods that operate a caching system for initializes"""

    def __init__(self):
        """ Instance of the Redis db """
        self._redis = redis.Redis()
        self._redis.flushdb()  # Clear the database for testing purposes

    @count_calls  # this was add because of task 2
    # above to count the store value
    @call_history  # for the 3 task to show storing list
    def store(self, data: UnionOfTypes) -> str:
        """
        Method takes a data argument and returns a string
        or
        Store data in Redis and return the key.

        Args:
            data (UnionOfTypes): The data to store in Redis.

        Returns:
            str: The key associated with the stored data.
        """
        self._key = str(uuid4())
        self._redis.set(self._key, data)
        return self._key

    def get(self, key: str,
            fn: Optional[Callable] = None) -> UnionOfTypes:
        """
        Retrieves data stored in redis using a key
        converts the result/value back to the desired format
        Args:
            key (str): The key for the data.
            fn (Optional[Callable]): A function to convert the data format.

        Returns:
            UnionOfTypes: The retrieved data in the desired format.
        """
        value = self._redis.get(key)
        return fn(value) if fn else value

    def get_str(self, value: str) -> str:
        """ get a string  or Retrieve a string value from Redis.
        or
        Retrieve a string value from Redis.

        Args:
            key (str): The key for the data.

        Returns:
            str: The data as a string.
        """
        return self.get(self._key, str)

    def get_int(self, value: str) -> int:
        """ get an int  or Retrieve an integer value from Redis.
        or
        Retrieve a string value from Redis.

        Args:
            key (str): The key for the data.

        Returns:
            str: The data as a string.
         """
        return self.get(self._key, int)


def replay(method: Callable):
    """
    Display the history of calls of a particular function.
    """
    # Get the Redis instance from the method's first argument (self)
    self = method.__self__
    method_name = method.__qualname__
    input_key = f"{method_name}:inputs"
    output_key = f"{method_name}:outputs"

    # Retrieve the count of calls
    call_count = int(self._redis.get(method_name) or 0)
    print(f"{method_name} was called {call_count} times:")

    # Retrieve inputs and outputs from Redis
    inputs = self._redis.lrange(input_key, 0, -1)
    outputs = self._redis.lrange(output_key, 0, -1)

    # Display each call with input and output
    for input_val, output_val in zip(inputs, outputs):
        # Decode and format the output to match the example
        print(
            f"{method_name}(*{input_val.decode('utf-8')}) -> {output_val.decode('utf-8')}")
