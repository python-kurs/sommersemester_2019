#! /usr/bin/python
# -*- coding: utf-8 -*-

def count_items(x):
    """
    Count occurence of unique items of list

    Counts items in the list and returns counts as a dict

    Parameters
    ----------
    x : list
        List of items to count

    Returns
    -------
    dict
        Items are keys, counts are values

    """
    # init an empty dictionary
    counts = {}
    # loop through the list of items (lines)
    for item in x:
        # check if it already is in the dictionary
        # if it is increase count by one if not add it
        if item in counts.keys():
            counts[item] += 1
        else:
            counts[item] = 1

    return counts
