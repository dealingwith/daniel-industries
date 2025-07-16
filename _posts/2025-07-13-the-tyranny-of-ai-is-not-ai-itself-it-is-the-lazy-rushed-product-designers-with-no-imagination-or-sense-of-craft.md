---
layout: post
title: "The tyranny of AI is not AI itself, it is the lazy, rushed product designers with no imagination or sense of craft"
excerpt: 
date: 2025-07-13 12:21:36 -0500
categories: 
 - ai
---

I'm doing it! I'm writing this post. 

![](/assets/2025/07/52f088a1e9a9927c.jpg)
<p class="caption" markdown="1">_Why_, you might ask? I decided to use this [Oblique Strategies](https://en.wikipedia.org/wiki/Oblique_Strategies) card. Perhaps there is a UX lesson for AI product designers in Oblique Strategies...🤔</p>

## Let's talk about product naming

Since "assistants" became a thing--10 years ago? 15 years ago?--they needed names, and they were often bad.

- Google Assistant. Good job. Keep is simple, stupid.
- Alexa. [Sorry everyone who named their child this](https://www.parents.com/baby-names-ruined-by-technology-and-society-8656098 "According to the Social Security Administration (SSA), the baby name Alexa peaked as the 32nd most popular girl’s name in 2015, before plummeting to rank 603. Why? Having Alexa as a trigger for a voice command around the house can lead to children with that name becoming the butt of jokes and bullying.") in the years prior.
- Siri. Would have probably been liked had it worked.

Then came LLM chatbots. They talked like humans! Of course they needed ostensibly human names!

| Platform/Developer | Name | My hot take |
|---|---|---|
| Google | Gemini | alliteration! |
| Samsung | Bixby | meh |
| Microsoft | Cortana | double meh |
| Microsoft | Copilot | better |
| Meta | Meta AI | KISS |
| Yandex | Alice | Go ask Alice / When she's ten feet tall |
| Huawei | Celia | why the anglophone name? |
| Amazon (AWS) | Q | is this supposed to be a James Bond reference? |
| Brave | Leo | rawr |
| xAI (Elon Musk/X) | Grok | stop trying to fit in with the nerds you dumb frat bro |
| Anthropic | Claude | fine |
| OpenAI | ChatGPT | do any of your customers know what GPT means? |
| Perplexity.ai | Perplexity | I'm indeed perplexed |
| DeepSeek | DeepSeek | KISS |
| Intercom | Intercom Fin | it's over |
| Zendesk | Zendesk AI | I do like a donut shop called "donuts" |
| HubSpot | Breeze Copilot | it'll be a breeze, I promise |
| Salesforce | Einstein Copilot | come on, guys |
| Freshworks | Freddy AI | Wes Craven fans |
| IBM | IBM watsonx Assistant | don't capitalize "watsonx", that makes it cooler |
| Zoom | Zoom AI Companion | don't be afraid, it's a _companion_ |
| Amazon | Rufus | woof woof |
| Upwork | Uma | I wonder how long they workshopped this |

## May 2024

![](/assets/2025/07/uma.png)
<p class="caption" markdown="1">Why, no, I haven't met Uma! Is that Uma? Hi, Uma! I love your cool bookshelf thing, Uma. Is that your training data? Fantastic pun, by the way.</p>

I received the above email in May 2024. Here were my immediate notes, right after I wrote what is now the title of this post:

LLMs can offer significant value to your business. Slapping an LLM-backed chatbot onto the front of your product, using one of the major models either out-of-the-box or via their API, does not automatically provide any value. The chat UI has been replicated in seemingly every product out there. Just picking a new name for your bot out of a hat isn't a product feature; that is the laziest product development I can imagine. Chat is great when it exactly matches the use case, but most of the time it does not. Unimaginative product leaders and designers are just copying what is out there.

The companies developing the models, hoping to find revenue that can sustain that development, were also just perpetuating the first and most obvious UX pattern for leveraging the models (chat, and now voice, which is the same thing). Chat is boring, lazy UX design, perpetuated throughout the AI product bubble.

Just using the base models provides no additional value over your customers just using those providers' products directly; in fact, it might be worse if you've half-assed your initial prompt instructions. Using an LLM in the context of your business value requires:

- understanding the additional tech (e.g., RAG and vector DBs [2025: and now, MCP servers and advanced 'memory' techniques]) required to leverage your business's intelligence/context
- extensive prompt engineering and temperature defaults
- extensive training and fine tuning

I then listed a couple of exceptions to this trend, and I have some more now, a year later, but I come back to those in a minute. Because I wasn't the only one making these observations last year and every chance since...

![](/assets/2025/07/image_1729697533290_0.png)
<p class="caption" markdown="1">When the product is already a dog, the AI gets a dog's name (apologies to all human Rufuses, especially Rufus Wainwright, who is amazing, and you, if you're a Rufus reading this, you're amazing too).</p>

## Prior Art

[Language Model Sketchbook, or Why I Hate Chatbots](https://maggieappleton.com/lm-sketchbook/) (almost 2 years ago) is the exemplar, and why I haven't bothered to write this post for a year.

> The primary interface everyone and their mother jumps to at this point is the chatbot. We are irreversibly anchored to this text-heavy, turn-based interface paradigm. And sure, it’s a great solution in a lot of cases! It’s flexible, familiar, and easy to implement.
> 
> But it’s also the lazy solution. It’s only the obvious tip of the iceberg when it comes to exploring how we might interact with these strange new language model agents we’ve grown inside a neural net.

Maggie then goes on to use her amazing illustrations and some mockups of alternative UX for AI. This is the must-read post on this topic.

She links to [Natural language is the lazy user interface](https://austinhenley.com/blog/naturallanguageui.html) by Austin Z. Henley (Jan 2023) ...how crazy must this person be feeling over two years later! (He's very smart, so he's probably fine working on interesting problems, not too worried about Uma and Rufus.)

> People are anticipating that large language models are going to revolutionize the world.
> 
> And maybe they will.
> 
> But a chat bot won't.
> 
> Expecting users to primarily interact with software in natural language is lazy.
> 
> It puts all the burden on the user to articulate good questions. What to ask, when to ask it, how to ask it, to make sense of the response, and then to repeat that many times.
> 
> But a user may not know what they don't know.
> 
> A good user interface let's me iteratively and incrementally explore the problem and solution space in a variety of ways.
> 
> A great user interface guides me and offers nudges.
> 
> Couldn't a natural language interface help with that?
> 
> Certainly.
> 
> But not as the only option. Probably not even the main interface.

[The case against conversational interfaces](https://julian.digital/2025/03/27/the-case-against-conversational-interfaces/) (Mar 2025)

> I’m not entirely sure where this obsession with conversational interfaces comes from. Perhaps it’s a type of <abbr title="a feeling of nostalgia for a time you have never experienced. It captures the longing for a past that is not your own, often evoked by music, films, or other cultural artifacts.">anemoia</abbr>, a nostalgia for a future we saw in StarTrek that never became reality. Or maybe it’s simply that people look at the term “natural language” and think “well, if it’s natural then it must be the logical end state”.
> 
> I’m here to tell you that it’s not.

^ This is a very good article that goes into detail and you should read it.

[tante: ChatBots are just a really bad interface for a lot of tasks that they're supposedly the future of...](https://tldr.nettime.org/@tante/114392947271726896) (Apr 2025)

> The thing is: ChatBots are just a really bad interface for a lot of tasks that they're supposedly the future of.   
> 
> "AI"==chatbot mostly comes from the fact that this is very easy to build. Especially if - as it is with most modern AI tools - you don't actually know what the real use case is as a developer.  
> Good interfaces derive their structure from the task the user is trying to solve and the expected knowledge and domain model that user has. This is not how most "AI" solutions' interfaces are built.  
> 
> It is kinda funny. Terminal applications are always seen as too clunky and unwieldy for average non-nerds to use but that's exactly what chatbots are: Command line apps with unspecified parameters and outcomes.  

[It's time we stopped asking for vases](https://brilliantcrank.com/its-time-we-stopped-asking-for-vases/) (Apr 2025)

> When generative AI was made available to the public I, like you, bore witness to an insane barrage of crap posted to every nook and cranny of the Internet. It was interesting to see how far AI capabilities had advanced, but that curiosity lasted for about a day. Prompt engineering became the latest must-have skill. Many folks I know who advocated "hand crafted" quality in digital work were duct taping AI to their services and thought leadership.

[Are we designing AI products all wrong?](https://uxdesign.cc/are-we-designing-ai-products-all-wrong-d54d1005c92f) (June 2025)

> ...open any AI product and you’ll see the same tired interface: a message box at the bottom, chat bubbles, sidebar history. Twelve major platforms with nearly identical interfaces. This isn’t user-centered design; it’s design abdication.

## Exceptions

Besides Maggie's prototypes, here are some interesting outliers:

- [Elicit](https://elicit.com), a tool focused on academics and researchers, is designed to "Automate time-consuming research tasks like summarizing papers, extracting data, and synthesizing your findings." Maggie worked at Elicit, and the lab that birthed it. It offers a table UX for results, and a lot of thought-through LLM and agentic tech behind the scenes, specific to their use case.
- [Saner.AI](https://www.saner.ai/) is focused on the PKM and notetaking market. I used it for a while, but couldn't get it to work for my very picky brain. It does start with the chat UX as central, but offers additional UX affordances when working on notes and documents. It has built-in RAG against your notes.
- [Reor](https://www.reorproject.org/) is a similar writing and note-taking app, but it runs on the desktop. The note or document is central, with a sidebar for surfacing related notes. It's new and rough around the edges, and importantly, in my use case, has only dark mode. I currently can't read anything in dark mode because of a cataract, which I'll have surgery on in two weeks.
- [Sudowrite](https://www.sudowrite.com/) is focused on fiction writers. I'm very tempted to try it out for nonfiction and just sensemaking, however, as it looks well crafted and has a great team behind it.
- [Otto](https://ottogrid.ai/) uses a table UI to spawn concurrent agents to scrape data.
- The Browser Company's new [Dia](https://www.diabrowser.com) browser is getting thrown a lot of shade right now for reasons I will not get into, but their original marketing video for their pivot from Arc is _saying all the right things_. [An early peek at Dia, our second product](https://www.youtube.com/watch?v=C25g53PC5QQ) 📽️
  
  > Edison's light bulb by itself wouldn't change the world. Again, inventions alone rarely do. The real test came when Edison announced that he would illuminate one square mile of the heart of New York City with a newfangled electric light. Individual light bulbs were basically just better candles. A better candle was nice, but it didn't fulfill the promise of this revolutionary technology. It was only when we rebuilt our world around artificial light that everything changed. Night became as productive as day and the rhythm of daily life itself was transformed. 
  > 
  > Today we're at a similar point with AI. We've invented groundbreaking language models,  but **all we've managed to do is scatter AI buttons across our interfaces**. Just as individual light bulbs were like better candles, these isolated AI features are just better buttons. The real transformation will come when we weave AI throughout our computing environment, and that's what we want to build toward with DIA. So we think it has to be on top of a browser. You can build an operating system for a device, but you have to do it...with the idea that AI is going to be central.
  
  (Emphasis mine.) I have tried Dia a few times but the main interface is still the chat textbox.

I could be wrong. I'm using these tools that almost exclusively offer me just the dreaded Small White Box. Claude Projects looked promising, but it's just a way to persist some context across chats. ChatGPT's projects are exactly the same (clearly neither company knows what _project_ means). Notion's AI-in-every-context-menu is just a nuisance. The agentic workflows we're exploring at my day job will be almost entirely behind-the-scenes, just putting words and data in very standard UIs. If anything, we'll have a handful of [Unixy](https://en.wikipedia.org/wiki/Unix_philosophy) apps for kicking off and observing workflows, getting a particular piece of data, or entering new context into a workflow.

So far, my favorite interaction has been with Claude Code, which is still just prompting an agent, but because it is more like chatting with a project manager with multiple developers on its team, it hits different. It still takes considerable experience with software to get it to work, and it is still better with some languages than others. But once again, that's a subject for another post.

## Coda

[This Is Just Infinite](https://samplereality.itch.io/this-is-just-infinite) is peak Internet. This is the kind of thing AI could help you build (if AI knows [Twine](https://twinery.org/)), but could never think up itself, and I'm not sure it could even help you arrive at such an idea if you had vague rumblings. But the brain activity it unlocks is exactly what I wish AI could do, even if in slightly less abstract ways.