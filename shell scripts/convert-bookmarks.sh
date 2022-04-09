#!/usr/bin/env bash

BOOKMARKS='FirefoxBookmarks.json'

jq -r '
  def bookmark($iconuri; $title; $uri):
     if $iconuri != null then "![\($iconuri)]" else "" end +
     "[\($title)](\($uri))";

  def bookmarks:
    (objects | to_entries[]
     | if .value | type == "array" then (.value | bookmarks)
                                   else .value end ) //
    (arrays[] | [bookmarks] | " - \(.[0])", "  \(.[1:][])" );

  (.. | .children? | arrays)
    |= map(if .uri != null then {bookmark: bookmark(.iconuri; .title; .uri)}
                           else {title} end +
           {children})
  | del(..| select(length == 0))     # remove empty children and empty titles
  | del(..| select(length == 0))     # remove objects that got empty because of previous deletion
  | del(..| objects | select(has("title") and (.children | length == 0)))   # remove objects with title but no children
  | .children                        # remove root level
  | bookmarks
    ' < "$BOOKMARKS"
