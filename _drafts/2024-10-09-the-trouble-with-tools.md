---
layout: post
title: "The trouble with tools"
excerpt: 
date: 2024-10-09 09:10:09 -0500
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

Per above, however, I manage projects in Notion. Projects in Notion are typically a database view or a specific database. Sometimes they are Notion pages which contain multitudes (text, more pages, databases). I'll just include a link to the topmost Notion page on the Logseq page for that project.

```
Project page

- [Project on Notion](https://notion.so...)
```

There is some annoyance at switching between apps, and there is some data loss, but I prefer this method to trying to make either tool do work for which it is not ideal.

### Projects have tasks

Notion's flexibility is a double-edged sword, but also the reason I've stuck with it for so long despite its horrible performance both in a browser and on a mobile device.

I've long stuck with the [single tasks DB](https://www.notion.vip/insights/golden-rules-of-notion) method. Notion provides _many_ ways to slice and dice a database:

- Views based on filters and sorts, which can also selectively show or hide specific columns. I have 24 views on my Tasks DB. Some get frequent use, some not. They are added-to and culled and modified regularly.

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
This will also break down, however. Sometimes I _don't_ want those tasks in my Tasks DB, so it gets its own DB, often forgotten about. Or it is a software project hosted on GitHub, in which case I will primarily use GitHub issues and Pull Requests, which I can then sync to a Notion DB, even though the latter has little utility at that point.
</aside>

This already sounds like a mess, and it is, but it's not so terrible I can't just fix it within the existing tool in question, or simply keep to some reliable system. The problem I struggle with is twofold.

### Tasks can spawn from anywhere

1. While taking notes on my computer (Logseq). Logseq has a TODO block type, which is great. Maybe too great. I will be journaling in the morning and want to quickly capture tasks as they come to mind. I also know I will be spending the _most_ time in Logseq, so I trust them to stay in front of me, _but only for today_.
1. While away from my computer (Notion widget). Notion's Android widget is a great way to capture something into my Tasks DB. I almost never open the Notion app itself on my phone because it is awful. So the task goes into my "Inbox" view (no "status"), which might mean it sits dormant for anywhere between a day and forever.
1. While away from my computer but taking notes on paper. I love using paper notebooks for the usual reasons, primarily because they are _not screens_. But there's no paper system that could properly manage my tasks. Just as with Logseq, I either get them into my Notion DB or they disappear into the past. Sometimes that's fine, but when it's not...

### Task lists become overwhelming

Boy, have I covered [this](https://daniel.industries/2021/01/26/in-defense-of-the-backlog/) [before](https://daniel.industries/2021/11/16/overload/). When it comes time to focus, nothing's worse than having 576 items peering out at you from that backlog you're trying not to think about. That, combined with the slow, clunky UX of Notion, has left me trying _all the things_ for a narrowed view of current priorities.

- Long ago I used Trello and Taskpaper in concert, to great effect. I created a small Ruby script to pull from my Trello boards and generate a Taskpaper file, which I then referenced from my text editor of choice. I called it Trellopaper.
- I created [Notionpaper](https://github.com/dealingwith/notionpaper) after switching from Trello to Notion (as bad as Notion has become, Trello had already been Atlassianed by the time I switched).

For various reasons, this method stopped working as well for me.

1. I wasn't in front of my computer as much
1. Capture is still an issue--I have to go back to Notion
1. Only works on my computer, not mobile without additional work
1. Notion's flexibility meant that if I tweaked anything in Notion, I probably had to go fix something in my script

<div markdown="1" class="small_img">
![](/assets/2024/10/tft4.png)
</div>
