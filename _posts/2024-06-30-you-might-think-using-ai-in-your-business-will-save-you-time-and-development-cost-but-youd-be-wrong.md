---
layout: post
title: "You might think using AI in your business will save you time and development cost but you'd probably be wrong"
excerpt: "Software that adds AI functionality is still More Software"
date: 2024-06-30 15:01:27 -0500
categories: 
 - software
 - development
 - ai
---

"AI" (usually Generative AI, and henceforth referred to simply as AI) is, of course, all the rage right now. It might be easy to think that if you do not get on the bandwagon, your competition will leave you in the dust, having implemented AI in some magical way that puts them ahead of you in the marketplace.

You might even think that AI will help you create software, even if that software is the old, boring, garden-variety kind. AI will speed up your current software developers, allow your product designers to create full-fledged applications, and prevent you from having to grow your developer team in the future, while still pumping out software at the same rate.

Here are some things you might want to keep in mind as you allow this temptation to take root:

Software that adds AI functionality is still More Software. More software requires time (money) to build, test, and most importantly, maintain. The models and APIs your developers are using today will be out of date in months, and the changes (if recent history is any indication) will be significant. Even after your developers update their code to the new spec, the results coming from that AI API will probably be significantly different. You might even have to revisit the entire system around the AI---the UX, that piece of the ETL chain, or the analyst dashboards that now have no continuity and create more confusion than they do insight.

I've been using GitHub Copilot off and on since it was released, and have a mostly favorable view of its capabilities[^1], as long as the user knows what they're doing in the first place. But you know what it can't do? Write AI apps. Seemingly because the APIs are changing so frequently. It will give you API v1 and v2 syntax all mixed together. It's hilarious. The same goes for trying to use ChatGPT (even their most recent 4o model) to write anything with the OpenAI API.

![](/assets/2024/06/a-vivid-illustration-of-a-futuristic-robot-simulta-6WbPe8XRTCCxOEwL1AltlA-uDxNuZzOTUGltfzLFJT7Rg.jpeg)

<p class="caption">I couldn't resist making an AI-generated (I used ideogram.ai) image for this post, because I love irony.</p>

> ChatGPT...doesn't learn, or understand, or reason about things. What it does is probabilistically generate text in response to a prompt. That can work well enough if the context you need to describe the goal is so simple that you can write it down and include it with the prompt. But that's a very small class of essentially trivial problems...

<p class="caption"><a href="https://jenniferplusplus.com/losing-the-imitation-game/">Jennifer Moore: Losing the imitation game</a>. Seriously, go read the entire post.</p>

People get excited when a model writes a working program when the only times I've seen that work is when it is so bog standard that it is no different than copy-pasting from a GitHub repo. Given the average number of edge cases in even the most standard web app, things go off the rails pretty fast. [Jennifer Moore again](https://jenniferplusplus.com/losing-the-imitation-game/):

> Non-trivial software changes over time. The requirements evolve, flaws need to be corrected, the world itself changes and violates assumptions we made in the past, or it just takes longer than one working session to finish. And all the while, that software is running in the real world. All of the design choices taken and not taken throughout development; all of the tradeoffs; all of the assumptions; all of the expected and unexpected situations the software encounters form a hugely complex system that includes both the software itself and the people building it. And that system is continuously changing.

> The fundamental task of software development is not writing out the syntax that will execute a program. [The task is to build a mental model of that complex system](https://pablo.rauzy.name/dev/naur1985programming.pdf), make sense of it, and manage it over time.

However the real deceit of "AI" c. 2024 isn't the tech and what it can or can't do. Its businesses still treating software development as a cost center, laying off devs at the same time they extol plans to build more features thanks to AI's ability to vomit boilerplate. [Jennifer Moore one last time](https://jenniferplusplus.com/losing-the-imitation-game/):

> Software development is complex...But there seem to be a lot of people who either don't understand that or choose to ignore it. They frame the entire process of software development as being equivalent to writing the toy problems and code samples we use among general audiences.

> The intersection of AI hype with that elision of complexity seems to have produced a kind of AI booster fanboy, and they're making personal brands out of convincing people to use AI to automate programming. This is an incredibly bad idea. The hard part of programming is building and maintaining a useful mental model of a complex system. The easy part is writing code.

**It's the features that cost money, regardless of who wrote them.**

Lean methodologies are a diet aimed at keeping the business healthy. But feature factories are more like a host nearly consumed by parasites. They need to be detoxed.

[^1]: I will cover GitHub Copilot in more detail in the future, including both my favorable experiences with it and studies supporting and opposing its effectiveness in software development. It can be very useful for a modestly experienced programmer, particularly one learning a new language/framework after already mastering one or more languages/frameworks already. It can also dramatically speed up tasks that are _mostly_ boilerplate, like writing tests. There are a number of sources in favor of, and against, leaning on AI tools for increasing test coverage.
