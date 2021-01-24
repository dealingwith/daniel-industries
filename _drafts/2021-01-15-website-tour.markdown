---
layout: post
title: "Website tour"
excerpt: 
date: 2021-01-15 13:42:58 -0600
categories: 
---



## History

* 2001: Blogger
  * `dealingwith.blogspot.com`
  * `nonlinear.blogspot.com`
* 2002: "SWIM"
  * danielsjourney.com
  * "[SWiM test 1M](daniel.industries/2002/12/03/SWiM-test-1M/)"
  * these awesome permalinks
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
    * [Desire, Meaning, Beauty, Stories (The Last Post)](http://daniel.industries/2011/11/29/desire-and-meaning/)
    * sometimes at:
      * `/blog` (maybe?)
      * `blog.`
      * the root
* 201?
  * integrate all the things
    * 2010 posts
    * old LiveJournal posts
  * move to just danielsjouney.com
* 2019
  * daniel.industries
* 2020
  * `poseur.daniel.industries`
    * zola

## Process

* High level
  * Private notes and journaling 
    * Dendron
    * used to be just a folder with .md files with a ruby script for generating from a template
    * a long time ago I had a private MoveableType blog
  * Semi-public
    * 200 words a day
    * now adagia.org
  * Public
    * blog
  * the private and semi-private stuff will probably get lost, or at best is much less searchable and fungible.
    * the public blog _is the archive_
    * as such, a lot of private or semi-public stuff might get imported over time
      * less concern for how polished the work is when it's going into the archive
* Some of the nuts and bolts
  * Still have a rake file left over from Octopress with various tasks I still use today
    * new_post
    * isolate
    * gen_deploy
  * randomjourney script that spits out a new random post from the past for me to garden -- I do this rather infrequently

## Lessons

* The #1 benefit of maintaining your own blog for 19.5 years is for your own personal benefit
  * Not for professional benefit or your personal "brand"
  * For your personal history
    * Remembering
    * Learning about yourself
    * Nostalgia
* Host yourself
  * Requires the tiniest bit of tech savvy
  * Over a long enough time scale, blog hosts come and go
* Avoid databases if at all possible
  * Flat files are awesome
    * Searchable from a text editor
    * Mass edits from a text editor
    * Require a little bit of dev savvy
      * Lots of regex find/replace
      * Site generators that use flat files usually require some dev env and coding
* Avoid dependencies
  * not just hosts and databases -- all tooling
  * daniel.industries is 3 gems (including jekyll)
  * getzola.org is a single rust app
* Permalinks, permalinks, permalinks!
* Err on the side of posting
  * Drafts get lost
  * Personal note systems change
  * Nobody really cares
  * Cool people might email you about a post from 19 years ago
* Don't feel bad for
  * constantly redesigning
  * constantly fiddling with your tools or process
  * revising history

<iframe width="100%" height="315" src="https://www.youtube.com/embed/cXXtx5Lip4Q" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>