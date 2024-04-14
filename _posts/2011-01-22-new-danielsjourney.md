---
author: dealingwith
date: '2011-01-22 01:00:00'
layout: post
slug: new-danielsjourney
status: publish
title: New danielsjourney
wordpress_id: '3266'
categories:
 - nonlinear
---

Usually a redesign of a one-page site of mine doesn't warrant a blog post, but
this story is a little bit more interesting, mostly because of the work it
built on. I haven't really told the story of a design before. I'm curious how
this will pan out.


[![][1]][2]


I was in my RSS reader last night after an ill-advised after-dinner coffee and
saw [Naz's post on Weightshift about the personal page][3]...meme? Can we call
it that? I had long since moved to a single-serving homepage w/ some text and
an image. In the meantime about.me made it a big deal. (Nevermind that Dallas-
based [Magnt][4] had a better offering since long ago.)


But let's face it, Naz's, and his imitators', looked better. And most
importantly, he [posted the source on Github][5]. That meant that seconds
later I had [my own copy of his source][6] on my computer and started
replacing his images and text with my own.


It used a script called backstretch to position and size the image, also on
Github, which I also [forked and modified][7] for my uses. Since I had already
decided to use a [wedding picture][8], I wanted to try and at least create two
layers so the field grass could superimpose the text box. The original
backstretch script could only accomodate one image which it threw far into the
back of the document model. That was easily fixed in just [a couple lines of
code][9].


That got me thinking about the [awesome Github 404 page][10]. Maybe I could
[parallax][11] the grass! Well I tried applying the parallax plugin to the
elements in question and no dice. I tried a new page that didn't use
backstretch and applying the parallax plugin there--still no dice. Last night
I decided to stick to just the two layers--if someone had a window sized just
right, they would notice the grass popping up over the bottom of the box.


Of course this morning I couldn't [let it be][12]! I read most of the parallax
code and while it was pretty much what I expected, its need to accomodate for
all manner of circumstances made it overly complex to just copy and paste to
fit my needs. I ended up just hand-coding some [simple code][13] that moves
the grass in the direction you move your mouse, after doing a single left-
right sway once on page load just for good measure.


I'm far too pleased with the end result. Now I am considering trying to get
the foreground grass to actually bend as it moves...in the meantime if you
haven't you can [check it out][2].

   [1]: http://farm6.static.flickr.com/5087/5376146429_9897396ba7.jpg

   [2]: http://danielsjourney.com

   [3]: http://weightshift.com/memo/created/the-personal-page/

   [4]: http://magnt.com/

   [5]: http://github.com/weightshift/The-Personal-Page

   [6]: https://github.com/dealingwith/The-Personal-Page

   [7]: https://github.com/dealingwith/jquery-backstretch

   [8]: http://www.flickr.com/photos/carissabyers/sets/72157625162248858/with/5081188250/

   [9]: https://github.com/dealingwith/jquery-backstretch/commit/e7db01009effab5e5fe8d514f886c296911d6917

   [10]: https://github.com/404

   [11]: http://webdev.stephband.info/parallax.html

   [12]: http://www.youtube.com/watch?v=GcZ8Gz0rDtw

   [13]: https://github.com/dealingwith/The-Personal-Page/blob/master/script.js
