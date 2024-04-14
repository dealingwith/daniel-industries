---
layout: post
title: "What to do if Ubuntu cannot see partitions due to the SSD being in RAID mode"
excerpt: 
date: 2020-03-13 06:03:49 -0500
categories: 
---

I bought a lower-end Lenovo gaming laptop about a year ago for both myself and my kids play games on, and to play around with Linux on.

I tried to install [PopOS](https://system76.com/pop) on it at the time, but during the install process, the installer could not see any available partitions on the hard drive. I googled and tried troubleshooting but soon lost the plot. The children were in the process of taking over the laptop anyway.

Last weekend I ordered myself a Dell laptop for the explicit purpose of installing Linux on it and using it as my device. This reinvigorated my interest in getting a Linux distro installed on the Lenovo. This time I was able to discover the problem and solve it.

This time I went with vanilla [Ubuntu](https://ubuntu.com/desktop), as its installer seems to be the most automated of all Linux distributions. The installer once again failed to see any available partitions on the hard drive.

Google paydirt this time came by way of this askubuntu Stack Exchange post: "[Installing Ubuntu Desktop 18.04 LTS but it's not detecting my Samsung PCIe NVME SSD](https://askubuntu.com/questions/1031766/installing-ubuntu-desktop-18-04-lts-but-its-not-detecting-my-samsung-pcie-nvme)" which linked to [this post](https://www.tenforums.com/drivers-hardware/15006-attn-ssd-owners-enabling-ahci-mode-after-windows-10-installation.html#post332243) with careful instructions on how to switch a hard drive to AHCI mode without messing up the existing Windows installation.

So here is what I did:

1. In Windows, I turned on safe mode. To do so, I did not use the command prompt as described in the above post, instead, I used the config GUI by searching for `msconfig` in the Windows search box, then selected “Safe boot” under the "Boot" tab.
1. Reboot the Lenovo and entered the BIOS settings by repeatedly pressing F2 during boot.
1. Navigated to the storage screen and set the drive config to AHCI. The config manager displayed a dire warning that this would erase all data on the drive. It did not.
1. Saved and rebooted back into Windows. Everything was fine. I turned off safe mode with the same technique as I had turned it on. I rebooted again. Everything was still fine.
1. I once again booted to my Ubuntu USB and stepped through the initial screens of the installer. This time it could see the drive and partitions and the installer worked! The machine can now boot to either Windows or Ubuntu.

Now to just figure out the graphics driver situation. :P
