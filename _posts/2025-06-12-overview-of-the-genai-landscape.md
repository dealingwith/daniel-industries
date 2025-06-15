---
layout: post
title: "Overview of the GenAI landscape"
excerpt: 
date: 2025-06-12 07:42:27 -0500
categories: 
 - ai
---

I posted the outline of a [General-audience AI Presentation](/general-audience-ai-presentation/) I have about a month ago, but I have a bunch of AI-related links sitting around and an idea of how they link together, so here goes...

## The levels of understanding

I get to talk to (or read) a broad sample of people -- regular nontechnical folks, businesspeople anywhere from ops and sales to executives, and technical professionals who range from entirely skeptical of AI tech to practitioners in the space and AI product developers. Because the application of AI is so varied, and the number of software applications so numerous and (somewhat) varied, everyone's (mostly hot) takes also vary based on what they've experienced.

### The ignorant

Sometimes people don't know anything about AI tech or haven't tried it, and it's not because they're intellectually lazy, it's because they are busy and -- believe it or not -- AI tools have not actually wormed their way into everyone's working life.

### The confident skeptic

This group tends to focus on one or all of a few factors:

- GenAI is energy-inefficient, only adding to our climate crisis
- GenAI is inaccurate, hallucinating fictional sources or general nonsense when generating responses
- GenAI preys on our intellectually lazy natures, empowering bullshit mongers and filling our already shitty media landscape with slop (for the pigs -- us)

### The practical practitioner

Many people in software and technical fields have adopted various GenAI tools as part of their workflow. Product managers use ChatGPT or Claude to synthesize research and user interview transcripts. Businesspeople "chat with" meeting transcripts and documents, or use the chat UX and "project" UX of the tools to generate documents like decks or responses to inbound information requests. Vibe coders use coding agents to whip up small tools or apps.

### The builder

These are the people building entire SaaS products on top of AI tech. They are the ones fine-tuning models, chaining together agentic workflows, often writing their own instrumentation to observe the inputs and outputs through their workflows, perpetually building data pipelines in attempts to get better inputs into their workflows.

I find myself in all four categories in differing degrees. When I read academic papers or even just the blogs of CS or DS grad students, I feel ignorant. I'm skeptical when tech bros or self-help influencers claim AI will change "the game" or "everything forever". I use a number of AI tools every day for business and technical reasons (I have to process information, write documents, and write code most days). And I'm beginning to understand the complexity of actually building business-value-focused systems that use LLMs.

## The frames of reference

### The philosopher 


### The grizzled pragmatist


### The Pollyanna


### The optimistic pragmatist


---

With that context set, I'm going to link to a number of things that have crossed my desk in recent weeks.

Paul Ford has been working on web content and applications for decades. In his most recent iteration, he produces a podcast with his [Aboard](https://aboard.com) cofounder Rich Ziade. These two episodes in particular discuss how to think about AI from the perspective of business executives and software product people.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/iYfwpGXboyg?si=nOk9tdf_D7dd7pcs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> But I think there's a bigger issue. And I think what's happening is because of this anxiety and fear is they're skipping the thinking part. They're just going into execution. They're buying stuff. They're hiring people.Like, Chief AI Officer has become a thing...

> Tip one: Do not start any conversation, when you talk to your team and your leaders, with, "What are we gonna do--what is our AI plan?" Don't start a conversation that way. That's the cart before the horse. Like, "What are we doing about AI?" Terrible way to start a conversation.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/N4a9_PZqGVw?si=IDY0hbRP96p0S78_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> When we talk about the last mile, it's never going away. Don’t assume that AI is going to close up this gap. The last mile is very long, it’s going to remain very long. And you need a process that allows you to assess things, keep humans in the loop, make sure you're going to be able to ship. And that process, I hate to say it, it's probably going to look a lot like the old ones.

The next one is from LangChain's Interrupt conference. This is squarely in "the builder" category from above and his "hot take" towards the end is actually really important.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kuXtW03cZEA?si=5OVtzprDh-n3RLRU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> My last learning--and maybe this is a little bit more forward-looking and a bit of a hot take--but as we're here talking about agents, I wanted to talk a little bit about data. The take here is the most important data doesn't exist yet.

> Maybe one reductive or simplistic take on AI progress in the last decade has been that we've made a ton of progress by just taking more and more publicly available data and creating larger and larger models. That's of course been very successful--it's led to the amazingly capable foundation models that we all know...

> But I would argue that to build domain-specific agentic workflows for real-world tasks, we actually need more process data--the kind of data that shows you how to get things done inside of those firms today.

