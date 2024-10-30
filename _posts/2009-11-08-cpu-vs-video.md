---
date: '2009-11-08 15:40:00'
layout: post
slug: cpu-vs-video
title: 'CPU vs Video'
categories:
 - geek
 - video
 - web
---

Having an older Mac that positively freaks out when I try to watch videos or do anything else rather CPU intensive, and even having a relatively brand new one that gets pretty hot doing the same, I was excited to find in my Twitters this morning a <a class="dead">YouTube HTML5 Viewer</a> that takes a given YouTube link and renders it using the new(ish) HTML5 video tag. Common sense and the blog post that introduced it claimed to use less CPU than Flash on Mac and Linux.

Needless to say, I was shocked to find the video embed to perform so horribly in Safari and so well in Chrome (Chrome numbers were with a single tab open, all procs combined, for those wondering). I don't know the internals of how the video in rendered in the browser, but it is either not a part of the core Webkit, or it is something the Google folks have already improved upon despite its dearth of use.

I will perhaps spend more time testing this across different OS's (and OS versions--above was Leopard) and browsers, but would be curious what your findings were, were you to do a quick comparison.
