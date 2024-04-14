---
author: dealingwith
date: '2006-01-27 00:35:00'
layout: post
slug: help-whats-wrong-with-my-mysql-syntax
status: publish
title: HELP! What's wrong with my MySQL syntax??
wordpress_id: '929'
categories:
 - development
 - mysql
 - personal notes
---

SELECT DISTINCT ID FROM swim_1tids WHERE ID < 4 AND TID = 5 AND ID IN (SELECT
ID FROM swim_1 WHERE Publish = 1)

http://dev.mysql.com/doc/refman/4.1/en/any-in-some-subqueries.html

"SELECT DISTINCT ID FROM swim_1tids WHERE ID < 4 AND TID = 5" works

"SELECT ID FROM swim_1 WHERE Publish = 1" works (returns 4 rows of the ID
column: 1 2 3 4)

so clearly it is the AND IN that is causing a problem

"SELECT * FROM swim_1tids WHERE ID IN (SELECT ID FROM swim_1 WHERE Publish =
1)" doesn't work

i'm so fried i can't figure out how to spell words like doesn't and fried.

one more bit of info: "SELECT * FROM swim_1tids WHERE ID IN (1,2,3,4)" works

another: "SELECT DISTINCT ID FROM swim_1tids WHERE ID < 4 AND TID = 5 AND ID
IN ('SELECT ID FROM swim_1 WHERE Publish = 1')" works but returns an empty set

