---
layout: post
title: "Left-leaning italics"
excerpt: "Inspired by Robin Rendle's post Sinistral Hands, I made my titles left-leaning italics"
date: 2026-07-20 21:42:12 -0500
categories: 
---

Inspired by Robin Rendle's post [Sinistral Hands](https://robinrendle.com/notes/sinistral-hands/), I made my titles left-leaning italics. Since I use free fonts from CDNs, I did it with CSS transform:

```css
h1 {
  font-size: 2.1rem;
  transform: skewX(12deg);
  font-style: normal;
  font-weight: 700;
}
```

![](/assets/2026/07/left-leaning.png)

I don't know how many browsers this will work in.

I switched the font while I was at it. I tried [Geist](https://fonts.bunny.net/family/geist) for a minute but ended up choosing [Bitter](https://fonts.bunny.net/family/bitter), which is a lot like the previous one, [Aleo](https://fonts.bunny.net/family/aleo).
