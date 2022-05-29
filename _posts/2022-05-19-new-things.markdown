---
layout: post
title: "New Things"
excerpt: 
date: 2022-05-19 22:49:28 -0500
categories: 
---

[![](/assets/2022/05/lines.png)](https://poorlydrawnlines.com/comic/what-is-it/)

It has been a bit of a long road recovering from [the hospital visit](/2022/05/08/the-hospital/). Not really long, yet. Just slow. Last Friday, a full six days after getting out of the hospital, my hemoglobin was still below where it was when I _entered_ the hospital.

![](/assets/2022/05/hemoglobin.png "Here's a fun graph!")

I go back by the lab tomorrow for another blood test.

In the meantime, however, I redesigned this site. The original intent was to simply add a [writing](/writing) section but the redesign came along for the ride. I ripped out Tailwind, which I [introduced](/2020/11/29/new-coat-of-paint/) in 2020. I did a lot of other stuff but it's still basic, just the way I like it. I learned about Jekyll [collections](https://jekyllrb.com/docs/collections/). I also got to use CSS variables for the first time, and they allowed me to very quickly implement an auto-dark-mode based on your system preferences:

```css
:root {
  --bg: #fbf7f0;
  --text: #1d1d1d;
  --green: #515f00;
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg: #262626;
    --text: #fcf7ed;
    --green: #f0fff0;
  }
}
```
