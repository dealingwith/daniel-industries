---
layout: post
title: "B-b-back to Ubuntu"
excerpt: 
date: 2021-11-12 11:30:24 -0600
categories: 
 - linux
---

Previously, in reverse order:

- [Getting This Running on Windows](/2021/10/09/getting-this-running-on-windows/)
- [Linux Setup Update](/2020/08/06/linux-setup-update/)
- [My Linux Setup](/2020/07/11/my-linux-setup/)

In the most recent post above ends with, "I’m back on Ubuntu–a story for a different post..." In fact, I'm now on a second install of Ubuntu since then, still suffering a little bit but staying the course for now, so I'm going to take some notes here for my future self or anyone who stumbles across them and might find them useful.

I reinstalled Ubuntu as a dual-boot with Windows just in case I wanted/needed anything on Windows, and to continue to hold out for Windows 11 (which I can now upgrade to but have not yet). But I didn't only install Ubuntu because I was having trouble getting a sane development environment set up; I also just don't like the Windows user experience.

At first I decided to try [Pop!_OS](https://pop.system76.com/), which I have been keeping an eye on since right about the time it was first released. I created a boot USB and boot to it, but its installer doesn't support automatic dual-boot. I think it can be done, but at the time I preferred more efficiency and hand-holding so I immediately went back to Ubuntu, whose installer I knew could set me up a dual-boot situation automatically via the installer.

I decided to go with the most recent release of Ubuntu which at the time was 21.04. It installed easily and I was on my way. I slowly got all the things installed and set up and was a relatively happy camper. I had done a "minimal" install and as such it hadn't installed any drivers for my NVIDIA GPU, but everything I needed to run was doing fine with the integrated Intel graphics (maybe better). The screen brightness controls even worked, which was not my experience with 20.04 (or it was the GPU drivers, I may never know).

- I did experience new-to-me issues with my wifi. Every two or three weeks I would lose my IP address from the router and couldn't get a new one. Rebooting the router resolved the problem.
- I experienced a success I hadn't before, which was getting multiple versions of Java running so that I could run both very old and very new versions of Minecraft.

Then (ominous music) I managed to brick my desktop environment for the first time ever. I was trying to get a specific version of Python installed so I could run a to-remain-unnamed nonessential program. I thought Python would have been installed already but _which python_ returned nothing. I installed the _python3_ package and at that point I had a python I could access. Unfortunately said program needed an older version of python, and I guess python versions forked at version 3 so I had to install a completely different python package. Before I did that I decided to uninstall the python3 package. This was the critical mistake. The long list of dependencies that _apt_ said it was going to uninstall with it should have been a big red stop sign, but I just plowed along. Next thing I knew GNOME was toast. I tried a number of things but nothing worked. In hindsight, reinstalling python3 might have done the trick. But before I thought of that, I went ahead and reinstalled Ubuntu 21.10, using the full install this time, just in case.

Now I'm suffering under a number of 21.10-specific issues.

- I'm sticking to Firefox for now, but it's slow and a little buggy in it's snap package iteration. And the GNOME Shell extension doesn't work in this snap Firefox version. I don't use that many extensions so it's not quite worth installing them by hand. Firefox also no longer supports GTK themes.
- There aren't RVM packages for 21.10, but rbenv worked so I'm on my way to getting this blog building and deploying again. There have been some other packages that are also missing versions of 21.10.
- I haven't figured out the multiple versions of Java thing again yet.
- Screen brightness controls still work, though! It's the small things.

And of course there are the general getting-everything-set-up-again hassles, which I enjoy on occassion but not twice in as many months. On top of that, I've been quite ill all week so I haven't had much energy to work on it.

---

Current setup:

- Tweaks. One of the first things I install so I can change caps lock to escape and flip alt and control keys.
- gnome-sushi for file preview (I had something similar before but I forget what)
- gpaste for clipboard management (no change here but I don't make it long without a clipboard manager) (UI is a bit messed up on 21.10)
- Autokey for text completion (no change here but it's behaving oddly on 21.10--I can't seem to set up custom shortcut keys)
- Zoom, of course, somewhat unfortunately. But it's much more stable now than it used to be.
- Flameshot for screenshots.

On the short-lived previous setup I'd installed Chrome in order to have a Slack call. I'm still holding out on Chrome (or Chromium, or Brave, or whatever) for now this time around.

Update: Got the version of Java I needed installed.
