---
layout: post
title: 'On Tags and Taxonomies'
categories:
 - design
---

This is going to be very notish-y for the time being. This is for me ATM. More work than comment to be done ATM, particularly in this area.

<a class="dead">My del.icio.us links tagged "tags"</a>.

My primary experience with tags has been the recent creation of a <a class="dead">del.icio.us</a> account, done for just that purpose.

Plusses:

- All the usual hype about tags and bottom-up metadata creation/categorization/data structuring/architecting and the social effects blah blah blah.
- Provides the positive reinforcement of making it easier to tag the more I tag.
- The click-to-add-tag and the recommended tags.
- The <a class="dead">Foxylicious</a> Firefox plugin.
- Proper/smart use of RSS 1.0 (RDF) as the delicious RSS format (<a class="dead">example</a>).

Wants (del. specific):

- Click-to-add-tag in edit, from any tagword on page.
- "Tag with same tags as {blank} link."
- More sorts (of my own links)...particularly by popularity, with some kind of cross reference to the other tags ppl have used for that link.
- A barebones, *documented* API. (REST/SOAP/DONTGIVEACRAP.) (Although is this necessary with RSS?)
- Tag consolidation. (Much like <a class="dead">43Things</a>' "This goal is like {blank}," except just within my own darn links, which are outnumbered by tags.
- More speed. It's slow. Product of centralized service?

Problems/Thoughts (more gen):

- The word tag.
- Tags == Keywords. WTF is the big dealio?
- <a href="http://www.zeldman.com/daily/0505a.shtml">Much of what is discussed in this Zeldman article</a> and its resultant comments. From the latter. A soundbyte:
  
  >We have such an information overload these days, that we are currently looking for more and more ways to cut the data.
  
  And a thread:
  
  >I think successful navigation in some instances can be developed using both conventional and unconventional systems. So if flikr (for example) introduced a flag called "Location" and this was a proper parent child structure, users could add a location and all it's parents by just adding
  >
    >>Fulham (which knows it's in London which knows it's in the UK).
  >
  >This could then be overlaid with a tag cloud of Bar or Club or Football and by combining both navigation styles (and further adding in mined data (e.g search results) you could give people the best of both worlds?)
  > 
  > 
  >>I agree that the parent-child relationship loses it's meaning when the child takes on more meaning than the parent. The thing is, to some people, 8 mile would be more important than Michigan, so would that be considered a parent of the state? Is this a relative thing? If a place is considered logically...every tag would be "Earth".
  >>
  >>I think I'm delving deeper than I wanted to here. There should be a tag structure that relates to parent-child relationships, which would give the same weight to all levels.
  >>
  >>>Can we scroll back a little please - if you could apply 'tags' to a printed book how would you do it? Probably with postit notes sticking out or something, right? Little flags of interest.
  >>>
  >>>Everyone who comes along adds their own postit and soon you can't close the book, but if you look closely it's only certain pages that are "postit tagged" heavily.
  >>>
  >>>Switching back online, is this any different?
  >>>
  >>>Pickup a book, with no 'tag's. What do you have. A title that tells you you have the correct book, a table of contents that tells you the structure of the book and where each major section starts. Page numbers so you can find those sections. Possibly an index at the back with "tags" linked to page numbers. Cross references within the book.
  >>
  >>>>Where I think your problem with tag clouds begins is the fact that "popularity" is about as far as tags (and also link-trackers) have come in terms of their sophistication.
  >>>>
  >>>>When tag clouds are sliced yet again -- by time, another tag or two, a keyword, an author -- they start showing their power.
  >>>>
  >>>>...Cutting the data in this way can turn a simple popularity cloud into a fantastic data mining technique. The relationships between the tags are what's important, not so much the tags themselves -- in this way they're just a means to a greater end. If, of course, someone's willing to take them to the next level.
  
  Ok I don't have any more time to parse those comments.
- <a class="dead">Centralized services that hold my data</a>. The centralized service should hold only the social elements. Back to an API; I want to post to my SWIM "links" and THEN have it post to my delicious links, not the other way around.

Our thoughts over the course of a number of weeks in regards to <a href="/2017/12/23/swim-stock-take/">SWIM</a>* and tags has been that there needs to be some way of graduating from keywords to tags to taxonomy. I say again:

<aside style="text-align:center" markdown="1">
Taxonomies

**^**

Tags

**^**

(mined?) Keywords
</aside>

Later: screengrab or spec of such a system in SWIM.(Which has always favored more "strict" hierarchy/taxonomy, despite trying to solve the SAME EXACT problems those proponents of tags are trying to solve.)

Some kind of P2P/XFN/trackback system for tags, so that the social effects of tags are not centralized, but rather spread out and trusted.
