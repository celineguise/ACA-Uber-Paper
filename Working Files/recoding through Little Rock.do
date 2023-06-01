use "usa_00006.dta", clear

drop if age == 26
keep if age >=19 & age<= 33
drop if countyfip == 0

//keep if ind == 6190
//keep if occ == 9140 | occ==9142

//keep if classwkrd == 13



gen launch = date("1/1/2000","MDY")

//San Francisco
replace launch = date("10/1/2010","MDY") if (statefip == 6 & countyfip == 45) | ///
(statefip == 6 & countyfip == 33) | ///
(statefip == 6 & countyfip == 97) | ///
(statefip == 6 & countyfip == 55) | ///
(statefip == 6 & countyfip == 95) | ///
(statefip == 6 & countyfip == 41) | ///
(statefip == 6 & countyfip == 13) | ///
(statefip == 6 & countyfip == 75) | ///
(statefip == 6 & countyfip == 1) | ///
(statefip == 6 & countyfip == 81) | ///
(statefip == 6 & countyfip == 85) | ///
(statefip == 6 & countyfip == 87) | ///
(statefip == 6 & countyfip == 69) | ///
(statefip == 6 & countyfip == 53)

//NYC
replace launch = date("5/1/2011","MDY") if (statefip == 36 & countyfip == 5) | ///
(statefip == 36 & countyfip == 61) | ///
(statefip == 36 & countyfip == 85) | ///
(statefip == 36 & countyfip == 81) | ///
(statefip == 36 & countyfip == 47) 

//Seattle
replace launch = date("8/1/2011","MDY") if (statefip == 53 & countyfip == 61) | ///
(statefip == 53 & countyfip == 33)

//Chicago
replace launch = date("9/1/2011","MDY") if (statefip == 17 & countyfip == 37) | ///
(statefip == 17 & countyfip == 89) | ///
(statefip == 17 & countyfip == 43) | ///
(statefip == 17 & countyfip == 31) | ///
(statefip == 17 & countyfip == 99) | ///
(statefip == 17 & countyfip == 93) | ///
(statefip == 17 & countyfip == 63) | ///
(statefip == 17 & countyfip == 91) | ///
(statefip == 17 & countyfip == 197)

//Boston
replace launch = date("10/1/2011","MDY") if (statefip == 25 & countyfip == 9) | ///
(statefip == 25 & countyfip == 17) | ///
(statefip == 25 & countyfip == 21) | ///
(statefip == 25 & countyfip == 25) | ///
(statefip == 25 & countyfip == 5) | ///
(statefip == 25 & countyfip == 23) | ///
(statefip == 25 & countyfip == 1) | ///
(statefip == 25 & countyfip == 7) | ///
(statefip == 25 & countyfip == 19)

//Washington DC
replace launch = date("12/1/2011","MDY") if (statefip == 24 & countyfip == 31) | ///
(statefip == 51 & countyfip == 69) | ///
(statefip == 51 & countyfip == 43) | ///
(statefip == 51 & countyfip == 107) | ///
(statefip == 51 & countyfip == 59) | ///
(statefip == 51 & countyfip == 13) | ///
(statefip == 51 & countyfip == 171) | ///
(statefip == 51 & countyfip == 187) | ///
(statefip == 51 & countyfip == 139) | ///
(statefip == 51 & countyfip == 113) | ///
(statefip == 51 & countyfip == 157) | ///
(statefip == 51 & countyfip == 47) | ///
(statefip == 51 & countyfip == 179) | ///
(statefip == 51 & countyfip == 153) | ///
(statefip == 51 & countyfip == 61) | ///
(statefip == 51 & countyfip == 177) | ///
(statefip == 51 & countyfip == 33) | ///
(statefip == 51 & countyfip == 99) | ///
(statefip == 51 & countyfip == 193) | ///
(statefip == 51 & countyfip == 57) | ///
(statefip == 51 & countyfip == 159) | ///
(statefip == 51 & countyfip == 133) | ///
(statefip == 51 & countyfip == 103) | ///
(statefip == 51 & countyfip == 119) | ///
(statefip == 51 & countyfip == 155)

//Los Angles
replace launch = date("2/1/2012","MDY") if (statefip == 6 & countyfip == 37)

//Philadelphia
replace launch = date("5/1/2012","MDY") if (statefip == 42 & countyfip == 17) | ///
(statefip == 42 & countyfip == 91) | ///
(statefip == 42 & countyfip == 29) | ///
(statefip == 42 & countyfip == 101) | ///
(statefip == 42 & countyfip == 45)

//San Diego
replace launch = date("5/1/2012","MDY") if statefip == 6 & countyfip == 73 | ///
(statefip == 6 & countyfip == 25)

//Hamptons NY
replace launch = date("7/1/2012","MDY") if (statefip == 36 & countyfip == 103)

//Atlanta
replace launch = date("8/1/2012","MDY") if (statefip == 13 & countyfip == 115) | ///
(statefip == 13 & countyfip == 15) | ///
(statefip == 13 & countyfip == 57) | ///
(statefip == 13 & countyfip == 85) | ///
(statefip == 13 & countyfip == 117) | ///
(statefip == 13 & countyfip == 139) | ///
(statefip == 13 & countyfip == 233) | ///
(statefip == 13 & countyfip == 223) | ///
(statefip == 13 & countyfip == 67) | ///
(statefip == 13 & countyfip == 121) | ///
(statefip == 13 & countyfip == 135) | ///
(statefip == 13 & countyfip == 143) | ///
(statefip == 13 & countyfip == 45) | ///
(statefip == 13 & countyfip == 97) | ///
(statefip == 13 & countyfip == 89) | ///
(statefip == 13 & countyfip == 247) | ///
(statefip == 13 & countyfip == 297) | ///
(statefip == 13 & countyfip == 217) | ///
(statefip == 13 & countyfip == 149) | ///
(statefip == 13 & countyfip == 77) | ///
(statefip == 13 & countyfip == 113) | ///
(statefip == 13 & countyfip == 63) | ///
(statefip == 13 & countyfip == 255) | ///
(statefip == 13 & countyfip == 151) | ///
(statefip == 13 & countyfip == 35) | ///
(statefip == 13 & countyfip == 159)

//Dallas
replace launch = date("8/1/2012","MDY") if (statefip == 48 & countyfip == 121) | ///
(statefip == 48 & countyfip == 85) | ///
(statefip == 48 & countyfip == 439) | ///
(statefip == 48 & countyfip == 113) | ///
(statefip == 48 & countyfip == 397)

//Denver
replace launch = date("8/1/2012","MDY") if (statefip == 8 & countyfip == 13) | ///
(statefip == 8 & countyfip == 47) | ///
(statefip == 8 & countyfip == 59) | ///
(statefip == 8 & countyfip == 31) | ///
(statefip == 8 & countyfip == 35) | ///
(statefip == 8 & countyfip == 1) | ///
(statefip == 8 & countyfip == 5) | ///
(statefip == 8 & countyfip == 39) | ///
(statefip == 8 & countyfip == 73) | ///
(statefip == 8 & countyfip == 121) | ///
(statefip == 8 & countyfip == 63) | ///
(statefip == 8 & countyfip == 125)

//Mineapolis - ST. Paul
replace launch = date("10/1/2012","MDY") if (statefip == 27 & countyfip == 171) | ///
(statefip == 27 & countyfip == 19) | ///
(statefip == 27 & countyfip == 53) | ///
(statefip == 27 & countyfip == 139) | ///
(statefip == 27 & countyfip == 37) | ///
(statefip == 27 & countyfip == 123) | ///
(statefip == 27 & countyfip == 163) | ///
(statefip == 27 & countyfip == 3)

//Phoenix
replace launch = date("11/1/2012","MDY") if (statefip == 4 & countyfip == 13) | ///
(statefip == 4 & countyfip == 21) | ///
(statefip == 4 & countyfip == 7)

//Orange County CA
replace launch = date("12/1/2012","MDY") if (statefip == 6 & countyfip == 59)

//Baltimore-Maryland
replace launch = date("1/1/2013","MDY") if (statefip == 24 & countyfip != 31)

//Sacramento
replace launch = date("2/1/2013","MDY") if (statefip == 6 & countyfip == 15) | ///
(statefip == 6 & countyfip == 93) | ///
(statefip == 6 & countyfip == 49) | ///
(statefip == 6 & countyfip == 23) | ///
(statefip == 6 & countyfip == 105) | ///
(statefip == 6 & countyfip == 89) | ///
(statefip == 6 & countyfip == 35) | ///
(statefip == 6 & countyfip == 103) | ///
(statefip == 6 & countyfip == 63) | ///
(statefip == 6 & countyfip == 21) | ///
(statefip == 6 & countyfip == 7) | ///
(statefip == 6 & countyfip == 91) | ///
(statefip == 6 & countyfip == 115) | ///
(statefip == 6 & countyfip == 57) | ///
(statefip == 6 & countyfip == 11) | ///
(statefip == 6 & countyfip == 101) | ///
(statefip == 6 & countyfip == 61) | ///
(statefip == 6 & countyfip == 113) | ///
(statefip == 6 & countyfip == 67) | ///
(statefip == 6 & countyfip == 17) | ///
(statefip == 6 & countyfip == 5) | ///
(statefip == 6 & countyfip == 3) | ///
(statefip == 6 & countyfip == 77) | ///
(statefip == 6 & countyfip == 9) | ///
(statefip == 6 & countyfip == 109) | ///
(statefip == 6 & countyfip == 43) | ///
(statefip == 6 & countyfip == 51)

//Detroit
replace launch = date("3/1/2013","MDY") if (statefip == 26 & countyfip == 163)

//Napa
replace launch = date("5/1/2013","MDY") if (statefip == 6 & countyfip == 55)

//Indianapolis
replace launch = date("6/1/2013","MDY") if (statefip == 18 & countyfip == 117) | ///
(statefip == 18 & countyfip == 93) | ///
(statefip == 18 & countyfip == 71) | ///
(statefip == 18 & countyfip == 79) | ///
(statefip == 18 & countyfip == 137) | ///
(statefip == 18 & countyfip == 31) | ///
(statefip == 18 & countyfip == 5) | ///
(statefip == 18 & countyfip == 13) | ///
(statefip == 18 & countyfip == 5) | ///
(statefip == 18 & countyfip == 107) | ///
(statefip == 18 & countyfip == 109) | ///
(statefip == 18 & countyfip == 97) | ///
(statefip == 18 & countyfip == 103) | ///
(statefip == 18 & countyfip == 95) | ///
(statefip == 18 & countyfip == 81) | ///
(statefip == 18 & countyfip == 145) | ///
(statefip == 18 & countyfip == 139) | ///
(statefip == 18 & countyfip == 161) | ///
(statefip == 18 & countyfip == 41) | ///
(statefip == 18 & countyfip == 177) | ///
(statefip == 18 & countyfip == 65) | ///
(statefip == 18 & countyfip == 59) | ///
(statefip == 18 & countyfip == 57) | ///
(statefip == 18 & countyfip == 63) | ///
(statefip == 18 & countyfip == 67) | ///
(statefip == 18 & countyfip == 159) | ///
(statefip == 18 & countyfip == 169) | ///
(statefip == 18 & countyfip == 135) | ///
(statefip == 18 & countyfip == 75) | ///
(statefip == 18 & countyfip == 53) | ///
(statefip == 18 & countyfip == 9) | ///
(statefip == 18 & countyfip == 17) | ///
(statefip == 18 & countyfip == 15) | ///
(statefip == 18 & countyfip == 23) | ///
(statefip == 18 & countyfip == 11)

//Charlotte
replace launch = date("9/1/2013","MDY") if (statefip == 37 & countyfip == 25) | ///
(statefip == 37 & countyfip == 119)

//Rhode Island
replace launch = date("10/1/2013","MDY") if (statefip == 44)

//Santa Barbara
replace launch = date("10/1/2013","MDY") if (statefip == 6 & countyfip == 83)

//Tuscon
replace launch = date("10/1/2013","MDY") if (statefip == 4 & countyfip == 19) | ///
(statefip == 4 & countyfip == 23) | ///
(statefip == 4 & countyfip == 3)

//Oklahoma City
replace launch = date("11/1/2013","MDY") if (statefip == 40 & countyfip == 109)

//Columbus
replace launch = date("12/1/2013","MDY") if (statefip == 39 & countyfip == 49)

//Honolulu
replace launch = date("12/1/2013","MDY") if (statefip == 15 & countyfip == 3)

//Nashville
replace launch = date("12/1/2013","MDY") if (statefip == 47 & countyfip == 125) | ///
(statefip == 47 & countyfip == 187) | ///
(statefip == 47 & countyfip == 189) | ///
(statefip == 47 & countyfip == 159) | ///
(statefip == 47 & countyfip == 169) | ///
(statefip == 47 & countyfip == 165) | ///
(statefip == 47 & countyfip == 111) | ///
(statefip == 47 & countyfip == 21) | ///
(statefip == 47 & countyfip == 37)

//Jacksonville
replace launch = date("1/1/2014","MDY") if (statefip == 12 & countyfip == 3) | ///
(statefip == 12 & countyfip == 19) | ///
(statefip == 12 & countyfip == 31) | ///
(statefip == 12 & countyfip == 89) | ///
(statefip == 12 & countyfip == 107) | ///
(statefip == 12 & countyfip == 109)

//Park City, Utah
replace launch = date("1/1/2014","MDY") if (statefip == 49 & countyfip == 43)

//Fresno
replace launch = date("2/1/2014","MDY") if (statefip == 6 & countyfip == 19) | ///
(statefip == 6 & countyfip == 31) | ///
(statefip == 6 & countyfip == 27) | ///
(statefip == 6 & countyfip == 39) | ///
(statefip == 6 & countyfip == 107)

//Houston
replace launch = date("2/1/2014","MDY") if (statefip == 48 & countyfip == 157) | ///
(statefip == 48 & countyfip == 39) | ///
(statefip == 48 & countyfip == 89) | ///
(statefip == 48 & countyfip == 321) | ///
(statefip == 48 & countyfip == 481) | ///
(statefip == 48 & countyfip == 473) | ///
(statefip == 48 & countyfip == 471) | ///
(statefip == 48 & countyfip == 339) | ///
(statefip == 48 & countyfip == 291) | ///
(statefip == 48 & countyfip == 201) | ///
(statefip == 48 & countyfip == 185) | ///
(statefip == 48 & countyfip == 167) | ///
(statefip == 48 & countyfip == 71)

//Palm Springs
replace launch = date("2/1/2014","MDY") if (statefip == 6 & countyfip == 65)

//Pittsburgh
replace launch = date("2/1/2014","MDY") if (statefip == 42 & countyfip == 3) | ///
(statefip == 42 & countyfip == 5) | ///
(statefip == 42 & countyfip == 7) | ///
(statefip == 42 & countyfip == 19) | ///
(statefip == 42 & countyfip == 51) | ///
(statefip == 42 & countyfip == 59) | ///
(statefip == 42 & countyfip == 63) | ///
(statefip == 42 & countyfip == 73) | ///
(statefip == 42 & countyfip == 125) | ///
(statefip == 42 & countyfip == 129)

//Cincinnati (Includes some parts of northern Kentucky)
replace launch = date("3/1/2014","MDY") if (statefip == 39 & countyfip == 17) | ///
(statefip == 39 & countyfip == 25) | ///
(statefip == 39 & countyfip == 61) | ///
(statefip == 39 & countyfip == 165) | ///
(statefip == 21 & countyfip == 15) | ///
(statefip == 21 & countyfip == 23) | ///
(statefip == 21 & countyfip == 37) | ///
(statefip == 21 & countyfip == 41) | ///
(statefip == 21 & countyfip == 77) | ///
(statefip == 21 & countyfip == 81) | ///
(statefip == 21 & countyfip == 117) | ///
(statefip == 21 & countyfip == 187) | ///
(statefip == 21 & countyfip == 191)

//Madison
replace launch = date("3/1/2014","MDY") if (statefip == 55 & countyfip == 1) | ///
(statefip == 55 & countyfip == 21) | ///
(statefip == 55 & countyfip == 23) | ///
(statefip == 55 & countyfip == 25) | ///
(statefip == 55 & countyfip == 43) | ///
(statefip == 55 & countyfip == 45) | ///
(statefip == 55 & countyfip == 47) | ///
(statefip == 55 & countyfip == 49) | ///
(statefip == 55 & countyfip == 57) | ///
(statefip == 55 & countyfip == 65) | ///
(statefip == 55 & countyfip == 77) | ///
(statefip == 55 & countyfip == 103) | ///
(statefip == 55 & countyfip == 107) | ///
(statefip == 55 & countyfip == 110)

//Milwaukee
replace launch = date("3/1/2014","MDY") if (statefip == 55 & countyfip == 27) | ///
(statefip == 55 & countyfip == 55) | ///
(statefip == 55 & countyfip == 59) | ///
(statefip == 55 & countyfip == 79) | ///
(statefip == 55 & countyfip == 89) | ///
(statefip == 55 & countyfip == 101) | ///
(statefip == 55 & countyfip == 127) | ///
(statefip == 55 & countyfip == 131) | ///
(statefip == 55 & countyfip == 133)

//Ann Arbor
replace launch = date("4/1/2014","MDY") if (statefip == 26 & countyfip == 75) | ///
(statefip == 26 & countyfip == 161)

//Cleveland
replace launch = date("4/1/2014","MDY") if (statefip == 39 & countyfip == 35) | ///
(statefip == 39 & countyfip == 93) | ///
(statefip == 39 & countyfip == 103) | ///
(statefip == 39 & countyfip == 151) | ///
(statefip == 39 & countyfip == 153) 

//Inland Empire
replace launch = date("4/1/2014","MDY") if (statefip == 6 & countyfip == 71)

//Louisville
replace launch = date("4/1/2014","MDY") if (statefip == 21 & countyfip == 1) | ///
(statefip == 21 & countyfip == 9) | ///
(statefip == 21 & countyfip == 29) | ///
(statefip == 21 & countyfip == 53) | ///
(statefip == 21 & countyfip == 57) | ///
(statefip == 21 & countyfip == 87) | ///
(statefip == 21 & countyfip == 93) | ///
(statefip == 21 & countyfip == 99) | ///
(statefip == 21 & countyfip == 111) | ///
(statefip == 21 & countyfip == 125) | ///
(statefip == 21 & countyfip == 155) | ///
(statefip == 21 & countyfip == 163) | ///
(statefip == 21 & countyfip == 169) | ///
(statefip == 21 & countyfip == 171) | ///
(statefip == 21 & countyfip == 179) | ///
(statefip == 21 & countyfip == 207) | ///
(statefip == 21 & countyfip == 211) | ///
(statefip == 21 & countyfip == 217) | ///
(statefip == 21 & countyfip == 215) | ///
(statefip == 21 & countyfip == 229) | ///
(statefip == 21 & countyfip == 231) | ///
(statefip == 18 & countyfip == 19) | ///
(statefip == 18 & countyfip == 19) | ///
(statefip == 18 & countyfip == 43) | ///
(statefip == 18 & countyfip == 61) | ///
(statefip == 18 & countyfip == 77) | ///
(statefip == 18 & countyfip == 143) | ///
(statefip == 18 & countyfip == 175)

//Raleigh-Durham
replace launch = date("4/1/2014","MDY") if (statefip == 37 & countyfip == 63) | ///
(statefip == 37 & countyfip == 183)

//New Jersey
replace launch = date("4/1/2014","MDY") if (statefip == 34)

//San Antonio
replace launch = date("4/1/2014","MDY") if (statefip == 48 & countyfip == 29) | ///
(statefip == 48 & countyfip == 91) | ///
(statefip == 48 & countyfip == 187) | ///
(statefip == 48 & countyfip == 259)

//Tacoma
replace launch = date("4/1/2014","MDY") if (statefip == 53 & countyfip == 53)

//Tampa Bay
replace launch = date("4/1/2014","MDY") if (statefip == 12 & countyfip == 57) | ///
(statefip == 12 & countyfip == 103)

//Tulsa
replace launch = date("4/1/2014","MDY") if (statefip == 40 & countyfip == 1) | ///
(statefip == 40 & countyfip == 5) | ///
(statefip == 40 & countyfip == 21) | ///
(statefip == 40 & countyfip == 23) | ///
(statefip == 40 & countyfip == 35) | ///
(statefip == 40 & countyfip == 37) | ///
(statefip == 40 & countyfip == 41) | ///
(statefip == 40 & countyfip == 61) | ///
(statefip == 40 & countyfip == 71) | ///
(statefip == 40 & countyfip == 77) | ///
(statefip == 40 & countyfip == 79) | ///
(statefip == 40 & countyfip == 89) | ///
(statefip == 40 & countyfip == 91) | ///
(statefip == 40 & countyfip == 97) | ///
(statefip == 40 & countyfip == 101) | ///
(statefip == 40 & countyfip == 103) | ///
(statefip == 40 & countyfip == 105) | ///
(statefip == 40 & countyfip == 111) | ///
(statefip == 40 & countyfip == 113) | ///
(statefip == 40 & countyfip == 115) | ///
(statefip == 40 & countyfip == 117) | ///
(statefip == 40 & countyfip == 121) | ///
(statefip == 40 & countyfip == 127) | ///
(statefip == 40 & countyfip == 131) | ///
(statefip == 40 & countyfip == 135) | ///
(statefip == 40 & countyfip == 143) | ///
(statefip == 40 & countyfip == 145) | ///
(statefip == 40 & countyfip == 147)

//Alburquerque
replace launch = date("5/1/2014","MDY") if (statefip == 35 & countyfip == 1)

//Connecticut
replace launch = date("5/1/2014","MDY") if (statefip == 9)

//Eastern Shore (INCLUDES SUSSEX COUNTY DE)
replace launch = date("5/1/2014","MDY") if (statefip == 24 & countyfip == 9) | ///
(statefip == 24 & countyfip == 13) | ///
(statefip == 24 & countyfip == 17) | ///
(statefip == 24 & countyfip == 27) | ///
(statefip == 24 & countyfip == 33) | ///
(statefip == 24 & countyfip == 35) | ///
(statefip == 24 & countyfip == 39) | ///
(statefip == 24 & countyfip == 43) | ///
(statefip == 24 & countyfip == 45) | ///
(statefip == 10 & countyfip == 5)

//Hampton Roads
replace launch = date("5/1/2014","MDY") if (statefip == 51 & countyfip == 1) | ///
(statefip == 51 & countyfip == 73) | ///
(statefip == 51 & countyfip == 93) | ///
(statefip == 51 & countyfip == 95) | ///
(statefip == 51 & countyfip == 115) | ///
(statefip == 51 & countyfip == 131) | ///
(statefip == 51 & countyfip == 175) | ///
(statefip == 51 & countyfip == 181) | ///
(statefip == 51 & countyfip == 199) | ///
(statefip == 51 & countyfip == 6500) | ///
(statefip == 51 & countyfip == 7000) | ///
(statefip == 51 & countyfip == 7100) | ///
(statefip == 51 & countyfip == 7400) | ///
(statefip == 51 & countyfip == 8000) | ///
(statefip == 51 & countyfip == 8300)

//Kansas City
replace launch = date("5/1/2014","MDY") if (statefip == 20 & countyfip == 91) | ///
(statefip == 20 & countyfip == 103) | ///
(statefip == 20 & countyfip == 209) | ///
(statefip == 29 & countyfip == 3) | ///
(statefip == 29 & countyfip == 13) | ///
(statefip == 29 & countyfip == 21) | ///
(statefip == 29 & countyfip == 25) | ///
(statefip == 29 & countyfip == 37) | ///
(statefip == 29 & countyfip == 47) | ///
(statefip == 29 & countyfip == 49) | ///
(statefip == 29 & countyfip == 63) | ///
(statefip == 29 & countyfip == 95) | ///
(statefip == 29 & countyfip == 101) | ///
(statefip == 29 & countyfip == 107) | ///
(statefip == 29 & countyfip == 165) | ///
(statefip == 29 & countyfip == 177)

//Memphis
replace launch = date("5/1/2014","MDY") if (statefip == 47 & countyfip == 47) | ///
(statefip == 47 & countyfip == 69) | ///
(statefip == 47 & countyfip == 75) | ///
(statefip == 47 & countyfip == 157) | ///
(statefip == 47 & countyfip == 167) | ///
(statefip == 28 & countyfip == 33) | ///
(statefip == 5 & countyfip == 35) | ///
(statefip == 5 & countyfip == 37) | ///
(statefip == 5 & countyfip == 77) | ///
(statefip == 5 & countyfip == 123)


//Modesto
replace launch = date("5/1/2014","MDY") if (statefip == 6 & countyfip == 47) | ///
(statefip == 6 & countyfip == 99)

//Salt Lake City
replace launch = date("5/1/2014","MDY") if (statefip == 49 & countyfip == 35) 

//Austin
replace launch = date("6/1/2014","MDY") if (statefip == 48 & countyfip == 21) | ///
(statefip == 48 & countyfip == 31) | ///
(statefip == 48 & countyfip == 53) | ///
(statefip == 48 & countyfip == 171) | ///
(statefip == 48 & countyfip == 209) | ///
(statefip == 48 & countyfip == 453) | ///
(statefip == 48 & countyfip == 491) 

//Bakersfield
replace launch = date("6/1/2014","MDY") if (statefip == 6 & countyfip == 29)

//Colorado Springs
replace launch = date("6/1/2014","MDY") if (statefip == 8 & countyfip == 9) | ///
(statefip == 8 & countyfip == 11) | ///
(statefip == 8 & countyfip == 17) | ///
(statefip == 8 & countyfip == 25) | ///
(statefip == 8 & countyfip == 41) | ///
(statefip == 8 & countyfip == 55) | ///
(statefip == 8 & countyfip == 61) | ///
(statefip == 8 & countyfip == 71) | ///
(statefip == 8 & countyfip == 89) | ///
(statefip == 8 & countyfip == 99) | ///
(statefip == 8 & countyfip == 101) | ///
(statefip == 8 & countyfip == 119)

//Miami
replace launch = date("6/1/2014","MDY") if (statefip == 12 & countyfip == 11) | ///
(statefip == 12 & countyfip == 25) | ///
(statefip == 12 & countyfip == 85) | ///
(statefip == 12 & countyfip == 99)

//Omaha
replace launch = date("6/1/2014","MDY") if (statefip == 31 & countyfip == 55) | ///
(statefip == 31 & countyfip == 153) | ///
(statefip == 31 & countyfip == 155)

//Orlando
replace launch = date("6/1/2014","MDY") if (statefip == 12 & countyfip == 69) | ///
(statefip == 12 & countyfip == 95) | ///
(statefip == 12 & countyfip == 97) | ///
(statefip == 12 & countyfip == 105) | ///
(statefip == 12 & countyfip == 117)

//Spokane
replace launch = date("6/1/2014","MDY") if (statefip == 53 & countyfip == 63)

//Baton Rouge
replace launch = date("7/1/2014","MDY") if (statefip == 22 & countyfip == 33) | ///
(statefip == 22 & countyfip == 63) | ///
(statefip == 22 & countyfip == 91) | ///
(statefip == 22 & countyfip == 105) | ///
(statefip == 22 & countyfip == 121)

//Charleston
replace launch = date("7/1/2014","MDY") if (statefip == 45 & countyfip == 9) | ///
(statefip == 45 & countyfip == 15) | ///
(statefip == 45 & countyfip == 19) | ///
(statefip == 45 & countyfip == 29) | ///
(statefip == 45 & countyfip == 35) | ///

//Columbia SC
replace launch = date("7/1/2014","MDY") if (statefip == 45 & countyfip == 79)

//El Paso 
replace launch = date("7/1/2014","MDY") if (statefip == 48 & countyfip == 141) | ///
(statefip == 48 & countyfip == 229)

//Greenville SC
replace launch = date("7/1/2014","MDY") if (statefip == 45 & countyfip == 7) | ///
(statefip == 45 & countyfip == 45) | ///
(statefip == 45 & countyfip == 59) | ///
(statefip == 45 & countyfip == 73) | ///
(statefip == 45 & countyfip == 77) | ///
(statefip == 45 & countyfip == 83)

//Lexington
replace launch = date("7/1/2014","MDY") if (statefip == 21 & countyfip == 5) | ///
(statefip == 21 & countyfip == 11) | ///
(statefip == 21 & countyfip == 13) | ///
(statefip == 21 & countyfip == 17) | ///
(statefip == 21 & countyfip == 19) | ///
(statefip == 21 & countyfip == 21) | ///
(statefip == 21 & countyfip == 25) | ///
(statefip == 21 & countyfip == 43) | ///
(statefip == 21 & countyfip == 45) | ///
(statefip == 21 & countyfip == 49) | ///
(statefip == 21 & countyfip == 51) | ///
(statefip == 21 & countyfip == 63) | ///
(statefip == 21 & countyfip == 65) | ///
(statefip == 21 & countyfip == 67) | ///
(statefip == 21 & countyfip == 69) | ///
(statefip == 21 & countyfip == 71) | ///
(statefip == 21 & countyfip == 73) | ///
(statefip == 21 & countyfip == 79) | ///
(statefip == 21 & countyfip == 89) | ///
(statefip == 21 & countyfip == 95) | ///
(statefip == 21 & countyfip == 97) | ///
(statefip == 21 & countyfip == 109) | ///
(statefip == 21 & countyfip == 113) | ///
(statefip == 21 & countyfip == 115) | ///
(statefip == 21 & countyfip == 119) | ///
(statefip == 21 & countyfip == 121) | ///
(statefip == 21 & countyfip == 125) | ///
(statefip == 21 & countyfip == 127) | ///
(statefip == 21 & countyfip == 129) | ///
(statefip == 21 & countyfip == 131) | ///
(statefip == 21 & countyfip == 133) | ///
(statefip == 21 & countyfip == 135) | ///
(statefip == 21 & countyfip == 137) | ///
(statefip == 21 & countyfip == 147) | ///
(statefip == 21 & countyfip == 151) | ///
(statefip == 21 & countyfip == 153) | ///
(statefip == 21 & countyfip == 159) | ///
(statefip == 21 & countyfip == 161) | ///
(statefip == 21 & countyfip == 167) | ///
(statefip == 21 & countyfip == 165) | ///
(statefip == 21 & countyfip == 173) | ///
(statefip == 21 & countyfip == 175) | ///
(statefip == 21 & countyfip == 181) | ///
(statefip == 21 & countyfip == 189) | ///
(statefip == 21 & countyfip == 193) | ///
(statefip == 21 & countyfip == 195) | ///
(statefip == 21 & countyfip == 197) | ///
(statefip == 21 & countyfip == 199) | ///
(statefip == 21 & countyfip == 201) | ///
(statefip == 21 & countyfip == 203) | ///
(statefip == 21 & countyfip == 205) | ///
(statefip == 21 & countyfip == 209) | ///
(statefip == 21 & countyfip == 235) | ///
(statefip == 21 & countyfip == 237) | ///
(statefip == 21 & countyfip == 239) 

//Lubbock
replace launch = date("7/1/2014","MDY") if (statefip == 48 & countyfip == 17) | ///
(statefip == 48 & countyfip == 33) | ///
(statefip == 48 & countyfip == 79) | ///
(statefip == 48 & countyfip == 101) | ///
(statefip == 48 & countyfip == 107) | ///
(statefip == 48 & countyfip == 115) | ///
(statefip == 48 & countyfip == 125) | ///
(statefip == 48 & countyfip == 153) | ///
(statefip == 48 & countyfip == 155) | ///
(statefip == 48 & countyfip == 165) | ///
(statefip == 48 & countyfip == 169) | ///
(statefip == 48 & countyfip == 189) | ///
(statefip == 48 & countyfip == 207) | ///
(statefip == 48 & countyfip == 219) | ///
(statefip == 48 & countyfip == 263) | ///
(statefip == 48 & countyfip == 269) | ///
(statefip == 48 & countyfip == 275) | ///
(statefip == 48 & countyfip == 279) | ///
(statefip == 48 & countyfip == 303) | ///
(statefip == 48 & countyfip == 305) | ///
(statefip == 48 & countyfip == 345) | ///
(statefip == 48 & countyfip == 415) | ///
(statefip == 48 & countyfip == 433) | ///
(statefip == 48 & countyfip == 445) | ///
(statefip == 48 & countyfip == 501)

//Piedmont Triad
replace launch = date("7/1/2014","MDY") if (statefip == 47 & countyfip == 1) | ///
(statefip == 47 & countyfip == 57) | ///
(statefip == 47 & countyfip == 59) | ///
(statefip == 47 & countyfip == 67) | ///
(statefip == 47 & countyfip == 81) | ///
(statefip == 47 & countyfip == 151) | ///
(statefip == 47 & countyfip == 197)

//San Luis Obispo
replace launch = date("7/1/2014","MDY") if (statefip == 6 & countyfip == 79)

//Ventura
replace launch = date("7/1/2014","MDY") if (statefip == 6 & countyfip == 110)

//Wilmington NC
replace launch = date("7/1/2014","MDY") if (statefip == 37 & countyfip == 19) | ///
(statefip == 37 & countyfip == 47) | ///
(statefip == 37 & countyfip == 129) | ///
(statefip == 37 & countyfip == 141)

//Asheville NC
replace launch = date("8/1/2014","MDY") if (statefip == 37 & countyfip == 21) | ///
(statefip == 37 & countyfip == 39) | ///
(statefip == 37 & countyfip == 43) | ///
(statefip == 37 & countyfip == 75) | ///
(statefip == 37 & countyfip == 87) | ///
(statefip == 37 & countyfip == 89) | ///
(statefip == 37 & countyfip == 99) | ///
(statefip == 37 & countyfip == 111) | ///
(statefip == 37 & countyfip == 113) | ///
(statefip == 37 & countyfip == 115) | ///
(statefip == 37 & countyfip == 121) | ///
(statefip == 37 & countyfip == 149) | ///
(statefip == 37 & countyfip == 161) | ///
(statefip == 37 & countyfip == 173) | ///
(statefip == 37 & countyfip == 175)

//Gainesville
replace launch = date("8/1/2014","MDY") if (statefip == 12 & countyfip == 1) | ///
(statefip == 12 & countyfip == 7) | ///
(statefip == 12 & countyfip == 23) | ///
(statefip == 12 & countyfip == 29) | ///
(statefip == 12 & countyfip == 41) | ///
(statefip == 12 & countyfip == 47) | ///
(statefip == 12 & countyfip == 67) | ///
(statefip == 12 & countyfip == 75) | ///
(statefip == 12 & countyfip == 121) | ///
(statefip == 12 & countyfip == 125) 

// Grand Rapids
replace launch = date("8/1/2014","MDY") if (statefip == 26 & countyfip == 81) | ///
(statefip == 26 & countyfip == 121) | ///
(statefip == 26 & countyfip == 139)

//Knoxville
replace launch = date("8/1/2014","MDY") if (statefip == 47 & countyfip == 1) | ///
(statefip == 47 & countyfip == 93)

//Lansing
replace launch = date("8/1/2014","MDY") if (statefip == 26 & countyfip == 37) | ///
(statefip == 26 & countyfip == 45) | ///
(statefip == 26 & countyfip == 65)

//Myrtle Beach
replace launch = date("8/1/2014","MDY") if (statefip == 45 & countyfip == 43)

//Richmond
replace launch = date("8/1/2014","MDY") if (statefip == 51 & countyfip == 7) | ///
(statefip == 51 & countyfip == 25) | ///
(statefip == 51 & countyfip == 36) | ///
(statefip == 51 & countyfip == 41) | ///
(statefip == 51 & countyfip == 49) | ///
(statefip == 51 & countyfip == 53) | ///
(statefip == 51 & countyfip == 75) | ///
(statefip == 51 & countyfip == 81) | ///
(statefip == 51 & countyfip == 85) | ///
(statefip == 51 & countyfip == 87) | ///
(statefip == 51 & countyfip == 97) | ///
(statefip == 51 & countyfip == 101) | ///
(statefip == 51 & countyfip == 109) | ///
(statefip == 51 & countyfip == 111) | ///
(statefip == 51 & countyfip == 117) | ///
(statefip == 51 & countyfip == 127) | ///
(statefip == 51 & countyfip == 135) | ///
(statefip == 51 & countyfip == 145) | ///
(statefip == 51 & countyfip == 147) | ///
(statefip == 51 & countyfip == 149) | ///
(statefip == 51 & countyfip == 183) | ///
(statefip == 51 & countyfip == 7300) | ///
(statefip == 51 & countyfip == 7600)

//Vancouver WA
replace launch = date("8/1/2014","MDY") if (statefip == 53 & countyfip == 11)

//Worcester
replace launch = date("8/1/2014","MDY") if (statefip == 25 & countyfip == 27)

//Athens
replace launch = date("9/1/2014","MDY") if (statefip == 13 & countyfip == 59)

//Charlottesville-Harrisonburg
replace launch = date("9/1/2014","MDY") if (statefip == 51 & countyfip == 3) | ///
(statefip == 51 & countyfip == 5) | ///
(statefip == 51 & countyfip == 15) | ///
(statefip == 51 & countyfip == 17) | ///
(statefip == 51 & countyfip == 65) | ///
(statefip == 51 & countyfip == 79) | ///
(statefip == 51 & countyfip == 91) | ///
(statefip == 51 & countyfip == 113) | ///
(statefip == 51 & countyfip == 125) | ///
(statefip == 51 & countyfip == 137) | ///
(statefip == 51 & countyfip == 163) | ///
(statefip == 51 & countyfip == 165)

//Louisiana
replace launch = date("9/1/2014","MDY") if (statefip == 22 & countyfip == 51) | ///
(statefip == 22 & countyfip == 71) | ///
(statefip == 22 & countyfip == 103)

//Tallahassee
replace launch = date("9/1/2014","MDY") if (statefip == 12 & countyfip == 37) | ///
(statefip == 12 & countyfip == 39) | ///
(statefip == 12 & countyfip == 65) | ///
(statefip == 12 & countyfip == 73) | ///
(statefip == 12 & countyfip == 77) | ///
(statefip == 12 & countyfip == 79) | ///
(statefip == 12 & countyfip == 123) | ///
(statefip == 12 & countyfip == 129)

//Wichita
replace launch = date("9/1/2014","MDY") if (statefip == 20 & countyfip == 7) | ///
(statefip == 20 & countyfip == 15) | ///
(statefip == 20 & countyfip == 17) | ///
(statefip == 20 & countyfip == 19) | ///
(statefip == 20 & countyfip == 35) | ///
(statefip == 20 & countyfip == 49) | ///
(statefip == 20 & countyfip == 73) | ///
(statefip == 20 & countyfip == 77) | ///
(statefip == 20 & countyfip == 79) | ///
(statefip == 20 & countyfip == 95) | ///
(statefip == 20 & countyfip == 113) | ///
(statefip == 20 & countyfip == 115) | ///
(statefip == 20 & countyfip == 125) | ///
(statefip == 20 & countyfip == 151) | ///
(statefip == 20 & countyfip == 155) | ///
(statefip == 20 & countyfip == 159) | ///
(statefip == 20 & countyfip == 173) | ///
(statefip == 20 & countyfip == 185) | ///
(statefip == 20 & countyfip == 191) | ///
(statefip == 20 & countyfip == 205) | ///
(statefip == 20 & countyfip == 207)

//College Station
replace launch = date("10/1/2014","MDY") if (statefip == 48 & countyfip == 41) | ///
(statefip == 48 & countyfip == 51) | ///
(statefip == 48 & countyfip == 287) | ///
(statefip == 48 & countyfip == 289) | ///
(statefip == 48 & countyfip == 313) | ///
(statefip == 48 & countyfip == 331) | ///
(statefip == 48 & countyfip == 395) | ///
(statefip == 48 & countyfip == 477)

//Dayton
replace launch = date("10/1/2014","MDY") if (statefip == 39 & countyfip == 11) | ///
(statefip == 39 & countyfip == 21) | ///
(statefip == 39 & countyfip == 23) | ///
(statefip == 39 & countyfip == 37) | ///
(statefip == 39 & countyfip == 57) | ///
(statefip == 39 & countyfip == 91) | ///
(statefip == 39 & countyfip == 107) | ///
(statefip == 39 & countyfip == 109) | ///
(statefip == 39 & countyfip == 113) | ///
(statefip == 39 & countyfip == 135) | ///
(statefip == 39 & countyfip == 149)

//Des Moines
replace launch = date("10/1/2014","MDY") if (statefip == 19 & countyfip == 57)

//Fayetteville AR
replace launch = date("10/1/2014","MDY") if (statefip == 5 & countyfip == 7) | ///
(statefip == 5 & countyfip == 33) | ///
(statefip == 5 & countyfip == 131) | ///
(statefip == 5 & countyfip == 143)

//Fayetteville NC
replace launch = date("10/1/2014","MDY") if (statefip == 37 & countyfip == 17) | ///
(statefip == 37 & countyfip == 51) | ///
(statefip == 37 & countyfip == 85) | ///
(statefip == 37 & countyfip == 93) | ///
(statefip == 37 & countyfip == 155) | ///
(statefip == 37 & countyfip == 163) | ///
(statefip == 37 & countyfip == 165)

//Kalamazoo
replace launch = date("10/1/2014","MDY") if (statefip == 26 & countyfip == 21) | ///
(statefip == 26 & countyfip == 77) | ///
(statefip == 26 & countyfip == 159)

//New Hampshire
replace launch = date("10/1/2014","MDY") if (statefip == 33)

//Portland ME
replace launch = date("10/1/2014","MDY") if (statefip == 23 & countyfip == 1) | ///
(statefip == 23 & countyfip == 5) | ///
(statefip == 23 & countyfip == 17) | ///
(statefip == 23 & countyfip == 23) | ///
(statefip == 23 & countyfip == 31)

//Roanoke
replace launch = date("10/1/2014","MDY") if (statefip == 51 & countyfip == 9) | ///
(statefip == 51 & countyfip == 11) | ///
(statefip == 51 & countyfip == 19) | ///
(statefip == 51 & countyfip == 21) | ///
(statefip == 51 & countyfip == 23) | ///
(statefip == 51 & countyfip == 27) | ///
(statefip == 51 & countyfip == 31) | ///
(statefip == 51 & countyfip == 35) | ///
(statefip == 51 & countyfip == 45) | ///
(statefip == 51 & countyfip == 51) | ///
(statefip == 51 & countyfip == 63) | ///
(statefip == 51 & countyfip == 67) | ///
(statefip == 51 & countyfip == 71) | ///
(statefip == 51 & countyfip == 77) | ///
(statefip == 51 & countyfip == 83) | ///
(statefip == 51 & countyfip == 89) | ///
(statefip == 51 & countyfip == 105) | ///
(statefip == 51 & countyfip == 121) | ///
(statefip == 51 & countyfip == 141) | ///
(statefip == 51 & countyfip == 143) | ///
(statefip == 51 & countyfip == 155) | ///
(statefip == 51 & countyfip == 161) | ///
(statefip == 51 & countyfip == 167) | ///
(statefip == 51 & countyfip == 169) | ///
(statefip == 51 & countyfip == 173) | ///
(statefip == 51 & countyfip == 185) | ///
(statefip == 51 & countyfip == 191) | ///
(statefip == 51 & countyfip == 195) | ///
(statefip == 51 & countyfip == 197) | ///
(statefip == 51 & countyfip == 5200) | ///
(statefip == 51 & countyfip == 5900) | ///
(statefip == 51 & countyfip == 6800) | ///
(statefip == 51 & countyfip == 6900) | ///
(statefip == 51 & countyfip == 7500) | ///
(statefip == 51 & countyfip == 7700) 

//South Bend
replace launch = date("10/1/2014","MDY") if (statefip == 18 & countyfip == 39) | ///
(statefip == 18 & countyfip == 49) | ///
(statefip == 18 & countyfip == 85) | ///
(statefip == 18 & countyfip == 87) | ///
(statefip == 18 & countyfip == 99) | ///
(statefip == 18 & countyfip == 141) | ///
(statefip == 18 & countyfip == 151)

///Waco
replace launch = date("10/1/2014","MDY") if (statefip == 48 & countyfip == 1) | ///
(statefip == 48 & countyfip == 35) | ///
(statefip == 48 & countyfip == 145) | ///
(statefip == 48 & countyfip == 161) | ///
(statefip == 48 & countyfip == 191) | ///
(statefip == 48 & countyfip == 293) | ///
(statefip == 48 & countyfip == 309) | ///
(statefip == 48 & countyfip == 349) 

//Akron
replace launch = date("11/1/2014","MDY") if (statefip == 39 & countyfip == 153)

//Chattanooga
replace launch = date("11/1/2014","MDY") if (statefip == 47 & countyfip == 7) | ///
(statefip == 47 & countyfip == 11) | ///
(statefip == 47 & countyfip == 61) | ///
(statefip == 47 & countyfip == 65) | ///
(statefip == 47 & countyfip == 107) | ///
(statefip == 47 & countyfip == 115) | ///
(statefip == 47 & countyfip == 121) | ///
(statefip == 47 & countyfip == 139) | ///
(statefip == 47 & countyfip == 143) | ///
(statefip == 47 & countyfip == 153) | ///
(statefip == 47 & countyfip == 175) | ///
(statefip == 47 & countyfip == 177)

//Little Rock
replace launch = date("11/1/2014","MDY") if (statefip == 5 & countyfip == 1) | ///
(statefip == 5 & countyfip == 23) | ///
(statefip == 5 & countyfip == 29) | ///
(statefip == 5 & countyfip == 45) | ///
(statefip == 5 & countyfip == 51) | ///
(statefip == 5 & countyfip == 53) | ///
(statefip == 5 & countyfip == 59) | ///
(statefip == 5 & countyfip == 69) | ///
(statefip == 5 & countyfip == 85) | ///
(statefip == 5 & countyfip == 95) | ///
(statefip == 5 & countyfip == 97) | ///
(statefip == 5 & countyfip == 105) | ///
(statefip == 5 & countyfip == 107) | ///
(statefip == 5 & countyfip == 115) | ///
(statefip == 5 & countyfip == 117) | ///
(statefip == 5 & countyfip == 119) | ///
(statefip == 5 & countyfip == 141) | ///
(statefip == 5 & countyfip == 145) | ///
(statefip == 5 & countyfip == 147) | ///
(statefip == 5 & countyfip == 149)






























































//drop if launch == 14610
