---
layout: post
title: "To Find an Alternative to WordPress, Just Go Back to the Beginning"
excerpt: "A French developer can create a CMS, abandon it, and move on to a humble career in software, and a college student in Houston can fork that CMS, convince another software developer to help him continue the project, turn that into a rather profitable business, and become a wealthy and (until very recently) well-regarded internet person."
date: 2024-02-29 13:46:03 -0600
categories:
  - web
  - development
  - history
---

WordPress-the-company has found itself in some hot water lately, mostly due to the actions of its founder. This post is not about said water, but [here is a link I found that describes the "double-whammy" and the conundrum many WordPress customers and/or users find themselves in](https://tedium.co/2024/02/28/wordpress-automattic-tumblr-controversy/). WordPress has long been a reliable organization, seemingly both by design (by which I mean the [.com](https://wordpress.com/)/[.org](https://wordpress.org/) divisions) and by virtue of the sanity of its leadership. The latter is now in question. I do not find this circumstance surprising, nor potentially irredeemable. However, I saw some toots on Mastodon discussing options for moving off WordPress, which got me thinking...

You could go back to the original trunk from which WordPress was forked in 2003. What _was_ that thing called? I was there, paying attention at the time, but I still had to look it up: [b2/cafelog](https://en.wikipedia.org/wiki/WordPress#History).

This part of the nature of open-source software is one of its most interesting. A French developer can create a CMS, abandon it, and move on to a humble career in software, and a college student in Houston can fork that CMS, convince another software developer to help him continue the project, turn that into a rather profitable business, and become a wealthy and (until very recently) well-regarded internet person. In the meantime, another French developer can also [fork the original CMS](http://b2evolution.net/), maintain it for almost two decades in a (relative to WordPress) quiet corner of the internet, and [eventually move on to other things](https://fplanque.com/dev/b2evolution/18-years-of-b2evolution/).

There was another CMS launched in 2003, one designed and developed by [one of the early internet renaissance humans](/2018/01/21/dean-allen/) (who [would leave the project just a few years later](https://en.wikipedia.org/wiki/Textpattern#Developers)). That's right, not only is [Textpattern](https://textpattern.com/) still available, it is still being actively maintained, and it still uses Textile, which despite [inspiring Markdown](<https://en.wikipedia.org/wiki/Textile_(markup_language)#History>) was (seemingly) entirely supplanted by its descendant. But lo! Textile has [its own website](https://textile-lang.com/) and [was updated just this year](https://github.com/textile). [README.textile](https://github.com/textile/php-textile/blob/master/README.textile)! I didn't know you could DO that! I want to convert all my readme files. This markdown hoodie is threadbare, hand me my textile smoking jacket!

Aside: [Textpattern is on the fedi](https://indieweb.social/@textpattern), on the same server as I am, no less!

I'll wrap this up before I spawn more tabs about Drupal (which has a more recent release than WordPress) or Movable Type (yes, version 8 dropped last November). Perhaps I should check out the _Adobe ColdFusion Online Summit 2024_...I did (almost exclusively) code in ColdFusion from mid-2003 until mid-2004. There is one ColdFusion CMS on Wikipedia's [list of content management systems](https://en.wikipedia.org/wiki/List_of_content_management_systems). Its [readme.md](https://github.com/Ortus-Solutions/ContentBox/blob/master/readme.md) contains this gem, which is both ominous and prophetic:

> Because of God's grace, this project exists. If you don't like this, then don't read it, its not for you.

If there is better evidence of God's grace than a bunch of [jiggling atoms](https://www.youtube.com/watch?v=NA4odJfINkE) combining to create software over the course of decades, I can't think of one right now.


## 03/01/2024 Update

The original [cafelog.com](https://cafelog.com/) site is still up, however few, if any, of the links on it work. There is also a historical (but not officially archived) [b2 repo on Github](https://github.com/leogopal/b2). There is also an [entire book about WordPress](https://github.com/WordPress/book) on Github; see [2-b2-cafelog.md](https://github.com/WordPress/book/blob/trunk/Content/Part%201/2-b2-cafelog.md). It would seem many of the links in the book are broken; one working link is to this [2011 talk by Michel Valdrighi](https://wordpress.tv/2012/02/27/les-origines-de-wordpress-la-naissance-de-b2cafelog/) at _WordCamp Paris 2011_, however the video is no longer accessible.

## 03/04/2024 Update

Via [this toot from Kottke](https://saturation.social/@jkottke/112035323488245957) I learned about _[WordPress Website's Search Engine Spam](https://waxy.org/2005/03/wordpress_websi/)_ ploy in 2005. WordPress had "...been quietly hosting at least 168,000 articles on their website. These articles are designed specifically to game the Google Adwords program, written by a third-party about high-cost advertising keywords..."

There are plenty of links in the Waxy post including a follow-up post on Waxy and a response post from Matt (that refutes certain facts like the number of hosted articles).

The crazy thing is this:

> WordPress is partnered with Textdrive, who also hosts the WordPress website. From what I gather, when the Textdrive folks found out about, they removed the files from the web server.

[TextDrive](https://en.wikipedia.org/wiki/TextDrive) was "founded in 2004 by the Canadian typographer, art director, designer, writer and programmer Dean Allen, the creator of Textile markup, who was looking to create an ideal hosting environment for the content management system he was developing, Textpattern."

> In November 2005, [Joyent](https://en.wikipedia.org/wiki/Joyent#History) merged with TextDrive...TextDrive CEO Dean Allen, a resident of France, became president and director of Joyent Europe.

IIRC, Joyent and Dean Allen had a turbulent relationship and he left the company some years later. Joyent was acquired by Samsung in 2016.

Matt's 2005 spam post controversy strikes me of water long-since under bridges, but reminds me that Matt is primarily a business person. This is probably why he's been so successful. Businesses are somewhat always under threat of reaching their end-of-life, and my experience with business people is they are frequently willing to compromise their own values for the sake of their business. Sometimes that means selling data, sometimes that means things that will land you in jail. Fear and pride are strong drivers. Morals and values are not. 😕

I also have to add this image [originally posted by Jason Lefkowitz](https://octodon.social/@jalefkowit/112005557624794341) in response to his own toot about WordPress history.

![](/assets/2024/02/422b19f80d8e3d5f.jpeg)
