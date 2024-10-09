---
layout: post
title: "Why doesn't Microsoft do their own Linux distro?"
excerpt: "They are already investing pretty heavily in OSS and their Linux 'subsystem'"
date: 2024-10-09 12:37:33 -0500
categories: 
 - technology
 - software
 - linux
---

I was thinking about how:

- Windows is a cluster, and I’m not talking about container orchestration
    - Part of that is bad design, both UI design and product design that has been trampled by business interests interested in unlimited growth
    - Part of that is its age, its constraints in staying compatible with a wide range of hardware, and its attempts at backwards compatibility
- M$ has purchased or developed widely-loved dev products
    - GitHub, which for the most part continues to provide its core value prop. New add-ons may or may not be valuable to individuals or enterprises, but they haven’t started to enshittify the core product yet; their React front-end rewrite wasn’t good, but it isn’t a deal-breaker for most, it would seem.
    - VSCode. Same.
    - TypeScript. In terms of JS devs looking for a type system, I have not seen anyone say anything bad about TS.
    - npm. This one was spooky. The others on this list are optional. This one, less so, at least if you’re working with JS.
- M$ has invested in Linux via their “subsystem for Windows”. This was more out of necessity, due to the fact that the majority of production stacks run on Linux, so keeping developers on Windows required it. I don’t understand why any self-respecting computer user would choose Windows over the alternatives, but that’s just my opinion (even if it’s the correct opinion).
- M$ has made some attempt to create cross-OS versions of their major products. Those products still suck (see [Microsoft Teams](/2023/03/04/i-was-having-a-day/)), but at least if your company forces you to use them, you can use them on an OS of your choice. The Edge browser seems to be an exception to “those products suck”, however the credit there likely falls to the Chromium project.

<div markdown="1" class="small_img">
![](/assets/2024/10/win-lin.png)
</div>

So why doesn’t M$ create their own Linux distro? It could come pre-loaded with all the M$ products one might need to interact with the rest of your Windows enterprise. It could come pre-loaded with M$ and Azure-centered dev tools. It could even come with a Windows VM ready to go! It would be a half-step-back for all those devs who switched to Mac or Linux after whatever version of Windows was the final straw for them.
