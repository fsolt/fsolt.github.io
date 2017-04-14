---
title: "Notes from a grad-student workshop on writing peer reviews"
author: "Frederick Solt"
date: "April 14, 2017"
output: html_document
---

I get asked to do a lot of reviews: at the beginning of this semester, I got 7 requests within two or three weeks.  I used to always say yes, but doing 35 or 40 reviews a year just took too much time: when I was first starting out, I'd take like 6 or 8 hours on each, but even I pretty quickly got down to 4 or so.  Nowadays it's might be a touch less, spread over two days: I like to give the paper a close read on one day, while taking notes and maybe doing a bit of research, and then to write up my review the next day, after my thoughts have had a chance to percolate.  

Anyway, now I have a two-per-month rule, which I sometimes break: I took 4 out of those 7 requests back in January.

I always start my reviews with a quick summary of the piece, but as reviewers, our focus should be on Theory, Data, and Method.  For top journals, the old saw is that the standard is New Theory, New Data, New Method--choose any two--but regardless of journal, for a work to make a contribution, it has to be sound--not new, just sound--on all three.  A couple of quick notes on each:

* Theory: if you think that the authors--and I've settled on always writing reviews with the assumption that the piece is co-authored and the appropriate pronoun is "they"--if you think the authors have overlooked some plausible rival theory, be sure to explain and include specific citations. You don't have to have a full bibliographic entry; author and year are probably enough, though I usually throw the journal abbreviation in too just to be sure. 

Reviews aren't the place to develop your own new rival theory.  If you're really tempted to do so, plan instead on responding to this paper when it comes out in print.

* Data: do the authors take advantage of all available data?  Probably not--we can't all look at everything all the time--but if they've neglected obvious things: using, say, just that oddball third wave of the WVS instead of all the waves, or if they have very little data and you know of other sources they can draw on, say so.  Of course, if they use some source and you know that there's other, better data available, point that out to them.

* Methods: are the methods appropriate?  Judge the methods on their own terms: NOT, oh, this study uses survey data, so none of this is causal! OR this study just reports an experiment, so it has no external validity!

Are interaction terms properly constructed and interpreted?  There's software that makes this easy. Recommend it by name: `grinter` for Stata and `interplot` for R.  Include cites to Braumoeller's (2004) _IO_ article and/or Brambor, Clark, and Golder (2006) in _PA_.

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