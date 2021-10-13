---
layout: post
title: "Getting this running on Windows"
excerpt: 
date: 2021-10-09 23:05:11 -0500
categories: 
 - linux
 - windows
 - development
---

This is a test to see if I can build and deploy this site--as simple as it is!--from Windows. First, the backstory of how I ended up in this strange place:

I was a Windows user for the first decade+ of my career, and a DOS user before that (from childhood through college). I switched to a Mac in ~2009.

In [2020 I switched to Linux](https://www.daniel.industries/2020/07/11/my-linux-setup/) (Ubuntu). I ended up going back to a Mac in 2021, however, and for a single unfortunate reason, really: Zoom was really unstable on Linux.

So now I'm once again going to need to return a Mac laptop to a business entity. Based on the information above, I would just switch back to my Ubuntu setup. Except that, a couple of months ago, I went to log into my Ubuntu machine and...just couldn't. It would not accept my password. Had I forgotten my password? I tried every iteration I could possibly imagine, but no luck. I was locked out. So I resorted to factory resetting the entire machine from the boot menu, which meant back to Windows.

Since I'm not particularly against any given OS (as you might have already gathered), I thought I'd play with Windows for a second. Of specific interest was answering the question of getting a development environment set up. I got a little bit down that road at the time before putting it aside for the next couple months (until now).

The primary piece of kit that allows me to even ask the question is the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/). 

> The Windows Subsystem for Linux lets developers run a GNU/Linux environment -- including most command-line tools, utilities, and applications -- directly on Windows, unmodified, without the overhead of a traditional virtual machine or dual-boot setup.

Getting it installed was [not as easy as advertised](https://docs.microsoft.com/en-us/windows/wsl/install) but easy enough that I don't remember what extra steps were required.

The WSL has access to the Windows filesystem (it's technically possible for Windows to access the WSL filesystem but it is strongly discouraged), so I can use [GitHub Desktop](https://desktop.github.com/)* and [Visual Studio Code](https://code.visualstudio.com/) normally to clone, edit, and commit the files that constitute this site. Then, and this is quite nice, VS Code automatically picks up the fact that I can run a WSL terminal and allows me to run it directly inside the editor--and drops me directly into the file path for this project (which looks different for the WSL than it is for Windows).

So from there, it was just a matter of installing [Bundler](https://bundler.io/) and running it to install the gems (primarily [Jekyll](https://jekyllrb.com/)) required to generate this site. It runs locally, which means it will probably build fine, now the real test: can I deploy?

\* This did not go entirely smoothly, however, as I had a file with a ? in it, which Windows could not handle. I ended up installing [Git Bash](https://gitforwindows.org/), and generating yet another key for GitHub, although the final fix was to simply get rid of the offending file.
