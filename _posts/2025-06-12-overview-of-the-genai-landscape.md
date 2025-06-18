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

I get to talk to (or read) a broad sample of people--regular nontechnical folks, businesspeople anywhere from ops and sales to executives, and technical professionals who range from entirely skeptical of AI tech to practitioners in the space and AI product developers. Because the application of AI is so varied, and the number of software applications so numerous and (somewhat) varied, everyone's (mostly hot) takes also vary based on what they've experienced.

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

There are a lot of different perspectives one can take when approaching new AI tech.

> LLM vibe trends:
>
> Mastodon in the morning (Europeans) -- This is horrible and the end of society and probably humanity
>
> Mastodon during the day (Americans) -- This is interesting
>
> LinkedIn all day -- OMGBBQ THIS CHANGED MY LIFE

-- (me)

### The philosopher 

Our attraction to AI is deeper than just a new shiny piece of tech kit.

[foxwizard](https://www.foxwizard.com/) (see [Check Your Paradiastoles](/2025/05/09/check-your-paradiastoles/)). [Kester Brewin](https://www.kesterbrewin.com/). Todd McGowan and Ryan Engley (keep reading below).

### The grizzled pragmatist

They know that [even AI software is still software](/2024/06/30/you-might-think-using-ai-in-your-business-will-save-you-time-and-development-cost-but-youd-be-wrong/) and we've never [really done agile](/2024/10/20/productcamp-2024/). There are quite a few in this camp. [Baldur Bjarnason](https://www.baldurbjarnason.com/) is a good one.

### The Pollyanna

The LinkedIn poster who just discovered some new trick with ChatGPT. They're most likely to attribute human characteristics to the machine. To gush about its capabilities unblinkingly. Gena Gorlin. Dan Shipper.

### The optimistic pragmatist

Most of the builders from above. I would pay attention to people like the [Future of Coding](https://futureofcoding.org/) crew (see [Computing Machinery and Intelligence](/2025/06/02/computing-machinery-and-intelligence/))

Some people move between these modes regularly. Dario Amodei and Demis Hassabis, for example, seem to zoom out and then back in regularly.

## And now with that out of the way

With that context set, I'm going to link to a number of things that have crossed my desk in recent weeks.

Paul Ford has been working on web content and applications for decades. In his most recent iteration, he produces a podcast with his [Aboard](https://aboard.com) cofounder Rich Ziade. These two episodes in particular discuss how to think about AI from the perspective of business executives and software product people.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/iYfwpGXboyg?si=nOk9tdf_D7dd7pcs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> But I think there's a bigger issue. And I think what's happening is because of this anxiety and fear is they're skipping the thinking part. They're just going into execution. They're buying stuff. They're hiring people. Like, Chief AI Officer has become a thing...

> Tip one: Do not start any conversation, when you talk to your team and your leaders, with, "What are we gonna do--what is our AI plan?" Don't start a conversation that way. That's the cart before the horse. Like, "What are we doing about AI?" Terrible way to start a conversation.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/N4a9_PZqGVw?si=IDY0hbRP96p0S78_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> When we talk about the last mile, it's never going away. Don’t assume that AI is going to close up this gap. The last mile is very long, it’s going to remain very long. And you need a process that allows you to assess things, keep humans in the loop, make sure you're going to be able to ship. And that process, I hate to say it, it's probably going to look a lot like the old ones.

The next one is from LangChain's Interrupt conference. This is squarely in "the builder" category from above and his "hot take" towards the end is actually really important.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/kuXtW03cZEA?si=5OVtzprDh-n3RLRU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> My last learning--and maybe this is a little bit more forward-looking and a bit of a hot take--but as we're here talking about agents, I wanted to talk a little bit about data. The take here is the most important data doesn't exist yet.

> Maybe one reductive or simplistic take on AI progress in the last decade has been that we've made a ton of progress by just taking more and more publicly available data and creating larger and larger models. That's of course been very successful--it's led to the amazingly capable foundation models that we all know...

> But I would argue that to build domain-specific agentic workflows for real-world tasks, we actually need more process data--the kind of data that shows you how to get things done inside of those firms today.

There's also this nice insight in a single slide:

![](/assets/2025/06/harvey-ai-ui.png)

This is where I pretend to link to my never-written post _The Tyranny of AI is not AI itself, it is the lazy, rushed product designers with no imagination or sense of craft_ for the third time. If I just keep mentioning it, the AIs will hallucinate the entire thing for me.

Now we get philosophical. This one you're just going to have to search up. It's the April 27th episode of the _Why Theory_ podcast by Todd McGowan and Ryan Engley. Here's what it looks like:

![](/assets/2025/06/why-theory.png)

> _[Todd]:_ What's interesting is the function and the kind of answer that it gives, because it doesn't just give a particular answer. If I ask you to criticize my theory of capitalism, you would have a particular criticism. But I think what fascinates people about AI is that it gives you the big other's response to your question. Even if you feed it a prompt to an exam question, it will give you what the big other would answer to that question. If you ask it a question about your essay, it will respond in the way that the big other responds.
>
> The big other is Lacan's name for a social authority that captures the average in the society--it's the authority of the mean, basically. The problem is in our everyday lives, we have to interpret that ourselves...
>
> What's different is we get an actual statement by the big other when typically we have to do a lot of interpreting to understand what it really wants. And often we're wrong because it's never anything exact. I think AI allows us to make it exact, and that really changes our relationship to the big other...

> Our friend Rick Boothby says not that the big other doesn’t exist, but that the big other doesn’t know. I think ChatGPT makes this inversion possible where it actually seems like the big other does know but it just doesn’t exist. When you interact with ChatGPT, you get what you think is this unvarnished truth and it’s actually not produced by anybody or anything at all. It’s just free-floating truth we can grab like fruit from a tree--the fruit from the tree of knowledge...

> _[Ryan]:_ I think most of the time--and this is the most noxious dimension of AI--it allows us to imagine a world where the big other isn’t telling us what to do when in fact the big other is always telling us what to do. Yet there is this knowledge that the big other has that we can access, and this is true knowledge not knowledge filtered through the big other.

> It's reproducing the common in a way. The barometer of the most common. Part of why it succeeds is because it does seem so instant. You don't see the work. If you could see where it was pulling things from--if you had the screen divided where you're seeing the work that it does and maybe even slowed down where it's pulled from--I think suddenly the authority is gone. Especially when you know there are these huge data centers in the global South where labor is cheap, where OpenAI is paying people in Africa to clean up the language for like two bucks an hour. The instantaneousness of it is what gives it the authority and the fact that it does seem to be divorced from labor.

> _[Todd]:_ That's a key point--we're suspicious of knowledge that involves labor. It's a crazy thing, but it's really true. We're more confident in the notion that somebody just spontaneously has a certain knowledge or intelligence than we are of somebody who's labored their whole life to have that same level of intelligence...

> _[Ryan]:_ Right now what AI does is look for people who have attempted things and give you that. That’s where we are--this logic of emergence that completely goes against something like T.S. Eliot’s ‘Tradition and the Individual Talent’ or our friend Danny Cho’s idea of genius. The large language model completely eliminates the individual aspect of a text or of an idea and this total capitulation to a very ideological common that, because it is so confident looking, it seems like the right answer...


