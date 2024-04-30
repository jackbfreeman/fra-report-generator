# paragraph styles
fp_par_normal_body <- fp_par(word_style = "Normal")
fp_par_footnote <- fp_par(line_spacing = 1, word_style = "Compact")
fp_par_bodytext2 <- fp_par(word_style = "Body Text 2")

# text styles
fp_text_refnote <- fp_text_lite(vertical.align = "superscript")
fp_text_italic <- fp_text_lite(italic = TRUE)
fp_text_bold <- fp_text_lite(bold = TRUE)
fp_text_underline <- fp_text_lite(underline = TRUE)
fp_text_italic_underline <- fp_text_lite(italic = TRUE, underline = TRUE)
fp_text_bold_underline <- fp_text_lite(bold = TRUE, underline = TRUE)
fp_text_bold_italic <- fp_text_lite(bold = TRUE, italic = TRUE)
fp_text_normal <- fp_text_lite()


ddd <- "01/01/2021"
doc_type <- "causation"
short <- "no" # yes/no, only shows if doc_type = rebut
case <- "yes" # yes/no
case_no <- "CaseNoSample" # hidden if no case
court_name <- "SampleCourtName"
case_defendant_name <- "SampleCaseDefendantName"

lawyer <- list(
  first_name = "LawyerFirst",
  last_name = "LawyerLast", # ignore postnominals (i.e., Jr. or II)
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
  pdof = "rollover", # frontal, rear, near-side, far-side, rollover
  fatality = "no"
)

plaintiff <- list(
  first_name = c("Pl1FirstName", "Pl2FirstName", "Third One"),
  last_name = c("Pl1LastName", "Pl1LastName", "Third Name"),
  et_al = "yes", # check box for yes, default to yes
  gender = c("f", "m", "nb"),
  dob = c("01/01/1999", "01/02/1990", "01/04/1994"),
  weight = "100", # pounds
  injury_location = "disk", # disk, shoulder, spine (rollover), seatbelt efficacy
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
  gender = "m",
  firm = "LMNOP", # multiple choice or Other
  depo_reviewed = "no",
  depo_date = "01/01/2021",
  deltaV = "8", # mph
  acceleration = "6", # g
  report_citations_number = "12",
  report_pages_number = "15",
  report_date = "01/01/2021",
  mdf_agree = "no"
)

action_individual <- ifelse(case == "yes", "action", single_plural("individual"))

doc <- read_docx(ifelse(doc_type == "notes", file.path(datapath, "fra-template-notes.dotx"),
                        file.path(datapath, "fra-template-caus-rebut.dotx")))

background_facts_recon_file_name <- file.path(datapath, "sample_background_facts_analysis.docx")
med_hx_file_name <- file.path(datapath, "sample_med_hx.docx")
# only used for rebuttals, where background facts document needs to be split again
background_facts_new_recon_file_name <- file.path(datapath, "temp_import_docx", "reconstruction.docx")

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

phone_fun <- function(phone, invalid = NA)
{
  phone <- gsub("[^0-9]", "", phone)          # remove non-numeric characters
  phone[!nchar(phone) %in% c(10)] <- invalid  # keep only 10 digit numbers
  
  phone <- gsub("(^\\d{3})(\\d{3})(\\d{4}$)", "(\\1) \\2-\\3", phone)
  
  phone
}

convert_date_format <- function(date_str) {
  # Convert string to Date object
  date_obj <- as.Date(date_str, format = "%m/%d/%Y")
  
  # Format the Date object to the desired output format
  formatted_date <- format(date_obj, "%B %d, %Y")
  formatted_date <- gsub(" 0", " ", formatted_date)
  
  return(formatted_date)
}

#' calculate_age
#'
#' @param birthdate 
#' @param reference_date 
#'
#' @return
#' @export
#'
#' @examples 
#' calculate_age(birthdate = "01/01/1990", reference_date = "01/02/2020")

calculate_age <- function(birthdate, reference_date) {
  # Convert strings to Date objects
  birthdate <- as.Date(birthdate, format = "%m/%d/%Y")
  reference_date <- as.Date(reference_date, format = "%m/%d/%Y")
  
  # Calculate age in years
  age <- as.numeric(difftime(reference_date, birthdate, units = "days") / 365.25)
  
  return(floor(age))
}

plaintiff$age <- sapply(plaintiff$dob, calculate_age, crash$date)


plural <- function(x) {
  #Conjugate simple verbs
  if(x %in% c("has", "is", "was", "isn't", "wasn't", "have", "are", "were", "aren't", "weren't", "it")) {
    if(x == "has") x <- "have"
    if(x == "is") x <- "are"
    if(x == "was") x <- "were"
    if(x == "hasn't") x <- "haven't"
    if(x == "isn't") x <- "aren't"
    if(x == "wasn't") x <- "weren't"
    if(x == "it") x <- "they"
  } else if (nchar(x)==1) {
    return(paste0(x, "'s"))
  } else {
    #noun may already be plural:
    #hard to distinguish from singular noun ending in -s
    #but then it usually ends in a/i/o/u + s e.g. bus
    if(substr(x, nchar(x), nchar(x)) == "s" &
       !substr(x, nchar(x)-1, nchar(x)-1) %in% c("a","o","i","u","s")) {
      return(x)
    }
    
    #capitalization
    caps <- grepl("[[:upper:]]", strsplit(x, "")[[1]])
    
    #all caps: assume abbreviation e.g. PCs
    if(all(caps)) {
      return(paste0(x, "s"))
    }
    
    #e.g. genotypes -> genotypes
    #
    
    #ignore case, to bring it back later
    x <- tolower(x)
    
    
    
    #When the noun ends in S, SH, CH, X or Z, we add -ES to the noun
    if(x != "fish" &
       (substr(x, nchar(x), nchar(x)) %in% c("x", "s", "z") |
        substr(x, nchar(x)-1, nchar(x)) %in% c("sh", "ch"))) {
      x <- paste0(x, "es")
    }
    
    #When the noun ends in a CONSONANT + Y, we remove Y and add -IES to the noun
    x <- gsub("([b-df-hj-np-tv-xz])y$", "\\1ies", x)
    
    #If the noun ends in a CONSONANT + O, we normally add -ES to the noun.
    if(!x %in% c("piano", "halo", "photo", "torso")) {
      x <- gsub("([b-df-hj-np-tv-xz])o$", "\\1oes", x)
    }
    
    #If the noun ends in F or FE, we remove the F/FE and add -VES to the noun.
    if(!x %in% c("roof", "cliff", "chief", "belief", "chef")) {
      x <- gsub("(f|fe)$", "ves", x)
    }
    
    #if not already plural: just add s
    if(x %in% c("man", "woman", "child", "foot", "tooth", "goose", "mouse",
                "men", "women", "children", "feet", "teeth", "geese", "mice")) {
      if(x == "man") x <- "men"
      if(x == "woman") x <- "women"
      if(x == "child") x <- "children"
      if(x == "foot") x <- "feet"
      if(x == "tooth") x <- "teeth"
      if(x == "goose") x <- "geese"
      if(x == "mouse") x <- "mice"
    } else if (x %in% c("fish", "sheep", "deer", "moose", "aircraft", "dice")) {
      #singular same as plural
    } else if(substr(x, nchar(x), nchar(x)) != "s") {
      x <- paste0(x, "s")
    }
    
    #bring back caps (usually first letter)
    #all added letters are lowercase
    caps <- c(caps, rep(FALSE, nchar(x)-length(caps)))
    x <- strsplit(x, "")[[1]]
    x <- paste(ifelse(caps, toupper(x), x), collapse = "")
  }
  return(x)
}

single_plural <- function(x) {
  if (length(plaintiff$first_name) >1)
    return(plural(x))
  else return(x)
}

# Gender
Mr_Ms <- function(gender_var = plaintiff$gender[1]) {
  if (gender_var == "m") return("Mr.")
  else if (gender_var == "f") return("Ms.")
  else return("Mx.")
}

He_She <- function(number = length(person$gender), person = plaintiff) {
  if (number > 1) return("They")
  else if (person$gender[number] == "f") return("She")
  else if (person$gender[number] == "m") return("He")
  else {return("They")}
}

he_she <- function(number = length(person$gender), person = plaintiff) tolower(He_She(number, person))

His_Her <- function(number = length(person$gender), person = plaintiff) {
  if (number > 1) return("Their")
  else if (person$gender[number] == "f") return("Her")
  else if (person$gender[number] == "m") return("His")
  else {return("Their")}
}

his_her <- function(number = length(person$gender), person = plaintiff) tolower(His_Her(number, person))

Him_Her <- function(number = length(person$gender), person = plaintiff) {
  if (number > 1) return("Them")
  else if (person$gender[number] == "f") return("Her")
  else if (person$gender[number] == "m") return("Him")
  else {return("Them")}
}

him_her <- function(number = length(person$gender), person = plaintiff) tolower(Him_Her(number, person))

Men_Women <- if (plaintiff$gender[1] == "m") "Men" else if (plaintiff$gender[1] == "f") "Women" else "People"
men_women <- tolower(Men_Women)

# if plaintiff$number is 1: "Mr. Plaintiff"; if plaintiff$number is 2: "Mr. Plaintiff1 and/or Mr. Plaintiff2" (and/or depending on which word is put as an argument for the function); if same last name, "Mr. and Ms. X"
Mr_Ms_Lastname <- function(person = plaintiff, conjunction = "and", number = length(person$last_name)) {
  x <- ""
  for (i in 1:number) {
    x <- paste0(x, 
                Mr_Ms(person$gender[i]), 
                " ", 
                ifelse(number > 1 & 
                         (i == number | 
                            person$last_name[i] != person$last_name[i + 1]) |
                         number == 1, 
                       paste0(person$last_name[i], 
                              ifelse(i != number, " ", "")
                       ), 
                       ""),
                ifelse(
                  i == number, 
                  "", 
                  paste0( 
                    conjunction, 
                    " ")))
  }
  return(x)
}

# if plaintiff$number is 1: Plaintiff full name; if plaintiff$number is 2: Plaintiff1 full name and/or Plaintiff2 full name (and/or depending on which word is put as an argument for the function)
Firstname_Lastname <- function(person = plaintiff, conjunction = "and") {
  x <- ""
  for (i in 1:length(person$last_name)) {
    x <- paste0(x, 
                person$first_name[i], 
                " ", 
                ifelse(length(person$last_name) > 1 & 
                         (i == length(person$last_name) | 
                            person$last_name[i] != person$last_name[i + 1])|
                         length(person$last_name) == 1, 
                       paste0(person$last_name[i], 
                              ifelse(i != length(person$last_name), " ", "")
                       ), 
                       ""),  # Closing parenthesis added here
                ifelse(
                  i == length(person$last_name), 
                  "", 
                  paste0( 
                    conjunction, 
                    " ")))
  }
  return(x)
}

Dr_Mr_Ms_Expert_Lastname <- paste(defense_biomech_expert$title, defense_biomech_expert$last_name)

nth_decade <- paste0(ifelse(plaintiff$age[1]%%10 >5, "late ", "early "), toOrdinal(floor((plaintiff$age[1]/10)+1)), " decade")

asymptomatic_moderate <- if (plaintiff$age[1] < 30) paste0("asymptomatic") else if (plaintiff$age[1] > 50) paste0("moderate to advanced") else paste0("at least moderate")
