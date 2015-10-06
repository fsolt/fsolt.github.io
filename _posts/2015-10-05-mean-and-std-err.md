---
layout: post
title:  "How can I use the SWIID data to make my own graphs? Or to get the data in the old mean-plus-standard-error format?"
date:   2015-10-05 17:14:01
categories: sfaq_howto
---

As of Version 5.0, the SWIID is distributed only pre-formatted for use with the tools for analyzing multiply-imputed data in Stata or R. This is meant to "set the default" in a way that encourages researchers to take into account the uncertainty in the SWIID estimates; this uncertainty is considerable in many developing countries. This decision does mean, however, that one will have to take the extra step of summarizing the multiple imputations when they aren’t needed, e.g., for graphing, or when doing analyses that the multiple-imputation tools can’t handle (though in such circumstances, one should limit one’s sample to those observations with relatively small standard errors; see [Solt 2009](../papers/Solt2009), 238).

In Stata:

    use SWIIDv5_0.dta, clear
    // Summarize the dataset
    keep country year _*
    
    foreach v in gini_net gini_market rel_red abs_red {
        egen `v' = rowmean(_*`v')
        egen `v'_se = rowsd(_*`v')
        gen `v'_95ub = `v' + 1.96*`v'_se
        gen `v'_95lb = `v' - 1.96*`v'_se
    }
    drop _*
    sort country year
    
    // A silly example
    gen name_length = length(country)
    gen first_letter = substr(country, 1, 1)
    keep if year==2010 & first_letter=="S" /*2010 for Senegal, Serbia, . . .*/
    
    // A scatterplot with 95% confidence intervals
    twoway rspike gini_net_95ub gini_net_95lb name_length, lstyle(ci) || ///
        scatter gini_net name_length, msize(small) legend(order(2 "SWIID Net-Income Inequality")) 

In R: 

    load("SWIIDv5_0.RData")
    library(dplyr)
    library(stringr)
    library(ggplot2)
    
    # Summarize the dataset
    swiid.summary <- swiid %>% do.call(rbind, .) %>% 
      group_by(country, year) %>% 
      summarize_each(funs(mean, sd)) %>% ungroup
    names(swiid.summary) <- str_replace(names(swiid.summary), "_mean", "")
    names(swiid.summary) <- str_replace(names(swiid.summary), "_sd", "_se")

    # A silly example
    swiid.summary.2010S <- swiid.summary %>% 
      mutate(name_length = str_length(country),
             first_letter = str_sub(country, 1, 1)) %>% 
      filter(year==2010 & first_letter=="S")

    # A scatter plot with 95% confidence intervals
    ggplot(swiid.summary.2010S) + 
      geom_pointrange(aes(x=name_length, y=gini_net, 
      ymin=gini_net - 2*gini_net_se, ymax = gini_net + 2*gini_net_se)) +
      theme_bw() + theme(legend.position="none")
      