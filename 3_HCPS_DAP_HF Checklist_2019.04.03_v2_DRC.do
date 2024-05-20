**** HCPS - HF CHECKLIST: DRC ****

**** INDICATORS: HF CHECKLIST ****

* Open dataset (enter your own filepath)
use "Yams:58 CARAMAL\8. Results\8.2. Raw data\DRC\HCPS\HCP Facility Checklist_v5_ DRC.dta", clear

/* The following indicators need to be stratified by HF level(primary, secondary, tertiary).
	Please use the code below to select the category that is analyzed. */

tab zq5a, nolab
tab zq5a
global hfcat1 = 			// HF category
keep if zq5a == $hfcat1 	// drop HF categories

label define yesno 0 "No" 1 "Yes", replace

*------------------------------------------------------------------------------*
/* Description of sampling strategy
In the three Health Zones (Ipamu, Kenge and Kingandu), all 18 Referral Health 
Facilities (Hospitals and Referral Health Centers) were automatically sampled 
(because of their small number). In addition, 32 Primary Health Facilities 
(Health Posts) as well as 28 secondary health facilities (Health Centers) from 
the public sector amd 8 secondary health facilities from the private sector 
were randomly sampled (proportional to size of each Health Zone). For secondary 
HFs, private and public facilties were stratfied before the sampling method was 
applied. Within each health facility the HF Checklist was completed with 
available staff. */

** weights
gen pw = .
replace pw = 1 if zhf == 11
replace pw = 1 if zhf == 12
replace pw = 1 if zhf == 13
replace pw = 1 if zhf == 14
replace pw = 1 if zhf == 15
replace pw = 1 if zhf == 16
replace pw = 1 if zhf == 17
replace pw = 1 if zhf == 18
replace pw = 1 if zhf == 19
replace pw = 2 if zhf == 20
replace pw = 2 if zhf == 21
replace pw = 2 if zhf == 22
replace pw = 2 if zhf == 23
replace pw = 2 if zhf == 24
replace pw = 2 if zhf == 25
replace pw = 2 if zhf == 26
replace pw = 2 if zhf == 27
replace pw = 2 if zhf == 28
replace pw = 2 if zhf == 29
replace pw = 2 if zhf == 30
replace pw = 2 if zhf == 31
replace pw = 2 if zhf == 32
replace pw = 2 if zhf == 33
replace pw = 2 if zhf == 34
replace pw = 2 if zhf == 35
replace pw = 2 if zhf == 36
replace pw = 2 if zhf == 37
replace pw = 2 if zhf == 38
replace pw = 2 if zhf == 39
replace pw = 2 if zhf == 40
replace pw = 2 if zhf == 41
replace pw = 2 if zhf == 42
replace pw = 2 if zhf == 43
replace pw = 2 if zhf == 44
replace pw = 2 if zhf == 45
replace pw = 2 if zhf == 46
replace pw = 2 if zhf == 47
replace pw = 2 if zhf == 49
replace pw = 2 if zhf == 50
replace pw = 1 if zhf == 57
replace pw = 1 if zhf == 58
replace pw = 1 if zhf == 59
replace pw = 1 if zhf == 60
replace pw = 1 if zhf == 61
replace pw = 1 if zhf == 62
replace pw = 2.09090909090909 if zhf == 63
replace pw = 2.09090909090909 if zhf == 64
replace pw = 2.09090909090909 if zhf == 65
replace pw = 2.09090909090909 if zhf == 66
replace pw = 2.09090909090909 if zhf == 67
replace pw = 2.09090909090909 if zhf == 68
replace pw = 2.09090909090909 if zhf == 69
replace pw = 2.09090909090909 if zhf == 70
replace pw = 2.09090909090909 if zhf == 71
replace pw = 2.09090909090909 if zhf == 72
replace pw = 2.09090909090909 if zhf == 73
replace pw = 1.83333333333333 if zhf == 74
replace pw = 1.83333333333333 if zhf == 75
replace pw = 1.83333333333333 if zhf == 76
replace pw = 1.83333333333333 if zhf == 77
replace pw = 1.83333333333333 if zhf == 78
replace pw = 1.83333333333333 if zhf == 79
replace pw = 1 if zhf == 96
replace pw = 1 if zhf == 97
replace pw = 1 if zhf == 98
replace pw = 1.875 if zhf == 99
replace pw = 1.875 if zhf == 100
replace pw = 1.875 if zhf == 101
replace pw = 1.875 if zhf == 102
replace pw = 1.875 if zhf == 103
replace pw = 1.875 if zhf == 104
replace pw = 1.875 if zhf == 105
replace pw = 1.875 if zhf == 106
replace pw = 2 if zhf == 107
replace pw = 2 if zhf == 108
replace pw = 2 if zhf == 109
replace pw = 2 if zhf == 110
replace pw = 2 if zhf == 112
replace pw = 2 if zhf == 113
replace pw = 2 if zhf == 114
replace pw = 2 if zhf == 115
replace pw = 2 if zhf == 116

* Finite population correction
gen fpc = .
replace fpc = 18 if zhf == 11
replace fpc = 18 if zhf == 12
replace fpc = 18 if zhf == 13
replace fpc = 18 if zhf == 14
replace fpc = 18 if zhf == 15
replace fpc = 18 if zhf == 16
replace fpc = 18 if zhf == 17
replace fpc = 18 if zhf == 18
replace fpc = 18 if zhf == 19
replace fpc = 18 if zhf == 20
replace fpc = 18 if zhf == 21
replace fpc = 18 if zhf == 22
replace fpc = 18 if zhf == 23
replace fpc = 18 if zhf == 24
replace fpc = 18 if zhf == 25
replace fpc = 18 if zhf == 26
replace fpc = 18 if zhf == 27
replace fpc = 18 if zhf == 28
replace fpc = 36 if zhf == 29
replace fpc = 36 if zhf == 30
replace fpc = 36 if zhf == 31
replace fpc = 36 if zhf == 32
replace fpc = 36 if zhf == 33
replace fpc = 36 if zhf == 34
replace fpc = 36 if zhf == 35
replace fpc = 36 if zhf == 36
replace fpc = 36 if zhf == 37
replace fpc = 36 if zhf == 38
replace fpc = 36 if zhf == 39
replace fpc = 36 if zhf == 40
replace fpc = 36 if zhf == 41
replace fpc = 36 if zhf == 42
replace fpc = 36 if zhf == 43
replace fpc = 36 if zhf == 44
replace fpc = 36 if zhf == 45
replace fpc = 36 if zhf == 46
replace fpc = 8 if zhf == 47
replace fpc = 8 if zhf == 49
replace fpc = 8 if zhf == 50
replace fpc = 18 if zhf == 57
replace fpc = 18 if zhf == 58
replace fpc = 18 if zhf == 59
replace fpc = 18 if zhf == 60
replace fpc = 18 if zhf == 61
replace fpc = 18 if zhf == 62
replace fpc = 23 if zhf == 63
replace fpc = 23 if zhf == 64
replace fpc = 23 if zhf == 65
replace fpc = 23 if zhf == 66
replace fpc = 23 if zhf == 67
replace fpc = 23 if zhf == 68
replace fpc = 23 if zhf == 69
replace fpc = 23 if zhf == 70
replace fpc = 23 if zhf == 71
replace fpc = 23 if zhf == 72
replace fpc = 23 if zhf == 73
replace fpc = 11 if zhf == 74
replace fpc = 11 if zhf == 75
replace fpc = 11 if zhf == 76
replace fpc = 11 if zhf == 77
replace fpc = 11 if zhf == 78
replace fpc = 11 if zhf == 79
replace fpc = 18 if zhf == 96
replace fpc = 18 if zhf == 97
replace fpc = 18 if zhf == 98
replace fpc = 15 if zhf == 99
replace fpc = 15 if zhf == 100
replace fpc = 15 if zhf == 101
replace fpc = 15 if zhf == 102
replace fpc = 15 if zhf == 103
replace fpc = 15 if zhf == 104
replace fpc = 15 if zhf == 105
replace fpc = 15 if zhf == 106
replace fpc = 16 if zhf == 107
replace fpc = 16 if zhf == 108
replace fpc = 16 if zhf == 109
replace fpc = 16 if zhf == 110
replace fpc = 16 if zhf == 112
replace fpc = 16 if zhf == 113
replace fpc = 8 if zhf == 114
replace fpc = 8 if zhf == 115
replace fpc = 8 if zhf == 116


* strata
generate strata = ""
replace strata = "1-3" if zhf == 11
replace strata = "1-3" if zhf == 12
replace strata = "1-3" if zhf == 13
replace strata = "1-3" if zhf == 14
replace strata = "1-3" if zhf == 15
replace strata = "1-3" if zhf == 16
replace strata = "1-3" if zhf == 17
replace strata = "1-3" if zhf == 18
replace strata = "1-3" if zhf == 19
replace strata = "1-2-public" if zhf == 20
replace strata = "1-2-public" if zhf == 21
replace strata = "1-2-public" if zhf == 22
replace strata = "1-2-public" if zhf == 23
replace strata = "1-2-public" if zhf == 24
replace strata = "1-2-public" if zhf == 25
replace strata = "1-2-public" if zhf == 26
replace strata = "1-2-public" if zhf == 27
replace strata = "1-2-public" if zhf == 28
replace strata = "1-1" if zhf == 29
replace strata = "1-1" if zhf == 30
replace strata = "1-1" if zhf == 31
replace strata = "1-1" if zhf == 32
replace strata = "1-1" if zhf == 33
replace strata = "1-1" if zhf == 34
replace strata = "1-1" if zhf == 35
replace strata = "1-1" if zhf == 36
replace strata = "1-1" if zhf == 37
replace strata = "1-1" if zhf == 38
replace strata = "1-1" if zhf == 39
replace strata = "1-1" if zhf == 40
replace strata = "1-1" if zhf == 41
replace strata = "1-1" if zhf == 42
replace strata = "1-1" if zhf == 43
replace strata = "1-1" if zhf == 44
replace strata = "1-1" if zhf == 45
replace strata = "1-1" if zhf == 46
replace strata = "1-2-private" if zhf == 47
replace strata = "1-2-private" if zhf == 49
replace strata = "1-2-private" if zhf == 50
replace strata = "2-3" if zhf == 57
replace strata = "2-3" if zhf == 58
replace strata = "2-3" if zhf == 59
replace strata = "2-3" if zhf == 60
replace strata = "2-3" if zhf == 61
replace strata = "2-3" if zhf == 62
replace strata = "2-2-public" if zhf == 63
replace strata = "2-2-public" if zhf == 64
replace strata = "2-2-public" if zhf == 65
replace strata = "2-2-public" if zhf == 66
replace strata = "2-2-public" if zhf == 67
replace strata = "2-2-public" if zhf == 68
replace strata = "2-2-public" if zhf == 69
replace strata = "2-2-public" if zhf == 70
replace strata = "2-2-public" if zhf == 71
replace strata = "2-2-public" if zhf == 72
replace strata = "2-2-public" if zhf == 73
replace strata = "2-1" if zhf == 74
replace strata = "2-1" if zhf == 75
replace strata = "2-1" if zhf == 76
replace strata = "2-1" if zhf == 77
replace strata = "2-1" if zhf == 78
replace strata = "2-1" if zhf == 79
replace strata = "3-3" if zhf == 96
replace strata = "3-3" if zhf == 97
replace strata = "3-3" if zhf == 98
replace strata = "3-2-public" if zhf == 99
replace strata = "3-2-public" if zhf == 100
replace strata = "3-2-public" if zhf == 101
replace strata = "3-2-public" if zhf == 102
replace strata = "3-2-public" if zhf == 103
replace strata = "3-2-public" if zhf == 104
replace strata = "3-2-public" if zhf == 105
replace strata = "3-2-public" if zhf == 106
replace strata = "3-1" if zhf == 107
replace strata = "3-1" if zhf == 108
replace strata = "3-1" if zhf == 109
replace strata = "3-1" if zhf == 110
replace strata = "3-1" if zhf == 112
replace strata = "3-1" if zhf == 113
replace strata = "3-2-private" if zhf == 114
replace strata = "3-2-private" if zhf == 115
replace strata = "3-2-private" if zhf == 116


*svyset
svyset zuniqueid_cal [pw=pw], strata(strata) fpc(fpc)

*------------------------------------------------------------------------------*

*** TABLE 1: CHARACTERISTICS OF HEALTH CARE PROVIDERS INTERVIEWED ***

* Access to / use of guidelines for treatment of malaria
capture noisily svy: tab zq61					// ETAT
capture noisily svy: tab zq63					// Pocketbook
capture noisily svy: tab zq21					// Salaries / incentives

*** TABLE 2: CHARACTERISTICS OF HEALTH FACILITIES AND COMMUNITY HEALTH SITES SURVEYED ***

tab zq5b, m						// Affiliation of HF
tab zq5b_oth					// Please check other responses if they fit into zq5b's categories

gen open_days = " " + string(zq17_1, "%2.0f") + " " + string(zq17_2, "%2.0f") ///
	+ " " + string(zq17_3, "%2.0f") + " " + string(zq17_4, "%2.0f") ///
	+ " " + string(zq17_5, "%2.0f") + " " + string(zq17_6, "%2.0f") ///
	+ " " + string(zq17_7, "%2.0f") + " " + string(zq17_8, "%2.0f") +  " "
gen weekdays = cond(regexm(open_days," 1 ")==1 & regexm(open_days," 2 ")==1 & regexm(open_days," 3 ")==1 ///
	& regexm(open_days," 4 ")==1 & regexm(open_days," 5 ")==1,1,0)
gen saturday = cond(regexm(open_days," 6 ")==1,1,0)
gen sunday = cond(regexm(open_days," 7 ")==1,1,0)
label values weekdays saturday sunday yesno

capture noisily svy: tab weekdays				// Opening days: Monday - Friday
capture noisily svy: tab saturday				// Opening days: Saturday
capture noisily svy: tab sunday					// Opening days: Sunday

capture noisily svy: tab zq23					// Do patients have to pay for medical services and / or drugs?
gen supervision = " " + string(zq56_1, "%2.0f") + " " + string(zq56_2, "%2.0f") ///
	+ " " + string(zq56_3, "%2.0f") + " " + string(zq56_4, "%2.0f") ///
	+ " " + string(zq56_5, "%2.0f") + " "
gen sv_unicef = cond(zq55==1,cond(regexm(supervision," 1 ")==1,1,0),.)
gen sv_moh = cond(zq55==1,cond(regexm(supervision," 2 ")==1,1,0),.)
gen sv_lha = cond(zq55==1,cond(regexm(supervision," 3 ")==1,1,0),.)
gen sv_other = cond(zq55==1,cond(regexm(supervision,"96")==1,1,0),.)

capture noisily svy: tab sv_unicef				// Supervision: UNICEF
capture noisily svy: tab sv_moh					// Supervision: NMCP / MOH
capture noisily svy: tab sv_lha					// Supervision: Local Health Authorities
capture noisily svy: tab sv_other				// Supervision: Other
tab zq56_oth, m					// Please check other responses if they fit into q56's categories

capture noisily svy: tab zq55					// Supervision: Not supervised
gen sv_6mon = cond(zq59==1|zq59==2,1,0)
capture noisily svy: tab sv_6mon				// Supervision: At least one supervisory visit in the past 6 months

preserve
stack zq69a zhf pw fpc strata  zq69b zhf pw fpc strata  ///
	zq69c zhf pw fpc strata  zq71a zhf pw fpc strata  ///
	zq71b zhf pw fpc strata  zq71c zhf pw fpc strata, ///
	into(zq69_stat zhf pw fpc strata) clear 
svyset zhf [pw=pw], strata(strata) fpc(fpc)
capture noisily svy: mean zq69_stat if zq69_stat >= 0
restore							// Facilities with IPD: Number of pediatric consultations per month
preserve
stack zq75a zhf pw fpc strata  zq75b zhf pw fpc strata  ///
	zq75c zhf pw fpc strata, into(zq75_stat zhf pw fpc strata) clear 
svyset zhf [pw=pw], strata(strata) fpc(fpc)
capture noisily svy: mean zq75_stat if zq75_stat >= 0
restore							// Number of children <5 with confirmed malaria per month
preserve
stack zq77a zhf pw fpc strata  zq77b zhf pw fpc strata  ///
	zq77c zhf pw fpc strata, into(zq77_stat zhf pw fpc strata) clear 
svyset zhf [pw=pw], strata(strata) fpc(fpc)
capture noisily svy: mean zq77_stat if zq77_stat >= 0
restore							// Number of children <5 with severe malaria per month
preserve
stack zq78b zhf pw fpc strata  zq78c zhf pw fpc strata  ///
	zq78d zhf pw fpc strata, into(zq78_stat zhf pw fpc strata) clear 
svyset zhf [pw=pw], strata(strata) fpc(fpc)
capture noisily svy: mean zq78_stat if zq78_stat >= 0
restore							// Number of children <5 referred to this HF per month

gen routine_test = " " + string(zq79_1, "%2.0f") + " " + string(zq79_2, "%2.0f") ///
	+ " " + string(zq79_3, "%2.0f") + " " + string(zq79_4, "%2.0f") ///
	+ " " + string(zq79_5, "%2.0f") + " " + string(zq79_6, "%2.0f") ///
	+ " " + string(zq79_7, "%2.0f") + " " + string(zq79_8, "%2.0f") ///
	+ " " + string(zq79_9, "%2.0f") + " " + string(zq79_10, "%2.0f") ///
	+ " " + string(zq79_11, "%2.0f") + " " + string(zq79_12, "%2.0f") ///
	+ " " + string(zq79_13, "%2.0f") + " " + string(zq79_14, "%2.0f") ///
	+ " " + string(zq79_15, "%2.0f") + " " + string(zq79_16, "%2.0f") ///
	+ " " + string(zq79_17, "%2.0f") + " " + string(zq79_18, "%2.0f") + " "
gen test_sugar = cond(regexm(routine_test," 1 ")==1,1,0)
gen test_creat = cond(regexm(routine_test," 2 ")==1,1,0)
gen test_blood = cond(regexm(routine_test," 3 ")==1,1,0)
gen test_fblood = cond(regexm(routine_test," 4 ")==1,1,0)
gen test_hemo = cond(regexm(routine_test," 5 ")==1,1,0)
gen test_hemato = cond(regexm(routine_test," 6 ")==1,1,0)
gen test_lumbar = cond(regexm(routine_test," 7 ")==1,1,0)
gen test_rdt = cond(regexm(routine_test," 8 ")==1,1,0)
gen test_ph = cond(regexm(routine_test," 9 ")==1,1,0)
gen test_bicarb = cond(regexm(routine_test," 10 ")==1,1,0)
gen test_plat = cond(regexm(routine_test," 11 ")==1,1,0)
gen test_bs = cond(regexm(routine_test," 12 ")==1,1,0)
gen test_tb = cond(regexm(routine_test," 13 ")==1,1,0)
gen test_urea = cond(regexm(routine_test," 14 ")==1,1,0)
gen test_arbo = cond(regexm(routine_test," 15 ")==1,1,0)
gen test_other = cond(regexm(routine_test,"96")==1,1,0)
label values test_* yesno

capture noisily svy: tab test_sugar				// Routine test: Blood sugar
capture noisily svy: tab test_creat				// Routine test: Creatinine
capture noisily svy: tab test_blood				// Routine test: Blood culture
capture noisily svy: tab test_fblood			// Routine test: Full blood count
capture noisily svy: tab test_hemo				// Routine test: Haemoglobin
capture noisily svy: tab test_hemato			// Routine test: Hematocrit
capture noisily svy: tab test_lumbar			// Routine test: Lumbar puncture
capture noisily svy: tab test_rdt				// Routine test: mRDT
capture noisily svy: tab test_ph				// Routine test: Blood pH
capture noisily svy: tab test_bicarb			// Routine test: Plasma bicarbonate
capture noisily svy: tab test_plat				// Routine test: Platelet count
capture noisily svy: tab test_bs				// Routine test: Malaria Blood Slide
capture noisily svy: tab test_tb				// Routine test: Tb microscopy
capture noisily svy: tab test_urea				// Routine test: Blood urea
capture noisily svy: tab test_arbo				// Routine test: Arbovirus test
capture noisily svy: tab test_other				// Routine test: Other
tab zq79_oth, m					// Please check other responses if they fit into q79's categories
capture noisily svy: tab zq15					// Mobile phone network available

*** TABLE 3: AVAILABILITY AND QUALITY OF TREATMENT FOR SEVERE AND UNCOMPLICATED MALARIA ***

** Availability of diagnostics **

gen microscope = ((zq90a>0 & zq90a!=.) | (zq90b>0 & zq90b!=.) | (zq91>0 & zq91!=.) ///
	| (zq92>0 & zq92!=.))*1 
capture noisily svy: tab microscope				// Microscope
gen rdt = (zq82_1==1)*1 + (zq82_2==1)*1 + (zq82_3==1)*1
capture noisily svy: tab rdt				// mRDT
capture noisily svy: tab zq88				// mRDT stock-outs in the last 12 months
capture noisily svy: tab zq93				// Giemsa stain
capture noisily svy: tab zq94				// Field's stain A/B
capture noisily svy: tab zq95				// Glass slides
capture noisily svy: tab zq96				// Power (%)
capture noisily svy: tab zq97				// Working thermometer
capture noisily svy: tab zq98				// Working body weight scale - infant
capture noisily svy: tab zq99				// Working body weight scale - adults
capture noisily svy: tab zq100				// Working stethoscope
capture noisily svy: tab zq101				// Working blood pressure machine - infant
capture noisily svy: tab zq102				// Working blood pressure machine - adults
capture noisily svy: tab zq103				// Working hemoglobinometer
capture noisily svy: tab zq104				// Supplies in stock: cuvettes for hemoglobin photometer
capture noisily svy: tab zq105				// Working glucometer
capture noisily svy: tab zq106				// Glucometer supplies in stock
capture noisily svy: tab zq107				// Working oximeter
capture noisily svy: tab zq108				// IV cannula - infant
capture noisily svy: tab zq109				// IV cannula - adults
capture noisily svy: tab zq110				// Syringes
capture noisily svy: tab zq111				// Disinfectant
capture noisily svy: tab zq114				// Working fridge
capture noisily svy: tab zq116				// Working freezer

** Availability of drugs **

egen alu_count = rowtotal(zq146c*)
gen alu = (alu_count>0)*1
egen alustock_count = rowtotal(zq146d*)
gen alustock = (alustock_count>0)*1
label values alu alustock yesno
capture noisily svy: tab alu						// AL in stock on day of survey
capture noisily svy: tab alustock					// AL stock outs in previous 12 months

qui ds zq146f*
global count1: word count `r(varlist)'
if ($count1 > 1){
	forvalue i = 1/$count1{
		local 146f_stack "`146f_stack' zq146f`i' zhf pw strata fpc  "
		}
	preserve
	stack `146f_stack', into(zq146f_stat zhf pw strata fpc) clear 
	svyset zhf [pw=pw], strata(strata) fpc(fpc)
	capture noisily svy: mean zq146f_stat if zq146f_stat >= 0
	restore						// Months of AL stock-outs
	}
else {
	capture noisily svy: mean zq146f1 if zq146f1>=0
	}							// Months of AL stock-outs

egen asaq_count = rowtotal(zq147c*)
gen asaq = (asaq_count>0)*1
egen asaqstock_count = rowtotal(zq147d*)
gen asaqstock = (asaqstock_count>0)*1
label values asaq asaqstock yesno
capture noisily svy: tab asaq					// ASAQ in stock on day of survey
capture noisily svy: tab asaqstock				// ASAQ stock outs in previous 12 months

qui ds zq147f*
global count2: word count `r(varlist)'
if ($count2 > 1){
		forvalue i = 1/$count2{
		local 147f_stack "`147f_stack' zq147f`i' zhf pw strata fpc  "
		}
	preserve
	stack `147f_stack', into(zq147f_stat zhf pw strata fpc) clear 
	svyset zhf [pw=pw], strata(strata) fpc(fpc)
	capture noisily svy: mean zq147f_stat if zq147f_stat >= 0
	restore						// Months of ASAQ stock-outs
	}
else {
	capture noisily svy: mean zq147f1 if zq147f1>=0
	}							// Months of ASAQ stock-outs

egen asmq_count = rowtotal(zq148c*)
gen asmq = (alu_count>0)*1
egen asmqstock_count = rowtotal(zq148d*)
gen asmqstock = (asmqstock_count>0)*1
label values asmq asmqstock yesno
capture noisily svy: tab asmq					// ASMQ in stock on day of survey
capture noisily svy: tab asmqstock				// ASMQ stock outs in previous 12 months
qui ds zq148f*
global count3: word count `r(varlist)'
if ($count3 > 1) {
		forvalue i = 1/$count3{
		local 148f_stack "`148f_stack' zq148f`i' zhf pw strata fpc  "
		}
	preserve
	stack `148f_stack', into(zq148f_stat zhf pw strata fpc) clear 
	svyset zhf [pw=pw], strata(strata) fpc(fpc)
	capture noisily svy: mean zq148f_stat if zq148f_stat >= 0
	restore						// Months of ASMQ stock-outs
	}
else {
	capture noisily svy: mean zq148f1 if zq148f1>=0
	}

capture noisily svy: tab zq151		// RAS in stock on day of survey
gen injas_stock = cond(zq132!=.,cond(zq132>0,1,0),.)
gen imam_stock = cond(zq133!=.,cond(zq133>0,1,0),.)
gen quin_stock = cond(zq134!=.,cond(zq134>0,1,0),.)
label values injas_stock imam_stock quin_stock yesno
capture noisily svy: tab injas_stock				// Inj. AS in stock on day of survey
capture noisily svy: tab zq138	 					// Inj. AS stock-outs in previous 12 months
capture noisily svy: mean zq141						// Inj. AS: mean months of stock outs
capture noisily svy: tab imam_stock					// IM Artemether in stock on day of survey
capture noisily svy: tab zq139	 					// IM Artemether stock-outs in previous 12 months
capture noisily svy: mean zq142						// IM Artemether: mean months of stock outs
capture noisily svy: tab quin_stock					// IV quinine in stock on day of survey
capture noisily svy: tab zq140	 					// IV quinine stock-outs in previous 12 months
capture noisily svy: mean zq143						// IV quinine: mean months of stock outs
capture noisily svy: tab zq172						// Amoxicilline in stock on day of survey
capture noisily svy: tab zq174						// Cefriaxone in stock on day of survey
capture noisily svy: tab zq175						// Ampicilline in stock on day of survey
capture noisily svy: tab zq176						// Gentamycine in stock on day of survey
capture noisily svy: tab zq177a						// Zinc in stock on day of survey
egen rehydration_count = rowtotal(zq192_*)
gen rehydration = (rehydration_count>0)*1
egen para_count = rowtotal(zq196_*)
gen paracetamol = (para_count>0)*1
egen anticon_count = rowtotal(zq179e*)
gen anticon = (anticon_count>0)*1
label values rehydration paracetamol anticon yesno
capture noisily svy: tab rehydration				// Rehydration salt in stock on day of survey
capture noisily svy: tab paracetamol				// Paracetamol in stock on day of survey
capture noisily svy: tab anticon					// Anticonvulsants in stock on day of survey
capture noisily svy: tab zq181a						// Iron folate in stock on day of survey
gen glucose = (zq182a == 1 | zq183a == 1)*1
label values glucose yesno
capture noisily svy: tab glucose					// Glucose in stock on day of survey
capture noisily svy: tab zq193						// Sodium chloride 0.9% available on day of survey
capture noisily svy: tab zq194						// Diuretics available on day of survey
capture noisily svy: tab zq195						// Vitamin K injections available on day of survey
egen ibu_count = rowtotal(zq197_*)
gen ibuprofen = (ibu_count>0)*1
label values ibuprofen yesno
capture noisily svy: tab ibuprofen					// Ibuprofen in stock on day of survey

** Availability of medical supplies **

capture noisily svy: tab zq184						// Oxygen
capture noisily svy: tab zq185						// Inhaled salbutamol with spacer
capture noisily svy: tab zq186						// Peadiatric nasogastric tube
capture noisily svy: tab zq187						// Capacity to do blood transfusion
capture noisily svy: tab zq188						// Blood bank

** Availability of job aids **

capture noisily svy: tab zq60						//  For performing mRDT, danger signs, administration of treatment etc.

*** TABLE 6: REFERRALS ***

egen distance_rhf = cut(zq8b), at(0,2,5.1,100) label
capture noisily svy: tab distance_rhf						// Distance to referral facility


