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
  number = 2, # 1 or 2
  first_name = c("Pl1FirstName", "Pl2FirstName"),
  last_name = c("Pl1LastName", "Pl2LastName"),
  gender = c("f", "m"),
  dob = c("01/01/1999", "01/02/1990"),
  weight = "100", # pounds
  injury_location = "disk", # disk, shoulder, spine (rollover)
  car_make = "PlCarMake",
  car_model = "PlCarModel",
  car_year = "1995"
)

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

# case name is only plaintiff name if case is "no"
case_name <- if (case == "no") {
  if (plaintiff$number == 1) {
    result <- c(plaintiff$first_name[1], " ", plaintiff$last_name[1])
  } else if (plaintiff$number == 2) {
    result <- c(
      plaintiff$first_name[1], " ", plaintiff$last_name[1],
      "; ",
      plaintiff$first_name[2], " ", plaintiff$last_name[2]
    )
    result <- paste0(result, collapse = "")
  } else {
    result <- "Unsupported number of plaintiffs"
  }
  result
} else {
  if (plaintiff$number == 1) {
    result <- c(
      plaintiff$first_name[1], " ", plaintiff$last_name[1], " et al. v ",
      case_defendant_name, " et al.,", " Case No: ", case_no, ", ", court_name
    )
    result <- paste0(result, collapse = "")
  } else if (plaintiff$number == 2) {
    result <- c(
      plaintiff$first_name[1], " ", plaintiff$last_name[1], "; ",
      plaintiff$first_name[2], " ", plaintiff$last_name[2],
      " et al. v ", case_defendant_name, " et al.,", " Case No: ", case_no, ", ", court_name
    )
    result <- paste0(result, collapse = "")
  } else {
    result <- "Unsupported number of plaintiffs"
  }
  result
}