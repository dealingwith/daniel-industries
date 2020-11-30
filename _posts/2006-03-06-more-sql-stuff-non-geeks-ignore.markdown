---
author: dealingwith
date: '2006-03-06 15:51:00'
layout: post
slug: more-sql-stuff-non-geeks-ignore
status: publish
title: More SQL stuff (non geeks ignore)
wordpress_id: '1080'
---

gets me * from _entries based on an OR from _tags (give me _entries.* if
_tags.tags is "this" or "that"):


    SELECT swimlite_entries.*, swimlite_tags.*

    FROM swimlite_entries, swimlite_tags

    WHERE swimlite_entries.ID = swimlite_tags.ID

    AND (swimlite_tags.Tag = "tag01"

    OR swimlite_tags.Tag = "tag02")

now i want to get * from _entries based on an AND (give me _entries.* if
_tags.tags is "this" and "that"):


    SELECT a.Id, count(distinct a.Id, b.Tag)

    FROM swimlite_entries a, swimlite_tags b

    WHERE a.ID = b.ID

    AND (b.Tag = "tag01" OR b.Tag = "tag02")

    GROUP BY a.ID

...but that's as far as we've gotten so far...gives me the count but not only
the rows I want...

