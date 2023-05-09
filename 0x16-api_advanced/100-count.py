#!/usr/bin/python3
'''
   Queries Reddit API and returns a list containing the titles
   of all hot articles & prints a sorted count of a given keywords.
   If no results are found for the given subreddit,
   the function should return None
'''
import requests


def recurse(subreddit, hot_list=[], after=''):
    '''
    Recursive function that queries Reddit API
    and return lists containing the titles of hot articles
    for a given subreddit
    '''
    if after is None:
        return hot_list
    res = requests.get(
        'https://www.reddit.com/r/{}/hot.json'.format(subreddit),
        params={
            'limit': 100,
            'after': after},
        headers={
            'User-agent': 'cli:api_advanced:v1.0.0 (by /u/ Yosinan'},
        allow_redirects=False)
    if res.status_code == 200:
        posts = res.json()
        for post in posts['data']['children']:
            hot_list.append(post['data']['title'])
        return recurse(subreddit, hot_list, posts['data']['after'])
    else:
        return None

def count_words(subreddit, word_list):
    '''
    parses the title of hot articles & prints SORTED count
    '''
    word_list = list(map(str.lower, word_list))
    res = {}
    titles = recurse(subreddit)
    for title in titles:
        for word in word_list:
            if word in title:
                if res.get(word) is None:
                    res[word] = 0
                result[word] += 1
    res = [(k, v) for k, v in res.items()]
    res.sort(key=lambda x: x[1], reverse=True)
    for k, v in res:
        print('{}: {}'.format(k, v))
