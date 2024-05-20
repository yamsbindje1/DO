**** HCPS - CHW TOOL: DRC ****

* Open dataset
use "Yams:\58 CARAMAL\8. Results\8.2. Raw data\DRC\CHW_FORM_v4_DRC.dta", clear

*-------------------------------------------------------------------------------*
/* Description of sampling strategy: 
In the three Health Zones (Ipamu, Kenge and Kingandu), all the 28 Community Health Sites 
Site de Soins Communautaires) were automatically sampled (because of their small number). 
In addition to that, within each Community Health Site, one CHW was interviewed. Community
Health Sites usually consist of 2 CHWs of which one is on duty/present. The CHW that was 
on duty/present at the time of the survey was interview.  */

* svyset: 
* clustering: Health Zones
* weighting: NA											
svyset provider_id_no, strata(level2) 

*-------------------------------------------------------------------------------*

label define yesno 1 "Yes" 0 "No", replace
label define yesnona 1 "Yes" 0 "No" -99 "NA", replace

*** TABLE 1: CHARACTERISTICS OF HEALTH CARE PROVIDERS INTERVIEWED ***

qui summarize age 				// Age
egen agecat = cut(age), at(`r(min)', 30, 40, 50, 60, 100) label
tab agecat	 	  				// Age in categories
tab gender						// Sex
tab q1, m 						// Main occupation
tab q1_oth						// Please check other responses if they fit into q1's categories
egen workcat = cut(q3), at(0,1,3,6,100) label
tab workcat, m					// Years working as a health worker
tab q30, m						// Access to / use of guidelines for treatment of malaria
tab q30_oth						// Please check other responses if they fit into q30's categories
gen any_salary = cond(zq26==1 | zq27==1,1,0)			
label values any_salary yesno
tab any_salary, m				// Salaries / incentives

*** TABLE 2: CHARACTERISTICS OF HEALTH FACILITIES AND COMMUNITY HEALTH SITES SURVEYED ***

gen any_payment=cond(zq30==1 | zq30a==1,1,0)
label values any_payment yesno
tab any_payment, m				// Do patients have to pay for medical services and / or drugs?
tab q16, m						// Supervision: Who is conducting supervision visits?
tab q16_oth						// Please check other responses if they fit into q16's categories
tab q18, m						// Supervision: At least one supervisory visit in the past 6 months
preserve
stack zq79a zq79b zq79c, into(zq79_stat) clear 
tabstat zq79_stat if zq79_stat>=0, statistics(n mean sd med min max) columns(variables)
restore							// Number of consultations with children <5 years per month
preserve
stack zq82a zq82b zq82c, into(zq82_stat) clear 
tabstat zq82_stat if zq82_stat>=0, statistics(n mean sd med min max) columns(variables)
restore							// Number of children <5 with confirmed malaria per month
preserve
stack zq83a zq83b zq83c, into(zq83_stat) clear 
tabstat zq83_stat if zq83_stat>=0, statistics(n mean sd med min max) columns(variables)
restore							// Number of children <5 with fever and danger signs per month
tab zq12, m						// Mobile network available

*** TABLE 3: AVAILABILITY AND QUALITY OF TREATMENT FOR SEVERE AND UNCOMPLICATED MALARIA ***

gen mrdt = cond(zq37>0,1,0)
label values mrdt yesno
tab mrdt, m						// Availability of diagnostics: mRDT
tab zq39, m						// Availability of diagnostics: mRDT stock-outs in the last 12 months
tabstat zq40, statistics(n mean sd med min max) columns(variables)
								// Mean cumulative number of months of RDT stock-outs in the previous 12 months
gen power = cond(zq14_1!=-99,1,0)
label values power yesno
tab power						// Power (%)
tab zq42, m						// Working thermometer
tab zq45, m						// Working body weight scale - infant
tab zq47, m						// Disinfectant
tab zq48, m						// Working fridge
gen alu = cond(zq60>0,1,cond(zq60==0,0,cond(zq60==-99,-99,.)))
label values alu yesnona
tab alu, m						// Availability of drugs: AL in stock on day of survey
gen asaq = cond(zq61>0,1,cond(zq61==0,0,cond(zq61==-99,-99,.)))
label values asaq yesnona
tab asaq, m						// Availability of drugs: ASAQ in stock on day of survey
gen asmq = cond(zq62>0,1,cond(zq62==0,0,cond(zq62==-99,-99,.)))
label values asmq yesnona
tab asmq, m						// Availability of drugs: ASMQ in stock on day of survey
tab zq65, m						// Availability of drugs: Complete ACT stock-outs in previous 12 months
* tab zq67, m					// Availability of drugs: RAS in stock on day of survey
tab zq75, m						// Availability of drugs: Zinc in stock on day of survey
tab zq76, m						// Availability of drugs: ORS in stock on day of survey
tab zq77, m						// Availability of durgs: Paracetamol in stock on day of survey
tab zq23, m						// Availability of job aids for performing mRDT, danger signs, administration of treatment etc.

*** TABLE 4: TRAINING STATUS AND KNOWLEDGE OF MALARIA CARE BY HEALTH CARE PROVIDER ***

** Trainings **

tab q5, m						// Provision of (initial) professional training
tab q5_oth						// Please check other responses if they fit into q5's categories
tab q8							// When di you last attend a CHW training?
gen training_topic = " " + string(q8a1, "%2.0f") + " " + string(q8a2, "%2.0f") ///
	+ " " + string(q8a3, "%2.0f") + " " + string(q8a4, "%2.0f") ///
	+ " " + string(q8a5, "%2.0f") + " " + string(q8a6, "%2.0f") ///
	+ " " + string(q8a7, "%2.0f") + " " + string(q8a8, "%2.0f") ///
	+ " " + string(q8a9, "%2.0f") + " " + string(q8a10, "%2.0f") ///
	+ " " + string(q8a11, "%2.0f") + " " + string(q8a12, "%2.0f") + " " 
gen train_iccm = cond(regexm(training_topic," 1 ")==1,1,0)
gen train_malaria = cond(regexm(training_topic," 2 ")==1,1,0)
gen train_pneumonia = cond(regexm(training_topic," 3 ")==1,1,0)
gen train_diarrhea = cond(regexm(training_topic," 4 ")==1,1,0)
gen train_child = cond(regexm(training_topic," 5 ")==1,1,0)
* gen train_ras = cond(regexm(training_topic," 6 ")==1 | q9a == 1,1,0)
gen train_rdt = cond(regexm(training_topic," 7 ")==1,1,0)
gen train_assess = cond(regexm(training_topic," 8 ")==1,1,0)
gen train_treat = cond(regexm(training_topic," 9 ")==1,1,0)
gen train_promotion = cond(regexm(training_topic," 10 ")==1,1,0)
gen train_other = cond(regexm(training_topic,"-96")==1,1,0)
gen train_dk = cond(regexm(training_topic,"-98")==1,1,0)

label values train_iccm train_malaria train_pneumonia train_diarrhea ///
	train_child train_rdt train_assess train_treat train_promotion ///
	train_other train_dk yesno
*label values train_ras yesno

tab train_iccm					// Training topic: iCCM (%)
tab train_malaria				// Training topic: Malaria (%)
tab train_pneumonia				// Training topic: Pneumonia (%)
tab train_diarrhea				// Training topic: Diarrhea (%)
tab train_child					// Training topic: Childhood illnesses (%)
*tab train_ras					// Training topic: RAS (%)
tab train_rdt					// Training topic: mRDT use (%)
tab train_assess				// Training topic: Assessing children (%)
tab train_treat					// Training topic: Treating children (%)
tab train_promotion				// Training topic: Health promotion (%)
tab train_other					// Training topic: Other, specify (%)
tab train_dk					// Training topic: Don't know (%)
tab q8a_oth						// Please check other responses if they fit into q8a's categories

*tab q9b						// When did you last attend a RAS training?
tabstat q10a if q10a >= 0, statistics(n mean sd med min max) columns(variables) 		
								// Number of trainings received in past 12 months: iCCM
*tabstat q9c of q9c >= 0, statistics(n mean sd med min max) columns(variables)					
								// Number of trainings received in past 12 months: RAS
gen further_training = " " + string(q15a1, "%2.0f") + " " + string(q15a2, "%2.0f") ///
	+ " " + string(q15a3, "%2.0f") + " " + string(q15a4, "%2.0f") ///
	+ " " + string(q15a5, "%2.0f") + " " + string(q15a6, "%2.0f") ///
	+ " " + string(q15a7, "%2.0f")  + " " // + string(q15a8, "%2.0f") + " "	//(add if "Referring" was one of the answer options)
gen futrain_patient = cond(regexm(further_training," 1 ")==1,1,0)
gen futrain_medicine = cond(regexm(further_training," 2 ")==1,1,0)
gen futrain_promotion = cond(regexm(further_training," 3 ")==1,1,0)
gen futrain_records = cond(regexm(further_training," 4 ")==1,1,0)
gen futrain_refer = cond(regexm(further_training," 5 ")==1,1,0)
gen futrain_other = cond(regexm(further_training,"-96")==1,1,0)
label values futrain_* yesno

tab futrain_patient					// Further training: Treatment and diagnosis of patients (%)
tab futrain_medicine				// Further training: Medicine management (%)
tab futrain_promotion				// Further training: Health promotion activities (%)
tab futrain_records					// Further training: Records keeping (%)
tab futrain_refer					// Further training: Referring (%)
tab futrain_other					// Further training: Other, specify (%)
tab q15a_oth						// Please check other responses if they fit into q15a's categories

** Knowledge assessment **

gen q39_sum = cond(q39_1>0 & q39_1!=.,1,0) + cond(q39_2>0 & q39_2!=.,1,0) ///
	 + cond(q39_3>0 & q39_3!=.,1,0) + cond(q39_4>0 & q39_4!=.,1,0) ///
	 + cond(q39_5>0 & q39_5!=.,1,0) + cond(q39_6>0 & q39_6!=.,1,0) ///
	 + cond(q39_7>0 & q39_7!=.,1,0) + cond(q39_8>0 & q39_8!=.,1,0) ///
	 + cond(q39_9>0 & q39_9!=.,1,0) + cond(q39_10>0 & q39_10!=.,1,0) ///
	 + cond(q39_11>0 & q39_11!=.,1,0) + cond(q39_12>0 & q39_12!=.,1,0) ///
	 + cond(q39_13>0 & q39_13!=.,1,0)
gen knowledge_DS3 = cond(q39_sum >= 3,1,0)	// iCCM danger signs: 
gen knowledge_DS11 = cond(q39_sum == 11,1,0) 
label values knowledge_DS* yesno
tab knowledge_DS3					// At least 3 of 11 items (%)
tab knowledge_DS11					// All 11 items (%)
tab q39_oth							// Please check other responses if they fit into q39's categories

gen malaria_diagno = " " + string(q33_1, "%2.0f") + " " + string(q33_2, "%2.0f") ///
	+ " " + string(q33_3, "%2.0f") + " " + string(q33_4, "%2.0f") ///
	+ " " + string(q33_5, "%2.0f") + " "
gen diagn_micro = cond(regexm(malaria_diagno," 1 ")==1,1,0)
gen diagn_rdt = cond(regexm(malaria_diagno," 2 ")==1,1,0)
gen diagn_physical = cond(regexm(malaria_diagno," 3 ")==1,1,0)
gen diagn_other = cond(regexm(malaria_diagno,"-96")==1,1,0)
label values diagn_* yesno

tab diagn_micro						// Malaria diagnosis: Microscopy
tab diagn_rdt						// Malaria diagnosis: mRDT
tab diagn_physical					// Malaria diagnosis: Physical observation
tab diagn_other					// Malaria diagnosis: Other
tab q33_oth							// Please check other responses if they fit into q33's categories

gen malaria_signs = " " + string(q33a1, "%2.0f") + " " + string(q33a2, "%2.0f") ///
	+ " " + string(q33a3, "%2.0f") + " " + string(q33a4, "%2.0f") ///
	+ " " + string(q33a5, "%2.0f") + " " + string(q33a6, "%2.0f") ///
	+ " " + string(q33a7, "%2.0f") + " " + string(q33a8, "%2.0f") ///
	+ " " + string(q33a9, "%2.0f") + " " + string(q33a10, "%2.0f") ///
	+ " " + string(q33a11, "%2.0f") + " " + string(q33a12, "%2.0f") ///
	+ " " + string(q33a13, "%2.0f") + " " + string(q33a14, "%2.0f") ///
	+ " " + string(q33a15, "%2.0f") + " " + string(q33a16, "%2.0f") ///
	+ " " + string(q33a17, "%2.0f") + " " // + string(q33a18, "%2.0f") + " " + string(q33a19, "%2.0f") + " " // ( add if "Loss of appetite" and "Jaundice" were answer options)
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
gen sign_convuls = cond(regexm(malaria_signs," 11 ")==1,1,0)
gen sign_shiver = cond(regexm(malaria_signs," 12 ")==1,1,0)
gen sign_conscious = cond(regexm(malaria_signs," 13 ")==1,1,0)
gen sign_fever = cond(regexm(malaria_signs," 14 ")==1,1,0)
gen sign_appetite = cond(regexm(malaria_signs," 15 ")==1,1,0)
gen sign_jaundice = cond(regexm(malaria_signs," 16 ")==1,1,0)
gen sign_none = cond(regexm(malaria_signs,"77")==1,1,0)
gen sign_other = cond(regexm(malaria_signs,"96")==1,1,0)
label values sign_* yesno

tab sign_headache				// Malaria signs: Headache
tab sign_dizzy					// Malaria signs: Dizziness
tab sign_cough					// Malaria signs: Cough
tab sign_sputum					// Malaria signs: Cough with sputum
tab sign_breathing				// Malaria signs: Difficulty in breathing
tab sign_nausea					// Malaria signs: Nausea
tab sign_vomit					// Malaria signs: Vomiting
tab sign_diarrhea				// Malaria signs: Diarrhoea
tab sign_stomach				// Malaria signs: Stomach ache
tab sign_skin					// Malaria signs: Skin rash
tab sign_convuls				// Malaria signs: Convulsions
tab sign_shiver					// Malaria signs: Shivering
tab sign_conscious				// Malaria signs: Loss of consciousness
tab sign_fever					// Malaria signs: Fever
*tab sign_appetite				// Malaria signs: Loss of appetite
*tab sign_jaundice				// Malaria signs: Jaundice
tab sign_none					// Malaria signs: None
tab sign_other					// Malaria signs: Other
tab q33a_oth					// Please check other responses if they fit into q33a's categories

gen q34_sum = cond(q34==1,1,0) + cond(q35==1,1,0) + cond(q36==1,1,0) + cond(q37==1,1,0) + cond(q38==1,1,0) 
gen rdtcheck3 = cond(q34_sum >= 3,1,0)	// Correct performance and interpretation of mRDT:
gen rdtcheck5 = cond(q34_sum == 5,1,0)
label values rdtcheck* yesno
tab rdtcheck3					// At least 3 of 5 items (%)
tab rdtcheck5					// All 5 items (%)

*** TABLE 5: TREATMENT ATTITUDES AND PRACTICE, RAS KNOWLEDGE AND ACCEPTABILITY ***

** Attitudes and beliefs towards malaria management **

tab q71, m						// Test for presence of danger signs
*tab q72, m						// Second dose of RAS if referral is delayed
*tab q73, m						// Less urgency of referral after RAS
*tab q74, m						// RAS can be continued until oral treatment is possible
tab q76, m						// Nets prevent mosquito bites and malaria transmission
tab q77, m						// Referral note more important than explaining reason for referral
*tab q78, m						// RAS can replace injectable AS
*tab q79, m						// RAS recommended for all patients with signs of malaria

** Treatment practice **
tab q82							// Patients with fever tested with mRDT in past 14 days
gen reason_notest = " " + string(q83_1, "%2.0f") + " " + string(q83_2, "%2.0f") ///
	+ " " + string(q83_3, "%2.0f") + " " + string(q83_4, "%2.0f") ///
	+ " " + string(q83_5, "%2.0f") + " "
gen reason_nt_tests = cond(q82 == 0 |q82 == 2,cond(regexm(reason_notest," 1 ")==1,1,0),.)
gen reason_nt_refused = cond(q82 == 0 |q82 == 2,cond(regexm(reason_notest," 2 ")==1,1,0),.)
gen reason_nt_referral = cond(q82 == 0 |q82 == 2,cond(regexm(reason_notest," 3 ")==1,1,0),.)
gen reason_nt_other = cond(q82 == 0 |q82 == 2,cond(regexm(reason_notest,"96")==1,1,0),.)
label values reason_nt_* yesno

tab reason_nt_tests				// Reason for not testing (all) patients (q83): No tests available
tab reason_nt_refused			// Reason for not testing (all) patients (q83): Caregiver refused
tab reason_nt_referral			// Reason for not testing (all) patients (q83): Child needs urgent referral
tab reason_nt_other				// Reason for not testing (all) patients (q83): Other
tab q83_oth						// Please check other responses if they fit into q83's categories

tab q84							// Patients with fever and danger signs tested with mRDT in past 14 days
gen reason_notest2 = " " + string(q85_1, "%2.0f") + " " + string(q85_2, "%2.0f") ///
	+ " " + string(q85_3, "%2.0f") + " " + string(q85_4, "%2.0f") ///
	+ " " + string(q85_5, "%2.0f") + " "
gen reason_nt_tests2 = cond(q84 == 0 |q84 == 2,cond(regexm(reason_notest2," 1 ")==1,1,0),.)
gen reason_nt_refused2 = cond(q84 == 0 |q84 == 2,cond(regexm(reason_notest2," 2 ")==1,1,0),.)
gen reason_nt_referral2 = cond(q84 == 0 |q84 == 2,cond(regexm(reason_notest2," 3 ")==1,1,0),.)
gen reason_nt_other2 = cond(q84 == 0 |q84 == 2,cond(regexm(reason_notest2,"96")==1,1,0),.)
label values reason_nt_* yesno

tab reason_nt_tests2			// Reason for not testing (all) patients (q85): No tests available
tab reason_nt_refused2			// Reason for not testing (all) patients (q85): Caregiver refused
tab reason_nt_referral2			// Reason for not testing (all) patients (q85): Child needs urgent referral
tab reason_nt_other2			// Reason for not testing (all) patients (q85): Other
tab q85_oth						// Please check other responses if they fit into q85's categories

gen treatment_pos = " " + string(q86a1, "%2.0f") + " " + string(q86a2, "%2.0f") ///
	+ " " + string(q86a3, "%2.0f") + " " + string(q86a4, "%2.0f") ///
	+ " " + string(q86a5, "%2.0f") + " " + string(q86a6, "%2.0f") ///
	+ " " + string(q86a7, "%2.0f") + " " + string(q86a8, "%2.0f") ///
	+ " " + string(q86a9, "%2.0f") + " " + string(q86a10, "%2.0f") + " "
gen pos_none = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos,"77")==1,1,0),.)
gen pos_amox = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 1 ")==1,1,0),.)
gen pos_act = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 2 ")==1,1,0),.)
gen pos_ras = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 3 ")==1,1,0),.)
gen pos_ors = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 4 ")==1,1,0),.)
gen pos_zinc = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 5 ")==1,1,0),.)
gen pos_para = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos," 6 ")==1,1,0),.)
gen pos_other = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_pos,"96")==1,1,0),.)
label values pos_* yesno

tab pos_none					// Treatment of mRDT+ patients: No treatment
tab pos_amox					// Treatment of mRDT+ patients: Amoxicillin
tab pos_act						// Treatment of mRDT+ patients: ACT
tab pos_ras						// Treatment of mRDT+ patients: RAS
tab pos_ors						// Treatment of mRDT+ patients: ORS
tab pos_zinc					// Treatment of mRDT+ patients: Zinc
tab pos_para					// Treatment of mRDT+ patients: Paracetamol
tab pos_other					// Treatment of mRDT+ patients: Other
tab q86a_oth					// Please check other responses if they fit into q86a's categories

gen treatment_neg = " " + string(q86b1, "%2.0f") + " " + string(q86b2, "%2.0f") ///
	+ " " + string(q86b3, "%2.0f") + " " + string(q86b4, "%2.0f") ///
	+ " " + string(q86b5, "%2.0f") + " " + string(q86b6, "%2.0f") ///
	+ " " + string(q86b7, "%2.0f") + " " + string(q86b8, "%2.0f") ///
	+ " " + string(q86b9, "%2.0f") + " " + string(q86b10, "%2.0f") + " "
gen neg_none = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg,"77")==1,1,0),.)
gen neg_amox = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 1 ")==1,1,0),.)
gen neg_act = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 2 ")==1,1,0),.)
gen neg_ras = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 3 ")==1,1,0),.)
gen neg_ors = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 4 ")==1,1,0),.)
gen neg_zinc = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 5 ")==1,1,0),.)
gen neg_para = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg," 6 ")==1,1,0),.)
gen neg_other = cond(q82 == 1 |q82 == 2,cond(regexm(treatment_neg,"96")==1,1,0),.)
label values neg_* yesno

tab neg_none					// Treatment of mRDT- patients: No treatment
tab neg_amox					// Treatment of mRDT- patients: Amoxicillin
tab neg_act						// Treatment of mRDT- patients: ACT
tab neg_ras						// Treatment of mRDT- patients: RAS
tab neg_ors						// Treatment of mRDT- patients: ORS
tab neg_zinc					// Treatment of mRDT- patients: Zinc
tab neg_para					// Treatment of mRDT- patients: Paracetamol
tab neg_other					// Treatment of mRDT- patients: Other
tab q86b_oth					// Please check other responses if they fit into q86b's categories

gen treatment_notest = " " + string(q87_1, "%2.0f") + " " + string(q87_2, "%2.0f") ///
	+ " " + string(q87_3, "%2.0f") + " " + string(q87_4, "%2.0f") ///
	+ " " + string(q87_5, "%2.0f") + " " + string(q87_6, "%2.0f") ///
	+ " " + string(q87_7, "%2.0f") + " " + string(q87_8, "%2.0f") ///
	+ " " + string(q87_9, "%2.0f") + " " + string(q87_10, "%2.0f") + " "
gen notest_none = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest,"77")==1,1,0),.)
gen notest_amox = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest," 1 ")==1,1,0),.)
gen notest_act = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest," 2 ")==1,1,0),.)
gen notest_ras = cond(q82 == 0 | q82 == 2,cond(regexm(treatment_notest," 3 ")==1,1,0),.)
gen notest_ors = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest," 4 ")==1,1,0),.)
gen notest_zinc = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest," 5 ")==1,1,0),.)
gen notest_para = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest," 6 ")==1,1,0),.)
gen notest_other = cond(q82 == 0 |q82 == 2,cond(regexm(treatment_notest,"96")==1,1,0),.)
label values notest_* yesno

tab notest_none					// Treatment of patients without test: No treatment
tab notest_amox					// Treatment of patients without test: Amoxicillin
tab notest_act					// Treatment of patients without test: ACT
tab notest_ras					// Treatment of patients without test: RAS
tab notest_ors					// Treatment of patients without test: ORS
tab notest_zinc					// Treatment of patients without test: Zinc
tab notest_para					// Treatment of patients without test: Paracetamol
tab notest_other				// Treatment of patients without test: Other
tab q87_oth						// Please check other responses if they fit into q87's categories

gen treatment_ds = " " + string(q88_1, "%2.0f") + " " + string(q88_2, "%2.0f") ///
	+ " " + string(q88_3, "%2.0f") + " " + string(q88_4, "%2.0f") ///
	+ " " + string(q88_5, "%2.0f") + " " + string(q88_6, "%2.0f") ///
	+ " " + string(q88_7, "%2.0f") + " " + string(q88_8, "%2.0f") ///
	+ " " + string(q88_9, "%2.0f") + " " + string(q88_10, "%2.0f") + " "
gen ds_none = cond(q81 == 1,cond(regexm(treatment_ds,"77")==1,1,0),.)
gen ds_amox = cond(q81 == 1,cond(regexm(treatment_ds," 1 ")==1,1,0),.)
gen ds_act = cond(q81 == 1,cond(regexm(treatment_ds," 2 ")==1,1,0),.)
gen ds_ras = cond(q81 == 1,cond(regexm(treatment_ds," 3 ")==1,1,0),.)
gen ds_ors = cond(q81 == 1,cond(regexm(treatment_ds," 4 ")==1,1,0),.)
gen ds_zinc = cond(q81 == 1,cond(regexm(treatment_ds," 5 ")==1,1,0),.)
gen ds_para = cond(q81 == 1,cond(regexm(treatment_ds," 6 ")==1,1,0),.)
gen ds_other = cond(q81 == 1,cond(regexm(treatment_ds,"96")==1,1,0),.)
label values ds_* yesno

tab ds_none					// Treatment of patients with danger signs: No treatment
tab ds_amox					// Treatment of patients with danger signs: Amoxicillin
tab ds_act					// Treatment of patients with danger signs: ACT
tab ds_ras					// Treatment of patients with danger signs: RAS
tab ds_ors					// Treatment of patients with danger signs: ORS
tab ds_zinc					// Treatment of patients with danger signs: Zinc
tab ds_para					// Treatment of patients with danger signs: Paracetamol
tab ds_other				// Treatment of patients with danger signs: Other
tab q88_oth					// Please check other responses if they fit into q88's categories

*tab q89a						// Did any patients with fever and danger signs receive RAS?
*tab q89b						// Why did you not treat (all) patients with fever and danger signs/severe malaria with RAS?
*tab q90						// Did any patient who received RAS receive more than one dose?
*tab q91						// Why did these patients receive more than one dose?

egen distance_rhf = cut(zq6), at(0,2,5.1,10.1,20.1,100) label
tab q100 distance_rhf, col		// Referral of patients with fever and danger signs to higher level HF in past 14 days
tab q41							// Heard about suppositories
tab q42							// Acceptance of suppositories / rectal treatment 
tab q44							// Heard about RAS
*tab q45						// RAS prescribed by CHW

*** TABLE 6: REFERRALS ***

tab q60 distance_rhf, m col		// Are patients referred further by this health care provider?
tab q61a distance_rhf, col		// Where are patients referred to?
gen reasons_ref = " " + string(q62b1, "%2.0f") + " " + string(q62b2, "%2.0f") ///
	+ " " + string(q62b3, "%2.0f") + " " + string(q62b4, "%2.0f") ///
	+ " " + string(q62b5, "%2.0f") + " "
gen ref_ds = cond(q60 == 1,cond(regexm(reasons_ref," 1 ")==1,1,0),.)
gen ref_dk = cond(q60 == 1,cond(regexm(reasons_ref," 2 ")==1,1,0),.)
gen ref_time = cond(q60 == 1,cond(regexm(reasons_ref," 3 ")==1,1,0),.)
gen ref_supply = cond(q60 == 1,cond(regexm(reasons_ref," 4 ")==1,1,0),.)
gen ref_other = cond(q60 == 1,cond(regexm(reasons_ref,"96")==1,1,0),.)	
label values ref_* yesno
	
tab ref_ds						// Reasons for referral: Child is severely ill / has a danger sign.
tab ref_dk						// Reasons for referral: Don't know how to treat them / non-iCCM condition.
tab ref_time					// Reasons for referral: Lack of time / high caseload
tab ref_supply					// Reasons for referral: Lack of supply
tab ref_other					// Reasons for referral: Other
tab q62b_oth					// Please check other responses if they fit into q62b's categories

gen reasons_noref = " " + string(q62a1, "%2.0f") + " " + string(q62a2, "%2.0f") ///
	+ " " + string(q62a3, "%2.0f") + " " + string(q62a4, "%2.0f") ///
	+ " " + string(q62a5, "%2.0f") + " " + string(q62a6, "%2.0f") + " "
gen noref_cost = cond(q60 == 0,cond(regexm(reasons_noref," 1 ")==1,1,0),.)
gen noref_quality = cond(q60 == 0,cond(regexm(reasons_noref," 2 ")==1,1,0),.)
gen noref_access = cond(q60 == 0,cond(regexm(reasons_noref," 3 ")==1,1,0),.)
gen noref_nochild = cond(q60 == 0,cond(regexm(reasons_noref,"77")==1,1,0),.)
gen noref_other = cond(q60 == 0,cond(regexm(reasons_noref,"96")==1,1,0),.)	
label values noref_* yesno

tab noref_cost						// Reasons for no referral: Costs
tab noref_quality					// Reasons for no referral: Quality of care
tab noref_access					// Reasons for no referral: Accessibility
tab noref_nochild					// Reasons no referral: I never see children that need referral
tab noref_other						// Reasons for no referral: Other
tab q62a_oth						// Please check other responses if they fit into q62a's categories
tab distance_rhf					// Distance to referral facility
