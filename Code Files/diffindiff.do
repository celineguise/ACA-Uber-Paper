
use "trimmeddatatwo.dta", clear

use "trimmeddatathree.dta", clear

use "trimmeddataeight.dta", clear



//keep if ind == 6190
//keep if occ == 9140 | occ==9142
keep if age<= 30
keep if age>= 22
drop if uhrswork == 0
drop wkswork1


format launch %td

generate first = date("9/1/2010","MDY")

format first %td
//drop treated
generate treated = 0  

//drop yr
generate yr = year(launch)
replace treated = 1 if year >= yr & yr!= 2000
//reghdfe y treated [aw=perwt], a(county year) cl(county)




//drop y

gen x = (classwkrd==13) & (ind==6190) & ((occ== 9140) | (occ==9142))

gen county = (statefip * 1000) + countyfip
sort county
rename treated ubertreated
gen agetreated = 1
replace agetreated = 0 if age>=27


//reg y treated countyfe yearfe

//compress


//collapse y, by(year statefip countyfip treated perwt)


reghdfe uhrswork ubertreated i.occ[aw=perwt], a(county year) cl(county) pool(2)
reghdfe uhrswork treated_cbsa [aw=perwt], a(CBSACode year) cl(CBSACode) pool(2)




gen agetreated = 1
replace agetreated = 0 if age>=27


reghdfe uhrswork agetreated##treated_cbsa[aw=perwt], a(county year) cl(county) pool(1)
reghdfe y agetreated##ubertreated [aw=perwt], a(county year i.educ i.sex i.race) cl(county) pool(1)

//did2s y [aw=perwt], first_stage(county year i.educ i.sex i.race) second_stage(agetreated treated) treatment(treated) cluster(county)

//bacondecomp y treated, robust


drop pernum
drop first


replace yr = 0 if yr== 2000

sample 25

csdid uhrswork treated_cbsa, time(year) gvar(yr)fe vce(cluster CBSACode)


