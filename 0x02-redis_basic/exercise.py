#!/usr/bin/env python3
"""Module providing a Cache class for Redis operations."""

import redis
import uuid
from typing import Union, Callable, Optional


class Cache:
    """A class for caching data using Redis."""

    def __init__(self):
        """Initialize the Cache with a Redis client and flush the database."""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        Store the input data in Redis using a random key.

        Args:
            data: The data to be stored. Can be a string, bytes, integer, or float.

        Returns:
            str: The randomly generated key used to store the data.
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, 
            fn: Optional[Callable] = None) -> Union[str, bytes, int, float, None]:
        """
        Retrieve data from Redis for the given key and apply optional conversion.

        Args:
            key: The key to retrieve data for.
            fn: Optional callable to convert the retrieved data.

        Returns:
            The retrieved data, optionally converted, or None if the key doesn't exist.
        """
        value = self._redis.get(key)
        if value is None:
            return None
        if fn:
            return fn(value)
        return value

    def get_str(self, key: str) -> Union[str, None]:
        """
        Retrieve a UTF-8 string from Redis for the given key.

        Args:
            key: The key to retrieve data for.

        Returns:
            The retrieved string, or None if the key doesn't exist.
        """
        return self.get(key, fn=lambda d: d.decode("utf-8"))

    def get_int(self, key: str) -> Union[int, None]:
        """
        Retrieve an integer from Redis for the given key.

        Args:
            key: The key to retrieve data for.

        Returns:
            The retrieved integer, or None if the key doesn't exist.
        """
        return self.get(key, fn=int)
