---
layout: post
title: "How to create stand-alone web apps in Ubuntu-based distros"
excerpt: 
date: 2024-01-17 13:43:59 -0600
categories: 
 - linux
---

Many web apps offer a desktop app option for Mac and Windows. But rarely are those same desktop apps available for Linux. In addition, it is difficult to customize or modify those web apps when they've been compiled to a desktop app, even if they're just using Electron or [Tauri](https://tauri.app/).

Most web apps are set up as [PWA](https://en.wikipedia.org/wiki/Progressive_web_app "Progressive web app")s and can be "installed" easily from the browser. However, on Linux, and IIRC on Mac as well, these windows appear as additional browser windows. There's not a huge advantage to installing a web app this way except for having less browser chrome. They work much better on mobile devices, which I think is the focus for PWAs anyway.

There have been tools for creating desktop versions of web apps for a long time. [Fluid](https://en.wikipedia.org/wiki/Fluid_(web_browser)) is/was one for Mac, but hasn't had an update for some time; maybe it doesn't require one, but I'm on PopOS anyway.

[Nativefier](https://github.com/nativefier/nativefier) was a popular option but is officially unmaintained since September, with the developer suggesting using browser shortcuts, which functionally work exactly like PWAs. It is probably ok to keep using Nativefier for now, but it will eventually rot as all unmaintained software does.

Linux Mint ships with [Webapp Manager](https://github.com/linuxmint/webapp-manager). I've never tried Mint, but I've watched plenty of walkthrough videos and have always longed for this app on the distros I've used (so far Ubuntu and PopOS).

Mint is based on Ubuntu, as is PopOS, so in theory I could get it running. Theory: correct! Here is what I did, based on [this article](https://ubuntuhandbook.org/index.php/2021/01/install-linux-mints-web-app-manager-ubuntu-20-04/):

1. Download the .deb from [packages.linuxmint.com/.../webapp-manager](http://packages.linuxmint.com/pool/main/w/webapp-manager/ "Index of /pool/main/w/webapp-manager/")
1. PopOS ships with [Eddy](https://github.com/donadigo/eddy "donadigo/eddy: A debian package installer for elementary OS"), so I used that to install Webapp Manager from the deb.
1. That was it! Using Webapp Manager is entirely intuitive, and offers multiple customization options (including which browser to use), and its Github readme covers everything else one might need to know.

The app I was trying to install standalone was Notion, which I customize with custom CSS. After getting the Webapp Manager version installed, I just had to install the Stylus extension again to load my custom CSS.
