---
layout: post
title: "2023 November Build Club Posts"
excerpt: 
date: 2024-02-14 14:36:45 -0600
categories: 
---

## Day 1: Inauspicious start

#### November  2th, 2023

- Sitting down at my computer, still feeling low on energy, and lacking any motivation to get started on Build Club work, I did what any slightly depressed developer would do: I messed with my computer. In today's episode, I installed some different icon themes. I'm on PopOS, so installing different icon themes is relatively straightforward. In the end, however, I went back to Pop's default icons. I do this periodically on my computer and on my phone (Android), because invariably there are a few icons I do not like. But in changing the theme, the icons I don't like end up just changing. I could mix-and-match, but that is a lot more work. With Apple products, I have the same issue, but no recourse, so I'm stuck with whatever the Great Apple Design Gods™ dictate, and usually just move on with my life. I'm not sure which is better. I don't apologize for wanting my computing environments Just So™, but it is a waste of time most of the time.
- That leaves me here, having to brain-dump my dumpster-fire of a day so far. It is the first day of Build Club™, and the *first rule of Build Club is you talk about Build Club*. I have a Notion page in my "Tasks" database titled:
	- *What's important inc*
- This is the only name I've thought of so far for this entity (aka me but not just my name) that creates and/or curates a collection of tools for managing life's work, be it on a computing device or on paper. There only other name I'd come up with for such a venture: *Internet Toy Company* which I liked when some of my ideas were just for fun.
- Within the Notion page are three lines of text:
	- Daily sheet
	- Daily page
	- Markdown print
- Oddly, the one app I actually have a domain name for, *TaskSheet*, which is also the project name in the metadata of the page, isn't there. TaskSheet, formerly known as NotionPaper, formerly known as TrelloPaper, is a CLI tool for turning a Notion database into a TaskPaper-formatted text file. Long ago, when I used Trello, I also used TaskPaper--not the official app, but a Sublime (and later VSCode) extension. Trello gave me the higher-level organization features I needed to organize All the Things™, but I spent most of my day inside my code editor, so a quick export of what was current, that I could display in an easily-manipulated text file, worked great. It was always right there in a tab in the editor, and I had the keyboard shortcuts in muscle memory. I always wanted a two-way sync, but parsing the TaskPaper was always a RegEx Too Far™. So I would just update Trello by hand at some regular interval.
- Years ago, I switched to Notion. Their database views offered significantly more options when it came to organizing the data in the system. I could move between different views faster. (Aside: I quickly learned the "keep everything in one database" technique.) But I had the same problem with both figuring out "what's next" and with having that list in a format and in a place that was more accessible and easier to work with and manipulate.
- Notion finally released their API, and so the port of TrelloPaper commenced. Their API was significantly more complex, due to the significantly more dynamic nature of the data. Instead of a static JSON object for any given request, one must formulate a query, and to formulate a query, one must have an understanding of the structure of the database you are querying. Hard-coding the query was fine for now, but would require an update every time I tweaked the database (which was not-infrequent), and would also mean only those with an understanding of both JSON and Notion's query API could adjust the tool for their own use.
- So I built a series of inputs both for the CLI, and then for a basic web app, which took as input information about said database structure, so that it could dynamically create the query. It still made a couple of assumptions about the structure of the data, for example that each page in the database would have some kind of status metadata represented as a select field. I got so far as to try to deploy the app (a Ruby app using Sinatra for the web app piece) on both Railway (failed) and fly.io (still failed, but after more progress).
- This was all done in 90-minute time blocks on Sunday afternoons. Eventually, the wind left the sails. The cost/benefit wasn't there, even as a one-off tool just for myself. I wasn't using TaskPaper in my code editor anymore. I wasn't in a code editor that much at that point. The database had become too large, so even a modest export to TaskPaper became so large that it did not achieve its primary purpose: focus. At my day job, I kept daily journal pages in Notion and just moved items from the previous day as needed. This worked well in that context because said day job had turned into a ferocious tennis match where flaming balls were served over the net on an hourly basis and my job was to attempt to either return said balls, or extinguish them and capture them in a bucket. I won't get into the details, but it is easy to understand that such a life is destined for Real Burnout™, in this case within 18 months, and also that if the goal is to have one's life produce Meaningful Outputs™, that is a terrible way to manage things.
- In my personal life, such as it was, I was still using the same Notion database as always, but in those brief moments when I could reflect on it and pick off a few things, I just wrote them down in my Field Notes notebook, bullet-journal-style. I still lacked that feeling that I was working on anything meaningful, but it didn't matter because I had so little time to worry about it. Life was passing me by, my physical health was deteriorating, and there was little I could do about it. That was until those 18-months-to-total-burnout passed, and I had to hit eject, and I was left with a classic midlife crisis moment of "What now?"
- There are a few other physical health issues impacting the direction of this already obnoxiously long brain dump. My eyes started getting worse. I can't focus on a computer screen first thing in the morning or late at night. I don't have the late-night stamina I used to have. I frequently return to my desk after the kids have gone to bed (a time which gets later as they age) and simply cannot muster the mental energy for Real Work™. As such, I need ways to do "deep work" away from the computer.
- There was already a component of TaskSheet née NotionPaper that intended for the output to be printed, if the user was a paper kind of person. I'd discovered in my slow transition from screen to paper that there is a ginormous community of paper journal people out there. Just search on YouTube for "bullet journal" or "traveler's notebook", I dare you. I've clawed my way out of those rabbit holes more times than I care to admit. There is [a South Korean company](https://webudding.com/en/), webudding, that sells only digital notebook pages, and they are doing quite well for themselves.
- I was sharing the TaskSheet concept with a friend, and they had the idea to reverse the workflow: instead of starting with the data (like this nerd did), what if I started with the output? I could have a few PDF templates (that's all webudding sells, PDFs), and the user could even just hand-enter the data for the page(s) and get a fresh PDF with their custom content inside. It's basically just a form in front of a PDF, so you don't have to use another piece of software on your computer or tablet. (Although maybe hand-writing onto the PDF is the point, I haven't done enough research yet to know.)
- I quite liked that idea, both because I knew there was already a market there of people buying PDFs for their digital/paper notebooks, and because it was more tractable than fixing the UX for data ingestion from Notion plus the 100 other potential data sources one might want.
- I briefly had the idea of using OCR to determine the "fields" for any PDF, but I quickly shoved that to the back burner, as it again smells of infinite scope.
- What I need is something that
	- I will absolutely use daily, or at least multiple times per week. For that, it has to be easy and make me feel good about a system that keeps me focused on What's Important™, motivates me to stay focused (that piece is complicated, but just being somewhat enjoyable to use would be a start), and accommodates my increasing physical constraints.
	- Makes sense to "release" to some "market"
		- post about a Notion template + low-barrier web app to various Reddit groups
		- figure out how to sell the PDF template on a marketplace + include instructions for said web app
		- ...???
- Just yesterday I was thinking about narrowing scope to "today" planning. I wrote:
	- Tools for "today" planning
		- Todoist has this
			- but I don't like Todoist
		- Notion views could accomplish this
		- This is somewhat at the heart of TaskSheet
			- Proper paper project planning tools?
	- I later created a "Today" view of my tasks database. It really just carved off the top of an already sorted list (called "Focus" ...Lord, I have a lot of database views in Notion, 21 to be precise). Having used it for less than a day, the jury is still out.
	- Aside: Notion queries do not currently support something like, "just give me this named view". There are at least a good handful of similar tools--there is a Raycast plugin for quickly interfacing with a Notion todo database, for example, but you have to use their database template.
		- Aside to the aside: Good Lord there are a lot of launchers out there. I'd forgotten the name of Raycast and had to google it. I actually started my yak shaving today by wanting to tweak the default PopOS launcher. There are mercifully fewer options on Linux. I quickly bailed on that project, after the longer rabbit-hole adjusting icons.
- This is getting disgustingly long, but it's helping me quite a bit. So: who's the user (me, but what does that mean, and are there any others like me out there), and what's the ideal UX?
	- My ideal self, the ideal user, implements Cal Newport's shutdown routine after a perfect day of only spending large chunks of time in Deep Work, focused on What's Important. As part of that shutdown routine, they visit their **Super Powerful Trusted System™**, in this case, Notion. They review what they did and consider tomorrow. They click some shit, the SPTS (I like this) snaps into a view that Makes Perfect Sense™ to their brain. They can move into whatever the rest of their day looks like (in Cal Newport's case, an idyllic evening spent with devote focus on their family and in reading approximately 10 books).
	- In the world where the tool formerly known as TaskSheet fits into this routine, they click another button and a file of their choosing appears:
		- Text file
		- PDF
		- Some other digital view that provides the sense of focus and achievement they're looking for...maybe?
			- this could also be automatic export to some other tool, an idea I've played with quite a bit
	- The next morning, they return to said output, which launches them into another perfect day full of satisfaction, focus, and heaps of money.
- Aside: Cal Newport's time-block journal has affordances for this, I think. I purchased said journal long ago and have literally never cracked it open. As part of this project, I should probably do so.
- What's the first build step? This is Build Club, after all.
	- I have decided I need to scrap TaskSheet entirely. Name and code.
	- I like Daily Page, it captures the ideal scenario nicely.
		- TODO Get a domain name. This is not strictly required at all, but like most indie devs it helps me focus. I could kick this can down the road.
	- I should describe in words what it does. I like the semi-sarcastic description above.
		- TODO A page of text could be a start. I could put it on yay.boo, another Good Enough product. Ditto in terms of this really being necessary.
	- I should build the **Minimal-Dogfoodable Product™** (MDP) (I like this as well)
		- TODO My SPTS is Notion, so hard-code the ingestion based on my database structure? This is the complex part my friend suggested bailing on, but on the other hand I've already done it in Ruby. Alternatively, I could find some template out there and quickly build a form to sit in front of it.
			- TODO Look for said template
		- I've decided to use JavaScript, so
			- TODO Create a new repo
				- I've decided on Bun, so
					- TODO Look for a Bun repo template. Is this even a thing?
			- TODO Write a script I can run on the command line, or a quick web form, to inject data
		- TODO Figure out the output
			- Printable? Yes. So, what's the fastest way to something I can print out.
				- 8.5" x 11"
				- It will need SOME structure, so some light design of said output will be required unless I find that Perfect PDF Template.
		- Then, test drive that for a few days while I figure out What's Next
	- MVP
		- Something anyone else could use.
			- Thoughts: expand the Notion-as-a-backend, just like with the original TaskSheet
				- OR hand-entry, per my friend's idea
				- AND/OR database template, like most of the similar tools on the market
			- Thoughts: and this is lingering from the original TS concept: multiple outputs
- This brain dump took a little over an hour. Not bad.
	- Aside: I wrote all this in Logseq, my other SPTS for *capture*, and I love it for info dumps and note taking, particularly because of its bidirectional linking capabilities. But I find it lacking in terms of doing any project or task planning.
- Misc capture:
	- TODO Where am I going to keep this project organized? UGH.
	- TODO I want to time-block a solid 4 hours every day to this, not spread them around, although two 2-hour blocks wouldn't be terrible either. I didn't track when I started but approximately 1pm, so I'm not at 2 hours, and another 2 would be 5pm. This day has sucked.
	- Nothing in my "Today" view had TaskSheet tasks in it yet. UGH.
		- There are a bunch of other projects' tasks and personal admin (that's late!) on there already from yesterday

---

- I just did a simple Google search for "daily page". Oh my.
	- [dailypage.co](https://www.dailypage.co/) is an app for writers to help them write every day
		-
			> Build a better writing habit.  
		-
			> Daily writing prompts & helpful writing courses.  
		- so, at least that's a specific thing. Can close that tab.
	- [The Daily Page](https://dailypageshop.com/) is a collection of paper planners, "established 2010". There are a million of these, I have an entire Notion database filled with them (called *TaskSheet Paper Goods Reference*). They're all very...specific...
		- I don't think I'll even add this one. Closing the tab on any pre-printed planners / notebooks.
		- Next tab was the Facebook page for this product.
		- Next tab was the Etsy shop for this product.
		- Good job on their Google Juice
	- The next result was the Product Hunt "Daily Page" (meaning dailypage.co) alternatives. There are a lot of them, natch, but fortunately this is a different domain entirely. Closing.
	- [Etsy results for "Daily Page Planner"](https://www.etsy.com/market/daily_page_planner) was next. This is more interesting because they do appear to mostly be digital goods, intended for printing.
	- Next was a [Pinterest user's board for "Daily page"](https://www.pinterest.com/emszepiela/daily-page/). Also moderately interesting but TBH I don't get Pinterest as an information discovery or organizational tool.
	- Next was a dead Shopify storefront. Pity it was on the first page of Google results, still.
	- Next was [Rae's Daily Page](https://raesdailypage.com/), "(Rae's) space to share bullet journal ideas, stationery reviews, and a glimpse at my life!"
	- Next was an old link to the [Hobonichi Techo](https://www.1101.com/store/techo/en/), another paper notebook with a following as enthusiastic as the Traveler's Company. Their products' designs provide a little bit more flexibility, but remain in the "paper calendar/planner" category.
	- Next was [Cloth & Paper](https://clothandpaper.com/), another notebook company. I did not already have this one in my database either, but meh.
		- Here's what I already had in my papergoods DB:
			- [Intelligent Change](https://www.intelligentchange.com/)
			- [Monk Manual](https://monkmanual.com/)
			- [MochiThings](https://shop.mochithings.com/)
			- [Ink+Volt](https://inkandvolt.com/)
			- [Karst](https://www.karststonepaper.com/)
			- [Lochby](https://www.lochby.com/)
			- [BestSelf Co.](https://bestself.co/)
			- [BaronFig](https://baronfig.com/)
			- [The Habit Nest Daily Planner](https://habitnest.com/products/the-habit-nest-daily-planner)
			- [Kokuyo](https://www.kokuyostore.com/en_US/home/)
			- [Scribbles That Matter](https://scribblesthatmatter.com/)
	- Day Designer -- [Free Daily Page Printable](https://daydesigner.com/products/free-daily-planning-page). Same. They're all selling 2024. It dawned on me that calendar-based planning paper goods have the advantage of automatically becoming obsolete if you use them or don't.
	- "[1 Page at a Time](https://adamjk.com/products/1-page-at-a-time) is a journal, scrapbook & anything else. It’s whatever you say it is. Slowly fill the book and by the time it’s done, you’ll have a perfect keepsake of the year you made it through."
		- From Amazon: "A supportive planner and journal for anyone—filled with prompts, reminders, and gently existential encouragement from the creative mind of Adam JK."
		-
			> [Adam J. Kurtz](https://adamjk.com/) (better known as  Adam JK) is an artist, author, designer, and speaker whose "deceptively simple" work is rooted in hope, honesty, humor, and a little bit of darkness.  
	- [Daily Grind Planner](https://dailygrindplanner.com/). More of the same, but they sell candles too!
	- [Canva daily planner templates](https://www.canva.com/planners/templates/daily/) is interesting. Pages upon pages.
	- That was an interesting 30 minutes of additional research, but just more of the same that I've done before. I hate the internet, and this space is huge. I do think it is interesting the gap between the paper-based world and the digital world. There's another huge product glut in the digital planning space.
- Based on what I saw on Etsy and Canva, finding a template that speaks to me is going to be a challenge. Going back to webudding. They have an image CTA that says "Looking for the perfect product for you? Sign in and see our recommendations that match your taste!" Going to give that a try. (Also, is this English version of their site new?)
	- On the auth page:
		-
			> Are you a Hezy member?  
			Please sign in using your Hezy account  
			to retain and continue your data.  
		- what's Hezy? A quick google search doesn't surface it, and clicking that just leads to another auth page. Just an OAuth provider, maybe?
			- another search for "hezy auth" surfaced webudding's auth page...such a mystery
	- okayyy, their Google auth flow is broken
	- ok, that signup flow was rough but I'm in
	- a new CTA: "Hey buddy! Having trouble using the service? Check out our user guide for more details!"
		- it goes to a Notion page! (or more likely, a Notion-to-website built page) [guide.webudding.com/en/customer](https://guide.webudding.com/en/customer)
			- wow that's a lot, but yeah, using the products is pretty difficult. [Goodnotes](https://www.goodnotes.com/) has its own section in there. Goodnotes [invested in webudding](https://techcrunch.com/2023/09/25/notetaking-app-goodnotes-invests-1-9m-in-digital-stationary-company-webudding/). I didn't even know about Goodnotes, but they must have a decent userbase and/or funding.
	- ok now that I'm out of that rabbit hole, "our recommendations that match your taste" was overselling it by a lot. It appears to be a standard ecommerce recommendation engine that currently has no information about me with which to make recommendations. This is another case of a million options thrown at me in a grid. meh.
- Now I'm at the 3-hour mark. I need a break.

---

## Day 2: High Energy Kick-off Call, Low Energy Work Session

#### November  3th, 2023

We had our kick-off call, which was really valuable (for me, at least) and ended up going for two hours. Jeff joined for a portion. Even with Andrew as the only other fellow builder, learning about his project and his thought process is really helpful in terms of motivation and my own thinking about my own project.

After the call, I had an on-the-bike meeting about my other totally different project, and that ride ended up being longer than planned (31 miles) and left me feeling pretty tired! I had blocked out two additional NBC work chunks on my calendar, but late afternoon and after the kids go to bed are terrible times of the day to focus on dev, so I spent some more time reviewing prior research, even though that was not my plan for Day 2. I need to start building.

- Went back over [Notion Tools](https://www.alexglv.com/notion-tools)
	- Lots of half-baked or now-dead stuff in here.
	- [notion-automations.com](https://notion-automations.com/) is interesting, and relatively expensive -- $7/mo (if paid annually) for ONE integration
	- [github.com/typeoneerror/notion-api-examples](https://github.com/typeoneerror/notion-api-examples)
		- cloning this for later reference
	- [notionmastery.com](https://notionmastery.com/) has expanded to two people since I last looked at it. Worked in the wake of Marie Poulin's consulting with Egghead, not sure how I felt about the results. It looks like Benjamin Borowski has taken over all the consulting here.
	- [optemization.com](https://optemization.com/)
		- Notion consulting has become quite The Thing, I guess
	- [bardeen.ai](https://www.bardeen.ai/)
		- I tried this out a while ago, should give it another go
		- Could I glue this to Firebase?
	- [whalesync.com](https://www.whalesync.com/)
		- Had not seen this one before, should play with it
	- [notionsocial.app](https://notionsocial.app/). Buffer-like functionality from Notion. I'll look into this one for Texas Youth Cycling social account content management.

- Bun research
	- [Awesome Bun github](https://github.com/oven-sh/awesome-bun)
		- so much of what's linked from here is incomplete or extremely bare-bones
	- One advantage is, if I actually built something that ran in the real world, I think Bun people would be pretty interested in it from a technical standpoint
	- [ElysiaJS framework github](https://github.com/elysiajs/elysia)
	- ElysiaJS docs
		- [Introduction](https://elysiajs.com/introduction.html)
		- I'm not sure I like the syntax for handling requests, although it is reminiscent of Sinatra, and each route could just be a function that returns HTML from a template, achieving the server-side JS I was thinking about.
		- TODO Try this
	- The ElysiaJS framework is...interesting, to say the least. The release notes are somewhat bizzare. See [Elysia 0.7 - Stellar Stellar](https://elysiajs.com/blog/elysia-07.html).


---

## Day 3: Now We're Cooking With Fire!

#### November  4th, 2023

Today I just kind of dove into building something, still without a really clear idea of what, but as I researched the BETH stack, I was intrigued. And more importantly, I found flow. The first 4 hours flew by, and then I worked at least a couple more hours in the afternoon. Even though I was learning TypeScript and JSX on the fly, there was something about [ElysiaJS](https://elysiajs.com/) and [htmx](https://htmx.org/) that felt familiar. They're reinventing the wheel, but they've made some small improvements, and the developer experience with the BETH stack is pretty great. Given how brand new it is, it all Just Works. It reminds me of Sinatra, which means (so far) it seems best suited to small apps (like mine). But there is a much larger app example I still need to dig into.

I feel both close to a MDP, and close to a vision for what the whole enchilada will be, and have decent confidence in this tech stack as a path to both.

I'm pretty done for today, and tomorrow my calendar looks like a Tetris game until 4. Maybe after that I can figure out something I can accomplish to move this forward. I would like to keep today's momentum going over the weekend.

---

Notes:

- [The BETH Stack: Build Hypermedia-Driven Web Apps with Great DX and Performance](https://youtu.be/cpzowDDJj24) (YouTube)
	- compelling!
	- here is the branch with that full demo; he's updated the main branch of this repo for the `create-beth-app` stuff, I think
		- [github.com/ethanniser/the-beth-stack/tree/PREVIOUS_REPO_ARCHIVE](https://github.com/ethanniser/the-beth-stack/tree/PREVIOUS_REPO_ARCHIVE)
		- each step of the todo demo from the video is a branch, that is really cool (if true)
			- ~~step through each step~~
				- no more branches, will have to just pause the video a lot
			- DONE clone this repo
			- DONE checkout `PREVIOUS_REPO_ARCHIVE`
			- I opened it before I ran `bun install` then I realized I hadn't updated bun (`bun upgrade`) but it's all good with `bun update`
			- So part of how I eval this kind of thing is: How does it make me *feel* when I read it?
				- So far, considering how unfamiliar I am with modern JS styles and frameworks, not terrible. I'm uncomfortable, but following.
				- Because there's no longer a branch that is pre-Turso, to run this out of the box I would have to set up Turso. I'm thinking about going back to the video and figuring out how to revert the Turso bit
					- oof, that's actually a lot
					- 5 minutes later, and a lot of commenting-out: ok, that was not bad at all
					- somewhat grokking this
	- woah, [4-hour follow-up](https://youtu.be/NZpPMlSAez0?si=sBPFlWLIevtMDUq2)
		- TODO Want to watch this, just not right now
		- [repo](https://github.com/ethanniser/beth-b2b-saas)
	- this kid is a *senior in hs* ...awesome!!!
	- Pretty scared to work in something this bleeding edge, but maybe I YOLO it
		- given the trouble I had deploying my Sinatra app. "Mature" isn't always better
- thinking about what's required by my app
	- thinking about going back to a barebones wireframing app
		- DONE Whimsical
	- Whimsical is buggy now, but this UX was simple enough to get it done
	- logged into Figma and whew. I think given how basic this is, I'd be better off just hand-HTML-ing this thing
	- this could all run without any server-side except to serve the page
		- [edited out a rabbit hole here]
		- Found [nanostores](https://github.com/nanostores/nanostores) by Evil Martians
	- I ended up going down the BETH path, and it was fun. I have some of the components of the design rendering.
	- Tab capture:
		- [Typescript Date Object](https://www.scaler.com/topics/typescript/typescript-date/)
		- [LaLoka Layouts for Tailwind CSS](https://layoutsfortailwind.lalokalabs.dev/)
		- [Tailwind CSS Documentation](https://v2.tailwindcss.com/docs)
		- [svelte/store docs](https://svelte.dev/docs/svelte-store)
		- [Hono - Ultrafast web framework for the Edges](https://hono.dev/)
		- [hyperscript](https://hyperscript.org/)
		- [hanji - Designless command line user interface builder for nodejs+typescript](https://github.com/drizzle-team/hanji)
		- [Drizzle Team](https://drizzle.team/)
		- [Hypermedia Systems](https://hypermedia.systems/)
		- [htmx - high power tools for html](https://htmx.org/)
		- [Turso - The Fastest, Easiest, Cheapest Database in the World](https://turso.tech/)
		- [UnoCSS - The instant on-demand Atomic CSS engine](https://unocss.dev/)
		- [first commit of tweaked BETH todo app example · dealingwith/daily-page-beth-stack@1e35595](https://github.com/dealingwith/daily-page-beth-stack/commit/1e35595d0b8e5830aa85a8e9ab5859ba09f15ba7#diff-0b5adbfe7b36e4ae2f479291e20152e33e940f7f265162d77f40f6bdb5da7405)
		- [selectors.info](https://selectors.info/)
		- [Build a Better Mobile Input](https://better-mobile-inputs.netlify.app/)
		- [Rams Palette](https://www.presentandcorrect.com/blogs/blog/rams-palette)
			- Colours taken from Dieter Rams legendary product collection for Braun. Made by [Chad Ashley.](https://greyscalegorilla.com/)
		- [Present & Correct](https://www.presentandcorrect.com/)
			- Love this name
			- This might be my favorite paper goods etc shop ever. The Swiss design flowing throughout, the appreciation for vintage design ...this site just continues to give. I will be back and probably impulse-buy some stuff
	- Aside: I put my phone in my little phone desk stand, but *facing away from me*, and *that has made all the difference*
- 11:53am: almost at the end of my 4-hour block. Things that made this one feel successful:
	- Started almost right away after I woke up. I did a little bit of my morning reading and daily pages over my first cup of coffee, but then jumped right in.
	- Barely ate. I had one more cup of coffee with creamer and a mini cliff bar. I know I'm about to run out of brain fuel but I think eating very little in the morning really helps me focus.
	- Actually touching code and doing dev things is really motivating. I think this is because I feel some sense of mastery, even when delving into a brand new stack. My other work is a lot of business stuff that I:
		- do not feel as experienced or skilled at
		- does not provide any immediate feedback or sense of accomplishment
			- this has been killing my motivation lately
	- Just wireframing a page opened all the creative doors. I can already imagine all the enhancements, where a paid tier enters, etc, etc. I haven't written any of that down yet, but it's there. I want to make sure I accomplish a first step before I get too far down the road in my head. But it had been a while since I'd experienced that confluence of design and dev creativity that I enjoy so much.
	- Almost all the rabbit holes were short and fulfilling


---

## Day 4 & 5: Weekend Frustrations

#### November  6th, 2023

Over the first weekend, days that are not agreed-upon work days of November Build Club, I still wanted to make some progress on my project, especially given the results of Friday's extended work session based on the BETH stack. Unfortunately, weekend days look like Tetris boards, and Saturday involved a volleyball game, an extended bike ride with the boy, and a hit of existential exhaustion. I worked a little bit in the evening: I created a new app with `create-beth-app`. It had significantly more boilerplate than the tutorial example I based my work on the day before. I tried to comment-out stuff I did not need and just render some HTML, but failed. I'm not sure how long I actually managed to work, but probably only about an hour. I ended up watching a number of episodes of _The Fall of the House of Usher_ after that.

Sunday morning I had a commitment to run sound at church, and the boy came with me. My wife had four photo shoots scheduled, so I was mostly responsible for the offspring. The girl was supposed to come with us, but took too long getting ready so I let her stay home by herself. I hung out with them a little bit in the afternoon but for the most part lost a number of hours between church and my standing 4:30 calendar event for "Computer Adventures" with James.

I caught James up on the project, mostly on a technical level, my experience with using the BETH stack thus far, and proposed three different options for moving forward after my frustrations of yesterday:

- Continue forward with the work as it stood at the end of Friday: based on the original BETH stack tutorial/example, which is now tucked into a branch on the main BETH library/package repository, which I have forked.
	- Advantage: it is more simple than the new boilerplate created by `create-beth-app`
	- Disadvantage: it will continue to be farther and farther behind of the main BETH project, and I'll have to maintain/update dependencies on my own
- Continue my attempts at adapting the new `create-beth-app` boilerplate to my needs, which was causing me so much frustration yesterday. I explained yesterday's work/findings to James and attempted this route for a little bit, continuing to get errors.
- Build an ElysiaJS app from scratch using `bun create elysia hi-elysia`. We did this, and then I got as far as adding:
    - staticPlugin from '@elysiajs/static'
    - html from "@elysiajs/html"
    - and UnoCSS and `concurrently`

At the end of that time, I was resolved to either
- find a templating system I was happier with than JSX (but was mature and well-supported / used)
- just plow forward with JSX, which appears to be the default/preferred way with ElysiaJS

I thought I was going to work some more in the evening, but I had a library book due Monday (_Faith, Hope and Carnage_ by Nick Cave and Seán O'Hagan) that I wanted to finish (it will be automatically returned and picked up by the next hold-holder).

---

## Days 6, 7, and 8: Into and Out of the Darkness

#### November  9th, 2023

I'd prefer to not discuss the content of my first three days of this week in this forum, but just now I:

- Modified an example [Astro](https://astro.build/) page and ~~component~~ layout, finally, after a couple of attempts.
- Closed all my tabs related to ElysiaJS, JSX (for now), [etc, etc](https://indieweb.social/@dealingwith/111371489597137134).
- I now have two Astro docs tabs open and a tab for my local dev server.
- A hope that I can massage this thing into what I need, and a plan to get back at it tomorrow.

Yesterday (or the day before, they blurred together), I discovered Nathan Broaddus / [Evenings](https://shop.world.limited/music), which is some of the most perfect music I've heard in a while.

Now I must go execute my obnoxiously long bedtime routine and try to sleep, then wake up at 6 for a bike ride. It is supposed to be raining by then. I hope it is raining by then. I've ridden enough the last two days. The Darkness came and I got on my bike and rode away from it, just like I do every time.

---

## Days 9-12: Mud Boss

#### November 13th, 2023

[Progress has been the speed of a very muddy gravel race in the middle of the night](https://youtu.be/ExOPQfBxqyg?t=1250&si=3IrconVp15QfUPME).

Day 9 (Thursday): Continued development in Astro, but you have to use another one of those FE frameworks I love to hate to get any interactivity (or I could roll my own with...what?...vanilla JS? There's a reason there's a new FE framework every few months). I started forward with Svelte. By the end of the day I was table-flipping.

Day 10 (Friday): I took the entire day off and revisited late at night. I fixed the "bug", breaking loose from the issue that had me table-flipping the night before.

Day 11 (Saturday): I thought about working on this, but...well...didn't.

Day 12 (Sunday, today): I hoped to work most of the day, but again, didn't. I got started when I had my standing weekly 90 minutes with James, and together we made a decent amount of progress. [#](https://indieweb.social/@dealingwith/111400366966132651)

With Astro, there's no server-side anything, so I have to connect it to Firebase or the like (or my own backend, I suppose). I'm debating making sure that route will work before I keep building out the frontend, or just finishing up the frontend, which could run without a backend for v0.1.

---

## Day 13: Trying to Keep it Fun

#### November 14th, 2023

Realizing I needed to reboot my daily schedule, this morning I woke up at 6am and went on my semi-usual 1-hour bike ride around White Rock Lake. I then immediately sat down and coded on my little project until noon. I focused on just implementing ideas as they came to me. I experienced some success, and learned a bit more about Svelte and Tailwind. I finally got stuck trying to get an event to bubble up to a parent-of-a-parent component, realizing what I needed was the Svelte "store", which remains a mystery. I also can't get away from Typescript, despite specifying that I didn't want to have to use Typescript when I set up the project, Astro is all Typescript behind the scenes. I tried to create a vanilla Javascript module and import/use it in my main Astro file, [which is supposed to be possible](https://docs.astro.build/en/guides/imports/#javascript), but it wouldn't work for me.

I struggled with energy levels all afternoon and evening, and now my eyes are doing their nightly failing thing. As previously mentioned, I am much more productive if I don't eat much and get started first thing in the morning, but the not eating much part really messes with the rest of my day.

Tech changes I'm still noodling:

- Ditch Astro and just use Sveltekit
- Using Firebase or not
- Ditching all this shit and going back to Rails/Turbo

It's 11:30 now and my alarm is set for 6am for another bike ride. About even odds right now if I'll make it. I have a 10am on-the-bike meeting tomorrow as well. The trail I'm helping to maintain is having some media event.

---

## Day 20: Progress

#### November 21th, 2023

I've been making progress and not blogging. Except last weekend, when I was ill with some kind of weird 24-hour flu thing. Thanksgiving week is upon us, which means the kids are home all day. Today I managed about a 3.5 hour block in which I squashed some more bugs, added some more features, finished some static content pages. I think I'm ready to build and deploy to a static host. Then I'll think about what's next.

After said block, I showered, trimmed my shaggy beard, and took the kids to Dick's Sporting Goods, where a new baseball glove, a new baseball, and some warm cycling clothes for the boy were obtained. Then we went to a park and threw baseballs until the sun ducked behind the trees.

The kids being out of school also means they stay up way later. It's 10:30 and I'm just now sat back at my computer. I should code. Maybe I'll buy a domain to point at this thing. Maybe.

---

## Day 21: Little Time, Little Fixes

#### November 22th, 2023

Last night I built the entirely static site and deployed it to [dailypage.daniel.industries](https://dailypage.daniel.industries/). I really don't hate having it on a subdomain of my personal site at this point. As soon as it was up there, I noticed a couple of issues.

- The margin between content blocks was off as certain middle-widths, including the A5 paper size I've been printing with. I fixed that tonight.
- It seemed like localStorage wasn't working correctly -- it seemed like my data got wiped out by the "default" data (which is really only ever supposed to show up the very first time you load the page). But tonight when I went to try to fix it, it was working correctly again. 

¯\\_(ツ)_/¯

I also added analytics via [Plausible](https://plausible.io/). I noticed that my browser (Brave) blocked the script by default, so my mileage is clearly going to vary. Tomorrow I will work on tracking clicks. Once anyone starts using it, I would like to see what they're clicking on. I also installed a certificate, so the page loads over HTTPS now.

The deploy process is delightfully simple, and identical to my personal site's (which uses [Jekyll](https://jekyllrb.com/)) -- that is, a build command, and an rsync command.

I'd like to quickly add the ability to specify a background image, with some good presets available. I'd also like to add the ability to add a Notion API key and query string. _Then_, maybe I'll work on the back-end, with login and server-side storage.

---

## Days 22-23: Little QOL Updates and Bug Fixes In-between Turkey

#### November 24th, 2023

Busy with T-day-related family activities these last two days so not much progress, but I did manage to get a ~2-hour block in each of these last two days.

- Added some QOL things: easier keyboard navigation with global shortcuts for each content area and the ability to quickly tab to a content area and then hit "Enter" to start editing (added instructions to the Help page as well)
- Squashed some bugs, I can't remember which now. localStorage seems to just work now, I'm not sure what caused the problems a few days ago.
- Discovered and added the [DaisyUI](https://daisyui.com/) component lib, so far only using the checkbox. This makes for less verbose class attributes and it has some nice touches and it makes it slightly less bog-standard-Tailwind-looking.

Yesterday a previous colleague reached out to me and on Saturday we're going to work on a Go backend, which I'm pretty excited about! I've never written Go before. Tomorrow I'm going to focus on boning up on Go so I'm not walking in _completely_ ignorant. But because one of the goals of this effort is to learn new things, I'm excited about this opportunity. 

---

## Days 24-26: Backend and Help

#### November 27th, 2023

Been a busy holiday week with a lot of guests in the house, two birthday celebrations, and of course T-day.

Yesterday Daniel R and I paired for about 2 hours and instead of Go, we explored how Astro does backend. We learned about dynamic JSON endpoints. We deployed Daily Page to Vercel.

Today James, Daniel, and I paired on getting Supabase auth working. I still have a decent amount of work to do before I get it working on Vercel. Importantly, it doesn't DO anything beyond the login at the moment, so there's not much point yet. I will probably try to get it to some reasonable state and then get it merged and deployed with the signin link hidden for now. Then, figure out Supabase DB and start storing user content in the DB. Then, settings.

James made some bug reports I need to look into as well. Daniel made some good UI suggestions I will be implementing.

It's really nice to have other people providing feedback both during dev and in terms of UX.

---

