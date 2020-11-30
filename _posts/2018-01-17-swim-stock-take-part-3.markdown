---
layout: post
title: "SWIM Stock-take Part 3"
excerpt: "Part 3 of my retrospective"
date: 2018-01-17 23:06:48 -0600
comments: true
categories: 
 - swim
 - nonlinear
---

[In part 1](/2017/12/23/swim-stock-take/) I discussed the origins of the ideas that have driven the development of SWIM.

[In part 2](/2017/12/26/swim-stock-take-part-2/) I talked about the history of the product from the early 00's until 2006. Those were the most productive years, but after pivoting the idea I have worked on a couple proof-of-concepts since.

As part of my application to work at [Collecta](https://www.linkedin.com/company/628089/) (which I did from 2009-2011, when it shut down), I developed what is really the second incarnation of SWIM. I called it _Suggest-o-matic_, and for a very quickly thrown together bit of HTML and Javascript, it worked, used the Google search API, and got me the job. 

![](https://github.com/dealingwith/swim/raw/master/public/images/swim-new-logo.png)

Then, at the end of 2016, I revisited Suggest-omatic, re-adopting the SWIM name (and of course quickly whipping up a new logo), simply as something to play with. Really just a re-do of the original proof-of-concept, the Google search API was no longer free so it uses Bing for search results, and works moderately better the original. I also briefly played with [Algolia](https://www.algolia.com/) search as a solution for storing/searching a personal corpus, but their pricing was prohibitive for such a small side-project. (It looks like they've adjusted their pricing, so now I'm tempted to try that road again.)

*Aaand* now Bing isn't free either...
