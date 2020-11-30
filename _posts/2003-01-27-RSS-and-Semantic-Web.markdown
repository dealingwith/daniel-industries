---
layout: post
title: 'RSS and Semantic Web'
categories:
 - design
---

Two historical links for myself:



<a href="http://xml.com/pub/a/2003/01/22/dive-into-xml.html">The new Dive into XML article</a> says



<em>On average, at any given time, about 10% of all RSS feeds are not well-formed XML. Some errors are systemic, due to bugs in publishing software. It took Movable Type a year to properly escape ampersands and entities...Other errors are transient, due to rough edges in authored content that the publishing tools are unable or unwilling to fix on the fly. As I write this, the Scripting News site's RSS has an illegal high-bit character, a curly apostrophe. Probably just a cut-and-paste error -- I've done the same thing myself many times -- but I don't know of any publishing tool that corrects it on the fly, and that one bad character is enough to trip up any XML parser.</em>



Well, I guess I have it one up on all those, because my <a href="http://www.danielsjourney.com/rss.php">RSS-building app</a> does catch all those at the moment, and anytime I notice my feed doesn't validate I just add the fix to my "cleaner" function which replaces all these characters. Note: right now I still allow relative links in my RSS. Not sure if I'm going to fix for that, since it doesn't break any parsers.





<b>U:</b> Aha he is just teaching the world how to do in Python what I figured out already in PHP, and he is talking about the feed consumer (reader) not the producer (where I do all this):



<em>data = data.replace('&lt;', '<')

data = data.replace('&gt;', '>')

data = data.replace('&quot;', '"') #"

data = data.replace(''', "'")

data = data.replace('&amp;', '&')</em>



<b>U.ii:</b> For some reason my <a href="http://www.danielsjourney.com/syndicates.php">news reader thingie</a>, which uses the PRAX XML parser, has never had a problem with bad RSS_XML. Dunno why but it's been good. :)



Second is from mpt, who doesn't have a link in his RSS feed so I'm too lazy to go find the post on his site and am just going to assume it is ok to mirror it here:
 

 
<em>Ben Hammersley's LazyWeb is quite a simple idea. For any small digital job you want done, it's quite likely that someone, somewhere, will find the task intrinsically rewarding -- so they'll do it for free. This is the volunteer power behind Free Software, expanded to electronic work in general. It's the extreme end of the economic supply curve -- given enough suppliers, one of them (and for a digital work, you only need one) will be offering a price of zero.



Recently I've been finding the LazyWeb has struck when I wasn't, um, necessarily wanting it to. Every so often, I've been meaning to write something, only to find that someone else has written it already.



For example, I was going to write about how the Semantic Web (as currently conceived) is doomed. Doomed because it requires average humans, when writing documents, to be more far-sighted -- in spending time entering invisible metadata now, in return for greater searchability and analyzability later -- than average humans have ever been. Even if that metadata investment would have a positive return in the long run, it's not obviously positive enough, so the investment problem strikes again.



Serendipitously, however, I discovered that Cory Doctorow had explained this already -- along with several other reasons why the Semantic Web's metadata-filled world is "a pipe-dream, founded on self-delusion, nerd hubris and hysterically inflated market opportunities". Quite.



As another example, I was going to write about how XHTML (as currently conceived) is doomed. Doomed because it requires average humans, when writing documents, to be more altruistic -- in ensuring their documents are valid XML, so that other people may more easily produce software which parses those documents -- than average humans have ever been.



Serendipitously, however, I found that Mark Pilgrim wrote the same thing first. He wasn't actually talking about XHTML, but substitute "XHTML" for "RSS" in his article and you'll see the point is exactly the same. Authors save time and money, right now, if they don't worry about the validity of the documents they produce. Therefore, readers demand browsers that can read invalid documents. Therefore, browser vendors (assuming a competitive browser market, which admittedly isn't the case at the moment) face a prisoner's dilemma -- the first one to render invalid documents gets a competitive advantage over the rest, who have litle choice but to follow. Therefore, invalid documents proliferate. Therefore, people producing software to parse those documents have to put in all the error-correcting code which XHTML was trying to save them from in the first place.



I'm not a doom and gloom merchant, really I'm not. My interest is in seeing how the Web can be made more useful, without expecting humans to do things which -- thanks to a variety of social dilemmas -- they Just Won't Do.



So, without constant coercion or persuasion, what will humans do? Well, for starters, they'll make Google work.



When it comes to making the Web more useful over the past ten years, Google takes the biscuit. The amount of time saved by that single site's existence must be truly enormous, compared to the best search engines of the early- and mid-'90s. ("Back in my day, we walked back and forth through pages and pages of AltaVista or Hotbot results ... In the rain ... And it was uphill both ways ...")



But here's the kicker: Google only works by accident. Most people put links in a Web page because they add value to that particular page, not because they contribute to Google's database of authority. (Blogrolls are a notable exception.) The links just happen to work extremely well for measuring authority as well, and the rest is history.



This isn't the Semantic Web, it's the Serendipitous Web. And I think in the long run, in a world full of lazy humans, serendipity is the only kind of semantic information gathering that will work.</em>