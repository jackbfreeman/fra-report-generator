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




# universal variables

background_facts_recon_file_name <- "~/Downloads/Morris, K v Goulet supplemental report 6-9-24.docx"
med_hx_file_name <- c("~/Downloads/Morris medical expert supplementary report 062424.docx") # can be multiple

doc_info <- list(
  type = "report", # notes, report
  rebuttal = list(
    yes_no = "yes"
  ),
  short = list(
    yes_no = "yes",
    original_report_date = "05/23/2024" # MM/DD/YYYY, only if short
  )
)

case <- "yes" # yes/no
case_no <- "A-22-860747-C" # hidden if no case
court_name <- "District Court, Clark County, Nevada"
case_defendant_name <- "Denise Goulet et al."

lawyer <- list(
  first_name = "Elizabeth",
  last_name = "Coats" # ignore postnominals (i.e., Jr. or II)
)

crash <- list(
  date = "03/01/2023", # MM/DD/YYYY
  pdof = "rear", # frontal, rear, near-side, far-side, rollover
  fatality = "no"
)


plaintiff <- list(
  first_name = c("Keith"),
  last_name = c("Morris"),
  et_al = "no", # check box for yes, default to yes
  gender = c("m"),
  dob = c("12/4/1981"), # MM/DD/YYYY
  injury_location = "disk" # disk, shoulder, spine (rollover), seatbelt efficacy
)

if (length(plaintiff$first_name > 1)) {
  plaintiff$seat_position = c("driver") # driver, front passenger, rear left/right passenger, only needed when >1 plaintiff
}


# doc-specific vars (successive sections build on previous sections)
# notes

# rebuttal notes vars
if (doc_info$rebuttal$yes_no == "yes") {
  defense_expert <- list(
    first_name = c("David"),
    last_name = c("Oliveri"),
    expert_field = c("medical") # biomechanical, reconstruction, medical, biomechanical and reconstruction
  )
}

# causation report vars
if (doc_info$type == "report") {
  
  # report vars
  lawyer <- c(
    lawyer,
    gender = "f",
    firm_name = "Naqvi Injury Law",
    address = "9500 W Flamingo Road, Suite 104",
    city = "Las Vegas",
    state = "Nevada",
    zip = "89147",
    phone = "7025531002"
  )
  
  plaintiff <- c(
    plaintiff,
    weight = "332", # pounds
    car_make = "Nippon",
    car_model = "Sharyo Highliner 2",
    car_year = "NoYear",
    if (plaintiff$injury_location == "shoulder") {
      dx_dr = c("Dr. Doctor") # doctor who diagnosed SLAP lesion
    }
  )
  
  # Currently not needed for any text - keeping for future texts that might use it
  # defendant <- list(
  #   first_name = "Richard",
  #   last_name = "Jacoby"
  # )
  
  mdf_deltaV <- "5.5" # mph
  mdf_accel <- "4.0" # g
  
  # rebuttal report specific vars
  if (doc_info$rebuttal$yes_no == "yes") {
    
    # rebuttal-specific vars
    defense_expert <- c(
      defense_expert,
      title = c("Mr."), # Dr. Mr. Ms.
      gender = c("m"),
      firm = c("ESi"), # multiple choice or Other
      depo_reviewed = "yes", # default no
      depo_date = c("05/31/2024"), # MM/DD/YYYY
      deltaV = "2.8", # mph
      acceleration = "3.8", # g
      report_citations_number = c("deposition"),
      report_pages_number = c("deposition"),
      report_date = c("deposition"),
      mdf_agree = c("no") # default no
    )
    
    
  }
  
}


# rename "near-side" to "driver-side" and "far-side" to "passenger-side" if >1 plaintiff
if (length(plaintiff$first_name) > 1) {
  if (crash$pdof == "near-side") {
    crash$pdof_text <- "driver-side"
  } else if (crash$pdof == "far-side") {
    crash$pdof_text <- "passenger-side"
  } else {
    crash$pdof_text <- crash$pdof
  }
} else {
  crash$pdof_text <- crash$pdof
}




final_doc_name <- 
  if (doc_info$type == "notes") {
    paste(
      "FR+A notes", 
      paste(
        sapply(1:length(plaintiff$first_name), function(i) {
          paste0(plaintiff$last_name[[i]],  substr(plaintiff$first_name[[i]], 1, 1))
        }),
        collapse = " "  # Adding space as separator
      ), 
      crash$pdof_text,
      plaintiff$injury_location,
      if (doc_info$rebuttal$yes_no == "yes") paste("rebut", defense_expert$last_name)
      
    )
  } else {
    paste0(
      lawyer$last_name, substr(lawyer$first_name, 1, 1), " ", 
      format(Sys.Date(), "%y%m%d"), " ",
      paste0(
        sapply(1:length(plaintiff$first_name), function(i) {
          paste0(plaintiff$last_name[[i]],  substr(plaintiff$first_name[[i]], 1, 1), " ")
        }),
        collapse = ""  # Adding space as separator
      ),
      crash$pdof_text, " ",
      plaintiff$injury_location, " ",
      if (doc_info$rebuttal$yes_no == "no"){
        "causation"
      } else {
        "rebuttal"
      },
      if (doc_info$rebuttal$yes_no == "yes") {
        paste0(
          " ", defense_expert$last_name
        )
      }
    )  
  }

datapath <- "data/"
temp_files_path <- "/Users/jbf/Documents/FR+A Reports/temp_docs"
imgpath <- "images/"
final_doc_path <- file.path("reports", final_doc_name)

# if there already is a file with the same name, include the time of creation after the name
if (file.exists(paste0(final_doc_path, ".docx")) == TRUE) {
  final_doc_path <- paste(final_doc_path, format(Sys.time(), "%H:%M:%S"))
} else {
  final_doc_path <- file.path("reports", paste0(final_doc_name))
}

# pdof near- and far-side change to driver- and passenger-side if >1 plaintiff

doc <- read_docx(ifelse(doc_info$type == "notes", file.path(datapath, "fra-template-notes.dotx"),
                        file.path(datapath, "fra-template-caus-rebut.dotx")))


# only used for rebuttals, where background facts document needs to be split again
background_facts_new_recon_file_name <- file.path(temp_files_path, "reconstruction.docx")

# case name is only plaintiff name(s) if case is "no"
case_name <- paste(plaintiff$first_name, plaintiff$last_name) %>% paste(collapse = "; ")
if(case == "yes") case_name <- paste(case_name,
                                     paste0(ifelse(plaintiff$et_al == "yes", "et al. ", ""), "v ", case_defendant_name, ",", " Case No: ", case_no, ", ", court_name))

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


# Mr. or Ms. or Mx.
Mr_Ms <- function(gender_var = plaintiff$gender[1]) {
  if (gender_var == "m") return("Mr.")
  else if (gender_var == "f") return("Ms.")
  else return("Mx.")
}


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



if (doc_info$type == "report") {
  
  
  action_individual <- ifelse(case == "yes", "action", single_plural("individual"))
  
  
  phone_fun <- function(phone, invalid = NA)
  {
    phone <- gsub("[^0-9]", "", phone)          # remove non-numeric characters
    phone[!nchar(phone) %in% c(10)] <- invalid  # keep only 10 digit numbers
    
    phone <- gsub("(^\\d{3})(\\d{3})(\\d{4}$)", "(\\1) \\2-\\3", phone)
    
    phone
  }
  
  
  # conjugate verb based on number of plaintiffs
  conjugate <- function(x) {
    if(x %in% c("has", "is", "was", "isn't", "wasn't", "have", "are", "were", "aren't", "weren't")) {
      if (length(plaintiff$first_name) == 1) {
        return(x)
      } else {
        if(x == "has") x <- "have"
        if(x == "is") x <- "are"
        if(x == "was") x <- "were"
        if(x == "hasn't") x <- "haven't"
        if(x == "isn't") x <- "aren't"
        if(x == "wasn't") x <- "weren't"
      }
      return(x)
    }
    
  }
  
  plural <- function(x) {
    #Conjugate simple verbs
    if (nchar(x)==1) {
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
                  "men", "women", "children", "feet", "teeth", "geese", "mice", "it", "they")) {
        if(x == "man") x <- "men"
        if(x == "woman") x <- "women"
        if(x == "child") x <- "children"
        if(x == "foot") x <- "feet"
        if(x == "tooth") x <- "teeth"
        if(x == "goose") x <- "geese"
        if(x == "mouse") x <- "mice"
        if(x == "it") x <- "they"
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
  
  
  
  
  
  
  
  nth_decade <- paste0(ifelse(plaintiff$age[1]%%10 >5, "late ", "early "), toOrdinal(floor((plaintiff$age[1]/10)+1)), " decade")
  
  degeneration_level <- if (plaintiff$age[1] < 30) paste0("asymptomatic") else if (plaintiff$age[1] > 50) paste0("moderate to advanced") else paste0("at least moderate")
  
  if (doc_info$rebuttal$yes_no == "yes") {
    Dr_Mr_Ms_Expert_Lastname <- paste(defense_expert$title, defense_expert$last_name)
  }
  
  
  
  mais1_probability_rear <- function(mais_deltaV) {
    (exp(- 1.8199+0.0671 * mais_deltaV)) / (1+exp(- 1.8199+0.0671 * mais_deltaV))
  }
  
  mais2_probability_rear <- function(mais_deltaV) {
    (exp(- 6.1818+0.1482 * mais_deltaV)) / (1+exp(- 6.1818+0.1482 * mais_deltaV))
  }
  
  mais3_probability_rear <- function(mais_deltaV) {
    (exp(- 8.0329+0.1793 * mais_deltaV)) / (1+exp(- 8.0329+0.1793 * mais_deltaV))
  }
  
  mais4_probability_rear <- function(mais_deltaV) {
    (exp(- 11.8787+0.2210 * mais_deltaV)) / (1+exp(- 11.8787+0.2210 * mais_deltaV))
  }
  
  mais5_probability_rear <- function(mais_deltaV) {
    (exp(- 12.1944+0.2276 * mais_deltaV)) / (1+exp(- 12.1944+0.2276 * mais_deltaV))
  }
  
  mais_fatality_probability_rear <- function(mais_deltaV) {
    (exp(- 12.1982+0.2255 * mais_deltaV)) / (1+exp(- 12.1982+0.2255 * mais_deltaV))
  }
  
  if (mdf_deltaV < 7) {
    crash_speed_low_moderate_high <- "low"
  } else if (mdf_deltaV > 25) {
    crash_speed_low_moderate_high <- "high"
  } else {
    crash_speed_low_moderate_high <- "moderate"
  }
  
}

