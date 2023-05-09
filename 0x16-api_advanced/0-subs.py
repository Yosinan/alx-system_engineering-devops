#!/usr/bin/python3
'''
    Queries Reddit API and returns the number of subscribers (not active users, total subscribers) for a given subreddit. If an invalid subreddit is given, the function should return 0
'''
import requests


def number_of_subscribers(subreddit):
    '''
    Return the no of SUbscribers
    '''
    res = requests.get(
        'https://www.reddit.com/r/{}/about.json'.format(subreddit),
        headers={
            'User-agent': 'cli:api_advanced:v1.0.0 (by /u/ Yosinan'},
        allow_redirects=False)
    if res.status_code == 200:
        return res.json().get('data').get('subscribers')
    else:
        return 0
