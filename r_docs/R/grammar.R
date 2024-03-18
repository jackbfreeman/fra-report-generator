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

He_She <- function(person = plaintiff) {
  if (length(person$gender) > 1) return("They")
  else if (person$gender == "f") return("She")
  else if (person$gender == "m") return("He")
  else {return("They")}
}

he_she <- function(person = plaintiff) tolower(He_She(person))

His_Her <- function(person = plaintiff) {
  if (length(person$gender) > 1) return("Their")
  else if (person$gender == "f") return("Her")
  else if (person$gender == "m") return("His")
  else {return("Their")}
}

his_her <- function(person = plaintiff) tolower(His_Her(person))

Him_Her <- function(person = plaintiff) {
  if (length(person$gender) > 1) return("Them")
  else if (person$gender == "f") return("Her")
  else if (person$gender == "m") return("Him")
  else {return("Them")}
}

him_her <- function(person = plaintiff) tolower(Him_Her(person))

# if plaintiff$number is 1: "Mr. Plaintiff"; if plaintiff$number is 2: "Mr. Plaintiff1 and/or Mr. Plaintiff2" (and/or depending on which word is put as an argument for the function); if same last name, "Mr. and Ms. X"
Mr_Ms_Lastname <- function(person = plaintiff, conjunction = "and") {
  x <- ""
  for (i in 1:length(person$last_name)) {
    x <- paste0(x, 
                Mr_Ms(person$gender[i]), 
                " ", 
                ifelse(length(person$last_name) > 1 & 
                         (i == length(person$last_name) | 
                            person$last_name[i] != person$last_name[i + 1]) |
                         length(person$last_name) == 1, 
                       paste0(person$last_name[i], 
                              ifelse(i != length(person$last_name), " ", "")
                       ), 
                       ""),
                ifelse(
                  i == length(person$last_name), 
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

Dr_Mr_Ms_Expert_Lastname <- function() {paste(defense_biomech_expert$title, defense_biomech_expert$last_name)}
