---
layout: post
title: 'On Tags and Taxonomies'
categories:
 - design
---

<img src="http://danielsjourney.com/blog/files/2005/05/050424_delicious.gif" style="border:0px;" align="left" /> This is going to be very notish-y for the time being. This is for me ATM. More work than comment to be done ATM, particularly in this area.



<a href="http://del.icio.us/dealingwith/tags">My del.icio.us links tagged "tags"</a>.



My primary experience with tags has been the recent creation of a <a href="http://del.icio.us/">del.icio.us</a> account, done for just that purpose.



Plusses:
<ul>
<li>All the usual hype about tags and bottom-up metadata creation/categorization/data structuring/architecting and the social effects blah blah blah.</li>
<li>Provides the positive reinforcement of making it easier to tag the more I tag.</li>
<li>The click-to-add-tag and the recommended tags.</li>
<li>The <a href="http://dietrich.ganx4.com/foxylicious/">Foxylicious</a> Firefox plugin.</li>
<li>Proper/smart use of RSS 1.0 (RDF) as the delicious RSS format (<a href="http://del.icio.us/rss/dealingwith">example</a>).</li>
</ul>
Wants (del. specific):
<ul>
<li>Click-to-add-tag in edit, from any tagword on page.</li>
<li>"Tag with same tags as {blank} link."</li>
<li>More sorts (of my own links)...particularly by popularity, with some kind of cross reference to the other tags ppl have used for that link.</li>
<li>A barebones, *documented* API. (REST/SOAP/DONTGIVEACRAP.) (Although is this necessary with RSS?)</li>
<li>Tag consolidation. (Much like <a href="http://43things.com">43Things</a>' "This goal is like {blank}," except just within my own darn links, which are outnumbered by tags.</li>
<li>More speed. It's slow. Product of centralized service?</li>
</ul>
Problems/Thoughts (more gen):
<ul>
<li>The word <a href="http://google.com/search?q=tags">tag</a>.</li>
<li>Tags == Keywords. WTF is the big dealio?</li>
<li><a href="http://www.zeldman.com/daily/0505a.shtml">Much of what is discussed in this Zeldman article</a> and its <a href="http://apartness.blogspot.com/2005/05/remove-forebrain-and-serve.html">resultant comments</a>. From the latter. A soundbyte:
	<blockquote>We have such an information overload these days, that we are currently looking for more and more ways to cut the data.
	</blockquote>
	And a thread:
	<blockquote>I think successful navigation in some instances can be developed using both conventional and unconventional systems. So if flikr (for example) introduced a flag called "Location" and this was a proper parent child structure, users could add a location and all it's parents by just adding
		<blockquote>Fulham (which knows it's in London which knows it's in the UK).
		</blockquote>
	This could then be overlaid with a tag cloud of Bar or Club or Football and by combining both navigation styles (and further adding in mined data (e.g search results) you could give people the best of both worlds?
	</blockquote>
	<blockquote>I agree that the parent-child relationship loses it's meaning when the child takes on more meaning than the parent. The thing is, to some people, 8 mile would be more important than Michigan, so would that be considered a parent of the state? Is this a relative thing? If a place is considered logically...every tag would be "Earth".

	

	I think I'm delving deeper than I wanted to here. There should be a tag structure that relates to parent-child relationships, which would give the same weight to all levels.
	</blockquote>
	<blockquote>Can we scroll back a little please - if you could apply 'tags' to a printed book how would you do it? Probably with postit notes sticking out or something, right? Little flags of interest.

	

	Everyone who comes along adds their own postit and soon you can't close the book, but if you look closely it's only certain pages that are "postit tagged" heavily.

	

	Switching back online, is this any different?

	

	Pickup a book, with no 'tag's. What do you have. A title that tells you you have the correct book, a table of contents that tells you the structure of the book and where each major section starts. Page numbers so you can find those sections. Possibly an index at the back with "tags" linked to page numbers. Cross references within the book.</blockquote>
	<blockquote>Where I think your problem with tag clouds begins is the fact that "popularity" is about as far as tags (and also link-trackers) have come in terms of their sophistication.

	

	When tag clouds are sliced yet again -- by time, another tag or two, a keyword, an author -- they start showing their power.

	

	...Cutting the data in this way can turn a simple popularity cloud into a fantastic data mining technique. The relationships between the tags are what's important, not so much the tags themselves -- in this way they're just a means to a greater end. If, of course, someone's willing to take them to the next level.
	</blockquote>
	Ok I don't have any more time to parse those comments.</li>
<li><a href="http://www.subtraction.com/archives/2005/0424_all_you_can_.php">Centralized services that hold my data</a>. The centralized service should hold only the social elements. Back to an API; I want to post to my SWIM "links" and THEN have it post to my delicious links, not the other way around.</li>
</ul>
Our thoughts over the course of a number of weeks in regards to <a href="http://underde.com/swim">SWIM</a>* and tags has been that there needs to be some way of graduating from keywords to tags to taxonomy. I say again:
<blockquote style="text-align: center;">Taxonomies


<strong>^

</strong>

Tags


<strong>^

</strong>

(mined?) Keywords</blockquote>
Later: screengrab or spec of such a system in SWIM.



* which has always favored more "strict" hierarchy/taxonomy, despite trying to solve the SAME EXACT problems those proponents of tags are trying to solve





Some kind of P2P/XFN/trackback system for tags, so that the social effects of tags are not centralized, but rather spread out and trusted.