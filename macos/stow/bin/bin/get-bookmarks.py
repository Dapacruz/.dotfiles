#!/usr/bin/env python3

import json
import os

home = os.environ['HOME']
with open(os.path.join(home, "Library/Application Support/Vivaldi/Default/Bookmarks"), "r") as f:
    data = json.load(f)

data = data["roots"]["bookmark_bar"]["children"]

def get_bookmark(obj, path):
    if obj["type"] == "url":
        if len(path) > 0:
            bookmark = [f'{"".join(path)}{obj["name"]}']
        else:
            bookmark = [obj["name"]]
        return bookmark
    elif obj["type"] == "folder":
        path.append(obj["name"])
        bookmarks = []
        for obj in obj["children"]:
            bookmarks.extend(get_bookmark(obj, path))
        del path[-1]
        return bookmarks

bookmarks = []
for obj in data:
    path = []
    bookmarks.extend(get_bookmark(obj, path))

for bookmark in sorted(bookmarks, key=str.casefold):
    print(bookmark)
