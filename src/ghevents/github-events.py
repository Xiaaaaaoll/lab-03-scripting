#!/usr/bin/env python3
import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'


def retrieve_events(url):
    """Fetch the JSON event data at url and return it as a Python object."""
    response_text = requests.get(url).text
    return json.loads(response_text)


def print_events(events, n=5):
    """Print the type and repo name for the first n events."""
    for x in events[:n]:
        event = x['type'] + ' :: ' + x['repo']['name']
        print(event)


def main():
    """Print the configured GitHub user and API URL, then fetch and display recent events."""
    print(GHUSER)
    print(url)
    events = retrieve_events(url)
    print_events(events)


if __name__ == "__main__":
    main()
