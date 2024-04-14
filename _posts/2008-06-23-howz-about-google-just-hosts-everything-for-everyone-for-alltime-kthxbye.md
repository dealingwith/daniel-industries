---
author: dealingwith
date: '2008-06-23 16:35:00'
layout: post
slug: howz-about-google-just-hosts-everything-for-everyone-for-alltime-kthxbye
status: publish
title: Howz about Google just hosts everything for everyone for alltime? Kthxbye.
wordpress_id: '2678'
categories:
 - development
 - javascript
 - ui
 - ux
 - web
 - work
---

[Ajaxian » Announcing AJAX Libraries API: Speed up your Ajax apps with
Google’s infrastructure][1]

>   * Caching can be done correctly, and once, by us... and developers have to
do nothing

>   * Gzip works

>   * We can serve minified versions

>   * The files are hosted by Google which has a distributed CDN at various
points around the world, so the files are "close" to the user

>   * The servers are fast

>   * By using the same URLs, if a critical mass of applications use the
Google infrastructure, when someone comes to your application the file may
already be loaded!

>   * A subtle performance (and security) issue revolves around the headers
that you send up and down. Since you are using a special domain (NOTE: not
google.com!), no cookies or other verbose headers will be sent up, saving
precious bytes.

I wonder what the [GWT][2] ramifications might be--in GWT's case, I think it
is already referencing libraries on Google servers and compiling your custom
interaction code into minified, browser-specific JS. So not having teh same
issues in the first place and more powerful still (if yer willing to drink the
Kool Aid).

Still, I'm going to try this out asap on my various JQuery-using projects.

[AJAX Search API Blog post][3]

(official) [AJAX Libraries API page on Google Code][4]

...

Also for me: [GwtQuery][5]: _GwtQuery is a jQuery-like API written in GWT,
which allows GWT to be used in progressive enhancement scenarios where perhaps
GWT widgets are too heavyweight._ via [this really long Google I/O video I'll
have to revisit if I consider going down this path][6]

Aaand: OMG [Lots of videos from the Google I/O conference][7] (there's an
official page but it seemed to require a Goog login), including [the keynote,
"Client, Connectivity, and the Cloud"][8] ([slides here][9]), which is talking
about the high level stuff around those cloud benefits [I was just
mentioning][10]. Can I has full day to watch videos and dream of the
possibilities?

Update: [All the GWT-related Google I/O videos seem to be posted here][11].

   [1]: http://ajaxian.com/archives/announcing-ajax-libraries-api-speed-up-your-ajax-apps-with-googles-infrastructure

   [2]: http://code.google.com/webtoolkit/ (Google Web Toolkit)

   [3]: http://googleajaxsearchapi.blogspot.com/2008/05/speed-up-access-to-your-favorite.html

   [4]: http://code.google.com/apis/ajaxlibs/

   [5]: http://code.google.com/p/gwtquery/

   [6]: http://www.youtube.com/watch?v=2ScPbu8ga1Q

   [7]: http://www.youtube.com/results?search_query=google+i%2Fo

   [8]: http://www.youtube.com/watch?v=vk1HvP7NO5w (but: it's 1.5hrs)

   [9]: http://sites.google.com/site/io/keynote-client-connectivity-and-the-cloud/IO_Keynote_vFINAL.pdf?attredirects=0 (but might require that login)

   [10]: http://dealingwith.livejournal.com/708960.html

   [11]: http://googlewebtoolkit.blogspot.com/2008/06/as-you-may-know-google-
io-conference.html

