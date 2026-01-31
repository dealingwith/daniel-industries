---
layout: post
title: "Code is a liability"
excerpt: "Cory Doctorow 🎯 again"
date: 2026-01-30 17:00:54 -0600
categories: 
  - ai
  - elsewhere
---

[Pluralistic: Code is a liability (not an asset)](https://pluralistic.net/2026/01/06/1000x-liability/#graceful-failure-modes)

> Code is a liability. Code's _capabilities_ are assets. The goal of a tech shop is to have code whose capabilities generate more revenue than the costs associated with keeping that code running. For a long time, firms have nurtured a false belief that code costs less to run over time: after an initial shakedown period in which the bugs in the code are found and addressed, code ceases to need meaningful maintenance. After all, code is a machine without moving parts – it does not wear out; it doesn't even wear down.

> ...code is not an infinitely reproducible machine that requires no labor inputs to operate. Rather, it is a brittle machine that requires increasingly heroic measures to keep it in good working order, and which eventually does "wear out" (in the sense of needing a top-to-bottom refactoring).

> "Writing code" is an incredibly useful, fun, and engrossing pastime. It involves breaking down complex tasks into discrete steps that are so precisely described that a computer can reliably perform them, and optimising that performance by finding clever ways of minimizing the demands the code puts on the computer's resources, such as RAM and processor cycles.

> Meanwhile, "software engineering" is a discipline that subsumes "writing code," but with a focus on the long-term operations of the system the code is part of. Software engineering concerns itself with the upstream processes that generate the data the system receives. It concerns itself with the downstream processes that the system emits processed information to. It concerns itself with the adjacent systems that are receiving data from the same upstream processes and/or emitting data to the same downstream processes the system is emitting to.

> "Writing code" is about making code that _runs well_. "Software engineering" is about making code that _fails well_. It's about making code that is legible – whose functions can be understood by third parties who might be asked to maintain it, or might be asked to adapt the processes downstream, upstream or adjacent to the system to keep the system from breaking.

> ...any nontrivial code has to interact with the outside world, and the outside world isn't static, it's _dynamic_. The outside world busts through the assumptions made by software authors _all the time_ and every time it does, the software needs to be fixed...

> ...code...needs to be updated _constantly_, because the upstream, downstream and adjacent processes connected to it are changing _constantly_. The longer that code sits there, the more superannuated its original behaviors become, and the more baroque, crufty and obfuscated the patches layered atop of it become.

> The longer a computer system has been running, the more tech debt it represents. The more important the system is, the harder it is to bring down and completely redo. Instead, new layers of code are slathered atop of it, and wherever the layers of code meet, there are fissures in which these systems behave in ways that don't exactly match up. Worse still: when two companies are merged, their seamed, fissured IT systems are smashed together, so that now there are _adjacent_ sources of tech debt, as well as upstream and downstream cracks...

> ...AI can write code, but AI can't do software engineering. Software engineering is all about thinking through _context_ – what will come before this system? What will come after it? What will sit alongside of it? How will the world change? Software engineering requires a very wide "context window," the thing that AI does not, and cannot have...

> Bosses _do not know_ that code is a liability, not an asset. That's why they won't shut the fuck up about the chatbots that shit out 10,000 times more code than any human programmer. They think they've found a machine that produces _assets_ at 10,000 times the rate of a human programmer. They haven't. They've found a machine that produces _liability_ at 10,000 times the rate of any human programmer.

> Maintainability isn't just a matter of hard-won experience teaching you where the pitfalls are. It also requires the cultivation of "Fingerspitzengefühl" – the "fingertip feeling" that lets you make reasonable guesses about where never before seen pitfalls might emerge. It's a form of process knowledge. It is ineluctable. It is not latent in even the largest corpus of code that you could use as training data...

> In automation theory, a "centaur" is a person who is assisted by a machine. A "reverse centaur" is someone who has been conscripted into assisting a machine. If you're a software engineer who uses AI to write routine code that you have the time and experience to validate, deploying your Fingerspitzengefühl and process knowledge to ensure that it's fit for purpose, it's easy to see why you might find using AI (when you choose to, in ways you choose to, at a pace you choose to go at) to be useful...

> There's another way in which software engineers find AI-generated code to be incredibly helpful: when that code is isolated. If you're doing a single project – say, converting one batch of files to another format, just once – you don't have to worry about downstream, upstream or adjacent processes. There aren't any. You're writing code to do something once, without interacting with any other systems. A lot of coding is this kind of utility project. It's tedious, thankless, and ripe for automation. Lots of personal projects fall into this bucket, and of course, by definition, a personal project is a centaur project...

> But the fact that software engineers can sometimes make their work better with AI doesn't invalidate the fact that code is a liability, not an asset, and that AI code represents liability production at scale.

These are (admittedly a lot of) snippets. Go to the original if you want the full Doctorow experience.
