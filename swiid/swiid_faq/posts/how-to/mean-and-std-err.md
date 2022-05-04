---
rank: 2
title: How can I use the SWIID data to make my own graphs?
---

The [SWIID download](https://dataverse.harvard.edu/dataset.xhtml?persistentId=hdl:1902.1/11992) contains files pre-formatted for use with the tools for analyzing multiply-imputed data and other data measured with uncertainty in Stata (`swiid8_2.dta`) or R (`swiid8_2.rda`). This is meant to "set the default" in a way that encourages researchers to take into account the uncertainty in the SWIID estimates.  This uncertainty is considerable in many developing countries, and the tools available in both software packages can now handle pretty much any analysis one may desire (for details, read the documents `R_swiid.pdf` and `stata_swiid.pdf` in the SWIID download). But this format does not lend itself to graphing.  For this purpose, use the `swiid8_2_summary.csv` file, which presents the SWIID estimates in mean-plus-standard-error summary format.

In Stata:

```
 import delimited "swiid8_2_summary.csv", clear
 
// Calculate the bounds of the 95% uncertainty intervals
gen gini_disp_95ub = gini_disp + 1.96*gini_disp_se
gen gini_disp_95lb = gini_disp - 1.96*gini_disp_se

// A silly example
gen name_length = length(country)
gen first_letter = substr(country, 1, 1)
keep if year==2010 & first_letter=="S" /*2010 for Senegal, Serbia, . . .*/

// A scatterplot with 95% confidence intervals
twoway rspike gini_net_95ub gini_net_95lb name_length, lstyle(ci) || ///
    scatter gini_net name_length, msize(small) legend(order(2 "SWIID Net-Income Inequality")) 
```

In R: 

```R
library(tidyverse)

# Load the SWIID
load("swiid8_2.rda")

# Plot SWIID gini_disp estimates for the United States
swiid_summary %>% 
    filter(country == "United States") %>% 
    ggplot(aes(x=year, y=gini_disp)) + 
    geom_line() +
    geom_ribbon(aes(ymin = gini_disp-1.96*gini_disp_se,
                    ymax = gini_disp+1.96*gini_disp_se, 
                    linetype=NA), alpha = .25) +
    scale_x_continuous(breaks=seq(1960, 2015, 5)) +
    theme_bw() + 
    labs(x = "Year", 
         y = "SWIID Gini Index, Disposable Income",
         title = "Income Inequality in the United States")

# Plot SWIID gini_net estimates for the United States
swiid_summary %>% 
    filter(country == "United States") %>% 
    ggplot(aes(x=year, y=gini_net)) + 
    geom_line() +
    geom_ribbon(aes(ymin = gini_net-1.96*gini_net_se,
                    ymax = gini_net+1.96*gini_net_se, 
                    linetype=NA), alpha = .25) +
    scale_x_continuous(breaks=seq(1960, 2015, 5)) +
    theme_bw() + 
    labs(x = "Year", 
         y = "SWIID Gini Index, Net Income",
         title = "Income Inequality in the United States")
```
      
