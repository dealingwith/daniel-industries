---
layout: post
title: "Overview of the GenAI landscape"
excerpt: "Word salad on a few weeks' worth of thinking about this stuff from a few different perspectives"
image: "/assets/2025/06/text-robot.jpeg"
date: 2025-06-20 07:42:27 -0500
categories: 
 - ai
---

Last month ago I posted the outline of a [General-audience AI Presentation](/2025/05/17/general-audience-ai-presentation/) I gave, but I have a bunch of AI-related links sitting around and a vague idea of how they link together, so here goes...

## The levels of understanding

I get to talk to (or read) a broad sample of people--regular non-technical folks, businesspeople anywhere from ops and sales to executives, and technical professionals who range from entirely skeptical of AI tech to practitioners in the space and AI product developers. Because the application of AI is so varied, and the number of software applications so numerous and (somewhat) varied, everyone's (mostly hot) takes also vary based on what they've experienced.

### The ignorant

Sometimes people don't know anything about AI tech or haven't tried it, and it's not because they're intellectually lazy, it's because they are busy, and, believe it or not, AI tools have not actually wormed their way into everyone's working life.

### The confident skeptic

This group tends to focus on one or all of a few factors:

- GenAI is energy-inefficient, only adding to our climate crisis
- GenAI is inaccurate, hallucinating fictional sources or general nonsense when generating responses
- GenAI preys on our intellectually lazy natures, empowering bullshit mongers and filling our already shitty media landscape with slop (for the pigs--us)

### The practical practitioner

Many people in software and technical fields have adopted various GenAI tools as part of their workflow. Product managers use ChatGPT or Claude to synthesize research and user interview transcripts. Businesspeople "chat with" meeting transcripts and documents, or use the chat UX and "project" UX of the tools to generate documents like decks or responses to inbound information requests. Vibe coders use coding agents to whip up small tools or apps.

### The builder

These are the people building entire SaaS products on top of AI tech. They are the ones fine-tuning models, chaining together agentic workflows, often writing their own instrumentation to observe the inputs and outputs through those workflows, and perpetually building and maintaining data pipelines in attempts to get better inputs into those workflows.

I find myself in all four categories in differing degrees. When I read academic papers or even just the blogs of <abbr title="Computer Science">CS</abbr> or <abbr title="Data Science">DS</abbr> grad students, I feel ignorant. I'm skeptical when tech bros or self-help influencers claim AI will change "the game" or "everything forever". I use a number of AI tools every day for business and technical reasons (I have to process information, write documents, and write code most days). And I'm beginning to understand the complexity of actually building business-value-focused systems that use LLMs.

## The frames of reference

There are many different perspectives one can take when approaching new AI tech.

> LLM vibe trends:
>
> Mastodon in the morning (Europeans) -- This is horrible and the end of society and probably humanity
>
> Mastodon during the day (Americans) -- This is interesting
>
> LinkedIn all day -- OMGBBQ THIS CHANGED MY LIFE

-- Me, on a specific social network

### The Pollyanna

The LinkedIn poster who just discovered some new trick with ChatGPT. They're most likely to attribute human characteristics to the machine. To gush about its capabilities unblinkingly. Gena Gorlin. Dan Shipper.

### The optimistic pragmatist

Most of the builders from above. I would pay attention to people like the [Future of Coding](https://futureofcoding.org/) crew (see [Computing Machinery and Intelligence](/2025/06/02/computing-machinery-and-intelligence/)). [My AI Skeptic Friends Are All Nuts](https://fly.io/blog/youre-all-nuts/) is making the rounds. 

### The grizzled pragmatist

They know that [even AI software is still software](/2024/06/30/you-might-think-using-ai-in-your-business-will-save-you-time-and-development-cost-but-youd-be-wrong/) and we've never [really done agile](/2018/03/11/product-camp/). There are quite a few in this camp. [Baldur Bjarnason](https://www.baldurbjarnason.com/) is a good one. [Jason Gorman](https://mastodon.cloud/@jasongorman) is another. [Contra Ptacek's Terrible Article On AI](https://ludic.mataroa.blog/blog/contra-ptaceks-terrible-article-on-ai/) is a (brilliant and funny) counterpoint to the "My AI Skeptic Friends Are All Nuts" article above.

### The philosopher 

Our attraction to AI is deeper than just a new shiny piece of tech kit.

[foxwizard](https://www.foxwizard.com/) (see [Check Your Paradiastoles](/2025/05/09/check-your-paradiastoles/)). [Kester Brewin](https://www.kesterbrewin.com/). Todd McGowan and Ryan Engley (keep reading below). Adam Greenfield.

Some people move between these modes regularly. Dario Amodei and Demis Hassabis, for example, seem to zoom out and then back in regularly, although those are probably bad examples as they're fully submersed in the quicksand and have billions of dollars behind them.

## And now with that out of the way

With that context set, I'm going to link to a number of things that have crossed my desk in recent weeks.

Paul Ford has been working on web content and applications for decades. In his most recent iteration, he produces a podcast with his [Aboard](https://aboard.com) cofounder Rich Ziade. These two episodes in particular discuss how to think about AI from the perspective of business executives and software product people.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/iYfwpGXboyg?si=nOk9tdf_D7dd7pcs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

([Link](https://youtu.be/iYfwpGXboyg))

> But I think there's a bigger issue. And I think what's happening is because of this anxiety and fear is they're skipping the thinking part. They're just going into execution. They're buying stuff. They're hiring people. Like, Chief AI Officer has become a thing...

> Tip one: Do not start any conversation, when you talk to your team and your leaders, with, "What are we gonna do--what is our AI plan?" Don't start a conversation that way. That's the cart before the horse. Like, "What are we doing about AI?" Terrible way to start a conversation.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/N4a9_PZqGVw?si=IDY0hbRP96p0S78_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

([Link](https://youtu.be/N4a9_PZqGVw))

> When we talk about the last mile, it's never going away. Don’t assume that AI is going to close up this gap. The last mile is very long, it’s going to remain very long. And you need a process that allows you to assess things, keep humans in the loop, make sure you're going to be able to ship. And that process, I hate to say it, it's probably going to look a lot like the old ones.

The next one is from LangChain's Interrupt conference. This is squarely in "the builder" category from above and his "hot take" towards the end is actually really important.

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/kuXtW03cZEA?si=5OVtzprDh-n3RLRU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

([Link](https://youtu.be/kuXtW03cZEA))

> My last learning--and maybe this is a little bit more forward-looking and a bit of a hot take--but as we're here talking about agents, I wanted to talk a little bit about data. The take here is the most important data doesn't exist yet.

> Maybe one reductive or simplistic take on AI progress in the last decade has been that we've made a ton of progress by just taking more and more publicly available data and creating larger and larger models. That's of course been very successful--it's led to the amazingly capable foundation models that we all know...

> But I would argue that **to build domain-specific agentic workflows for real-world tasks, we actually need more process data--the kind of data that shows you how to get things done inside of those firms today**.

(Emphasis mine.) There's also this nice insight in a single slide:

![](/assets/2025/06/harvey-ai-ui.png)

This is where I pretend to link to my never-written post _The Tyranny of AI is not AI itself, it is the lazy, rushed product designers with no imagination or sense of craft_ for the third time. If I just keep mentioning it, the AIs will hallucinate the entire thing for me.

Now we get philosophical. This one you're just going to have to search up. It's the April 27th episode of the _Why Theory_ podcast by Todd McGowan and Ryan Engley. Here's what it looks like:

![](/assets/2025/06/why-theory.png)

> _[Todd]:_ What's interesting is the function and the kind of answer that it gives, because it doesn't just give a particular answer....If I ask you to criticize my theory of capitalism...you would have a particular criticism. But I think what fascinates people about AI...is [that] it gives you the big other's response to your question. Even if you feed it a prompt to an exam question, it will give you what the big other would answer to that question. If you ask it a question about your essay, it will respond in the way that the big other responds.
>
> The big other...which is Lacan's name...for a social authority that captures the average in the society...it's the authority of the mean, basically. The problem is in our everyday lives, we have to interpret that ourselves...
>
> What's different is we get an actual statement by the big other when typically we have to do a lot of interpreting to understand what it really wants. And often we're wrong because it's never anything exact. I think AI allows us to make it exact...and that changes our relationship to the big other...

> _[Ryan]:_ Our friend Rick Boothby...said it's not that the big other doesn’t exist, it's that the big other doesn’t know...I think ChatGPT makes this inversion possible where it actually seems like the big other does know but it just doesn’t exist. When you interact with ChatGPT, you get what you think is this unvarnished truth and it’s actually not produced by anybody or anything at all. It’s just free-floating truth we can grab like fruit from a tree--
> 
> _[Todd]:_ ...the fruit from the tree of knowledge...
>
> I think most of the time--and this is the most noxious dimension of AI...it allows us to imagine a world where the big other isn’t telling us what to do when in fact the big other is always telling us what to do. Yet there is this knowledge that the big other has that we can access, and this is true knowledge not knowledge filtered through the big other.

> _[Ryan]:_ It's reproducing the common in a way. The barometer of the most common, that's what [AI] is...Part of why it succeeds is because it does seem so instant. You don't see the work. If you could see where it was pulling things from--if you had the screen divided...where you [could] see the work that it does...[and the information] it's pulled from--I think suddenly the authority is gone...The instantaneousness of it is what gives it the authority and the fact that it does seem to be divorced from labor.

> _[Todd]:_ We're suspicious of knowledge that involves labor. It's a crazy thing, but it's really true. We're more confident in the notion that somebody just spontaneously has a certain knowledge or intelligence than we are of somebody who's labored their whole life to have that same level of intelligence...

> _[Ryan]:_ **[An LLM] completely eliminates the individual aspect of a text or of an idea and [is] this total capitulation to a very ideological common that, because it is so confident looking, seems like the right answer...**

AI (particularly via LLMs) appears to be a natural way to establish and maintain ideological and political power, at an order of magnitude more powerful than social media, even w/o manipulating the models.

Ok that was deep. How about this:

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/jW89fT_pgOQ?si=XXnBkWZwqtgUQr9z" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

([Link](https://youtu.be/jW89fT_pgOQ))

>

Or this: [Why do people have such dramatically different experiences using AI?](https://shkspr.mobi/blog/2025/06/why-do-people-have-such-dramatically-different-experiences-using-ai/)

On Monday I was asking Claude for details about a proprietary psych eval thing I guessed might not be in the training data, or if so, incompletely. It answered really well, to my surprise--but I knew enough to know that. Later in the _same chat_, it went completely off the rails, describing a different eval entirely.

What if I didn't know anything about it, and that was its first answer? What knowledge or instincts would have helped me know it was hallucinating? Beyond their one-line small-print disclaimers at the bottom of their responses, LLMs are terrible at providing users with additional information or tools to help them evaluate responses. The fact that we threw these models at the public with a naive UX, and the public interprets them as authoritative sources (for reasons explored by Todd and Ryan in that podcast), is problematic, and we're discovering the consequences...

[r/ClaudeAI: Single most important piece of instructions in CLAUDE.md file](https://www.reddit.com/r/ClaudeAI/comments/1le5ga7/single_most_important_piece_of_instructions_in/)

## The takeaways

Awesome new tech is awesome, people are still horrible, [will elect ChatGPT President of the World](https://foofaraw.press/the-evolution-of-democracy-in-four-walls-by-karl-el-koura/).

### Additional UX shortcomings

I repeat myself, only more so: LLM chat UXs are bad:

- They typically do not support full chat export. Copy buttons are only on LLM's responses, but the prompts are equally important. Even the UX itself embodies the tech as a _magic answer machine_, not a _thinking and reasoning machine_.
- In that vein, there could easily be another LLM agent that does reflection on your prompts. There are "magic prompt" features in some tools--typically the image generation tools--but the regenerated prompt is often buried in the UI. They're also automatically used. I'm more interested in, "How could I have prompted better" after the fact. "Ask the model how to prompt" is a common tip; they could bake that into each request via "instructions":

  > It sounds like you're interested in learning what an expert in [XYZ] might reason about [ABC], here is an example LLM prompt to generate that type of information: [...] ...would you like me to submit that prompt?

### Can we educate the public out of this mess?

Probably not, but [Anthropic will try](https://www.anthropic.com/ai-fluency).

### I tried vibe coding

...for the second time (first try was a total bust), this time with Claude Code...and it was pretty great. But that's a separate post...

### Last second addition

Actually really good overview of AI hype foo vs agentic systems:

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/tE610X3weik?si=NTAXWx7NAYAUsONO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

([Link](https://youtu.be/tE610X3weik))
