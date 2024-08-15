#!/usr/bin/env python3
"""Module providing a caching and counting
wrapper for URL content retrieval."""

import redis
import requests
from functools import wraps
from typing import Callable

# Connect to Redis
redis_client = redis.Redis()


def url_access_count(func: Callable) -> Callable:
    """
    Decorator to count how many times a URL is accessed.

    Args:
        func: The function to be decorated.

    Returns:
        Callable: The wrapped function.
    """
    @wraps(func)
    def wrapper(url: str) -> str:
        count_key = f"count:{url}"
        redis_client.incr(count_key)
        return func(url)
    return wrapper


def cache_page(expiration: int = 10) -> Callable:
    """
    Decorator to cache the result of a function with an expiration time.

    Args:
        expiration: The expiration time in seconds (default 10).

    Returns:
        Callable: The decorator function.
    """
    def decorator(func: Callable) -> Callable:
        @wraps(func)
        def wrapper(url: str) -> str:
            cache_key = f"cached:{url}"
            cached_content = redis_client.get(cache_key)

            if cached_content:
                return cached_content.decode('utf-8')

            content = func(url)
            redis_client.setex(cache_key, expiration, content)
            return content
        return wrapper
    return decorator


@url_access_count
@cache_page()
def get_page(url: str) -> str:
    """
    Get the HTML content of a particular URL.

    Args:
        url: The URL to fetch.

    Returns:
        str: The HTML content of the URL.
    """
    response = requests.get(url)
    return response.text
