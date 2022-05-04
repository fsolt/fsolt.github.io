---
rank: 5
title: How can I use the SWIID data with Stata’s time-series operators?
---

To use Stata’s time-series operators (`l.` , `f.` , `d.` , etc.), you must first declare the time and panel variables using `tsset`, but the SWIID is already `mi set`, so `tsset` won’t work. Run the following before merging the rest of your data (called `my_data.dta` in this example) into the SWIID:

    use SWIIDv5_1.dta, clear
    egen cc = group(country)  
    mi tsset cc year
    merge 1:1 country year using "my_data.dta", keep(match master) 

Now you’ll be able to use `l.` and the rest of Stata’s time-series operators.
