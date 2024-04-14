---
layout: post
title: "Novel Mobile-Specific Content Handling"
date: 2013-03-07 15:26
comments: true
categories: development
---

On my current project I was tasked with creating an iPhone-specific view with the constraint that it had to be the same page as the already-constructed desktop-optimized version and the requirement that content be moved in the new mobile view. For whatever reasons I've had rather mixed results device-sniffing with javascript in the past but almost universal success using media queries in CSS to target difference devices (and I was already doing so on this page). So I devised this scheme for determining if the viewing target was a mobile device and then moving the desired content appropriately. I haven't yet figured out if it is clever or full of hidden perils. If you have an opinion give me a shout. It works and the only drawback I see so far is it requires an extra empty div on the page. 

<iframe style="width: 100%; height: 300px" src="http://jsfiddle.net/BvgyD/7/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>