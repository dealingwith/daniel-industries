---
layout: post
title: "Updating Windows and Formatting a Linux Partition"
excerpt: "The common narrative is that Linux is for more technical users, but my experience is the opposite"
date: 2024-03-17 21:42:48 -0500
categories: 
 - technology
 - software
---

## The setup

Today I finally got around to cleaning and updating my son's Window's laptop. It used to be my laptop, the first one I ever put Linux on, as duel-boot [sic]. He was experiencing multiple issues, not all of which could be attributed to the age of the machine. I had not tried to do anything in Windows for a long time.

## Every bucket has a hole in it

The very first thing we did was take apart the machine and clean it. Hat tip to Lenovo for making a laptop that is relatively easy to open. We used up the remaining compressed air in the can on hand, and had to run to the hardware store for more, _[There's a Hole in My Bucket](https://en.wikipedia.org/wiki/There%27s_a_Hole_in_My_Bucket)_ style.

## Windows update is different now?

First order of business once booting the machine was updating the OS. After dismissing the prompt to update from Windows 10 to Windows 11, I discovered it had been auto-updating for some time. That was good. I clicked the little grey button to install currently-available updates. That's when my trouble began.

- At first it looked like it was updating. The progress indicator is very small, just some text below the description of the update, in the same font size. It showed "downloading", then "installing", then returned to its previous state but with additional red text explaining there was not enough disk space for the update.
- I looked at the disk space and the Windows partition was indeed very full. I clicked on the link to the "Storage" settings and sorted the list of installed programs by size. There were not many large applications in that list, but I removed one or two. I began to realize that not all installed applications were in that list.
- I went back to the update, fairly certain that I had freed enough disk space for it, but apparently I had not. It was the same vague song and dance again. The disk space warning had disappeared, but only because the screen had reset and had to attempt the update again in order to let me know it still needed more disk space.
- One of the programs I noticed not in the installed list but clearly on the machine was a JetBrains IDE (I assume I installed it to work on Minecraft mods). I deleted it. I went through the machine and there was not much else there. Props to my 9-year-old: the downloads folder was empty (and I do not think that's because he has removed anything).
- I removed Steam games, which was another whole thing when the client updated itself mid-cleanup and wouldn't start again until after a reboot.

## The only way to format a Linux partition is from Linux

I could see the Linux partition just sitting there nearly empty. I tried using Window's disk utility, but it was unable to format the partition. After some internet digging, it appeared the most straightforward way to reformat the partition was to create a bootable Linux USB and use disk utility from Linux running off the USB. That worked. I should keep Linux USBs laying around; the longest part of the process was downloading the ISO and flashing it to the USB.

I changed Steam's default storage to the newly empty partition. That is about the only thing that might need large chunks of space in the future.

The update ran after all of this.

## Everything is terrible

I don't remember updating Windows being such an information-poor experience before. I've tried to hypothesize about why they've changed the UX to obfuscate important information about the need for, or progress of, updates. My only idea is that they force and/or assume auto-updates and actually do not want their users to manually execute OS updates. But what about when there is no longer enough space for the update? I've seen this on iOS before, and IIRC the OS offers to unload some stuff off the device temporarily in order to perform the update.

The UX of the Windows update settings panel was so poor that at one point I said out loud, "I'm about ready to just install Linux Mint on here and be done with it." I quickly remembered that some of his Steam games would not work on Linux. I thought about the fact that Windows, the most popular OS, is the result of decades of just adding code to DOS. It doesn't enjoy the turn-of-the-century reset [macOS](https://en.wikipedia.org/wiki/MacOS) got.

I realized at that moment that on the distros I've used, OS maintenance tasks are significantly more user-friendly than on Windows. The common narrative is that Linux is for more technical users, but my experience is the opposite: to actually use Windows is to survive a minefield of bad defaults, constant popups from bloatware (half of which is from Microsoft itself), and impossible-to-find information or UI for adjusting almost anything.
