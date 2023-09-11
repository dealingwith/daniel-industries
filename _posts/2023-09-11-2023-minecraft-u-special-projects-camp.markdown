---
layout: post
title: "2023 Minecraft U Special Projects Camp"
excerpt: 
date: 2023-09-11 14:57:43 -0500
categories: 
 - development
 - minecraft
 - education
---

![chess game screenshot]({{site.url}}/assets/2023/09/chess-game-screenshot.png)

In 2020 [Minecraft U](https://minecraftu.org/) was forced to conduct what were previously IRL camps at [a Dallas school](https://www.hockaday.org/on-campus/summer-at-hockaday) entirely online. Due to this new virtual offering, we were able to attract campers from outside the Dallas metro. One of those campers signed up for all of our camps that summer and quickly progressed through all of the curricula we had on offer. He was 11 years old at the time and already had significant experience programming in Python. By the last few weeks of that summer, I was working weekends with my most capable instructor to develop custom challenges for the following week's camp.

At some point, I started working with this exceptional young coder for an hour or two every weekend, usually working through a programming book, hacking on a small project, or both. In those sessions, we've studied JavaScript and Ruby.

In 2021 in-person camps returned and we shuttered our online offerings--we did not have the time to do both, and most of our online attendees would be back IRL. Except one.

I spun up a custom online camp and managed [a blog post announcing it]({{site.url}}/2021/07/02/computer-programming-adventures/), but never managed a recap of what we accomplished--[a desktop Tetris game written in Ruby](https://github.com/MinecraftU/2021-computer-adventures).

In 2022, we did it again. At that time I was not available to do the instruction myself, so I recruited a brilliant local university sophomore to teach the camp. He'd started as a camper years ago, worked his way up to student instructor, then full instructor until his college work prevented him from committing to an entire summer work schedule. He is our biggest success story so far and is crushing it in his computer science studies at university.

They decided to create [their own programming language](https://github.com/MinecraftU/2022-computer-adventures-pringlelang) using C++. And succeeded. 🤯

They both had some experience writing C++ going in, but not a significant amount. Neither had architected a language before. That type of thing is typically a project reserved for students in the last year or two of their CS degree.

I again failed to write up a recap. But a 13-year-old wrote a programming language using C++. I may still insert a more detailed write-up into the history of this site for posterity.

This year, they decided to create [a chess game in Rust](https://github.com/MinecraftU/2023-computer-adventures), compiled to WebAssembly and run in a browser. Neither the instructor nor the student had any experience writing Rust. They had less than two weeks. Again, they succeeded.

The format is this: We'll start generating ideas before camp, which has typically landed in the back half of the summer. We'll do this during our weekend sessions and asynchronously in our Discord chat. We capture ideas and research in a Notion document. This year we were primarily focused on potential projects involving LLMs.

Once camp starts, it is loosely structured as a two-week MVP sprint. Each weekday they meet for 3 hours on Discord. On the first day, they review and discuss potential projects, using Notion and Mural to organize their thinking. The Mural is based on a brainstorming template that includes an impact/effort matrix, but I changed it to impressiveness/feasibility. They also consider things like what tech stack will be used. For both instructor and student, I intend for these projects to be legitimate portfolio pieces.

Between days one and two, both write RFCs (based on a template) for at least one option.

In both years, they've reached out on day two to request my feedback on their options. Both years I steered them towards the more challenging project. My input is mostly based on my gut instincts, but also some logic: if they fail to complete the project within the camp window, we can always continue working on it afterwards; and these are two very bright people with very little experience building software through to completion, so better to stretch and see what they're capable of than simply do something they already know they can do. In both instances, this has resulted in surprising and impressive results.

[![chess RFC screenshot]({{site.url}}/assets/2023/09/chess-rfc-screenshot.png)]({{site.url}}/assets/2023/09/chess-rfc-screenshot.png)

Later during the second day, they create a plan based on the RFC. It includes a summary, goals for the MVP, stretch goals, and non-goals. It outlines the dependencies required. They create a GitHub repo and project and GitHub tickets for the first few development tasks.

Then they code furiously for the next seven days.

The last day is devoted to writing up a demo document and doing a sprint demo. I invite peers to the demo so there is a small, knowledgeable audience, and they have always asked great questions and provided valuable feedback. I remind them, without too much emphasis, that one of the developers is (now) 14 years old.

We have spent the intervening weekends cleaning up the project and looking for small ways to improve it. Software is both architecture and gardening, living structures in which we do our work, or in this case, [play chess](https://minecraftu.github.io/2023-computer-adventures/).

*[IRL]: In Real Life
*[LLMs]: Large Language Models
*[RFCs]: Requests For Comments
*[MVP]: Minimal Viable Product
