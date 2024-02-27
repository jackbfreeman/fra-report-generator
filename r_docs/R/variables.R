ddd <- "01/01/2021"
doc_type <- "causation"
case <- "yes" # yes/no
case_no <- "CaseNoSample" # hidden if no case
court_name <- "SampleCourtName"
case_defendant_name <- "SampleCaseDefendantName"

lawyer <- list(
  first_name = "LawyerFirst",
  last_name = "LawyerLast",
  gender = "m",
  firm_name = "SampleFirmName",
  address = "123 Address St.",
  city = "CityVille",
  state = "StateLand",
  zip = "12345",
  phone = "0123456789"
)

crash <- list(
  date = "01/01/2020",
  pdof = "rear" # frontal, rear, near-side, far-side, rollover
)

plaintiff <- list(
  first_name = c("Pl1FirstName", "Pl2FirstName", "The Ugly One"),
  last_name = c("Pl1LastName", "Pl1LastName", "Ugly Last Name"),
  gender = c("f", "m", "nb"),
  dob = c("01/01/1999", "01/02/1990", "01/04/1994"),
  weight = "100", # pounds
  injury_location = "disk", # disk, shoulder, spine (rollover)
  car_make = "PlCarMake",
  car_model = "PlCarModel",
  car_year = "1995"
)

plaintiff$age <- sapply(plaintiff$dob, calculate_age, crash$date)


defendant <- list(
  first_name = "DefFirstName",
  last_name = "DefLastName",
  gender = "m",
  car_make = "DefCarMake",
  car_model = "DefCarModel"
)

mdf_deltaV <- "10" # mph
mdf_accel <- "8" # g

defense_biomech_expert <- list(
  first_name = "ExpertFirst",
  last_name = "ExpertLast",
  title = "Dr.", # Dr. Mr. Ms.
  gender = "f",
  depo_reviewed = "no",
  depo_date = "01/01/2021",
  deltaV = "8", # mph
  acceleration = "6", # g
  report_citations_number = "12",
  report_pages_number = "15",
  report_date = "01/01/2021"
)

action_individual <- ifelse(case == "yes", "action", "individual")

doc <- read_docx(ifelse(doc_type == "notes", "../data/fra-template-notes.dotx", "../data/fra-template-caus-rebut.dotx"))

file_name <- ""

# case name is only plaintiff name(s) if case is "no"
case_name <- paste(plaintiff$first_name, plaintiff$last_name) %>% paste(collapse = "; ")
if(case == "yes") case_name <- paste(case_name,
                                     paste0("et al. v ", case_defendant_name, " et al.,", " Case No: ", case_no, ", ", court_name))