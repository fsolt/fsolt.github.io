---
title: "Notes for Those New to Writing Peer Reviews"
author: "Frederick Solt"
date: "April 14, 2017"
output: html_document
---

Today we had a workshop for our graduate students on writing peer reviews.  Here are my notes on my contribution:

I get asked to do a lot of reviews.  At the beginning of this semester, I got seven requests within two or three weeks.  I used to always say yes, but doing 35 or 40 reviews a year just took too much time: when I was first starting out, I'd take something like six or eight hours on each, but that pretty quickly got down to four or so.  Nowadays it might even be a touch less, spread over two days. I like to give the paper a close read on one day, while taking notes and maybe doing a bit of research.  Then the next day, I write up my review, after my thoughts have had a chance to percolate.  Anyway, now I have a two-per-month rule, though I sometimes break it: I took 4 out of those 7 requests back in January.

I always start my reviews with a quick summary of the piece, but as reviewers, our focus should be on theory, data, and method.  For the big-three journals, the old saw is that the standard is "new theory, new data, new method--choose any two," but regardless of the journal that has asked you to review, for a work to make a contribution, it has to be sound--not new, just sound--on all three.  Here are a couple of quick notes on each, mostly of the points I find myself most often making:

1. Theory: if you think that the authors<a href="#note1" id="note1ref"><sup>1</sup></a> have overlooked some plausible rival theory, be sure to explain and include specific citations. You don't have to have a full bibliographic entry; author and year are probably enough, though I usually throw the journal abbreviation in too just to be sure. 

Reviews aren't the place to develop your own new rival theory.  If you're _really_ tempted to do so, plan instead on responding to this paper when it comes out in print.

1. Data: do the authors take advantage of all available data?  Probably not---we can't all look at everything all the time--but if they've neglected obvious things: using, say, just that oddball third wave of the WVS instead of all the waves, or if they have very little data and you know of other sources they can draw on, say so.  Of course, if they use some source and you know that there's other, better data available, point that out to them.

1. Methods: are the methods appropriate?  Judge the methods on their own terms: NOT, oh, this study uses survey data, so none of this is causal! OR this study just reports an experiment, so it has no external validity!

Are interaction terms properly constructed and interpreted?  There's software that makes this easy. Recommend it by name. I always say, "There's [`grinter` for Stata](http://myweb.uiowa.edu/fboehmke/methods.html) and [`interplot` for R](https://cran.r-project.org/web/packages/interplot/vignettes/interplot-vignette.html)."  Include cites to [Braumoeller's (2004) _IO_ article](https://www.cambridge.org/core/journals/international-organization/article/hypothesis-testing-and-multiplicative-interaction-terms/5AE39EABAA8F26582C65F0D3FAD153D8) and/or [Brambor, Clark, and Golder (2006) in _PA_](http://www.jstor.org/stable/25791835), too.

Are the included controls appropriate?  Do the authors include controls that are plausibly causally downstream from their IVs?  That shouldn't be done.

Do they *exclude* variables that would plausibly confound the relationship between the IV and the DV?  It's not enough to say that "oh, they didn't control for X."  You should explain why including X as a control is important--and again, include citations.  You should also suggest a source of data for X.  Btw, in my book, omitting a control, even one you're totally sure is a source of spuriousness, is an R&R-able offense, not one that condemns the perpetrator to rejection.  Let them show you you're mistaken.

Are the coefficients and statistical significance interpreted correctly?  Are quantities of interest like predicted probabilities estimated and plotted?  With their associated uncertainty?

Can any included tables be made into graphs?  Probably, so be specific about what you have in mind, cite to Kastellec and Leoni's (2007) _Perspectives_ article, and maybe even give the `dotwhisker` package a shout-out.

* Note what you're NOT evaluating: the results themselves.  Don't filter on statistical significance: need to avoid contributing to publication bias and the pressure way too many people apparently feel to p-hack.

Nor the question asked. Don't suggest that authors "reframe" their work around some similar (or not so similar) question. Don't say that the question just isn't important enough for the AJPS. If you know me, you've probably heard me push you to work hard to ask _important_ questions.  I totally think that's a big deal.  But as a reviewer, deciding whether the question asked was sufficiently important for publication isn't your job.  That's for the editor, maybe, but really for us all as a discipline, as readers.

Nor typos, grammar, or citation formatting.  If it's *really* bad, I'll point out that it's something the author should be sure to work on.  I *will* always note if I see that cited works are not included in the bibliography.  BibTeX, people!

Finally and above all: take a considerate, *helpful* tone.  Research is hard, and the peer-review process is difficult and frustrating for all authors.  Contribute to the collective good by pitching your comments with a helpful tone that you would be happy to read in reviews of your own work.  In other words, #BeReviewer1.  Even if just everything is going to need to be started over from scratch--and sometimes it does--always find at least one good quality of the paper to highlight.  

# Resources
Political Methodologist 23(1), Special Issue on Peer Review, especially Nyhan's "Checklist Manifesto"

check #BeReviewer1 on Twitter, and be sure to read [Thomas Leeper's manifesto that started it all](http://thomasleeper.com/2016/08/be-reviewer-one/)

<a id="note1" href="#note1ref"><sup>1</sup></a> I've settled on always writing reviews with the assumption that the piece is co-authored and that the appropriate pronoun is therefore "they."