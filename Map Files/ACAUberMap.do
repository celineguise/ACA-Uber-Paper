//use "trimmeddataseven.dta", clear
//drop occ ind classwkr classwkrd sample launch CBSATitle CBSACode incwage hcovany
//collapse y (max) treated_cbsa [aw=perwt], by(county firsttreated)
/*
shp2dta using cb_2018_us_county_500k.shp, database(UberDBMap) coordinates(UberCord) genid(Counties) gencentroids(Center) replace

use "UberDBMap.dta", clear

destring STATEFP, generate(statefip)
destring COUNTYFP, generate(countyfip)

gen county = (statefip*1000)+countyfip
drop if statefip == 2
drop if statefip == 15
drop if statefip>56
drop statefip countyfip
*/
use "UberMapMerged.dta",clear

spmap firsttreated using UberCord, id(Counties) fcolor(Heat)  /// 
clmethod(custom) clnumber(9) clbreaks(2010 2011 2012 2013 2014 2015 2016 2017 2018) title("Uber Deployment by Year") ///
legend(order(9 "2017" 8 "2016" 7 "2015" 6 "2014" 5 "2013" 4 "2012" 3 "2011" 2 "2010" 1 "Never Treated"))


