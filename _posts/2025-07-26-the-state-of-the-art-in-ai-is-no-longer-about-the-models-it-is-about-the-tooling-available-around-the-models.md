---
layout: post
title: "The state-of-the-art in AI is no longer about the models, it is about the tooling available around the models"
excerpt: 
date: 2025-07-26 07:50:00 -0500
categories: 
 - ai
 - elsewhere
---

[Simon Willison: I really don’t like ChatGPT’s new memory dossier](https://simonwillison.net/2025/May/21/chatgpt-new-memory/) (May 2025)

> The *entire game* when it comes to prompting LLMs is to carefully control their context—the inputs (and subsequent outputs) that make it into the current conversation with the model.
> 
> The [previous memory feature](https://simonwillison.net/2024/Feb/14/memory-and-new-controls-for-chatgpt/)—where the model would sometimes take notes on things I’d told it—still kept me in control. I could browse those notes at any time to see exactly what was being recorded, and delete the ones that weren’t helpful for my ongoing prompts.
> 
> The new memory feature removes that control completely.
> 
> I try a lot of stupid things with these models. I really don’t want my fondness for dogs wearing pelican costumes to affect my future prompts where I’m trying to get actual work done!

> ...Understanding how these models work and what they can and cannot do is difficult enough already. There’s now an enormously complex set of extra conditions that can invisibly affect the output of the models.

_Memory_ and managing memory in an LLM tool stack is going to be critical as we build business systems that incorporate generative AI. The above shows how this feature, designed to improve outputs in a general-use consumer application of GenAI, can actually degrade the UX under certain circumstances.

📽️ [Architecting Agent Memory: Principles, Patterns, and Best Practices](https://www.youtube.com/watch?v=W2HVdB4Jbjs) is a short talk that I found useful in understanding how we will begin to manage memory around our agentic workflows.

The other tools I have already mentioned on this blog:

- RAG (Retrieval-Augmented Generation)
- Agentic workflows. Agent is just a fancy term for an instance of this tooling customized and narrowly scoped to perform a specific task, which controls for the unpredictable nature of model responses
- MCP (Model-Context Protocol)

Me, previously: [The Tyranny of AI Is Not AI Itself, It Is the Lazy, Rushed Product Designers with No Imagination or Sense of Craft](https://daniel.industries/2025/07/13/the-tyranny-of-ai-is-not-ai-itself-it-is-the-lazy-rushed-product-designers-with-no-imagination-or-sense-of-craft/):

> Using an LLM in the context of your business requires:
> 
> - understanding the additional tech--RAG and vector databases, MCP servers, and advanced memory techniques--required to leverage your business's intelligence/context
> 
> - prompt engineering and temperature defaults
> 
> - training and fine tuning

My *[builder](https://daniel.industries/2025/06/20/overview-of-the-genai-landscape/#the-builder)* archetype:

> These are the people building entire SaaS products on top of AI tech. They are the ones fine-tuning models, chaining together agentic workflows, often writing their own instrumentation to observe the inputs and outputs through those workflows, and perpetually building and maintaining data pipelines in attempts to get better inputs into those workflows.

[Prompting Isn't a Strategy](https://daniel.industries/2025/04/21/prompting-isnt-a-strategy/)
