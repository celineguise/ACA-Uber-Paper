use "trimmeddatasix.dta", clear

/*
drop pernum
drop first
replace yr = 0 if yr== 2000
drop launch
drop if yr == 2010
drop puma
drop density
drop ubertreated
*/

sample 10

gen interaction = treated_cbsa * agetreated

gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
replace firsttreated = 0 if missing(firsttreated)

csdid y treated_cbsa, time(year) gvar(firsttreated) method(dripw) ///
agg(event) saverif(aaaa) wboot replace rseed(1)

est clear

use aaaa, clear
eststo: csdid_stats event
esttab using "testtabletwo.tex", title(Test table) star(* .10 ** .05 *** .01)  se ar2

//show controls in table?


qui:csdid_stats event, wboot rseed(1)
csdid_plot

