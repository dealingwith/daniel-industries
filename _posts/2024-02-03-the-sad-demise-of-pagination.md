---
layout: post
title: "The Sad Demise of Pagination"
excerpt: 
date: 2024-02-03 18:42:42 -0600
categories: 
 - web
 - development
---

![photo of a book opened so many pages can be seen at once](/assets/2024/02/pages.jpg "actual pages, the original metaphor")

Decades ago:

- A list of content[^1] was loaded into the browser. It was static HTML.
- When a user reached the end of the first "page" of content, they clicked on to the next page, which was another actual URL, and once again a static HTML page. When a user wished to view something in the list, they clicked on it, loading that content in a new page.
- If the user wished to return to a previous page of results they used their browser's back button. They were conveniently not only returned to the correct page of results but if they had scrolled down during their previous visit to the page, they were returned to their scroll position. The page loaded instantly via the browser's cache.

Now:

- A list of content is loaded into the browser after the initial page load. This usually takes anywhere from 2-10 seconds.
- When a user reaches the end of the first "page" of content, the next chunk of content is loaded below the originally loaded content. This usually takes anywhere from 2-10 seconds. When a user wishes to view something in the list, they click on it, loading that content in a new page.
- When a user wishes to return to a previous page of results, they must again wait for the content to load. They are back at the top of the list, so if they had already scrolled down to load more content, they must do so again. Between the scrolling and the load times, it might take anywhere between 5-30 seconds to return to their previous position in the list.

I remember when "infinite scroll" was first developed, and the above UX degradation was pointed out, but it became the standard anyway. Since then, the frameworks and libraries we now rely on to build the web have been created with no other method for displaying long lists of content.

Now I feel a sense of relief when I am (occasionally) presented with an actually-paginated list of content or search results. Like that one appliance from the 80s that still Just Works and never Just Breaks.

GitHub's homepage, which presents a feed of updates from repositories and users you follow, used to work like this. The site was written with Ruby on Rails before the infinite scroll phenomenon. They recently rewrote the site in React[^2] and I'm not sure if the home page feed was changed then or earlier, but now a click from the feed and then back again means I will probably never find my previous place ever again. So I don't. I close the tab before the feed even loads and move on to the next thing.

We've learned to work around this by opening every link in a new tab, or the developers force the links into new tabs regardless of our preferences. So we end up with browsers full of tabs, which is, besides taking up RAM and causing organizational entropy, apparently [stressing us out](https://www.pcgamer.com/are-you-stressed-out-maybe-you-have-too-many-browser-tabs-open/). Most often, due to the inconsistent behavior of links, we don't know if we should close a tab or reach for the back button. I'm often moving the mouse toward the back button before I realize it is disabled, or closing a tab only to realize I should have just clicked back, forcing me to reopen the tab. Thankfully browsers have keyboard shortcuts for reopening the last-closed tab. Thanklessly, I usually must endure a stuttering page load while I manage to then click back.

<p class="small postscript">Photo by <a href="https://unsplash.com/@wellgraf?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Pontus Wellgraf</a> on <a href="https://unsplash.com/photos/black-red-and-white-striped-textile-Ov7uQoarS7w?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a></p>

[^1]: A _feed_, you might call it. 

[^2]: Or at least a lot of it.