---
layout: post
title: "GenAI helps me start even more projects I'll never finish"
excerpt: "Paul Ford and I are not normal. I consider it a point of pride, but it also continues to give me pause when marketers and tech bros regale their respective publications and feeds with promises of an AI-coded future."
date: 2025-11-14 16:08:56 -0600
categories: [ai]
---

![A screenshot of a Mastodon post: "GenAI helps me start even more projects I'll never finish"](/assets/2025/11/genai-projects-toot.png "GenAI helps me start even more projects I'll never finish")

[Aboard Newsletter: Claude Code for Web Ruined My Brain](https://mailchi.mp/aboard/zkd26k8jzm-10341440)

Paul Ford is probably the most fair, cogent commentator on the current state of GenAI tools on any given day. He's also a fantastic writer.

> I fit Claude Code’s profile embarrassingly well: **I’m a reasonably effective coder and a horrific dilettante, and I have a lot of little digital projects sitting around the house**. I know in detail how Computer works and how to make Computer go. And I’ve been vibe-coding for a year now, figuring out the new world.

> Did I just create a ton of tech debt? Yeah, but I have a tool to address it. Did I blow up my weekend? A little. But I was doing a lot of it on my phone, with time I might otherwise spend looking at Instagram. Programming in Claude Code is like playing with a Tamagotchi, if a Tamagotchi was a forty-person engineering and product team, and instead of producing little digital poops, it could instead deploy database-backed web applications with type-safe API interfaces and React frontends.

> I used to feel like I was building a ship, and now I feel like I’m steering one.

> **I just unlocked five years of personal tech debt (admittedly, a concept that very few people might share) in a couple of days.**

[Emphasis mine.]

I'm currently vibe-coding a Node script for importing CSVs into an existing Notion DB. The Notion functionality for this exists but refused to work for me. Without Claude Code, I would have just continued to bang my head against Notion's import feature until it worked, or hand-entered the data. Now I'll have a repeatable method for inserting these records straight from my terminal, and it took about two prompts.[^1] This project, as a piece of software, will go no further. Sure, I could have written it by hand, but the cost-benefit as it relates to my time would not have justified it.

Paul Ford and I are not normal. I consider it a point of pride, but it also continues to give me pause when marketers and tech bros regale their respective publications and feeds with promises of an AI-coded future. We're back to "[the hard part about software isn't coding](/2024/06/30/you-might-think-using-ai-in-your-business-will-save-you-time-and-development-cost-but-youd-be-wrong/ "The fundamental task of software development is not writing out the syntax that will execute a program. The task is to build a mental model of that complex system, make sense of it, and manage it over time.")."

[^1]: Ok, already more than two. Turns out my CSV was malformed (probably why Notion was inelegantly failing), so I'm asking it to fix it for me, since squinting at a CSV in my code editor is less than fun. Sure, there is probably a nice CSV editing tool out there, but...meh. It would seem that Claude is just as bad as me at writing bash, however, and after a couple of failed attempts to write bash to solve my problem, it has fallen back to good ol' Python and is making progress.
