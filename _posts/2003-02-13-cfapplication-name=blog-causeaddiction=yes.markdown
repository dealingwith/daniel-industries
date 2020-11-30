---
layout: post
title: 'cfapplication name=blog causeaddiction=yes'
categories:
 - minutia
---

&lt;cfapplication name="blog" causeaddiction="yes"&gt;

&lt;cfset baseurl="http://www.danielsjourney.com"&gt;



&lt;cfif not somethinginteresting=""&gt;

&nbsp;&lt;cfif obtaintime("thursday")=""&gt;

&nbsp;&nbsp;&lt;CF_STAGE FAVORITES="to_blog" URL=somethinginteresting&gt;

&nbsp;&nbsp;&lt;cfif getinterestingsomethings("to_blog") >= 10&gt;

&nbsp;&nbsp;&nbsp;&lt;CF_WARN WHO="reader" WHAT=<a onclick="javascript:alert('Blog queue constipated-- Beware forthcoming movement');" href="#">message</a>&gt;

&nbsp;&nbsp;&lt;/cfif&gt;

&nbsp;&lt;/cfif&gt;

&lt;/cfif&gt;


