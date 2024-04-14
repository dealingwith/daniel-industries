---
author: dealingwith
date: '2009-01-07 15:37:00'
layout: post
slug: sort-of-like-fishing-but-not
status: publish
title: Sort of like fishing but not
wordpress_id: '2906'
categories:
 - code
 - development
 - flex
---

AbstractTab(tab.selectedChild.getChildAt(0)).refreshFrame();

    AbstractTab(ModuleLoader(tab.selectedChild).child).showFrame();


There are some _almost_ coherent thoughts around OOP and/or/vs DOM for UI
development in my brain, but in the meantime the above code somewhat
encapsulates* something that often bothers me in my Flex development. To be
more specific, a mess-o-[casting][1].

For the code-inclined here: in case it isn't obvious, both lines are calling
functions on AbstractTab, which is an interface implemented by (the children
of) the child object of "tab" (a Flex "TabNavigator" object). That child is of
type "[ModuleLoader][2]", which is where it gets complicated.

I know vaguely why each line works, but it still kind of bothers me. I guess
my question is, in your opinion (if you have one), which (if either) is
clearer and why?

*[rim-shot][3]!

   [1]: http://en.wikipedia.org/wiki/Cast_(computer_science)

   [2]: http://livedocs.adobe.com/flex/3/langref/mx/modules/ModuleLoader.html

   [3]: http://en.wikipedia.org/wiki/Information_hiding#Overview

