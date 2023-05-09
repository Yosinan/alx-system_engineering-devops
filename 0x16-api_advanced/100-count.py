#!/usr/bin/python3
'''
   Queries Reddit API and returns a list containing the titles
   of all hot articles & prints a sorted count of a given keywords.
   If no results are found for the given subreddit,
   the function should return None
'''
import requests


def recurse(subreddit, res, after=''):
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
        hot_posts = posts['data']['children']
        addTitle(res, hot_posts)
        after = posts['data']['after']
        if not after:
            return
        recurse(subreddit, res, after=after)
    else:
        return None


def addTitle(res, hot_posts):
    if len(hot_posts) == 0:
        return

    title = hot_posts[0]['data']['title'].split()
    for word in title:
        for key in res.keys():
            y = re.compile("^{}$".format(key), re.I)
            if y.findAll(word):
                res[key] += 1
    hot_posts.pop(0)
    addTitle(res, hot_posts)


def count_words(subreddit, word_list):
    '''
    parses the title of hot articles & prints SORTED count
    '''
    res = {}
    for word in word_list:
        res[word] = 0

    recurse(subreddit, res)

    w = sorted(res.items(), key=lambda kv:kv[1])
    w.reverse()

    if len(w) != 0:
        for item in w:
            if item[1] != 0:
                print("{}: {}".format(item[0], item[1]))
            else:
                return
            '''
        for word in word_list:
            if word in title:
                if res.get(word) is None:
                    res[word] = 0
                result[word] += 1
    res = [(k, v) for k, v in res.items()]
    res.sort(key=lambda x: x[1], reverse=True)
    for k, v in res:
        print('{}: {}'.format(k, v))'''
