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
  pdof = "rear", # frontal, rear, near-side, far-side, rollover
  fatality = "no"
)

plaintiff <- list(
  first_name = c("Pl1FirstName", "Pl2FirstName", "The Ugly One"),
  last_name = c("Pl1LastName", "Pl1LastName", "Ugly Last Name"),
  et_al = "yes", # check box for yes, default to yes
  gender = c("f", "m", "nb"),
  dob = c("01/01/1999", "01/02/1990", "01/04/1994"),
  weight = "100", # pounds
  injury_location = "disk", # disk, shoulder, spine (rollover)
  car_make = "PlCarMake",
  car_model = "PlCarModel",
  car_year = "1995",
  seat_position = c("driver", "front passenger", "rear right passenger"), # driver, front passenger, rear left/right passenger
  dx_dr = c("Dr. Doctor")
)

defendant <- list(
  first_name = "DefFirstName",
  last_name = "DefLastName",
  et_al = "yes", # check box for yes, default to yes
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
  report_date = "01/01/2021",
  mdf_agree = "no"
)

action_individual <- ifelse(case == "yes", "action", "individual")

doc <- read_docx(ifelse(doc_type == "notes", file.path(datapath, "fra-template-notes.dotx"),
                        file.path(datapath, "fra-template-caus-rebut.dotx")))

background_facts_recon_file_name <- file.path(datapath, "sample_background_facts_analysis.docx")
med_hx_file_name <- file.path(datapath, "sample_med_hx.docx")

# case name is only plaintiff name(s) if case is "no"
case_name <- paste(plaintiff$first_name, plaintiff$last_name) %>% paste(collapse = "; ")
if(case == "yes") case_name <- paste(case_name,
                                     paste0(ifelse(plaintiff$et_al == "yes", "et al. ", ""), "v ", case_defendant_name, " et al.,", " Case No: ", case_no, ", ", court_name))

ext_img <- function(src, width) {
  get_height_fun <- function(img, width) {
    pic <- png::readPNG(img)
    nrow(pic)/ncol(pic) * width %>%
      return()
  }
  external_img(src = src, width = width, 
               height = get_height_fun(src, width))
}

fps <- function(..., style = "Normal") {
  tmp <- fpar(...)
  tmp$style <- style
  return(tmp)
}
