---
date: '2008-07-18 14:57:00'
layout: post
slug: frustrations
title: Frustrations
categories:
 - development
 - minutia
 - technology
 - work
---

Professionally: I gave up on [Flex](https://en.wikipedia.org/wiki/Apache_Flex) on Monday for various reasons I won't get into here. I've been trying to figure ways to possibly use it for various bits and pieces in the future as to not have wasted 1.5 weeks of my life exploring it as an [RIA](http://en.wikipedia.org/wiki/Rich_Internet_application) option.

This leaves me back in [GWT](https://en.wikipedia.org/wiki/Google_Web_Toolkit) land, a place I explored for about a week when I first started, in-between getting settled/bearings. GWT is _very_ [Java](http://en.wikipedia.org/wiki/Java_(programming_language)), and I'm learning that _I don't like_ Java very much. The entire experience is almost the exact opposite of Flex--Flex was easy to get off the ground and have some early success with, but fell flat on its face when trying to implement a second level of complexity (as well as having some high level issues for which there weren't obvious work-arounds). With GWT, deviating from the prescribed quick start guides or tutorials is met with a quick inability to even run the code. We have a GWT demo already built--by consultants before I joined--and I can't get it to run locally at all.

It feels like a lot of these strict OOP languages have traded a complexity in the code (and that is relative IMHO--chasing function calls or chasing function calls in objects...not that much of a difference...the stuff we're talking about for the web here isn't rocket surgery) for complexity in configuration (not that I'm calling millions of Java and .NET developers wrong). This code calls an object in this library that is referenced in these three places--one for the editor, one for the debugger, and one for the compiler; plus of course actually referencing it in your code, of course in every object that requires it. Move the code or rename its folder and you're focked. Anyone who can point me in the general direction of some insight in this area would be greatly appreciated.

Personally: Deadbeat dads are still dads, and that's frustrating. <a class="dead" title="you can just deposit your balls at the Cold Storage Facility for Completely Emasculated and Useless Men">I've blogged about it before in an undisclosed location</a>, but still...
