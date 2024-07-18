---
layout: post
title: "Website Tour"
excerpt: 
date: 2021-06-05 10:22:45 GMT-5
categories: 
 - about
---

![](/assets/2021/06/website-tour-screenshot.png)

I was invited to do a "website tour", to basically give a history of the structure and technology behind this site, for Hyperlink Academy. I thought it went pretty well, although I couldn't stand to re-listen (I didn't re-watch) to it for a while. When I did, I realized the host's background noise during the first third or so of the talk is really distracting. I created a version that crops off that first third. 

If you want to watch the entire thing, use [this YouTube link](https://www.youtube.com/watch?v=cXXtx5Lip4Q).

---

Here's the outline I worked from:

## History

* 2001: Blogger
  * `dealingwith.blogspot.com`
  * `nonlinear.blogspot.com`
* 2002: "SWIM"
  * danielsjourney.com
  * "[SWiM test 1M](/2002/12/03/SWiM-test-1M/)"
  * this awesome permalink style
    * `www.danielsjourney.com/index.php?archive=2002_10_01_archive.xml&id_pass=82418226`
* 2003: "The peak"
  * Was funemployed and childless and moving to Europe and writing a lot both on the site and elsewhere
  * ~1-2k daily visitors
  * after 2004 I pretty much stopped worrying about analytics
  * Pre-Twitter, it really was "web logging" -- everything went on the blog
* 200?
  * LiveJournal
* 2010: Jekyll
  * `2010.danielsjourney.com`
* 2011
  * back to danielsjourney.com
    * [Desire, Meaning, Beauty, Stories (The Last Post)](/2011/11/29/desire-and-meaning/)
    * sometimes at:
      * `/blog` (maybe?)
      * `blog.`
      * the root
* 201?
  * integrate all the things
    * 2010 posts
    * old LiveJournal posts
  * move to just danielsjourney.com
* 2019
  * daniel.industries
* 2020
  * ~~poseur.daniel.industries~~
    * zola

## Process

* High level
  * Private notes and journaling 
    * notes app
      * have tried them all, most used was Dendron (RIP) and now Logseq
    * used to be just a folder with .md files with a ruby script for generating from a template
    * a long time ago I had a private MoveableType blog
  * Semi-public
    * 200 words a day
    * then adagia.org
    * now, nothing
  * Public
    * blog
  * The private and semi-private stuff will probably get lost, or at best is much less searchable and fungible.
    * the public blog _is the archive_
    * as such, a lot of private or semi-public stuff might get imported over time
      * less concern for how polished the work is when it's going into the archive
* Some of the nuts and bolts
  * still have a rake file left over from Octopress with various tasks I still use today
    * `new_post`
    * `isolate`
    * `gen_deploy`
  * randomjourney script that spits out a new random post from the past for me to garden -- I do this rather infrequently

## Lessons

* The #1 benefit of maintaining your own blog for 19.5 years is for your own personal benefit
  * not for professional benefit or your personal "brand"
  * for your personal history:
    * remembering
    * learning about yourself
    * nostalgia
* Host yourself
  * Requires the tiniest bit of tech savvy
  * Over a long enough time scale, blog hosts come and go
* Avoid databases if at all possible
  * flat files are awesome
    * searchable from a text editor
    * mass edits from a text editor
    * require a little bit of dev savvy
      * lots of regex find/replace
      * site generators that use flat files usually require some dev env and coding
* Avoid dependencies
  * not just hosts and databases -- all tooling
  * daniel.industries is 3 gems (including jekyll)
  * getzola.org is a single rust app
* Permalinks, permalinks, permalinks!
* Err on the side of posting
  * drafts get lost
  * personal note systems change
  * nobody really cares
  * cool people might email you about a post from 19 years ago
* Don't feel bad for:
  * constantly redesigning
  * constantly fiddling with your tools or process
  * revising history