---
layout: post
title:  "I'm using an older version of Stata, and it won’t open the file. How can I use the SWIID?"
date:   2015-10-05 5:28:01
categories: sfaq_howto
---

Stata 13 introduced a new file format which older versions of Stata can’t open. Fortunately, there’s an easy fix: the `use13` command. In the command window, first type `ssc install use13` to install it. Then you can type `use13 SWIIDv5_0.dta, clear` to load the SWIID data.
