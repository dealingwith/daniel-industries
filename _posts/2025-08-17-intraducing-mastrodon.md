---
layout: post
title: "Intraducing Mastrodon"
excerpt: 
date: 2025-08-17 20:51:43 -0500
categories: 
---

On May 25th I used Claude Code for the first time. I've used [GitHub Copilot](/2024/07/09/my-mostly-positive-experience-with-github-copilot/) for some time, but I'd never used a "coding agent" with any success. I'd tried one with an online IDE and it failed so thoroughly so quickly I lasted maybe three prompts. I'd tried Copilot in agent mode, although to be fair never from zero.

Claude Code impressed me both with its competency and its UX. I spent about three hours with it that first day, then a couple more the following day. The particular project I started with wasn't that important, just an idea I'd had a while back. Then I finally returned to it last week and again this weekend.

**[Mastrodon](https://github.com/dealingwith/mastrodon)** is an Astro app that converts your Mastodon archive into a static web site.

I had this idea after I turned on automatic post deletion. I auto-delete old posts not because I never want to remember them, I just believe in a certain amount of online persona curation and I'm a little more fast and loose on Mastodon.

Details are in the README, but if you know how to download your Mastodon archive and run `npm` commands, it is hopefully straightforward enough.

## Casual observations while successfully vibe coding for the first time

- I recently learned that technically 'vibe coding' is only when you don't even pay attention to the code being generated. So I guess this wasn't that, as I'm familiar with JavaScript and Astro. Still, writing a prompt and watching the robot write hundreds of lines of code is thrilling and terrifying.
- As I mentioned, I'd tried a couple of vibe coding tools prior to Claude Code, and they left me wondering what the hype was about. Claude Code nailed it as far as I was concerned, which surprised me, because it only runs in the terminal, with a prompt-response loop exactly like [the chat bots](/2025/07/13/the-tyranny-of-ai-is-not-ai-itself-it-is-the-lazy-rushed-product-designers-with-no-imagination-or-sense-of-craft/).
- I kept three windows open:
  - The Claude Code terminal
  - Another terminal with the Astro dev server running, so I could restart it, look at logs myself, etc. Every once in a while Claude would want to start Astro itself, but I would just tell it no. It appeared to get the hint, at least within a single session.
  - VSCode, where I could better observe the code Claude wrote and make changes myself.
- I've since tried Claude Code in VSCode via their extension, but it just runs in a terminal tab; the only benefit I see is better diff views, as they open in their own VSCode diff tab. My problem is I have my UI and font cranked up so big, thanks to my [eyesight issues](/2025/08/12/my-eyes/), that just having two side-by-side tabs doesn't leave much room for text.
- I think this was another of the advantages of the terminal-based UX. Claude was running in its own window, and VSCode was _my_ domain (psychologically), where I wasn't afraid of its meddling when I wanted to enact my own will.
- I've noticed GitHub Copilot seems to work better when I choose Anthropic's models, but it's marginal. I think the magic of Claude Code is the agentic orchestration they've developed around the models that are actually writing the code. It breaks up your prompt into a plan and a todo list, and shows you the list each time it crosses off a task.
  - It also works well at managing its own context window(s?). One time during a long session it did the thing where it "compresses"(?) its context, and it was jarring. It's done it since and it wasn't as startling. (It's possible they updated that aspect of the UX.)
- Decent prompt engineering is still required. You have to write a good spec, just like in real life. But you find out really fast if the spec isn't great, and the spec is never great.
- I had Claude write its own CLAUDE.md but it didn't have much more than the README.md it also wrote for me. And it writes better Readmes than I do, and doesn't find it a chore. I haven't done any tweaking of its config at all, in fact, other than adding the [Linear](https://linear.app) docs MCP server when I quickly vibe coded (in the proper sense of the term) a CLI for visualizing some Linear data (for work).
- Total time spent was much longer than anticipated. It's just an Astro app that loads some JSON. How hard could it be! If I'd done this "by hand" it would have been:
  - Even more time consuming
  - Yet far less feature complete. I was more willing to add additional "features" because I could just ask Claude to write them.
  - And I might have given up
- I'm still not sure Claude and I did this the "right" way. Claude can write code, so it writes a lot of code. This is one of the [fundamental problems with using genAI to write software](/2024/06/30/you-might-think-using-ai-in-your-business-will-save-you-time-and-development-cost-but-youd-be-wrong/). [Experienced developers](/2022/12/08/the-defining-trait-of-a-senior-software-engineer/) know that more code, more problems.
  - I think there's a more canonically Astro way to load the JSON, but neither of us could figure it out.
- I really enjoy Claude's (mostly) made-up verbs it displays while it is working. I want there to be a published list of all of them. (Surely they're not burning tokens having a model generate them?)
- Making the smallest logical commits possible is still really important (for historic reasons but mostly as backstops when things go wrong), and something Claude doesn't offer to do. I'm still intending to figure out if that's a thing possible via configuration.