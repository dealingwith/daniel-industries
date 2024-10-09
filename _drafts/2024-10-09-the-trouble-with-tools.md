---
layout: post
title: "The trouble with tools"
excerpt: 
date: 2024-10-09 09:10:09 -0500
categories: 
 - thoughts
 - software
---

I spend a lot of time in productivity tools and thinking about productivity tools. I follow the development of new ones, am subscribed to the subreddits. I frequently try new tools or systems, hoping to land on something that will finally work for me. I develop my own scripts and small apps.

As I contemplated my struggles, I realized that, for me, there is a pretty simple trifecta of buckets. There are Notes, Projects, and Tasks.

<div markdown="1" class="small_img">
![](/assets/2024/10/tft0.png)
</div>

These three buckets lend themselves to distinct objects that facilitate their purposes: Blocks for notes, lists for tasks, and relational systems for projects

<div markdown="1" class="small_img">
![](/assets/2024/10/tft1.png)
</div>

Immediately I knew that these overlap.

<div markdown="1" class="small_img">
![](/assets/2024/10/tft2.png)
</div>

So far so good. I even have tools for each of these buckets that I prefer and have stuck with for years at this point: Logseq for notes, Notion for projects, and...and...and everything and anything for lists of tasks. 😬

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

Per above, however, I manage projects in Notion! Projects in Notion are typically a database view or a specific database. Sometimes they are Notion pages which contain multitudes (text, more pages, databases). I'll just include a link to the topmost Notion page on the Logseq page for that project.

```
Project page

- [Project on Notion](https://notion.so...)
```

### Projects have tasks

Notion's flexibility is a double-edged sword, but also the reason I've stuck with it for so long despite its horrible performance both in a browser and on a mobile device.

I've long stuck with the [single tasks DB](https://www.notion.vip/insights/golden-rules-of-notion) method. Notion provides _many_ ways to slice and dice a database:

- Views based on filters and sorts, which can selectively show or hide specific columns. I have 24 views on my Tasks DB. Some get frequent use, some not. They are added-to and culled and modified regularly.

<style>
  .main-content aside.views { padding-bottom: 0; }
  .main-content aside.views img { margin: 1em 0; }
</style>
<aside class="views">{% capture details %}Here is a screenshot of the ones that fit above the dialog max height:

![](/assets/2024/10/db-views.png)

The existence of a search box in this box indicates that I'm not the only one...{% endcapture %}{% capture summary %}Yes, 24 views{% endcapture %}{% include _details.html %}</aside>

- I use subtasks, typically to roll up to a project-level "task", which is not ideal. But I recently attempted to use a separate "projects" DB with a relation column and that did not work for me.
- When a project swells beyond a task row in my Tasks DB and subtasks, I find giving it a top-level page works best. I still need its tasks in my single tasks DB, though, so I will create yet another view of that DB in the project's page.

<div markdown="1" class="small_img">
![](/assets/2024/10/active-projects.png)
</div>

<aside markdown="1">
This will also break down, however. Sometimes I _don't_ want those tasks in my Tasks DB, so it gets its own DB, often forgotten about. Or it is a software project hosted on GitHub, in which case I will use primarily use GitHub issues and Pull Requests, which I can then sync to a Notion DB, even though the latter has little utility at that point.
</aside>

This already sounds like a mess, and it is, but it's not so terrible I can't just fix it within the existing tool in question, or simply keep to some reliable system. The problem I struggle with on a daily basis is: _tasks can spawn from anywhere_.

1. While taking notes on my computer (Logseq)
  - Logseq has a TODO block type, which is great. Maybe too great. I will be journaling in the morning and want to quickly capture tasks as they come to mind. (I also know I will be spending the _most_ time in Logseq, so I trust them to stay in front of me, _but only for today_.)
1. While away from my computer (Notion widget). Notion's Android widget is a great way to capture something into my Tasks DB. I almost never open the Notion app itself on my phone because it is awful. So the task goes into my "Inbox" view (no "status"), which might mean it sits dormant for anywhere between a day and forever.
1. While away from my computer but taking notes on paper[^1].

<div markdown="1" class="small_img">
![](/assets/2024/10/tft4.png)
</div>

[^1]: Logseq has a mobile app in theory but getting it working flies right past a reasonable cost-benefit ratio and into the horizon. (This fact _almost_ got me to switch to Obsidian, which I attempted to make work for me over the better part of a week, but that is a story for a different post.) 
