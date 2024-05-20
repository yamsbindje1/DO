**** HCPS - HF INTERVIEW: DRC ****

**** INDICATORS: HF INTERVIEW ****

* Open "long" dataset (enter your own file path)
use "Yams\ CARAMAL\4.2 CARAMAL DRC\1_ODK\HCPS\HF Interview\HCPS_DRC_HF Interview_2019.04.24_long.dta" , clear	

/* The following indicators need to be stratified by HF level(primary, secondary, tertiary).
	Please use the code below to select the category that is analyzed. */

tab q7, nolab
tab q7
global hfcat1 = 			// HF category

drop if q6 == .				// drop empty observations
keep if q7 == $hfcat1		// drop HF categories

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
applied. Within each Hospital and Referral Health Center, 4 and 2 Health Care 
Providers were randomly selected, respectively. In addition to that, within each 
Primary Health Facility, one Health Care Provider was randomly selected from the 
list of those who were present. Personal Interviews were conducted with each 
sampled Health Care Provider. */

** weights (PSU only)
* zq31: Number of doctors employed
* zq32: Number of doctors present
* zq37: Number of nurses employed
* zq40: Number of nurses present

gen pw = .
replace pw = 1 if hf == 11
replace pw = 1 if hf == 12
replace pw = 1 if hf == 13
replace pw = 1 if hf == 14
replace pw = 1 if hf == 15
replace pw = 1 if hf == 16
replace pw = 1 if hf == 17
replace pw = 1 if hf == 18
replace pw = 1 if hf == 19
replace pw = 2 if hf == 20
replace pw = 2 if hf == 21
replace pw = 2 if hf == 22
replace pw = 2 if hf == 23
replace pw = 2 if hf == 24
replace pw = 2 if hf == 25
replace pw = 2 if hf == 26
replace pw = 2 if hf == 27
replace pw = 2 if hf == 28
replace pw = 2 if hf == 29
replace pw = 2 if hf == 30
replace pw = 2 if hf == 31
replace pw = 2 if hf == 32
replace pw = 2 if hf == 33
replace pw = 2 if hf == 34
replace pw = 2 if hf == 35
replace pw = 2 if hf == 36
replace pw = 2 if hf == 37
replace pw = 2 if hf == 38
replace pw = 2 if hf == 39
replace pw = 2 if hf == 40
replace pw = 2 if hf == 41
replace pw = 2 if hf == 42
replace pw = 2 if hf == 43
replace pw = 2 if hf == 44
replace pw = 2 if hf == 45
replace pw = 2 if hf == 46
replace pw = 2 if hf == 47
replace pw = 2 if hf == 49
replace pw = 2 if hf == 50
replace pw = 1 if hf == 57
replace pw = 1 if hf == 58
replace pw = 1 if hf == 59
replace pw = 1 if hf == 60
replace pw = 1 if hf == 61
replace pw = 1 if hf == 62
replace pw = 2.09090909090909 if hf == 63
replace pw = 2.09090909090909 if hf == 64
replace pw = 2.09090909090909 if hf == 65
replace pw = 2.09090909090909 if hf == 66
replace pw = 2.09090909090909 if hf == 67
replace pw = 2.09090909090909 if hf == 68
replace pw = 2.09090909090909 if hf == 69
replace pw = 2.09090909090909 if hf == 70
replace pw = 2.09090909090909 if hf == 71
replace pw = 2.09090909090909 if hf == 72
replace pw = 2.09090909090909 if hf == 73
replace pw = 1.83333333333333 if hf == 74
replace pw = 1.83333333333333 if hf == 75
replace pw = 1.83333333333333 if hf == 76
replace pw = 1.83333333333333 if hf == 77
replace pw = 1.83333333333333 if hf == 78
replace pw = 1.83333333333333 if hf == 79
replace pw = 1 if hf == 96
replace pw = 1 if hf == 97
replace pw = 1 if hf == 98
replace pw = 1.875 if hf == 99
replace pw = 1.875 if hf == 100
replace pw = 1.875 if hf == 101
replace pw = 1.875 if hf == 102
replace pw = 1.875 if hf == 103
replace pw = 1.875 if hf == 104
replace pw = 1.875 if hf == 105
replace pw = 1.875 if hf == 106
replace pw = 2 if hf == 107
replace pw = 2 if hf == 108
replace pw = 2 if hf == 109
replace pw = 2 if hf == 110
replace pw = 2 if hf == 112
replace pw = 2 if hf == 113
replace pw = 2 if hf == 114
replace pw = 2 if hf == 115
replace pw = 2 if hf == 116

gen fpc = .
replace fpc = 18 if hf == 11
replace fpc = 18 if hf == 12
replace fpc = 18 if hf == 13
replace fpc = 18 if hf == 14
replace fpc = 18 if hf == 15
replace fpc = 18 if hf == 16
replace fpc = 18 if hf == 17
replace fpc = 18 if hf == 18
replace fpc = 18 if hf == 19
replace fpc = 18 if hf == 20
replace fpc = 18 if hf == 21
replace fpc = 18 if hf == 22
replace fpc = 18 if hf == 23
replace fpc = 18 if hf == 24
replace fpc = 18 if hf == 25
replace fpc = 18 if hf == 26
replace fpc = 18 if hf == 27
replace fpc = 18 if hf == 28
replace fpc = 36 if hf == 29
replace fpc = 36 if hf == 30
replace fpc = 36 if hf == 31
replace fpc = 36 if hf == 32
replace fpc = 36 if hf == 33
replace fpc = 36 if hf == 34
replace fpc = 36 if hf == 35
replace fpc = 36 if hf == 36
replace fpc = 36 if hf == 37
replace fpc = 36 if hf == 38
replace fpc = 36 if hf == 39
replace fpc = 36 if hf == 40
replace fpc = 36 if hf == 41
replace fpc = 36 if hf == 42
replace fpc = 36 if hf == 43
replace fpc = 36 if hf == 44
replace fpc = 36 if hf == 45
replace fpc = 36 if hf == 46
replace fpc = 8 if hf == 47
replace fpc = 8 if hf == 49
replace fpc = 8 if hf == 50
replace fpc = 18 if hf == 57
replace fpc = 18 if hf == 58
replace fpc = 18 if hf == 59
replace fpc = 18 if hf == 60
replace fpc = 18 if hf == 61
replace fpc = 18 if hf == 62
replace fpc = 23 if hf == 63
replace fpc = 23 if hf == 64
replace fpc = 23 if hf == 65
replace fpc = 23 if hf == 66
replace fpc = 23 if hf == 67
replace fpc = 23 if hf == 68
replace fpc = 23 if hf == 69
replace fpc = 23 if hf == 70
replace fpc = 23 if hf == 71
replace fpc = 23 if hf == 72
replace fpc = 23 if hf == 73
replace fpc = 11 if hf == 74
replace fpc = 11 if hf == 75
replace fpc = 11 if hf == 76
replace fpc = 11 if hf == 77
replace fpc = 11 if hf == 78
replace fpc = 11 if hf == 79
replace fpc = 18 if hf == 96
replace fpc = 18 if hf == 97
replace fpc = 18 if hf == 98
replace fpc = 15 if hf == 99
replace fpc = 15 if hf == 100
replace fpc = 15 if hf == 101
replace fpc = 15 if hf == 102
replace fpc = 15 if hf == 103
replace fpc = 15 if hf == 104
replace fpc = 15 if hf == 105
replace fpc = 15 if hf == 106
replace fpc = 16 if hf == 107
replace fpc = 16 if hf == 108
replace fpc = 16 if hf == 109
replace fpc = 16 if hf == 110
replace fpc = 16 if hf == 112
replace fpc = 16 if hf == 113
replace fpc = 8 if hf == 114
replace fpc = 8 if hf == 115
replace fpc = 8 if hf == 116

* strata
generate strata = ""
replace strata = "1-3" if hf == 11
replace strata = "1-3" if hf == 12
replace strata = "1-3" if hf == 13
replace strata = "1-3" if hf == 14
replace strata = "1-3" if hf == 15
replace strata = "1-3" if hf == 16
replace strata = "1-3" if hf == 17
replace strata = "1-3" if hf == 18
replace strata = "1-3" if hf == 19
replace strata = "1-2-public" if hf == 20
replace strata = "1-2-public" if hf == 21
replace strata = "1-2-public" if hf == 22
replace strata = "1-2-public" if hf == 23
replace strata = "1-2-public" if hf == 24
replace strata = "1-2-public" if hf == 25
replace strata = "1-2-public" if hf == 26
replace strata = "1-2-public" if hf == 27
replace strata = "1-2-public" if hf == 28
replace strata = "1-1" if hf == 29
replace strata = "1-1" if hf == 30
replace strata = "1-1" if hf == 31
replace strata = "1-1" if hf == 32
replace strata = "1-1" if hf == 33
replace strata = "1-1" if hf == 34
replace strata = "1-1" if hf == 35
replace strata = "1-1" if hf == 36
replace strata = "1-1" if hf == 37
replace strata = "1-1" if hf == 38
replace strata = "1-1" if hf == 39
replace strata = "1-1" if hf == 40
replace strata = "1-1" if hf == 41
replace strata = "1-1" if hf == 42
replace strata = "1-1" if hf == 43
replace strata = "1-1" if hf == 44
replace strata = "1-1" if hf == 45
replace strata = "1-1" if hf == 46
replace strata = "1-2-private" if hf == 47
replace strata = "1-2-private" if hf == 49
replace strata = "1-2-private" if hf == 50
replace strata = "2-3" if hf == 57
replace strata = "2-3" if hf == 58
replace strata = "2-3" if hf == 59
replace strata = "2-3" if hf == 60
replace strata = "2-3" if hf == 61
replace strata = "2-3" if hf == 62
replace strata = "2-2-public" if hf == 63
replace strata = "2-2-public" if hf == 64
replace strata = "2-2-public" if hf == 65
replace strata = "2-2-public" if hf == 66
replace strata = "2-2-public" if hf == 67
replace strata = "2-2-public" if hf == 68
replace strata = "2-2-public" if hf == 69
replace strata = "2-2-public" if hf == 70
replace strata = "2-2-public" if hf == 71
replace strata = "2-2-public" if hf == 72
replace strata = "2-2-public" if hf == 73
replace strata = "2-1" if hf == 74
replace strata = "2-1" if hf == 75
replace strata = "2-1" if hf == 76
replace strata = "2-1" if hf == 77
replace strata = "2-1" if hf == 78
replace strata = "2-1" if hf == 79
replace strata = "3-3" if hf == 96
replace strata = "3-3" if hf == 97
replace strata = "3-3" if hf == 98
replace strata = "3-2-public" if hf == 99
replace strata = "3-2-public" if hf == 100
replace strata = "3-2-public" if hf == 101
replace strata = "3-2-public" if hf == 102
replace strata = "3-2-public" if hf == 103
replace strata = "3-2-public" if hf == 104
replace strata = "3-2-public" if hf == 105
replace strata = "3-2-public" if hf == 106
replace strata = "3-1" if hf == 107
replace strata = "3-1" if hf == 108
replace strata = "3-1" if hf == 109
replace strata = "3-1" if hf == 110
replace strata = "3-1" if hf == 112
replace strata = "3-1" if hf == 113
replace strata = "3-2-private" if hf == 114
replace strata = "3-2-private" if hf == 115
replace strata = "3-2-private" if hf == 116


*svyset
svyset uniqueid_cal [pw=pw], strata(strata) fpc(fpc) || q3, strata(q9)

*** TABLE 1: CHARACTERISTICS OF HEALTH CARE PROVIDERS INTERVIEWED ***

qui summarize q6 				// Age
egen agecat = cut(q6), at(`r(min)', 30, 40, 50, 60, 100) label
tab agecat, m 					// Age in categories
tab q5, m						// Sex
tab q9, m 						// Professional background
tab q9_oth						// Please check other responses if they fit into q9's categories
egen workcat = cut(q11), at(0,1,3,6,100) label
tab workcat, m					// Years working as a health worker
gen workcal = cond(q12==1, q13/52, cond(q12==2, q13/12, cond(q12==3,q13,.)))
egen workhf = cut(workcal), at(0,1,3,6,100) label
tab workhf, m 					// Years working at this health facility

* Access to / use of guidelines for treatment of malaria
gen gl_imci = cond(q40a == 4 |q40b == 4, 1, 0)
gen gl_iccm = cond(q40a == 3 |q40b == 3, 1, 0)
gen gl_who = cond(q40a == 1 |q40b == 1, 1, 0)
gen gl_nmcp = cond(q40a == 2 |q40b == 2, 1, 0)
gen gl_oth = cond(q40a == -96 |q40b == -96, 1, 0)
gen gl_dk = cond(q40a == -98 |q40b == -98, 1, 0)
label values gl_imci gl_iccm gl_who gl_nmcp yesno
capture noisily svy: tab gl_imci				// IMCI
capture noisily svy: tab gl_iccm				// iCCM
capture noisily svy: tab gl_who					// WHO / Local guidelines
capture noisily svy: tab gl_nmcp				// NMCP
								// ETAT: see below (HF Checklist)
								// Pocketbook: see below (HF Checklist)
capture noisily svy: tab gl_oth					// Other
capture noisily svy: tab gl_dk					// Don't know
tab q40a_oth					// Please check other responses if they fit into q40a's categories
tab q40b_oth					// Please check other responses if they fit into q40b's categories
								// Salaries / incentives: see below (HF Checklist)

*** TABLE 2: CHARACTERISTICS OF HEALTH FACILITIES AND COMMUNITY HEALTH SITES SURVEYED ***

capture noisily svy: tab q8						// HF Affiliation: please also see below (HF Checklist: zq5b)
tab q8_oth						// Please check other responses if they fit into q8's categories
								// Opening days: see below (HF Checklist)
								// Payment for medical services/drugs: see below (HF Checklist)
								// Supervision: see below (HF Checklist)
								// # pediatric consulations: see below (HF Checklist)
								// # confirmed malaria: see below (HF Checklist)
								// # severe malaria: see below (HF Checklist)
								// # referrals: see below (HF Checklist)
								// # tests for severe febrile illness cases: see below (HF Checklist)
								// Mobile phone network: see below (HF Checklist)

*** TABLE 3: AVAILABILITY AND QUALITY OF TREATMENT FOR SEVERE AND UNCOMPLICATED MALARIA ***

// Availability of diagnostics: see below (HF Checklist)
// Availability of drugs: see below (HF Checklist)
// Availability of medical supplies: see below (HF Checklist)
// Availability of job aids: see below (HF Checklist)


// Complications: Denominator = # HFs 
* Any answer mentioned by any health worker of HF counts as the HF 
* being able to manage the complication
gen q54 = " " + string(q54_1, "%2.0f") + " " + string(q54_2, "%2.0f") ///
	+ " " + string(q54_3, "%2.0f") + " " + string(q54_4, "%2.0f") ///
	+ " " + string(q54_5, "%2.0f") + " " + string(q54_6, "%2.0f") ///
	+ " " + string(q54_7, "%2.0f") + " " + string(q54_8, "%2.0f") ///
	+ " " + string(q54_9, "%2.0f") + " " + string(q54_10, "%2.0f") ///
	+ " " + string(q54_11, "%2.0f") + " " + string(q54_12, "%2.0f") ///
	+ " " + string(q54_13, "%2.0f") + " "

gen comp_severe_anemia = cond(regexm(q54," 1 "),1,0)	// Complications: Severe anemia
gen comp_coma = cond(regexm(q54," 2 "),1,0)				// Complications: Coma
gen comp_hyperpyrexia = cond(regexm(q54," 3 "),1,0)		// Complications: Hyperpyrexia
gen comp_convulsion = cond(regexm(q54," 4 "),1,0)		// Complications: Convulsions
gen comp_hypoglycemia = cond(regexm(q54," 5 "),1,0)		// Complications: Hypglycemia
gen comp_pul_oedema = cond(regexm(q54," 6 "),1,0)		// Complications: Acute Pulmonary Oedema
gen comp_kidney_injury = cond(regexm(q54," 7 "),1,0)	// Complications: Acute Kidney injury
gen comp_bleeding = cond(regexm(q54," 8 "),1,0)			// Complications: Spontaneous bleeding & coagulopathy
gen comp_acidosis = cond(regexm(q54," 9 "),1,0)			// Complications: Metabolic Acidosis
gen comp_shock = cond(regexm(q54," 10 "),1,0)			// Complications: Shock
gen comp_other = cond(regexm(q54," -96 "),1,0)			// Complications: Other
gen comp_dk = cond(regexm(q54," -98 "),1,0)				// Complications: Don't know
	
preserve 
collapse (sum) comp_*, by(hf pw fpc strata)				// collapse to HF level
foreach var of varlist comp_* {
	replace `var' = 1 if `var' > 0
	label values `var' yesno
	} 
*svyset 
svyset hf [pw=pw], strata(strata) fpc(fpc)				// Sampling strategy for HF only

capture noisily svy: tab comp_severe_anemia					// Complications: Severe anemia
capture noisily svy: tab comp_coma							// Complications: Coma
capture noisily svy: tab comp_hyperpyrexia					// Complications: Hyperpyrexia
capture noisily svy: tab comp_convulsion					// Complications: Convulsions
capture noisily svy: tab comp_hypoglycemia					// Complications: Hypglycemia
capture noisily svy: tab comp_pul_oedema					// Complications: Acute Pulmonary Oedema
capture noisily svy: tab comp_kidney_injury					// Complications: Acute Kidney injury
capture noisily svy: tab comp_bleeding						// Complications: Spontaneous bleeding & coagulopathy
capture noisily svy: tab comp_acidosis						// Complications: Metabolic Acidosis
capture noisily svy: tab comp_shock							// Complications: Shock
capture noisily svy: tab comp_other							// Complications: Other
capture noisily svy: tab comp_dk							// Complications: Don't know
restore 

*** TABLE 4: TRAINING STATUS AND KNOWLEDGE OF MALARIA CARE BY HEALTH CARE PROVIDER ***

** Trainings **

gen init_train = " " + string(q14_1, "%2.0f") + " " + string(q14_2, "%2.0f") ///
	+ " " + string(q14_3, "%2.0f") + " " + string(q14_4, "%2.0f") ///
	+ " " + string(q14_5, "%2.0f") + " " + string(q14_6, "%2.0f") ///
	+ " " + string(q14_7, "%2.0f") + " " + string(q14_8, "%2.0f") ///
	+ " " + string(q14_9, "%2.0f") + " " + string(q14_10, "%2.0f") ///
	+ " " + string(q14_11, "%2.0f") + " "
gen int_unicef = cond(regexm(init_train," 1 "),1,0)
gen int_nmcp = cond(regexm(init_train," 2 "),1,0)
gen int_lha = cond(regexm(init_train," 3 "),1,0)
gen int_ce = cond(regexm(init_train," 4 "),1,0)
gen int_csh = cond(regexm(init_train," 5 "),1,0)
gen int_pt = cond(regexm(init_train," 6 "),1,0)
gen int_uni = cond(regexm(init_train," 7 "),1,0)
gen int_hc = cond(regexm(init_train," 8 "),1,0)
gen int_oth = cond(regexm(init_train,"-96"),1,0)
gen int_nt = cond(regexm(init_train,"-77"),1,0)
label values int_* yesno

capture noisily svy: tab int_unicef				// Initial training: UNICEF
capture noisily svy: tab int_nmcp				// Initial training: NMCP
capture noisily svy: tab int_lha				// Initial training: Local Health Authorities
capture noisily svy: tab int_ce					// Initial training: College of Education
capture noisily svy: tab int_csh				// Initial training: College / School of Health
capture noisily svy: tab int_pt					// Initial training: Polytechnic
capture noisily svy: tab int_uni				// Initial training: University
capture noisily svy: tab int_hc					// Initial training: Health Center
capture noisily svy: tab int_oth				// Initial training: Other
capture noisily svy: tab int_nt					// Initial training: Not trained
tab q14_oth						// Please check other responses if they fit into q14's categories
capture noisily svy: tab q18b					// Trainings in past 12 months: RAS use
capture noisily svy: mean q17a					// Trainings in past 12 months: Diagnosis of severe malaria
capture noisily svy: mean q17b					// Trainings in past 12 months: Severe malaria management
capture noisily svy: mean q17c					// Trainings in past 12 months: Emergency resuscitative measures

gen further_training = " " + string(q25_1, "%2.0f") + " " + string(q25_2, "%2.0f") ///
	+ " " + string(q25_3, "%2.0f") + " " + string(q25_4, "%2.0f") ///
	+ " " + string(q25_5, "%2.0f") + " " + string(q25_6, "%2.0f") ///
	+ " " + string(q25_7, "%2.0f") + " " // + string(q25_8, "%2.0f") + " "	(add if "Referring" was one of the answer options)
gen futrain_drug = cond(regexm(further_training," 1 ")==1,1,0)
gen futrain_shift = cond(regexm(further_training," 2 ")==1,1,0)
gen futrain_budget = cond(regexm(further_training," 3 ")==1,1,0)
gen futrain_hmis = cond(regexm(further_training," 4 ")==1,1,0)
*gen futrain_refer = cond(regexm(further_training," 5 ")==1,1,0)
gen futrain_other = cond(regexm(further_training,"96")==1,1,0)
label values futrain_* yesno

capture noisily svy: tab futrain_drug			// Further training: Latest drug use (%)
capture noisily svy: tab futrain_shift			// Further training: Discussions on task shifting (%)
capture noisily svy: tab futrain_budget			// Further training: Budgeting and Health Management System (%)
capture noisily svy: tab futrain_hmis			// Further training: HMIS & ICT (%)
*capture noisily svy: tab futrain_refer			// Further training: Referring (%)
capture noisily svy: tab futrain_other			// Further training: Other, specify (%)
tab q25_oth						// Please check other responses if they fit into q25's categories

** Knowledge assessment **

gen q50_sum = cond(q50_1>0 & q50_1!=.,1,0) + cond(q50_2>0 & q50_2!=.,1,0) ///
	 + cond(q50_3>0 & q50_3!=.,1,0) + cond(q50_4>0 & q50_4!=.,1,0) ///
	 + cond(q50_5>0 & q50_5!=.,1,0) + cond(q50_6>0 & q50_6!=.,1,0) ///
	 + cond(q50_7>0 & q50_7!=.,1,0) + cond(q50_8>0 & q50_8!=.,1,0) ///
	 + cond(q50_9>0 & q50_9!=.,1,0) + cond(q50_10>0 & q50_10!=.,1,0) ///
	 + cond(q50_11>0 & q50_11!=.,1,0) + cond(q50_12>0 & q50_12!=.,1,0) ///
	 + cond(q50_13>0 & q50_13!=.,1,0) + cond(q50_14>0 & q50_14!=.,1,0) ///
	 + cond(q50_15>0 & q50_15!=.,1,0) + cond(q50_16>0 & q50_16!=.,1,0) ///
	 + cond(q50_17>0 & q50_17!=.,1,0) + cond(q50_18>0 & q50_18!=.,1,0) ///
	 + cond(q50_19>0 & q50_19!=.,1,0) + cond(q50_20>0 & q50_20!=.,1,0)
gen definition_sm5 = cond(q50_sum>=5,1,0)
gen definition_sm10 = cond(q50_sum>=10,1,0)
gen definition_sm18 = cond(q50_sum==18,1,0)
label values definition_* yesno	// Definition of severe malaria: 

capture noisily svy: tab definition_sm5			// At least 5 of 18 items (%)
capture noisily svy: tab definition_sm10		// At least 10 of 18 items (%)
capture noisily svy: tab definition_sm18		// All 18 items (%)
tab q50_oth						// Please check other responses if they fit into q50's categories

gen malaria_diagno = " " + string(q43_1, "%2.0f") + " " + string(q43_2, "%2.0f") ///
	+ " " + string(q43_3, "%2.0f") + " " + string(q43_4, "%2.0f") ///
	+ " " + string(q43_5, "%2.0f") + " "
gen diagn_micro = cond(regexm(malaria_diagno," 1 ")==1,1,0)
gen diagn_rdt = cond(regexm(malaria_diagno," 2 ")==1,1,0)
gen diagn_physical = cond(regexm(malaria_diagno," 3 ")==1,1,0)
gen diagn_other = cond(regexm(malaria_diagno,"96")==1,1,0)
label values diagn_* yesno

capture noisily svy: tab diagn_micro			// Malaria diagnosis: Microscopy
capture noisily svy: tab diagn_rdt				// Malaria diagnosis: mRDT
capture noisily svy: tab diagn_physical			// Malaria diagnosis: Physical observation
capture noisily svy: tab diagn_other			// Malaria diagnosis: Other
tab q43_oth						// Please check other responses if they fit into q43's categories

gen malaria_signs = " " + string(q44_1, "%2.0f") + " " + string(q44_2, "%2.0f") ///
	+ " " + string(q44_3, "%2.0f") + " " + string(q44_4, "%2.0f") ///
	+ " " + string(q44_5, "%2.0f") + " " + string(q44_6, "%2.0f") ///
	+ " " + string(q44_7, "%2.0f") + " " + string(q44_8, "%2.0f") ///
	+ " " + string(q44_9, "%2.0f") + " " + string(q44_10, "%2.0f") ///
	+ " " + string(q44_11, "%2.0f") + " " + string(q44_12, "%2.0f") ///
	+ " " + string(q44_13, "%2.0f") + " " + string(q44_14, "%2.0f") ///
	+ " " + string(q44_15, "%2.0f") + " " + string(q44_16, "%2.0f") ///
	+ " " + string(q44_17, "%2.0f")  + " "
gen sign_headache = cond(regexm(malaria_signs," 1 ")==1,1,0)
gen sign_dizzy = cond(regexm(malaria_signs," 2 ")==1,1,0)
gen sign_cough = cond(regexm(malaria_signs," 3 ")==1,1,0)
gen sign_sputum = cond(regexm(malaria_signs," 4 ")==1,1,0)
gen sign_breathing = cond(regexm(malaria_signs," 5 ")==1,1,0)
gen sign_nausea = cond(regexm(malaria_signs," 6 ")==1,1,0)
gen sign_vomit = cond(regexm(malaria_signs," 7 ")==1,1,0)
gen sign_diarrhea = cond(regexm(malaria_signs," 8 ")==1,1,0)
gen sign_stomach = cond(regexm(malaria_signs," 9 ")==1,1,0)
gen sign_skin = cond(regexm(malaria_signs," 10 ")==1,1,0)
gen sign_convulsion = cond(regexm(malaria_signs," 11 ")==1,1,0)
gen sign_shiver = cond(regexm(malaria_signs," 12 ")==1,1,0)
gen sign_conscious = cond(regexm(malaria_signs," 13 ")==1,1,0)
gen sign_fever = cond(regexm(malaria_signs," 14 ")==1,1,0)
gen sign_none = cond(regexm(malaria_signs,"77")==1,1,0)
gen sign_other = cond(regexm(malaria_signs,"96")==1,1,0)
label values sign_* yesno

capture noisily svy: tab sign_headache			// Malaria signs: Headache
capture noisily svy: tab sign_dizzy				// Malaria signs: Dizziness
capture noisily svy: tab sign_cough				// Malaria signs: Cough
capture noisily svy: tab sign_sputum			// Malaria signs: Cough with sputum
capture noisily svy: tab sign_breathing			// Malaria signs: Difficulty in breathing
capture noisily svy: tab sign_nausea			// Malaria signs: Nausea
capture noisily svy: tab sign_vomit				// Malaria signs: Vomiting
capture noisily svy: tab sign_diarrhea			// Malaria signs: Diarrhoea
capture noisily svy: tab sign_stomach			// Malaria signs: Stomach ache
capture noisily svy: tab sign_skin				// Malaria signs: Skin rash
capture noisily svy: tab sign_convulsion		// Malaria signs: Convulsions
capture noisily svy: tab sign_shiver			// Malaria signs: Shivering
capture noisily svy: tab sign_conscious			// Malaria signs: Loss of consciousness
capture noisily svy: tab sign_fever				// Malaria signs: Fever
capture noisily svy: tab sign_none				// Malaria signs: None
capture noisily svy: tab sign_other				// Malaria signs: Other
tab q44_oth						// Please check other responses if they fit into q44's categories

gen q45_sum = cond(q45==1,1,0) + cond(q46==1,1,0) + cond(q47==1,1,0) + cond(q48==1,1,0) + cond(q49==1,1,0) 
gen rdt_test3 = cond(q45_sum>=3,1,0)
gen rdt_test5 = cond(q45_sum==5,1,0) // Correct performance and interpretation of mRDT:
capture noisily svy: tab rdt_test3					// At least 3 of 5 items (%)
capture noisily svy: tab rdt_test5					// All 5 items (%)

*** TABLE 5: TREATMENT ATTITUDES AND PRACTICE, RAS KNOWLEDGE AND ACCEPTABILITY ***

** Attitudes and beliefs towards malaria management **

capture noisily svy: tab q91					// Test patients with fever with mRDT or microscopy
*capture noisily svy: tab q92					// Second dose of RAS if referral is delayed
capture noisily svy: tab q93					// Combination therapy is most effective
capture noisily svy: tab q94					// Antimalarials to patients with negative test result
*capture noisily svy: tab q95					// Less urgency of referral after RAS
*capture noisily svy: tab q96					// RAS can be continued until oral treatment is possible
capture noisily svy: tab q98					// Nets prevent mosquito bites and malaria transmission
capture noisily svy: tab q99					// Referral note more important than explaining reason for referral
*capture noisily svy: tab q100					// RAS can replace injectable AS
*capture noisily svy: tab q101					// RAS recommended for all patients with signs of malaria
capture noisily svy: tab q102					// Severe malaria is always an emergency
capture noisily svy: tab q103					// Inj. treatment continued even if oral is possible

** Treatment practice **
capture noisily svy: tab q105					// Patients with fever tested with mRDT in past 14 days
gen reason_notest = " " + string(q106_1, "%2.0f") + " " + string(q106_2, "%2.0f") ///
	+ " " + string(q106_3, "%2.0f") + " " + string(q106_4, "%2.0f") ///
	+ " " + string(q106_5, "%2.0f") + " " + string(q106_6, "%2.0f") + " "
gen reason_nt_tests = cond(q105 == 0 |q105 == 2,cond(regexm(reason_notest," 1 ")==1,1,0),.)
gen reason_nt_refused = cond(q105 == 0 |q105 == 2,cond(regexm(reason_notest," 2 ")==1,1,0),.)
gen reason_nt_referral = cond(q105 == 0 |q105 == 2,cond(regexm(reason_notest," 3 ")==1,1,0),.)
gen reason_nt_department = cond(q105 == 0 |q105 == 2,cond(regexm(reason_notest," 4 ")==1,1,0),.)
gen reason_nt_other = cond(q105 == 0 |q105 == 2,cond(regexm(reason_notest,"96")==1,1,0),.)
label values reason_nt_* yesno

capture noisily svy: tab reason_nt_tests		// Reason for not testing (all) patients (q106): No tests available
capture noisily svy: tab reason_nt_refused		// Reason for not testing (all) patients (q106): Caregiver refused
capture noisily svy: tab reason_nt_referral		// Reason for not testing (all) patients (q106): Child needs urgent referral
capture noisily svy: tab reason_nt_department	// Reason for not testing (all) patients (q106): Child is tested at other HF department
capture noisily svy: tab reason_nt_other		// Reason for not testing (all) patients (q106): Other
capture noisily svy: tab q106_oth				// Please check other responses if they fit into q106's categories

capture noisily svy: tab q111					// Patients with severe malaria tested with mRDT/microscopy in past 14 days
gen reason_notest2 = " " + string(q112_1, "%2.0f") + " " + string(q112_2, "%2.0f") ///
	+ " " + string(q112_3, "%2.0f") + " " + string(q112_4, "%2.0f") ///
	+ " " + string(q112_5, "%2.0f") + " " + string(q112_6, "%2.0f") + " "
gen reason_nt_tests2 = cond(q111 == 0 |q111 == 2,cond(regexm(reason_notest2," 1 ")==1,1,0),.)
gen reason_nt_refused2 = cond(q111 == 0 |q111 == 2,cond(regexm(reason_notest2," 2 ")==1,1,0),.)
gen reason_nt_referral2 = cond(q111 == 0 |q111 == 2,cond(regexm(reason_notest2," 3 ")==1,1,0),.)
gen reason_nt_department2 = cond(q111 == 0 |q111 == 2,cond(regexm(reason_notest2," 4 ")==1,1,0),.)
gen reason_nt_other2 = cond(q111 == 0 |q111 == 2,cond(regexm(reason_notest2,"96")==1,1,0),.)
label values reason_nt_* yesno

capture noisily svy: tab reason_nt_tests2		// Reason for not testing (all) patients (q112): No tests available
capture noisily svy: tab reason_nt_refused2		// Reason for not testing (all) patients (q112): Caregiver refused
capture noisily svy: tab reason_nt_referral2	// Reason for not testing (all) patients (q112): Child needs urgent referral
capture noisily svy: tab reason_nt_department2	// Reason for not testing (all) patients (q112): Child is tested at other HF department
capture noisily svy: tab reason_nt_other2		// Reason for not testing (all) patients (q112): Other
tab q112_oth					// Please check other responses if they fit into q112's categories

gen treatment_pos = " " + string(q107_1, "%2.0f") + " " + string(q107_2, "%2.0f") ///
	+ " " + string(q107_3, "%2.0f") + " " + string(q107_4, "%2.0f") ///
	+ " " + string(q107_5, "%2.0f") + " " + string(q107_6, "%2.0f") ///
	+ " " + string(q107_7, "%2.0f") + " " + string(q107_8, "%2.0f") ///
	+ " " + string(q107_9, "%2.0f") + " " + string(q107_10, "%2.0f") ///
	+ " " + string(q107_11, "%2.0f") + " " + string(q107_12, "%2.0f") ///
	+ " " + string(q107_13, "%2.0f") + " " + string(q107_14, "%2.0f") ///
	+ " " + string(q107_15, "%2.0f") + " " + string(q107_16, "%2.0f") ///
	+ " " + string(q107_17, "%2.0f") + " " + string(q107_18, "%2.0f") ///
	+ " " + string(q107_19, "%2.0f") + " " + string(q107_20, "%2.0f") ///
	+ " " + string(q107_21, "%2.0f") + " " + string(q107_22, "%2.0f") ///
	+ " " + string(q107_23, "%2.0f") + " " + string(q107_24, "%2.0f") ///
	+ " " + string(q107_25, "%2.0f") + " "
gen pos_none = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos,"77")==1,1,0),.)
gen pos_amox = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 1 ")==1,1,0),.)
gen pos_act = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 8 ")==1 | regexm(treatment_pos," 13 ")==1,1,0),.)
gen pos_quin = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 15 ")==1,1,0),.)
gen pos_chloro = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 14 ")==1,1,0),.)
gen pos_injas = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 10 ")==1,1,0),.)
gen pos_sp = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 16 ")==1,1,0),.)
gen pos_ras = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 11 ")==1,1,0),.)
gen pos_ors = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 20 ")==1,1,0),.)
gen pos_para = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos," 21 ")==1,1,0),.)
gen pos_other = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_pos,"96")==1,1,0),.)
label values pos_* yesno

capture noisily svy: tab pos_none					// Treatment of mRDT+ patients: No treatment
capture noisily svy: tab pos_amox					// Treatment of mRDT+ patients: Amoxicillin
capture noisily svy: tab pos_act					// Treatment of mRDT+ patients: ACT
capture noisily svy: tab pos_quin					// Treatment of mRDT+ patients: Quinine
capture noisily svy: tab pos_chloro					// Treatment of mRDT+ patients: Chloroquine
capture noisily svy: tab pos_injas					// Treatment of mRDT+ patients: Injectable Artesunate
capture noisily svy: tab pos_sp						// Treatment of mRDT+ patients: Sulphadoxine-pyrimethamine
capture noisily svy: tab pos_ras					// Treatment of mRDT+ patients: RAS
capture noisily svy: tab pos_ors					// Treatment of mRDT+ patients: ORS
capture noisily svy: tab pos_para					// Treatment of mRDT+ patients: Paracetamol
capture noisily svy: tab pos_other					// Treatment of mRDT+ patients: Other
tab q107_oth						// Please check other responses if they fit into q107's categories

gen treatment_neg = " " + string(q108_1, "%2.0f") + " " + string(q108_2, "%2.0f") ///
	+ " " + string(q108_3, "%2.0f") + " " + string(q108_4, "%2.0f") ///
	+ " " + string(q108_5, "%2.0f") + " " + string(q108_6, "%2.0f") ///
	+ " " + string(q108_7, "%2.0f") + " " + string(q108_8, "%2.0f") ///
	+ " " + string(q108_9, "%2.0f") + " " + string(q108_10, "%2.0f") ///
	+ " " + string(q108_11, "%2.0f") + " " + string(q108_12, "%2.0f") ///
	+ " " + string(q108_13, "%2.0f") + " " + string(q108_14, "%2.0f") ///
	+ " " + string(q108_15, "%2.0f") + " " + string(q108_16, "%2.0f") ///
	+ " " + string(q108_17, "%2.0f") + " " + string(q108_18, "%2.0f") ///
	+ " " + string(q108_19, "%2.0f") + " " + string(q108_20, "%2.0f") ///
	+ " " + string(q108_21, "%2.0f") + " " + string(q108_22, "%2.0f") ///
	+ " " + string(q108_23, "%2.0f") + " " + string(q108_24, "%2.0f") ///
	+ " " + string(q108_25, "%2.0f") + " " 
gen neg_none = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg,"77")==1,1,0),.)
gen neg_amox = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 1 ")==1,1,0),.)
gen neg_act = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 8 ")==1 | regexm(treatment_neg," 13 ")==1,1,0),.)
gen neg_quin = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 15 ")==1,1,0),.)
gen neg_chloro = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 14 ")==1,1,0),.)
gen neg_injas = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 10 ")==1,1,0),.)
gen neg_sp = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 16 ")==1,1,0),.)
gen neg_ras = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 11 ")==1,1,0),.)
gen neg_ors = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 20 ")==1,1,0),.)
gen neg_para = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg," 21 ")==1,1,0),.)
gen neg_other = cond(q105 == 1 |q105 == 2,cond(regexm(treatment_neg,"96")==1,1,0),.)
label values neg_* yesno

capture noisily svy: tab neg_none					// Treatment of mRDT- patients: No treatment
capture noisily svy: tab neg_amox					// Treatment of mRDT- patients: Amoxicillin
capture noisily svy: tab neg_act					// Treatment of mRDT- patients: ACT
capture noisily svy: tab neg_quin					// Treatment of mRDT- patients: Quinine
capture noisily svy: tab neg_chloro					// Treatment of mRDT- patients: Chloroquine
capture noisily svy: tab neg_injas					// Treatment of mRDT- patients: Injectable Artesunate
capture noisily svy: tab neg_sp						// Treatment of mRDT- patients: Sulphadoxine-pyrimethamine
capture noisily svy: tab neg_ras					// Treatment of mRDT- patients: RAS
capture noisily svy: tab neg_ors					// Treatment of mRDT- patients: ORS
capture noisily svy: tab neg_para					// Treatment of mRDT- patients: Paracetamol
capture noisily svy: tab neg_other					// Treatment of mRDT- patients: Other
tab q108_oth						// Please check other responses if they fit into q108's categories

gen treatment_notest = " " + string(q109_1, "%2.0f") + " " + string(q109_2, "%2.0f") ///
	+ " " + string(q109_3, "%2.0f") + " " + string(q109_4, "%2.0f") ///
	+ " " + string(q109_5, "%2.0f") + " " + string(q109_6, "%2.0f") ///
	+ " " + string(q109_7, "%2.0f") + " " + string(q109_8, "%2.0f") ///
	+ " " + string(q109_9, "%2.0f") + " " + string(q109_10, "%2.0f") ///
	+ " " + string(q109_11, "%2.0f") + " " + string(q109_12, "%2.0f") ///
	+ " " + string(q109_13, "%2.0f") + " " + string(q109_14, "%2.0f") ///
	+ " " + string(q109_15, "%2.0f") + " " + string(q109_16, "%2.0f") ///
	+ " " + string(q109_17, "%2.0f") + " " + string(q109_18, "%2.0f") ///
	+ " " + string(q109_19, "%2.0f") + " " + string(q109_20, "%2.0f") ///
	+ " " + string(q109_21, "%2.0f") + " " + string(q109_22, "%2.0f") ///
	+ " " + string(q109_23, "%2.0f") + " " + string(q109_24, "%2.0f") ///
	+ " " + string(q109_25, "%2.0f") + " " 
gen notest_none = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest,"77")==1,1,0),.)
gen notest_amox = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 1 ")==1,1,0),.)
gen notest_act = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 8 ")==1 | regexm(treatment_notest," 13 ")==1,1,0),.)
gen notest_quin = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 15 ")==1,1,0),.)
gen notest_chloro = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 14 ")==1,1,0),.)
gen notest_injas = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 10 ")==1,1,0),.)
gen notest_sp = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 16 ")==1,1,0),.)
gen notest_ras = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 11 ")==1,1,0),.)
gen notest_ors = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 20 ")==1,1,0),.)
gen notest_para = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest," 21 ")==1,1,0),.)
gen notest_other = cond(q105 == 0 |q105 == 2,cond(regexm(treatment_notest,"96")==1,1,0),.)
label values notest_* yesno

capture noisily svy: tab notest_none				// Treatment of patients without test: No treatment
capture noisily svy: tab notest_amox				// Treatment of patients without test: Amoxicillin
capture noisily svy: tab notest_act					// Treatment of patients without test: ACT
capture noisily svy: tab notest_quin				// Treatment of patients without test: Quinine
capture noisily svy: tab notest_chloro				// Treatment of patients without test: Chloroquine
capture noisily svy: tab notest_injas				// Treatment of patients without test: Injectable Artesunate
capture noisily svy: tab notest_sp					// Treatment of patients without test: Sulphadoxine-pyrimethamine
capture noisily svy: tab notest_ras					// Treatment of patients without test: RAS
capture noisily svy: tab notest_ors					// Treatment of patients without test: ORS
capture noisily svy: tab notest_para				// Treatment of patients without test: Paracetamol
capture noisily svy: tab notest_other				// Treatment of patients without test: Other
tab q109_oth						// Please check other responses if they fit into q109's categories

gen treatment_sv = " " + string(q113a1, "%2.0f") + " " + string(q113a2, "%2.0f") ///
	+ " " + string(q113a3, "%2.0f") + " " + string(q113a4, "%2.0f") ///
	+ " " + string(q113a5, "%2.0f") + " " + string(q113a6, "%2.0f") ///
	+ " " + string(q113a7, "%2.0f") + " " + string(q113a8, "%2.0f") ///
	+ " " + string(q113a9, "%2.0f") + " " + string(q113a10, "%2.0f") ///
	+ " " + string(q113a11, "%2.0f") + " " + string(q113a12, "%2.0f") ///
	+ " " + string(q113a13, "%2.0f") + " " + string(q113a14, "%2.0f") ///
	+ " " + string(q113a15, "%2.0f") + " " + string(q113a16, "%2.0f") ///
	+ " " + string(q113a17, "%2.0f") + " " + string(q113a18, "%2.0f") ///
	+ " " + string(q113a19, "%2.0f") + " " + string(q113a20, "%2.0f") ///
	+ " " + string(q113a21, "%2.0f") + " " + string(q113a22, "%2.0f") ///
	+ " " + string(q113a23, "%2.0f") + " " + string(q113a24, "%2.0f") ///
	+ " " + string(q113a25, "%2.0f") + " "
gen sv_none = cond(q110==1,cond(regexm(treatment_sv,"77")==1,1,0),.)
gen sv_amox = cond(q110==1,cond(regexm(treatment_sv," 1 ")==1,1,0),.)
gen sv_act = cond(q110==1,cond(regexm(treatment_sv," 8 ")==1 | regexm(treatment_sv," 13 ")==1,1,0),.)
gen sv_quin = cond(q110==1,cond(regexm(treatment_sv," 15 ")==1,1,0),.)
gen sv_chloro = cond(q110==1,cond(regexm(treatment_sv," 14 ")==1,1,0),.)
gen sv_injas = cond(q110==1,cond(regexm(treatment_sv," 10 ")==1,1,0),.)
gen sv_sp = cond(q110==1,cond(regexm(treatment_sv," 16 ")==1,1,0),.)
gen sv_ras = cond(q110==1,cond(regexm(treatment_sv," 11 ")==1,1,0),.)
gen sv_ors = cond(q110==1,cond(regexm(treatment_sv," 20 ")==1,1,0),.)
gen sv_para = cond(q110==1,cond(regexm(treatment_sv," 21 ")==1,1,0),.)
gen sv_other = cond(q110==1,cond(regexm(treatment_sv,"96")==1,1,0),.)
label values sv_* yesno

capture noisily svy: tab sv_none				// Treatment of patients with severe malaria: No treatment
capture noisily svy: tab sv_amox				// Treatment of patients with severe malaria: Amoxicillin
capture noisily svy: tab sv_act					// Treatment of patients with severe malaria: ACT
capture noisily svy: tab sv_quin				// Treatment of patients with severe malaria: Quinine
capture noisily svy: tab sv_chloro				// Treatment of patients with severe malaria: Chloroquine
capture noisily svy: tab sv_injas				// Treatment of patients with severe malaria: Injectable Artesunate
capture noisily svy: tab sv_sp					// Treatment of patients with severe malaria: Sulphadoxine-pyrimethamine
capture noisily svy: tab sv_ras					// Treatment of patients with severe malaria: RAS
capture noisily svy: tab sv_ors					// Treatment of patients with severe malaria: ORS
capture noisily svy: tab sv_para				// Treatment of patients with severe malaria: Paracetamol
capture noisily svy: tab sv_other				// Treatment of patients with severe malaria: Other
tab q113a_oth					// Please check other responses if they fit into q113a's categories

capture noisily svy: tab q114					// Did any patients with fever and danger signs receive RAS?
gen reason_noras = " " + string(q115_1, "%2.0f") + " " + string(q115_2, "%2.0f") ///
	+ " " + string(q115_3, "%2.0f") + " " + string(q115_4, "%2.0f") ///
	+ " " + string(q115_5, "%2.0f") + " " + string(q115_6, "%2.0f") ///
	+ " " + string(q115_7, "%2.0f") + " "
gen noras_refer = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras," 1 ")==1,1,0),.)
gen noras_stockout = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras," 2 ")==1,1,0),.)
gen noras_hwdk = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras," 3 ")==1,1,0),.)
gen noras_concern = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras," 4 ")==1,1,0),.)
gen noras_notused = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras," 5 ")==1,1,0),.)
gen noras_other = cond(q114 == 0 | q114 == 2,cond(regexm(reason_noras,"96")==1,1,0),.)
	
capture noisily svy: tab noras_refer		// Reason for not treating severe malaria patients with RAS: Children were not referred
capture noisily svy: tab noras_stockout		// Reason for not treating severe malaria patients with RAS: RAS was out of stock / not sufficiently available
capture noisily svy: tab noras_hwdk			// Reason for not treating severe malaria patients with RAS: Health worker does not know how to administer RAS
capture noisily svy: tab noras_concern		// Reason for not treating severe malaria patients with RAS: Health worker has concerns about giving RAS
capture noisily svy: tab noras_notused		// Reason for not treating severe malaria patients with RAS: RAS not commonly used at HF
capture noisily svy: tab noras_other		// Reason for not treating severe malaria patients with RAS: Other
tab q115_oth					// Please check other responses if they fit into q115's categories

capture noisily svy: tab q116	// Did any patient who received RAS receive more than one dose?
capture noisily svy: tab q117	// Why did these patients receive more than one dose?
svy: tab q118					// Referral of patients with fever and danger signs to higher level HF in past 14 days
svy: tab q60					// Heard about suppositories
svy: tab q61					// Acceptance of suppositories / rectal treatment 
svy: tab q63					// Heard about RAS
svy: tab q64					// RAS used at facility

*** TABLE 6: REFERRALS ***

svy: tab q81					// Are patients referred further by this health care provider?
svy: tab q82a					// Where are patients referred to?
gen reasons_ref = " " + string(q84_1, "%2.0f") + " " + string(q84_2, "%2.0f") ///
	+ " " + string(q84_3, "%2.0f") + " " + string(q84_4, "%2.0f") ///
	+ " " + string(q84_5, "%2.0f") + " " 
gen ref_ds = cond(q81==1,cond(regexm(reasons_ref," 1 ")==1,1,0),.)
gen ref_dk = cond(q81==1,cond(regexm(reasons_ref," 2 ")==1,1,0),.)
gen ref_time = cond(q81==1,cond(regexm(reasons_ref," 3 ")==1,1,0),.)
gen ref_supply = cond(q81==1,cond(regexm(reasons_ref," 4 ")==1,1,0),.)
gen ref_other = cond(q81==1,cond(regexm(reasons_ref,"96")==1,1,0),.)
label values ref_* yesno
	
capture noisily svy: tab ref_ds						// Reasons for referral: Child is severely ill / has a danger sign.
capture noisily svy: tab ref_dk						// Reasons for referral: Don't know how to treat them / non-iCCM condition.
capture noisily svy: tab ref_time					// Reasons for referral: Lack of time / high caseload
capture noisily svy: tab ref_supply					// Reasons for referral: Lack of supply
capture noisily svy: tab ref_other					// Reasons for referral: Other
tab q84_oth							// Please check other responses if they fit into q84's categories

gen reasons_noref = " " + string(q83_1, "%2.0f") + " " + string(q83_2, "%2.0f") ///
	+ " " + string(q83_3, "%2.0f") + " " + string(q83_4, "%2.0f") ///
	+ " " + string(q83_5, "%2.0f") + " " + string(q83_6, "%2.0f") + " "
gen noref_cost = cond(q81 == 0,cond(regexm(reasons_noref," 1 ")==1,1,0),.)
gen noref_quality = cond(q81 == 0,cond(regexm(reasons_noref," 2 ")==1,1,0),.)
gen noref_access = cond(q81 == 0,cond(regexm(reasons_noref," 3 ")==1,1,0),.)
gen noref_nochild = cond(q81 == 0,cond(regexm(reasons_noref,"77")==1,1,0),.)
gen noref_other = cond(q81 == 0,cond(regexm(reasons_noref,"96")==1,1,0),.)	
label values noref_* yesno

capture noisily svy: tab noref_cost			// Reasons for no referral: Costs
capture noisily svy: tab noref_quality		// Reasons for no referral: Quality of care
capture noisily svy: tab noref_access		// Reasons for no referral: Accessibility
capture noisily svy: tab noref_nochild		// Reasons no referral: I never see children that need referral
capture noisily svy: tab noref_other		// Reasons for no referral: Other
tab q83_oth					// Please check other responses if they fit into q83's categories
							// Distance to referral facility: see below (HF Checklist)
