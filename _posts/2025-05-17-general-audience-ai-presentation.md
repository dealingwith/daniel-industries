---
layout: post
title: "General-audience AI Presentation"
excerpt:
date: 2025-05-17 09:21:19 -0500
categories:
 - ai
---

I gave a presentation to my company, which consists of ~20 people with a wide array of technical abilities/knowledge, from struggles-with-their-webcam to knows-more-about-this-tech-than-me. I thought it would be worth putting the outline on here. My presentations tend to get animated, I add a lot of jokes and meandering metaphors which are not included here. I asked an LLM to summarize the vibes:

<div class="small_img" markdown="1">![](/assets/2025/05/granola-transcript-vibes.png)
<p class="caption" markdown="1">via [Granola](https://www.granola.ai/). I posted this screenshot to Slack with the caption, "Granola you sycophantic monster, tell me more"</p>
</div>

It's also worth pointing out that some of the text here is copy-pasted straight out of Wikipedia.

Also worth mentioning: I exported the Google Slides deck to PDF, then put the PDF into ChatGPT to generate the following. ChatGPT modified the text. I prompted it again, "make sure to include all the text from the PDF", but it still made some subtle structural changes and edits. I'm not sure if I've noticed all of them; some of them I liked so I kept.

## Core Concepts and Practical Knowledge for Using AI

### Goal

To give you a basic technical understanding and a mental model with which to interact with this tech:

- Its strengths and weaknesses
- Why the hype
- How to see through the hype

We’re focused on LLMs today, because of the hype (“magic beans”) and sheer volume of new tech tools entering the market. ML is a broader topic.

### Agenda

- History of AI
- Important terms and concepts for understanding and using AI in May 2025
- How/when LLMs are good or bad
- Demos as time permits

**Not covering:**

- Ethical issues
- Slop (other than all the images in this presentation)[^1]
- Legal issues
- Security issues
- Terminator

*I will try to stop myself when I veer into philosophy or psychoanalysis but it’s difficult to avoid when discussing language.*

### History

*Pictured is from the ToC for [“History of artificial intelligence” on Wikipedia](https://en.wikipedia.org/wiki/History_of_artificial_intelligence), which has 40 subsections and approximately 20,000 words*

- Notice the dates
- Notice the two “AI winters”
- Neural networks (starting 1980) → led to...
- Lots of Machine Learning and Deep Learning work from 2010 → on
- The transformer architecture, which was foundational to the current boom in LLM-based AI technology, was published in 2017
- ChatGPT was the first published LLM in 2020

#### History (cont)

- Demis Hassabis + team → DeepMind → 2010 → Thiel, Musk → undisclosed, but let’s very conservatively say $5M
- Geoffrey Hinton + team → Google → 2012 → $44M
- DeepMind → Google → 2014 → between $400M and $650M
- [Musk v Google drama here]
- OpenAI nonprofit → 2015 → Musk, Altman
- OpenAI for profit → 2019 → $1B
- [OpenAI v Amodei drama here]
- Dario Amodei → Anthropic → 2021 → $6B
- [More OpenAI drama here]

<div class="small_img" markdown="1">![](/assets/2025/05/image-graph.png)
<p class="caption">Notice how ChatGPT still can’t draw* a graph properly. It also refused to continue iterating on it, I presume because it realized it was helping me violate Hasbro copyright.</p>
</div>

### Terms

- ML
- LLM
- GPT
- Context Window
- Prompt Engineering
- RAG
- MCP
- Agents

There are many more, we’re staying focused!

### Machine Learning

Machine learning (ML) is a field of study in artificial intelligence concerned with the development and study of statistical algorithms that can learn from data and generalise to unseen data

- Supervised learning
- Unsupervised learning
- Reinforcement learning

*Think of it like training your dog.*

### Large Language Models

A type of machine learning model designed for natural language processing tasks such as language generation.

- Trained on massive datasets of text
- Predict the next word/token in a sequence by assigning probabilities to each possible next word (or 'token') based on the words that came before
- Doesn’t “understand” meaning like a human — it mimics patterns of language based on data

### Generative Pre-trained Transformer

A transformer is a deep learning architecture. GPTs are a type of LLM pre-trained on large data sets of unlabeled text, and able to generate novel human-like content.

- The first GPT was introduced in 2018 by OpenAI (GPT-1)
- A foundation model is an AI model trained on broad data at scale such that it can be adapted to a wide range of downstream tasks

### The Context Window

Think of this as the amount of things the model can pay attention to at a time.

- Larger is better...to a point
- Limitations around context is why a single chat session might “forget” the first parts of the “conversation”, or a coding assistant might re-introduce a bug it had previously fixed

### Prompt Engineering

Prompt engineering is the process of structuring or crafting an instruction in order to produce the best possible output from an AI model

- Using the tools is the best teacher
- Looking at other people’s prompts is also a good way to learn, especially pre-written prompts or automatically generated prompts
- Making sure documents put into context are well structured (why LLMs love text, especially markdown)
- Asking good questions

### Retrieval-Augmented Generation (RAG)

RAG systems allow the system to query for additional information in order to put it into the context window.

- Usually using a vector database – a database structured similarly to an LLM but with only your content in it
- RAG allows you to create a specialized agent that “knows” more about your domain-specific information – a common example is a customer support agent

### Model Context Protocol (MCP)

MCP is a framework to standardize the way AI models integrate and share data with external tools, systems, and data sources.

- A standard way to hook up other systems to provide instructions or data to the model – an API for your models
- Can be used to build a RAG or RAG-like system, or to query an API that provides domain-specific data
- MCPs are everywhere now – Notion and Slack both have MCP servers, for example
  - They were quick to appear because they’re just new APIs against existing functionality (e.g. search)

### Agents and Agentic Workflows

An “agent” is just a specialized series of instructions and integrations for an LLM, probably using one of the technologies just discussed. Agents are typically strung together to accomplish specific tasks:

- Agent A is responsible for calling all the other agents and validating the final response
- Agent B might use MCP to retrieve and validate data, passing it on to...
- Agent C, which transforms the data and...
- Agent D, which produces a response to pass back to Agent A

### Technical Problems

- LLMs can not inherently create new ideas – they "want" to create the most average thing
- LLMs are only based on language, which is only symbolic
  - Language is still the "best thing we have", which is why we love LLMs, but also why smart people have to use scare quotes around certain words when describing what LLMs do, or the patterns we use to interact with them
  - The “uncanny valley” is harder to spot in text
- LLMs are sycophantic – the opposite of “Bold voices”[^2]
- LLMs are biased
- LLMs are NOT precise (but can use APIs when precision is needed)
- LLMs probably won't lead to AGI

### What are some of the most valuable applications for individual use of an LLM?

#### 1. Language-specific tasks

- Programming-language-specific tasks
  - Programming languages are designed to remove ambiguity, so LLMs are particularly good with them
- Helping you technically write better. ("Copy editor" is literally a job that can be replaced by an LLM)
- An LLM cannot take the place of an actual editor who tells you your story is:
  - stupid
  - full of holes
  - over-uses cliches
- LLMs aren't good writers if you're trying to actually sound smart or original
- Conversely, LLMs are good at navigating scenarios where business theater has replaced actual truth and meaning, like security audits. LLMs are great bullshit machines.

#### 2. Helping to structure, consolidate, or connect information

- Asking questions of a specific text  
  Example: Granola is great for meeting transcripts
  - Speaking is lossy – automatic transcription is less so
  - Listening is lossy and biased – the model might help you break from your initial interpretations
- Helping you reason or learn from a text, or learn an
established subject, and practice spaced repetition and other established learning methods
  - Learning basic things that already exist in the model or
supplied in the context window or through other data
sources

#### 3. Technical Applications

Technical applications where "close" is good enough, or even better than precision, or where the "obvious" solution is almost always the correct one; OR when completeness is required but by nature of the scope of the problem, impossible to achieve

- Scraping
- Test coverage
- QA automation

[ Aside: I discussed some of these last year in [this post](/2024/07/09/my-mostly-positive-experience-with-github-copilot/ "My Mostly Positive Experience with GitHub Copilot") ]

#### 4. Thinking Partner

If used correctly, an LLM can be used as a "thinking partner", helping you reveal obvious mistakes in your thinking, or where specific domain knowledge might apply to your assumptions.

- This requires specific prompts (and soon) tool chains[^3]
- You have to "force" the model to reverse its sycophantic nature, and look out for when it inevitably moves back to the mean or starts getting subtly sycophantic again.

Examples:

"Critique this text like [an internet troll, a professor who never gives A grades, Bob from work]" ("Bob from work" would have to be described to the model first)

"Specifically within the context of [some mental framework], ask me questions challenging the assumptions and claims made in this text."

[^1]: I had AI-generated images on most slides. I've only included one here, as they were mostly silly or weird, which was somewhat the point, but not worth including in this context.

[^2]: "Bold voices" is one of our company's core values

[^3]: Hopefully I will be posting about this soon