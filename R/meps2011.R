#' 2011 Medical Expenditure Panel Survey (MEPS) Full Year Consolidated Data File.
#' @source \url{http://meps.ahrq.gov/mepsweb/}
#' 
#' A cleaned up version of the MEPS with all missing values removed. 
#' Many features have either been removed or collapsed into single 
#' features. The features are as follows:
#' 
#' \itemize{
#'   \item dupersid. PERSON ID (DUID + PID)
#'   \item perwtf. FINAL PERSON SURVEY WEIGHT
#'   \item duid. DWELLING UNIT ID
#'   \item region. CENSUS REGION; 1=N, 2=MW, 3=S, 4=W
#'   \item povcat. FAMILY INC AS % OF POVERTY LINE
#'   \item msa. 1=METROPOLITAN STATISTICAL AREA
#'   \item sex. 1=FEMALE
#'   \item age. AGE AT END OF YEAR
#'   \item racex. RACE \itemize{
#'          \item 1 =  WHITE
#'          \item 2 = BLACK
#'          \item 3 = AMER INDIAN/ALASKA NATIVE
#'          \item 4 = ASIAN
#'          \item 5 = NATIVE HAWAIIAN/PACIFIC ISLANDER
#'          \item 6 = MULTIPLE RACES}
#'   \item hispanx. 1=HISPANIC ETHNICITY
#'   \item marry. MARITAL STATUS \itemize{
#'          \item 1 = MARRIED
#'          \item 2 = WIDOWED
#'          \item 3 = DIVORCED
#'          \item 4 = SEPARATED
#'          \item 5 = NEVER MARRIED}
#'   \item educyr. YEARS OF EDUC WHEN FIRST ENTERED MEPS
#'   \item hideg. \itemize{
#'          \item 1 = NO DEGREE
#'          \item 2 = GED
#'          \item 3 = HIGH SCHOOL DIPLOMA
#'          \item 4 = BACHELOR'S DEGREE
#'          \item 5 = MASTER'S DEGREE
#'          \item 6 = DOCTORATE DEGREE
#'          \item 7 = OTHER DEGREE}
#'   \item bpmldx. MULT DIAG HIGH BLOOD PRESSURE
#'   \item angidx. ANGINA DIAGNOSIS
#'   \item midx. MYOCARDIAL INFARCTION DIAGNOSIS
#'   \item ohrtdx. OTHER HEART RELATED DIAGNOSIS
#'   \item strkdx. STROKE DIAGNOSIS
#'   \item emphdx. EMPHEZYMA DIAGNOSIS
#'   \item choldx. HIGH CHOLESTEROL DIAGNOSIS
#'   \item cancerdx. CANCER DIAGNOSIS
#'   \item diabdx. DIABETES DIAGNOSIS
#'   \item arthdx. ARTHRITIS DIAGNOSIS
#'   \item asthdx. ASTHMA DIAGNOSIS
#'   \item bmindx53. BODY MASS INDEX (8.9 - 97.6)
#'   \item ttlp. PERSON'S TOTAL INCOME
#'   \item totch. TOTAL HEALTH CARE CHARGES AT END OF YEAR
#'   \item year. 2011
#'   \item vauser. TOTVA > 0 (ANY VA/CHAMPVA CARE)
#'   \item rthlth. PERCEIVED HEALTH STATUS (INCLUDES ALL ROUNDS) \itemize{
#'          \item 1 = EXCELLENT
#'          \item 2 = VERY GOOD    
#'          \item 3 = GOOD
#'          \item 4 = FAIR
#'          \item 5 = POOR}
#'   \item mnhlth. PERCEIVED MENTAL HEALTH STATUS (INCLUDES ALL ROUNDS) \itemize{
#'          \item 1 = EXCELLENT
#'          \item 2 = VERY GOOD    
#'          \item 3 = GOOD
#'          \item 4 = FAIR
#'          \item 5 = POOR}
#'   \item empst. EMPLOYMENT STATUS 
#'   ...
#' }
#' 
#' @docType data
#' @keywords datasets
#' @format A data frame with 7404 rows and 32 variables
#' @name meps2011
NULL