---
layout: post
title: "Salesforce's Slack: Quintessential Enshittification"
excerpt: "Slack's arc, starting out as a darling, then getting bought by a large corporation, losing against an inferior competitor, and finally morphing into an example of product design gone wrong, is simply a textbook example of what happens to our software over time and under the influence of large piles of cash."
date: 2023-12-30 08:46:17 -0600
categories: 
 - product
 - software
 - ux
---

Much has been said about Slack's redesign from earlier this year. "[The Enshittification of Basically all Digital Design. But in this Case, Specifically, the Slack Redesign](https://www.flagsmith.com/blog/the-enshittification-of-basically-all-digital-design-slack-redesign)", for example, even uses the same [noun](https://en.wikipedia.org/wiki/Enshittification "Enshittification - Wikipedia") I chose for my title.

> My Slack life is now 300 design papercuts a day...

"[Why are the UI designers like this?](https://www.reddit.com/r/Slack/comments/16d7ylx/how_to_switch_back_to_old_slack_design/ "Why are the UI designers like this?")"

> Seriously, where do they find these people?

> This change is diabolical.

Most of the negative feedback was on Twitter and Mastodon, and I am not seeing many people write longer-form explanations for the what and why of a mostly derided redesign. I suspect that is maybe because many of us do not use Slack much anymore. If we're on a not-company Slack, we've moved to different platforms, and if we were on a company Slack, we've been moved to Microsoft Teams, which has always been terrible and so at least there was never hope for having a functional chat experience.[^1] It's well known that Teams has eaten Slack's lunch, and we all know that was not because it was a better product, but simply bundled with the back office platform so many corporations use. That market pressure was probably some of the impetus behind Slack's redesign.

But this post isn't about the redesign. I say "quintessential" enshittification because Slack was once awesome, and [I have lauded](/2014/02/12/thanks-for-ruining-the-internet/) and [recommended](/2018/04/06/where-do-you-go-when-facebook-is-gone/) them on this site, although as time progressed, spending so much time in company chats became less about reduced friction and more about constant distraction and a lack of focus. Slack's arc, starting as a darling, then getting bought by a large corporation, losing against an inferior competitor, and finally morphing into an example of product design gone wrong, is simply a textbook example of what happens to our software over time and under the influence of large piles of cash.

This morning I wanted to check in on one of the Slack groups I'm still a part of. There are only two at this point, but I would like to know when someone posts to either of them, and I don't want to have Slack open all the time. Surely there was a feature that would allow me to get an email update for new posts, even if it was one-email-per-update? I poked around the settings but couldn't find anything except for desktop notifications. Aside: I'd recently been unable to update Slack on my phone, told instead that I had to install a new version of the app; I just uninstalled it instead.

I did a quick web search and dutifully clicked on the thing in the app that was supposed to show me how to manage email notification settings. It took me out of the Slack app to the web. That's fine, sometimes it is easier to keep a legacy piece of your application on the web when usage doesn't justify the investment to incorporate it into the app. Infrequently used settings screens feel like they could easily fall into that category. But one click later the web page was asking to launch the app, which I allowed, and it sent me right back to the in-app settings screen where I had started my journey.

I'm always amused by a UX loop. Maybe it's the programmer in me.

```bbcbasic
10 GOTO 20
20 GOTO 10
```

<p class="postscript" markdown="1">Postscript: I just spent an inordinate amount of time figuring out which language to specify to get the code highlighter to pick up my [BASIC](https://en.wikipedia.org/wiki/BASIC) code. First, I had to learn that Jekyll (via Kramdown) could be configured to [use Rouge](https://kramdown.gettalong.org/syntax_highlighter/rouge.html), and apparently I already had Rouge installed by default. Then I had to go to the Rouge site and find `bbcbasic` in the drop-down, finding neither BASIC or [QBasic](https://en.wikipedia.org/wiki/QBasic), the first language I learned[^2] on my father's PC.</p>

[^1]: The last company where I worked FT was a MS shop and used Teams, and I spent the majority of my time in the application. "300 papercuts a day" is a fairly apt description of the experience.

[^2]: Now, having visited the QBasic Wikipedia page for the first time, I have learned that I was doing it wrong: "Line numbers, a concept often associated with BASIC, are supported for compatibility, but are not considered good form, having been replaced by descriptive line labels."
