---
rank: 6
title: I imported the swiid_summary.csv file, and the data for some countries seem to be given in different units; for example, in one country, gini_disp is 313 and gini_mkt is 33. How can I interpret these data?
---

The issue here is that the swiid_summary.csv file is saved using [RFC 4180 csv conventions](https://en.wikipedia.org/wiki/Comma-separated_values), that is, with a dot marking the decimal and a comma separating values.  If you are in a locale that observes different conventions---many countries use commas to indicate the decimal and semicolons to separate values---your software's default settings may not read the data correctly.  Be sure to specify the decimal marker and value delimiter appropriately when loading the file: all SWIID values are Gini indices and so fall between zero and one hundred. 
