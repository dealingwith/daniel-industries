---
layout: post
title: "My Linux Setup"
excerpt: "About I month ago I switched from Mac to Linux"
date: 2020-07-11 20:29:08 -0500
categories: 
 - linux
 - meta
---

![]({{site.url}}/assets/2020/07/neofetch.png)

So far I think my only mention of Linux has been [this post]({{site.url}}/2020/03/13/what-to-do-if-ubuntu-cannot-see-partitions-due-to-the-ssd-being-in-raid-mode/ "What to Do if Ubuntu Cannot See Partitions Due to the SSD Being in RAID Mode"), but I have in fact been using Ubuntu as my primary OS for about a month now. I bought a 2019 XPS 15 7590 on sale in the spring in anticipation of using my work MacBook Pro less for personal use. At first, I installed Ubuntu 18.04 as dual-boot with the original Windows install. I did have to follow the same steps described in that post to get it to install.

What happened was, switching between computers for work/personal was too much hassle, and the Dell sat in my bag while I continued to use the MBP in both contexts. It wasn't until I left that job and returned the MBP that I started using the Dell full-time.

Shortly before the transition, I installed Ubuntu 20.04 as a fresh install, wiping out Windows on this machine. I was fully committed. I also purchased a Dell external monitor--an UltraSharp 27" 4k--as I was also returning the very nice LG 30" 5k display provided by my former employer.

I had spent some nights messing with the 18.04 install--installing themes, etc. But for the first few weeks with 20.04, I ran the stock look and feel. I have now installed the _[Nordic](https://www.gnome-look.org/p/1267246/)_ theme, mostly to tighten up those too-tall window title bars. It also has macOS style window buttons, but I've kept them on the right-hand side; for some reason that feels more natural to me, even after a decade-plus on macOS.

## Apps

* The very first thing I had to install was something to control the screen brightness, as the only hardware issue I've had has been the brightness controls (both the hardware buttons and native Ubuntu controls) not working (and the default 100% brightness is _blinding_). So I installed [this brightness controller](https://github.com/LordAmit/Brightness). This bug has been the second-most annoying issue so far. More on the most annoying issue later.
* Next I installed the Chromium browser (the open-source version of Chrome). I intended to use Firefox--the default browser installed with Ubuntu--but quickly noticed it used a lot of CPU; so much so that the fans spun up after opening just a couple of tabs. Chromium doesn't seem to have this problem, although particularly bad web pages will very occasionally cause trouble. None of my always-open web apps--Gmail, Google Calendar, Trello, Android Messages, Google Play Music, Notion--have any issues.
* Discord. Works great.
* Zoom. Works well enough. The UI isn't amazing but I'm pretty sure it's the same UI as on Mac.
* Slack. Works great.
* [Caprine](https://sindresorhus.com/caprine/) for Facebook Messenger.
* I went without a clipboard manager for almost my entire time on a Mac, but towards the end there I used one and I'm not sure why I waited so long. So now I use [GPaste](https://www.imagination-land.org/posts/2020-03-27-gpaste-3.36.3-released.html).
* Sublime Text. I forgot to save my themes, so this gave me a chance for a fresh start, and I like what I found better than what I had before. I'm using [ayu](https://github.com/dempfi/ayu) for both UI and color themes. 
* GNOME Tweaks, for changing the theme as described, and some key binding changes I'll get into later.
* Mateo for displaying how freaking hot it is outside in the system tray ([discovered via this post](https://www.omgubuntu.co.uk/2019/02/weather-apps-for-ubuntu-linux)).
* I just used the default GNOME app launcher--re-mapped to control+space--until tonight, when I installed [Ulauncher](https://ulauncher.io/) ([discovered via this post](https://www.omgubuntu.co.uk/2016/12/21-must-have-apps-ubuntu)), which gives me a very Alfred-like experience. I installed one extension--emojis--so now emojis are much closer at hand than they were before (with the default Characters app). 😎
* I miss Divvy, which was the window manager I used on macOS, but I've made do with the left-half/right-half/full-screen default window snapping in GNOME. 

## Fonts

Fonts were a bit of an issue. I installed my favorite monospace font--[Source Code Pro](https://en.wikipedia.org/wiki/Source_Code_Pro#:~:text=Source%20Code%20Pro%20is%20a%20set%20of%20monospaced%20OpenType%20fonts,designed to work well in coding environments.)--easily enough. That covered my preferences for Sublime and Terminal. I actually like the Ubuntu font so I'm using that pretty much everywhere else possible. However, I noticed web pages were somehow still rendering Arial when declared in their font-family. I have a long-standing hatred of Arial, since even before I switched from Windows to Mac in the late '00s. It turns out it wasn't Arial at all, but some other font that was being used as a substitution for Arial. I discovered, via some post I can't find anymore, that I could specify which font is substituted in Font Manager. Since most sites have Helvetica ahead of Arial in the font-family, I just substituted that one.

![]({{site.url}}/assets/2020/07/font-manager.png)

Not perfect but good enough for now.

## Cloud drive access

I knew this one was going to be problematic before I switched. I'd been a Dropbox customer for years, but their product has been going downhill consistently over the years, culminating in their force-installing a desktop app that by default would open at boot on macOS. The release of that app corresponded with a "smart sync" feature that was somehow different from their long-standing "selective sync" feature. For whatever reason, switching a file from "online-only" to "local"--a process one would think would just involve downloading the file--took a very long time, all the while consuming _all_ available CPU.

So a few months ago I started the long process of moving off Dropbox. I knew I was going to switch to Ubuntu so I was looking for something that would work on it. I eventually decided--despite moving farther away from the Apple ecosystem--to further entrench in the Google ecosystem and go with Google Drive (actually [Google One](https://one.google.com/about) but knowing Google it will probably be called something else soon). I knew I would need a third-party app to sync on Ubuntu, but the total cost was still going to be less than Dropbox.

Then I discovered that GNOME could automatically load Google Drive as a connected drive in the default [Files (Nautilus) app](https://wiki.gnome.org/action/show/Apps/Files). The only problem was it was very slow. So I ended up going with the third-party app anyway. That app is [Insync](https://www.insynchq.com/) and it works great. Again, the cost of Google Drive (with plenty of storage for myself _and_ now the rest of my family, plus full-res photo storage through Google Photos) plus Insync is less per year than Dropbox was.

## Other tweaks

When Apple took away the physical escape key, I mapped caps lock to escape and have never looked back (in fact I regretted not doing that years earlier). The easiest way to accomplish this in Ubuntu was to _swap_ the escape and caps lock keys using GNOME Tweaks. I also swapped the left Alt and Control keys, allowing me to keep my Mac muscle memory for cut/copy/paste, window close, etc. I mostly use a mechanical keyboard, so I also swapped the key caps to match. 

## Bugs and quirks

I've already mentioned the brightness control issue and the occasional Chromium crashes and the struggle to figure out why non-existent fonts were still rendering. But the most annoying thing is that fractional scaling isn't working. [This is a new feature in Ubuntu 20.04](https://www.omgubuntu.co.uk/2020/04/ubuntu-20-04-fractional-scaling-support-setting#:~:text=Ubuntu%2020.04%20has%20a%20switch,the%20feature%20is%20turned%20on%3A&text=I%20opened%20Activity%20Monitor%20and%20waited%20for%20it%20to%20settle.) and one I was really looking forward to making use of. Basically, 100% is too small and 200% is too big on my main 27" monitor. Additionally, I can't seem to be able to set my 27" to a different scaling percentage than the built-in laptop screen when they're in side-by-side mode. (200% is too small but 300% is too big on the laptop screen, though, so without fractional scaling working, it doesn't matter.)

![]({{site.url}}/assets/2020/07/display-settings.png)

## Resources

[omgubuntu.co.uk](https://www.omgubuntu.co.uk/) and [askubuntu.com](https://askubuntu.com/) have both been awesome.

## Things I like and final analysis

When Apple hardware was far and away the superior choice and even Ubuntu looked and felt really dated, it was easy to choose to spend a premium on a Mac. But when the 2016 MBP keyboards starting failing, which mine did, twice, along with the speakers, it was hard to not feel ripped off. Linux desktops continue to become more visually refined and the OS itself more stable on more hardware. App support is increasing, and most of my work is either in a browser or text editor anyway. Development environments are generally the same, and technologies like Docker make that part easier and tend to run better on Linux to begin with.

I'd long since moved away from the Apple ecosystem. I switched to Android years ago. The fact that iPhone users continue to have this weird privileged prejudice against people whose text messages appear in a different color is bizarre to me. And the fact that people are willing to pay 1.5 times as much for computer and phone hardware based mostly on brand is equally weird. I _really_ don't miss macOS crashing half the time I disconnected or reconnected the external monitor...or even bumped the cable a little bit.

I don't use any Adobe or Apple software or play any games that would keep me locked into either macOS or Windows. A large percentage of the software I use or might be interested in is either available on Linux or has a Linux equivalent. I can live without the rest.

![]({{site.url}}/assets/2020/07/elitism801_1024x1024.webp)

But mostly, I want to be different. I want to be able to tweak as many things as possible with this interface that I sit in front of for the majority of my waking hours. I don't want to pay a company more money because they're a popular brand. I'm actually less interested in a thing if it is popular. I don't want to give the biggest company in the world more money. (Yes, the Google ecosystem thing is still an issue--to the point I'm considering going back to an iPhone, but I don't think I will.) I want to be out on the edges as much as possible. That's where all the interesting things are happening.

---

Oh, and the static site generator that I use to publish this blog ([Jekyll](https://jekyllrb.com/)) runs about five times faster on Ubuntu than it did on macOS, which, when one has a blog of over 3,000 posts, is a nice bonus.
