---
layout: post
title: "Graphs as product work artifacts"
excerpt: 
date: 2021-08-06 03:35:04 GMT-5
categories: 
---

We use [Roam](https://roamresearch.com/) extensively at [work](https://egghead.io) and I just spent a few minutes exploring its graph view for the first time.

Our usage involves heavy use of daily notes pages, which link to other pages in the graph that might represent projects, other people, ideas, RFCs, etc.

When looking at a project page in the graph, it's easy to see a timeline of the volume of work:

![](/assets/2021/08/project-view-full.png)

(All graph views here are using the _Dagre Layout_.)

Zoomed in, one can see the very light hierarchy, with the project at the center and mostly daily notes pages above and subpages and metadata below:

![](/assets/2021/08/project-view-zoomed.png)

Daily notes are grouped by team member, so they are the large nodes when looking at any given daily page:

![](/assets/2021/08/daily-view-full.png)

But zooming into any given day gives a quick view of what was being worked on that day:

![](/assets/2021/08/daily-view-zoomed.png)

I must admit I was resistant to Roam as a collaborative tool until we landed on this methodology revolving around the daily notes pages. Now I'm curious about how to best surface other project data I need from the graph, for example status, current owner, etc. It's easy enough to store and view on project-specific pages, but harder to see everything in flight at once in a quickly-digestable way (and we have a _lot_ in flight at once). For now I'm still keeping a Notion database for that at-a-glance information, but because we're 90% in Roam (for this sort of thing), Notion gets out of date quickly.

Here is a graph view from the "partner products" page:

![](/assets/2021/08/partner-products.png)

Perhaps if I could have this view with metadata attached to the nodes (not as other nodes), and a way to more quickly get to this view without needing to navigate to the page and then having its graph jammed into my sidebar (else I could use it as an excuse to get an absurdly large monitor)... 🤔

For grins, here is the complete graph _without_ daily notes pages included:

![](/assets/2021/08/entire-graph.png)

...and _with_ daily notes pages:

![](/assets/2021/08/entire-graph-with-daily.png)
