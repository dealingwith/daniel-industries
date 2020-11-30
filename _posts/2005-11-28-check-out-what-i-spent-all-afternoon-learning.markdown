---
author: dealingwith
date: '2005-11-28 15:11:00'
layout: post
slug: check-out-what-i-spent-all-afternoon-learning
status: publish
title: CHECK OUT WHAT I SPENT ALL AFTERNOON LEARNING!!
wordpress_id: '763'
categories:
 - css
 - design
 - doctypes
 - standards
---

In EVEN THE MOST RECENT VERSION OF INTERNET EXPLORER, if you are using the
**iframe** tag, it will not display correctly -- it will insert a free
horizontal scroll bar no matter what -- UNLESS you do two things (both of
which are technically (AND MORALLY) WRONG WRONG WRONG) to the page displayed
INSIDE the iframe:

1. Declare the doctype as ONLY EITHER HTML 4.0 TRANSITIONAL -OR- HTML 4.1
TRANSITIONAL ...REGARDLESS OF HOW YOUR PAGE VALIDATES!

2. DO NOT include a URI to the document type definition, i.e. even if you obey
#1, <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd"> will not work! Only <!DOCTYPE HTML
PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> will.

OF COURSE, this will render your XHTML STRICT page as COMPLETE SHITE in every
other, compliant, browser.

...now, iframes are stupid to begin with, and not XHTML valid (I don't
think?), but this entry needs some Googlejuice, so if anyone is in the same
situation I just was, they can avoid the hours of trial-and-error...I did not
find this anywhere in the vast amount of IE assery documentation.

Update 12/2/2005

[found this][1], 4 days later, while looking into CSS inheritance problems in
IE

Upon investigating more, I think this is due to iframe pages inheriting from
their parents...kinda makes sense. And the HTML doctype declarations weren't
originally meant to have dtd URIs included, turns out..._As you can see in
Table 1, some of the DOCTYPEs have URIs and some do not. This is not a hard
rule: Any DOCTYPE can have a URI or leave it off. Thus, they were included at
random in the examples shown in the table. As you'll see later, however, the
presence or absence of a DOCTYPE URI can affect which rendering mode gets
picked._ [#][2] Also see Table 2. It's all becoming clear now. Sad news, I
can't use CSS like I'm used to because these pages will never validate/render-
in-anything-besides-quirks-mode.

Interesting side note: Visual Studio automatically make new web pages HTML
Transitional with no URI, and I think it automatically puts in weird markup
and/or attributes that force it immediately down to that (i.e so that the page
will be rendered in quirks mode).

   [1]: http://www.howtocreate.co.uk/ie6pita.html

   [2]: http://www.ericmeyeroncss.com/bonus/render-mode.html (eric myers ondoctypes; see table1)

