---
layout: post
title: "The trouble with tools"
excerpt: 
date: 2024-10-28 09:10:09 -0500
categories: 
 - thoughts
 - software
---

I spend a lot of time in productivity tools and thinking about productivity tools. I follow the development of new ones, I'm subscribed to the subreddits. I frequently try new tools or systems, hoping to land on something that will finally work for me. I develop my own scripts and small apps.

As I contemplated my struggles, I realized that, for me, there is a pretty simple trifecta of buckets. There are Notes, Projects, and Tasks.

<div markdown="1" class="small_img">
![](/assets/2024/10/tft0.png)
</div>

These three buckets lend themselves to distinct objects that facilitate their purposes: blocks for notes, lists for tasks, and relational systems for projects

<div markdown="1" class="small_img">
![](/assets/2024/10/tft1.png)
</div>

Immediately I knew that these overlap.

<div markdown="1" class="small_img">
![](/assets/2024/10/tft2.png)
</div>

So far so good. I even have tools for each of these buckets that I prefer and have stuck with for years at this point: Logseq for notes, Notion for projects, and...and...and anything and everything for lists of tasks. 😬

<div markdown="1" class="small_img">
![](/assets/2024/10/tft3.png)
<p class="caption">This is when things start to break down.</p>
</div>

### Projects have notes

Let's start with the overlap that I find less problematic. My note-taking app contains daily logs of random thoughts, links, article and book highlights, and--relevant to this topic--project and meeting notes. This soup is managed via Logseq's page links, which it represents with both [[page references]] and #tags, which I use with little regard for a pattern, although typically I will use a page reference as a top-level block--Logseq is an outliner--and a tag for a quick link at the end of a random note.

```
- [[Project or Topic Page Reference]]
  - notes I'm taking now
```

```
- Random note
- Another random note but it might relate to #Project
```

Per above, however, I manage projects in Notion. Projects in Notion are typically a database view or a specific database. Sometimes they are Notion pages that contain multitudes (text, more pages, databases). I'll just include a link to the topmost Notion page on the Logseq page for that project.

```
Project page

- [Project on Notion](https://notion.so...)
```

There is some annoyance at switching between apps, and there is some data loss, but I prefer this method to trying to make either tool do work for which it is not ideal.

### Projects have tasks

Notion's flexibility is a double-edged sword, but also the reason I've used it for so long despite its horrible performance both in a browser and on a mobile device.

I utilize the [single tasks DB](https://www.notion.vip/insights/golden-rules-of-notion) method. Notion provides _many_ ways to slice and dice a database:

- Views based on filters and sorts, which can also selectively show or hide specific columns. I have 24 views on my Tasks DB. Some get frequent use, some do not. They are added to and culled and modified regularly.

<style>
  /* .main-content aside.views { padding-bottom: 0; } */
  .main-content aside.views img { margin: 1em 0; }
</style>
<aside class="views">{% capture details %}Here is a screenshot of the ones that fit above the dialog max height:

![](/assets/2024/10/db-views.png)

The existence of a search feature in this box indicates that I'm not the only one...{% endcapture %}{% capture summary %}Yes, 24 views{% endcapture %}{% include _details.html %}</aside>

- I use subtasks, typically to roll up to a project-level "task", which is not ideal. But I recently attempted to use a separate "projects" DB with a relation column and that did not work for me.
- When a project swells beyond a task row in my Tasks DB and subtasks, I find giving it a top-level page works best. I still need its tasks in my single tasks DB, though, so I will create yet another view of that DB in the project's page.

<div markdown="1" class="small_img">
![](/assets/2024/10/active-projects.png)
</div>

<aside markdown="1">
This will also break down, however. Sometimes I _don't_ want those tasks in my Tasks DB, so it gets its own DB, often forgotten about. Or it is a software project hosted on GitHub, in which case I will primarily use GitHub issues and Pull Requests, which I can then sync to a Notion DB, even though the latter has little utility at that point.
</aside>

<div markdown="1" class="small_img">
![](/assets/2024/10/yak.png)
<p class="caption">This is what I thought of after re-reading that last section. I stare at that thing and think, "I can shave it!"</p>
</div>

This already sounds like a mess, and it is, but it's not so terrible I can't just fix it within the existing tool in question, or simply keep to some reliable system. The problem I struggle with is twofold.

### Tasks can spawn from anywhere

1. While taking notes on my computer (Logseq). Logseq has a TODO block type, which is great. Maybe too great. I will be journaling in the morning and want to quickly capture tasks as they come to mind. I also know I will be spending the _most_ time in Logseq, so I trust them to stay in front of me, _but only for today_. I do have a tasks query open in the right sidebar 90% of the time, but that's just a reverse-chronological list of tasks. They fall below the fold and aren't prioritized.
1. While away from my computer (Notion widget). Notion's Android widget is a great way to capture something into my Tasks DB. I rarely open the Notion app itself on my phone because it is awful. So the task goes into my "Inbox" view (no "status"), which might mean it sits dormant for anywhere between a day and forever.
1. While away from my computer but taking notes on paper. I love using paper notebooks for all of the usual reasons, but primarily because they are _not screens_. But no paper system could properly manage my tasks. Just as with Logseq, I either get them into my Notion DB or they disappear into the past. Sometimes that's fine, but when it's not...

### Task lists become overwhelming

Boy, have I covered [this](https://daniel.industries/2021/01/26/in-defense-of-the-backlog/) [before](https://daniel.industries/2021/11/16/overload/). When it comes time to focus, nothing's worse than having 576 items peering out at you from that backlog you're trying not to think about. That, combined with the slow, clunky UX of Notion, has left me trying _all the things_ for a narrowed view of current priorities.

- Long ago I used Trello and Taskpaper in concert, to great effect. I created a small Ruby script to pull from my Trello boards and generate a Taskpaper file, which I then referenced from my text editor of choice. I called it Trellopaper.
- I created [Notionpaper](https://github.com/dealingwith/notionpaper) after switching from Trello to Notion (as bad as Notion has become, Trello had already been Atlassianed by the time I switched).

For various reasons, this method stopped working as well for me.

1. I wasn't in front of my computer as much
1. Capture is still an issue--I have to go back to Notion
1. Only works on my computer, not mobile without additional work
1. Notion's flexibility meant that if I tweaked anything in Notion, I probably had to go fix something in my script

The focused day view was still the dream, plus an easy way to capture. I tried a _Today_ view of my DB but that didn't quite do it. I already have multiple _"Focus"_ views! The dream of paper, or at least something _way_ more simple than Notion, remained.

The paper planner community/market is massive and daunting. I have--wait for it--a Notion DB that is just links to various products and systems. There is an entire company in South Korea that sells PDFs for digital planners (almost always tablets). But I found that, for me, a tablet is no good (mostly due to its similarity to an actual computer, but also I just don't want another electronic device in my life) and printing every day is too much hassle. (Although I have come close to buying a tiny printer on several occasions.)

<div markdown="1" class="small_img">
![](/assets/2024/10/tft4.png)
<p class="caption">I spend an inordinate amount of time gathering tasks from various places, prioritizing them, and putting them into a central place where I won't get distracted.</p>
</div>

### Aside

While still working on the draft of this post, I listened to _[The Vergecast: What's in a productivity system?](https://deepcast.fm/episode/whats-in-a-productivity-system)_, confirming what I already knew: that productivity systems are incredibly varied and specific to each person and that while many of us hope to find the one system to rule them all, we all fail. And we change things up frequently. It's a great listen if you're also a productivity tools geek.

### In non-conclusion 

I've been sitting on the draft of this post for almost a month now, so I'm determined to wrap it up even though I do not know how I might do so. These are age-old problems of knowledge work, there are thousands of tools and thousands of people writing about this topic full-time.

My conclusion from all this thinking out loud is:

- I need a robust (complex) tool for the task of processing incoming information and tasks, revisiting that information, and prioritizing.
- I need a simple tool for a focused view of what needs my attention _right now_, and a capture method for new information and tasks that doesn't expose me to the complex tool's deep well of information and infinite field of nubbins.
- If either is not 99% perfect for my brain, I will want to solve for that 1%

_and yes, I've tried time-blocking_

### Postscript

r/Notion: [Is this... a $500 Notion theme? 😂](https://www.reddit.com/r/Notion/comments/1g6dd31/is_this_a_500_notion_theme/)

![](/assets/2024/10/reddit-screenshot.png)
