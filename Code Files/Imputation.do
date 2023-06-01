//DiD_Imputation

//old equation which is wrong
//eststo: did_imputation y ig year ftinteract [aw=perwt], fe(/*ig*/ CBSACode#year /*agetreated#year*/ educ hcovany race sex) cluster(CBSACode) autosample


//eststo: did_imputation y ig year ftinteract [aw=perwt], fe(ig CBSACode#year agetreated#year) controls(inctot incwelfr uhrswork) cluster(CBSACode) autosample

//esttab using "ResultsWithNumericControls.tex", title (Results with controls) star(* .10 ** .05 *** .01)  se ar2 replace

//use "trimmeddataseven.dta", clear
use "trimmeddataeight.dta", clear
drop occ ind classwkr classwkrd sample launch county CBSATitle incwage hcovany raced educd
drop bpld
drop inctot uhrswork


/*
drop y
gen y = (classwkrd==13) & (ind==6190) & ((occ== 9140) | (occ==9142))

//drop if age == 30
//egen ig = group(agetreated CBSACode)

gen aaa = year(launch)
drop if aaa== 2000
drop aaa
drop if sex == 2
drop if educ>8
keep if ((classwkrd== 13) | (classwkrd == 14))
*/

egen ig = group(agetreated CBSACode)
gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x
generate ftinteract = firsttreated  if ig >= 280


gen abc = e(pre_F)


eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year educ race sex metro /*marst bpl*/) hor(0/4) pretrends(4) /*controls(uhrswork inctot)*/ cluster(CBSACode) leaveout autosample
esttab using "DiDResultsEventStudyV2.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
event_plot, plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))
est clear


eststo: reghdfe y i.treated_cbsa /*c.uhrswork c.inctot*/[aw=perwt], a(CBSACode year educ race sex metro /*marst bpl*/) vce(cluster CBSACode) noconstant
esttab using "NonImputingResultsDiDV2.tex", title (Non Imputation Results) star(* .10 ** .05 *** .01) se ar2 replace
est clear


eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year educ race sex metro /*marst bpl*/) cluster(CBSACode)  /*controls(uhrswork inctot)*/  leaveout autosample
esttab using "DiDResultsATEV2.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
est clear


reghdfe y i.treated_cbsa##i.agetreated i.agetreated /*c.uhrswork c.inctot*/ [aw=perwt], a(CBSACode#year educ race sex /*marst bpl*/) vce(cluster CBSACode)
esttab using "NonImputingResultsV2.tex", title (Non Imputation Results) star(* .10 ** .05 *** .01) se ar2 replace
est clear


eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race metro) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ sex metro) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year race sex metro) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race sex) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race sex metro) cluster(CBSACode) leaveout autosample
esttab using "ImputationResultsATEV2.tex", title (Imputation Average Treatment Effect Results) star(* .10 ** .05 *** .01) se ar2 replace
est clear


//run event studies separately to f test for pretrends
eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year educ race sex metro /*marst bpl*/) hor(0/4) pretrends(4) /*controls(uhrswork inctot)*/ cluster(CBSACode) leaveout autosample



eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race metro) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ sex metro) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year race sex metro) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race sex) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year educ race sex metro) hor(0/4) pretrends(4) cluster(CBSACode) leaveout autosample

event_plot, plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))

esttab using "ImputationResultsESV2.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace

est clear

//Everything below is correct
eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year educ race sex metro marst bpl ) cluster(CBSACode)  controls(uhrswork inctot)  leaveout autosample
eststo: did_imputation y CBSACode year firsttreated [aw=perwt], fe(CBSACode year race sex metro marst bpl ) cluster(CBSACode)  controls(uhrswork inctot)  leaveout autosample
esttab using "DiDResultsATEV2More.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
est clear

eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year year educ race sex metro marst bpl ) cluster(CBSACode)  controls(uhrswork inctot)  leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe( CBSACode#year year race sex metro marst bpl ) cluster(CBSACode)  controls(uhrswork inctot)  leaveout autosample
esttab using "ImputationResultsATEV2More.tex", title (DiDResults) star(* .10 ** .05 *** .01) se ar2 replace
est clear

eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year educ race sex metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year race sex metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
esttab using "ImputationResultsESV2More.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace
event_plot, plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))

//All junk results below
eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year race metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
esttab using "ImputationResultsESV2MenNoEduc.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace
event_plot, plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))

eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year /*educ*/ race sex metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
esttab using "ImputationResultsESV2LessEducated.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace
event_plot, plottype(connected) ///
graph_opt(xtitle("Years since Uber deployment") ytitle("Coefficients") xlabel(-4 -3 -2 -1 0 1 2 3 4))

eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year educ race metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
eststo: did_imputation y ig year ftinteract [aw=perwt], fe(CBSACode#year race metro marst bpl) hor(0/4) pretrends(4) controls(uhrswork inctot) cluster(CBSACode) leaveout autosample
esttab using "ImputationResultsESV2LessEducatedMen.tex", title (Imputation Event Study Results) star(* .10 ** .05 *** .01) se ar2 replace
