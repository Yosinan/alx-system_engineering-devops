#!/usr/bin/python3
'''
    Queries the Reddit API and prints the titles of the first 10 hot posts listed for a given subreddit.
'''
import requests

def top_ten(subreddit):
    '''
    Prints the titles of the 1st 10 hot posts listed 
    '''
    res = requests.get('https://www.reddit.com/r/{}/hot.json?limit=10'.format(subreddit), headers={'User-agent': 'cli:api_advanced:v1.0.0 (by /u/ Yosinan'}, allow_redirects=False)
    if res.status_code == 200:
        for post in res.json().get('data').get('children'):
            print(post['data']['title'])
    else:
        print('None')
