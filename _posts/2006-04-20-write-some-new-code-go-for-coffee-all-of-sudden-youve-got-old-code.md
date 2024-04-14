---
author: dealingwith
date: '2006-04-20 16:50:00'
layout: post
slug: write-some-new-code-go-for-coffee-all-of-sudden-youve-got-old-code
status: publish
title: Write some new code. Go for coffee. All of sudden you've got old code.
wordpress_id: '1252'
categories:
 - code
 - design
 - development
 - ms
 - personal notes
 - technology
 - work
---

[Write some new code. Go for coffee. All of sudden you've got old code.][1]

> **Priorities**

> Of the above tasks [Visual Studio] is the primary tool for three. Writing new code, understanding existing code, and modifying existing code. The real question is "What percentage of time do real developers spend in each of these three activities?". The answer may surprise you, so think hard before continuing.

> My answers are:

> New Code: 2% Modifying Existing Code: 20% Understanding Code: 78%

> Now, I fit solidly in the Einstein user profile. I code all day every day. I'm a C++ power user. I read x86 assembly natively and can decipher the raw bytes of machine code in a pinch. I've been working on the same code base for 3.5 years, and will likely continue to work on that code base for another 3.5 years. A better question is, what do these numbers look like for Elvis. Now, many, many moons ago I used to be Elvis. I had a spanking new 386 on my desk. My primary tool for writing code was a pencil. Browsing code involved a printer and a highlighter. Yes, yes the year was 1988, and I'm writing a Futures and Options accounting system for Citibank in DBASE III+ as an intern... Oh my god I'm wearing the most god-awful blue pinstripe suit.

> So what are Elvis's numbers like:

> New Code: 5% Modifying Existing Code: 25% Understanding Code: 70%

> No, I am not making this up.

> Let me explain where these numbers come from. First: Why is 5 times more time spent modifying code than writing new code? The answer is that new code becomes old code almost instantly. **Write some new code. Go for coffee. All of sudden you've got old code.** Brand spanking new code reflects at most only the initial design however most design doesn't happen up front. Most development projects use the iterative development methodology. Design, code, test, repeat. Repeat a lot. Only the coding in the first iteration qualifies as all new code. After the first iteration coding quickly shifts to be more and more modifying rather than new coding. Also, almost all code changes made while bug fixing falls into the modifying code category. Look at VS, our stabilization (aka bug fixing) milestones are as long as our new feature milestones. Modifying code consumes much more of a professional developer's time than writing new code.

> Secondly, why does understanding code take 3 times more of a developers time than modifying code? The answer here is that before modifying code, you must first understand what it does. This is true of any refactoring of existing code--you must understand the behavior of the code so that you can guarantee that the refactoring didn't change anything unintended. When debugging, much more time is spent understanding the problem than actually fixing it, and once you've fixed it, you need to understand the new code to ensure that the fix was valid. And lastly, even when coding new code, you never start from scratch. You will be calling existing code to do most of your work. Either user written code or a library supplied by Microsoft or a third party for which no source is available. Before calling this existing code you must understand it in precise detail. When writing my first XML enabled app, I spent much more time figuring out the details of the XML class libraries than I did actually writing code. When adding new features you must understand the existing features so that you can reuse where appropriate. Understanding code is by far the activity at which professional developers spend most of their time.

> **Visual Studio is not Focused on Real Coders**

> I recently asked a couple of PM friends of mine (who will remain nameless to protect the innocent) where they figured developers spent their time. Their estimates ranked writing and modifying code above understanding code. Looking at the feature list for Whidbey I think that this is consistent with many folks across the division. It sounds reasonable that writing code is the primary activity for folks who write code for a living but it is in fact very far from the truth. I think there are several reasons why our current focus is on writing code rather than understanding code.

> **Many of our new features are designed by folks who write small demo apps. Lets face it, PM's aren't professional developers. They need to come up with code snippets and examples which are trimmed down for presentations and conferences. This results in features which demo well, but will in fact provide little or even negative benefit to the real coding task of understanding code. Staring at code for hours just doesn't demo well.**

> Our usability studies are run over a timeline of 3-4 hours. This includes problem definition, problem solution and post mortem. The last 2 usability studies I saw were basically "write this self contained dumbed down piece of code from scratch". This does not even remotely resemble real world professional coding. The last time I had a coding project like that I was in college. Early in college. A much more representative task would be to send a coder at an existing piece of code that they'd never seen, that was undocumented, badly written, badly architected and had several bugs. Then tell them to add a new feature while maintaining the existing behavior as much as possible. It may be difficult to get anything useful out of a short study, but it would be much more representative of real professional development. Even in the usability studies that I have seen, the users have spent a ton of time in help trying to understand our class libraries (aka understanding existing code).

   [1]: http://blogs.msdn.com/peterhal/archive/2006/01/04/509302.aspx

