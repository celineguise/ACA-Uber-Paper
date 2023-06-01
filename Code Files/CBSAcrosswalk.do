use "trimmeddatathree.dta", clear

use "trimmeddataeight.dta", clear


joinby using cbsawalk
bysort CBSACode year: egen treated_cbsa = max(ubertreated)



/*
collapse y (max) ubertreated [aw=perwt], by(county year)
xtset county
gen x = year if county==1
bysort county: egen firsttreated = min(x)
drop x
replace firsttreated = 0 if missing(firsttreated)
gen agetreated = 1
replace agetreated = 0 if age>=27

gen interaction = ubertreated*agetreated
csdid y ubertreated, ivar(county) time(year) gvar(firsttreated) notyet method(dripw)
estat event
*/



/*
bysort CBSACode: gen N = _N
keep if N== 10
*/

//gen agetreated = 1
//replace agetreated = 0 if age>=27
//gen interaction = treated_cbsa*agetreated




collapse y (max) treated_cbsa [aw=perwt], by(CBSACode year)
xtset CBSACode
xtreg y treated_cbsa i.year
sort CBSACode year
//drop firsttreated

gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
replace firsttreated = 0 if missing(firsttreated)

csdid y treated_cbsa , ivar(CBSACode) time(year) gvar(firsttreated) method(dripw) ///
agg(event) saverif(samplewide) wboot replace rseed(1)

use samplewide, clear
csdid_stats event

qui:csdid_stats event, wboot rseed(1)
csdid_plot




//drop agetreated
//drop launch

keep if age >= 27

collapse y (max) treated_cbsa[aw=perwt], by(CBSACode year)
xtset CBSACode
xtreg y treated_cbsa i.year

gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
replace firsttreated = 0 if missing(firsttreated)


csdid y treated_cbsa, ivar(CBSACode) time(year) gvar(firsttreated) method(dripw) ///
agg(event) saverif(controlage2) wboot replace rseed(1)
use controlage2, clear
csdid_stats event

qui:csdid_stats event, wboot rseed(1)
csdid_plot




keep if age <= 25

collapse y (max) treated_cbsa[aw=perwt], by(CBSACode year)
xtset CBSACode
xtreg y treated_cbsa i.year

gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
replace firsttreated = 0 if missing(firsttreated)


csdid y treated_cbsa, ivar(CBSACode) time(year) gvar(firsttreated) method(dripw) ///
agg(event) saverif(treatmentage2) wboot replace rseed(1)
use treatmentage2, clear
csdid_stats event

qui:csdid_stats event, wboot rseed(1)
csdid_plot


//DiD_Imputation


//old equation which is wrong
//eststo: did_imputation y ig year ftinteract [aw=perwt], fe(/*ig*/ CBSACode#year /*agetreated#year*/ educ hcovany race sex) cluster(CBSACode) autosample


//eststo: did_imputation y ig year ftinteract [aw=perwt], fe(ig CBSACode#year agetreated#year) controls(inctot incwelfr uhrswork) cluster(CBSACode) autosample

//esttab using "ResultsWithNumericControls.tex", title (Results with controls) star(* .10 ** .05 *** .01)  se ar2 replace

use "trimmeddataseven.dta", clear
drop occ ind classwkr classwkrd sample launch county CBSATitle incwage hcovany incwelfr inctot uhrswork raced educd
drop if educ>6
egen ig = group(agetreated CBSACode)


gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
generate ftinteract = firsttreated  if ig >= 280

//https://twitter.com/borusyak/status/1398302650123366400?lang=en
//event_plot


eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year educ race sex) hor(0/4) pretrends(4) cluster(CBSACode) autosample
esttab using "DiDResultsEventStudy.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
event_plot, ciplottype(none) plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))
est clear


eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year educ race sex) cluster(CBSACode) autosample
esttab using "DiDResultsATE.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
est clear

reghdfe y i.treated_cbsa##i.agetreated i.agetreated i.race i.sex i.educ [aw=perwt], a(CBSACode#year) vce(cluster CBSACode)
esttab using "NonImputingResults.tex", title (Non Imputation Results) star(* .10 ** .05 *** .01) se ar2 replace
est clear

eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ sex) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race sex) cluster(CBSACode) autosample

esttab using "ImputationResultsATE.tex", title (Imputation Average Treatment Effect Results) star(* .10 ** .05 *** .01) se ar2 replace
est clear


eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year) hor(0/4) pretrends(4) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race) hor(0/4) pretrends(4) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ sex) hor(0/4) pretrends(4) cluster(CBSACode) autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year educ race sex) hor(0/4) pretrends(4) cluster(CBSACode) autosample

esttab using "ImputationResultsES.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace

event_plot, ciplottype(none) plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))

