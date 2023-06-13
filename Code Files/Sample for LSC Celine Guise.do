//All of the code together is over several files, this is the sample of the important stuff used in my phd research

use "trimmeddata.dta", clear

//Data linking example linking deployment regions to state and county fips codes:

//San Francisco
replace launch = date("10/1/2010","MDY") if (statefip == 6 & countyfip == 1) | ///
(statefip == 6 & countyfip == 13) | ///
(statefip == 6 & countyfip == 33) | ///
(statefip == 6 & countyfip == 41) | ///
(statefip == 6 & countyfip == 45) | ///
(statefip == 6 & countyfip == 53) | ///
(statefip == 6 & countyfip == 55) | ///
(statefip == 6 & countyfip == 69) | ///
(statefip == 6 & countyfip == 75) | ///
(statefip == 6 & countyfip == 81) | ///
(statefip == 6 & countyfip == 85) | ///
(statefip == 6 & countyfip == 87) | ///
(statefip == 6 & countyfip == 95) | ///
(statefip == 6 & countyfip == 97) 

//NYC
replace launch = date("5/1/2011","MDY") if (statefip == 36 & countyfip == 5) | ///
(statefip == 36 & countyfip == 47) | ///
(statefip == 36 & countyfip == 61) | ///
(statefip == 36 & countyfip == 85) | ///
(statefip == 36 & countyfip == 81) 

//Seattle
replace launch = date("8/1/2011","MDY") if (statefip == 53 & countyfip == 33) | ///
(statefip == 53 & countyfip == 61)

//Chicago
replace launch = date("9/1/2011","MDY") if (statefip == 17 & countyfip == 31) | ///
(statefip == 17 & countyfip == 37) | ///
(statefip == 17 & countyfip == 43) | ///
(statefip == 17 & countyfip == 63) | ///
(statefip == 17 & countyfip == 89) | ///
(statefip == 17 & countyfip == 91) | ///
(statefip == 17 & countyfip == 93) | ///
(statefip == 17 & countyfip == 99) | ///
(statefip == 17 & countyfip == 197)

//Boston
replace launch = date("10/1/2011","MDY") if (statefip == 25 & countyfip == 1) | ///
(statefip == 25 & countyfip == 5) | ///
(statefip == 25 & countyfip == 7) | ///
(statefip == 25 & countyfip == 9) | ///
(statefip == 25 & countyfip == 17) | ///
(statefip == 25 & countyfip == 19) | ///
(statefip == 25 & countyfip == 21) | ///
(statefip == 25 & countyfip == 23) | ///
(statefip == 25 & countyfip == 25)

//merge up to the core based statiscal area level:

joinby using cbsawalk
bysort CBSACode year: egen treated_cbsa = max(ubertreated)



gen y = (classwkrd==13) & (ind==6190) & ((occ== 9140) | (occ==9142))


gen aaa = year(launch)
drop if aaa== 2000
drop aaa


egen ig = group(agetreated CBSACode)
gen x = year if treated_cbsa==1
bysort CBSACode: egen firsttreated = min(x)
drop x

//ft interact means first treated interaction
generate ftinteract = firsttreated  if ig >= 280



//Regressions below

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


//Producing map

shp2dta using cb_2018_us_county_500k.shp, database(UberDBMap) coordinates(UberCord) genid(Counties) gencentroids(Center) replace

use "UberDBMap.dta", clear

destring STATEFP, generate(statefip)
destring COUNTYFP, generate(countyfip)

gen county = (statefip*1000)+countyfip
drop if statefip == 2
drop if statefip == 15
drop if statefip>56
drop statefip countyfip

use "UberMapMerged.dta",clear

spmap firsttreated using UberCord, id(Counties) fcolor(Heat)  /// 
clmethod(custom) clnumber(9) clbreaks(2010 2011 2012 2013 2014 2015 2016 2017 2018) title("Uber Deployment by Year") ///
legend(order(9 "2017" 8 "2016" 7 "2015" 6 "2014" 5 "2013" 4 "2012" 3 "2011" 2 "2010" 1 "Never Treated"))
