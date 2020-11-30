---
layout: post
title: 'Updated RSS feeds'
categories:
 - design
---

Said Links section is no longer part of the default RSS feed (that any of you reading this via RSS are subscribed to). To subscribe to the Links section, just pass ?cat=Links as a variable, for example:



<a href="http://www.danielsjourney.com/rss.php?cat=Links">http://www.danielsjourney.com/rss.php?cat=Links</a>



You can also subscribe to any category with the same variable, for example if you are for some very odd reason only interested in my daily mintia you can subcribe to <a href="http://www.danielsjourney.com/rss.php?cat=Minutia">this flavor</a>. This feature is also on the main site, by the way, that's how the links to each category work.



However the customization of the feed doesn't stop there. Oh no. you also have:

?l=short -- <a href="http://www.danielsjourney.com/rss.php?l=short">get a short/blurb/teaser post with a link to the website</a>. this is how most peps do their feed, but a few weeks back i went to full posts because that's what i like to get in my newsreader.



?n=5 -- get specified number of posts at a time. the default is 10, same as it's been for some time. but you can do me a bandwidth favor if you hit the RSS feed more than once every 2 hours and get, say, <a href="http://www.danielsjourney.com/rss.php?n=5">5</a> (of course if your newsreader support LAST_MODIFIED then we're getting along, bandwidth-wise at least, already). if you have a really crazy newsreader polling every 10 minutes just get <a href="http://www.danielsjourney.com/rss.php?n=1">1</a>, max <a href="http://www.danielsjourney.com/rss.php?n=2">2</a>--really, i can't even post them that fast...or if, on the other hand, you never seem to fire up your newsreader but once on the weekend you can get <a href="http://www.danielsjourney.com/rss.php?n=30">30</a>.



?img=yes -- default is no images in the newsfeed, i find them kinda annoying when people use them in every post. i don't, though, so if you don't want to have to go to the site to see the occasional image, pass this variable as "yes" and <a href="http://www.danielsjourney.com/rss.php?img=yes">you will get the images</a> embedded in the post. still no media, flash, or anything else bandwidth-heavy and technologically-funnymoney.



So there you have it. Mix and match RSS feeds. Just string together the variables with &'s to do any combination. Try any of these flavors for example:



<a href="http://www.danielsjourney.com/rss.php?n=5&img=yes">latest five posts with images</a>

<a href="http://www.danielsjourney.com/rss.php?l=short">latest 10 posts w/o full text</a>

<a href="http://www.danielsjourney.com/rss.php?n=15&cat=Links">latest 15 Links</a>

etc., etc.