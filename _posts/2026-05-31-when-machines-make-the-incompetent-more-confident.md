---
layout: post
title: "When machines make the incompetent more confident"
excerpt: "Can I get the logo in cornflower blue?"
date: 2026-05-31 08:10:52 -0500
categories: 
 - software
 - product
 - elsewhere
---

[Appearing Productive in The Workplace](https://nooneshappy.com/article/appearing-productive-in-the-workplace/)

> A meaningful share of my current role has become sitting across from account directors and go-to-market leads who arrive with AI-generated projects and argue them. What they are proposing, in most cases, is a dashboard or website that displays the status of a process that is not ready to be automated, built to track a workflow that does not yet warrant tracking. The tool has not solved a problem; it has driven its user to identify a problem worth solving, outlined an architecture for the solution, and produced enough material — diagrams, schemas, interface mockups — that the user arrives in the room convinced the work is real. My job is to explain, carefully, why the logic is flawed: why the process they have outlined is either a non-problem or a premature one, why the architecture the model produced is a plausible shape of a system rather than a system plan, why the confidence they feel is the model’s confidence and not their own. They do not take it well. The tool has given them the experience of building something, and the experience feels like expertise...

> Requirements documents that were once a page are now twelve. Status updates that were once three sentences are now bulleted summaries of bulleted summaries. Retrospective notes, post-incident reports, design memos, kickoff decks: every artifact that can be elongated is, by people who do not read what they produce, for readers who do not read what they receive. The cost of producing a document has fallen to nearly zero; the cost of reading one has not, and is in fact rising, because the reader must now sift the synthetic context for whatever the document was originally about.

(I decided on just two big pull quotes this time, but seriously just read the entire thing.)

<iframe width="100%" height="315" src="https://www.youtube-nocookie.com/embed/k1k8iemxbl4?si=jsoNwAE-K0PgTS_N" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

"Can I get the logo in cornflower blue?" is one of my favorite movie quotes to deploy in a work conversation. But other times, I'm in a meeting with so much ignorant bloviating that I have to subtoot:

> Product management is the hardest job in software only because everyone thinks they are a f*n software expert even if they've never designed a single feature 

Actual documentation used to be the safe-from-stupidity domain of actual professionals, people who had the expertise and humility to actually think through problems and solutions. Now, "I read it on the Internet" has leeched into our conference rooms and intranets. At my work, an otherwise smart coworker plopped a 1000-word doc of proposed product updates into Slack that was the most slop-laden thing I'd read in some time.

> **URGENT: Platform Enhancement Requests**  
> **TO: [ ... ]**  
> **FROM: [ ... ]**  
> **DATE: [ ... ]**  
> **PRIORITY: 🔴 High -- Immediate Roadmap Consideration Required**
>
> **Executive Summary**
>
> [ _Two paragraphs of slop_ ]
>
>> ⚠️ These features must be prioritized in the next sprint cycle.
>
> [ _~1000 more words of slop_ ]

_Even recreating the bold text here makes me a little ill_

There is more going on that would lead someone to generate such a document _and_ immediately share it with their coworkers--her pain is real and should not be dismissed[^1]--but the fact that the AI became the intermediary for this communication simply intensified all the pitfalls of less experienced product thinking:

- Trying to develop solutions before fully understanding the problems
- Not understanding the context: 
  - what other work is being done
  - how we prioritize work
  - what other use cases are involved
  - what edge cases have been discovered
  - knowing that other use cases and edge cases have _not_ yet been discovered...
  - what it actually takes to get software into production
  - what it actually takes to maintain software in production
  - what it actually takes to support software in production
- Not appreciating how much organizational psychology is involved in product development[^2]

I use AI to generate documents at work _all the time_. It often helps me put things into words I hope coworkers will better understand. But I've first used the LLM to think through the problem: I've given it instructions to try to make it less sycophantic and get it to challenge me[^3], I've asked it to critique my original thinking, I've read its massive outputs, asked it more questions, instructed it very specifically about the document I would like, read that document, asked it to make edits, then made final edits myself. This results in a _draft_ that I then socialize with the _relevant_ and _capable_ coworkers, and we all leave comments and make edits. The robot is then really good at reading all of that, plus the relevant documents and comments from last year we've all forgotten about, and we start the entire process all over again. I use the robot to _not_ just make assumptions. I use it to _try_ to capture all the context.

The Internet gave everyone a voice to complain (and complain about complaining...see, I'm self-aware), best described in one of my favorite posts of all time, Paul Ford's 2011 _[The Web Is a Customer Service Medium](https://www.ftrain.com/wwic)_. Now AI is making everyone _feel_ and _present_ like an expert without any expertise. Part of me wants to offer them my job. After all, Claude Code can develop their software too, can it not?

[^1]: And much more: the acute pain, and potentially a feeling of helplessness, might have led to prompts that led a sycophantic and very _helpful_ LLM to produce such a document. _We have to get through to those Product people!_ I can hear the robot saying.

[^2]: In [Henry Gantt](/2022/09/13/henry-gantt/), I mention Hofstadter's law, Goodhart's law, and Campbell's law. Lately I've been saying [Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law "Organizations which design systems are constrained to produce designs which are copies of the communication structures of these organizations.") repeatedly.

[^3]: I think the jury is still out on whether this is effective, or if it's just placebo
