---
layout: post
title:  "Using the SWIID Standard Errors"
date:   2010-06-20 12:05
categories: note swiid
---

Incorporating the standard errors in the SWIID estimates into one's analyses is the right thing to do, but it is not a trivial exercise.  I myself have left it out of some work where I felt the model was already maxed out on complexity (though in such cases, I advise at least excluding observations with particularly large errors).  The short story is that one generates a bunch of Monte Carlo simulations of the SWIID data from the estimates and standard errors, then analyses each simulation, then combines the results of the multiple analyses as one would in a multiple-imputation setup (this should be easier to do with Stata 11's new multiple-imputation tools, but I won't get my copy of Stata 11 until the fall--oh well).  The code below does the trick.

    egen se_all = rowmean(se1-se10)
    replace se_all = se_all + (((1+(1/10)) * ((1/9)*ss_all)))
    
    gen t_all = coef_all/se_all
    gen p_all = 2*normal(-abs(t_all))
    
    egen r_sq_all = rowmean(r_sq1-r_sq10)
    
    gen vars = " " in 1/`n_ivs'
    local i = 0
    foreach iv in `other_ivs' "Inequality" "Constant" {
    	local i = `i'+1
    	replace vars = "`iv'" in `i'
    }
    mkmat coef_all se_all p_all if coef_all~=., matrix(res_all) rownames(vars)
    matrix list res_all, format(%9.3f)
    quietly sum r_sq_all
    local r2 = round(`r(mean)', .001)
    di "R-sq = `r2'"
    di "N = `cases'"


Please feel free to drop me an email if you have any questions or comments.
