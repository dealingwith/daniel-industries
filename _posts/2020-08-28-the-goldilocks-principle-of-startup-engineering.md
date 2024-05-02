---
layout: post
title: The Goldilocks Principle of Startup Engineering
subtitle: How much tech is just right?
date: 2020-08-28 23:14:03 -0500
categories:
 - technology
 - work
 - management
 - product
---

You've perfected your tech stack. You've kept your code perfectly DRY. Your component library is meticulously documented. Your deployment pipeline is flawless. Your test suite is second-to-none. Meanwhile, your CEO is screaming and throwing his hands up in the air, having just seen a sale slip through his fingers because he didn't have anything more than a Figma prototype and couldn't promise the customer a delivery date. 

OR

You shipped it! Your CEO is thrilled. But the honeymoon quickly ends when the customer reports a bug...and then another...and another. Then the app starts returning 500s on every page. It's impossible to know where the problem might be. There are no tests, no reliable way to track changes made to the codebase. You're anxious as hell and don't anticipate getting to sleep tonight...

OR

It was tight, but you managed to get just enough shipped to satisfy 60% of the customer's demands. You know 20% of their requests are utter nonsense (but you'll never say it). The other 20% are obviously needed to make this product worth it for them in the long term. But they're paying. And you can now hand off some of the development to the new contractor starting next week. There are just enough tests to give you confidence they won't break any core component of the system. There is a paper trail of commits and pull requests to help them understand the decisions made thus far. There is a lot of refactoring needed, but no one would accuse this repository of being a spaghetti bowl. Time for a restful weekend.

![]({{site.url}}/assets/2020/08/three-bears.jpg "The customer ate up my product. It must have been just right!")

How does one reach the peaceful nirvana of option three? By making deliberate trade-offs based on experience shipping real software to actual customers. It's possible to come from an organization that values perfect, bug-free code over hitting a deadline--certain regulated industries might even demand it. It's also possible to have a history of never having to maintain what you've built--it's never survived long enough in the market to matter.

But if your product does have a market, it will have to not only stand up but run fast enough to keep up with that market. And critically, **if you're successful with that first customer, there will be a second, and a third...soon, that idea of throwing away an "MVP" and starting over flies out the window.**

![]({{site.url}}/assets/2020/08/Page_89_illustration_in_More_English_Fairy_Tales.png)

Move fast and **don't** break things. Radically de-scope without decreasing the value your customer expects. Keep code quality high without constant churn. And for the love, do not change tech stacks because the CEO got some negative feedback from a potential investor.
