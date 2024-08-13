#!/usr/bin/env python3
"""
List all documents in Python
"""
import pymongo


def list_all(mongo_collection):
    """
    Lists all documents in a MongoDB collection.

    Args:
    mongo_collection: pymongo collection object

    Returns:
    list: A list of all documents in the collection, or an empty list if no documents exist
    """
    return list(mongo_collection.find())
