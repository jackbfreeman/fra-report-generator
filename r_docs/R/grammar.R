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
  
  return(formatted_date)
}


plural <- function(x) {
  if(nchar(x)==1) {
    return(paste0(x, "'s"))
  } else {
    #noun may already be plural:
    #hard to distinguish from singular noun ending in -s
    #but then it usually ends in a/i/o/u + s e.g. bus
    if(substr(x, nchar(x), nchar(x)) == "s" &
       !substr(x, nchar(x)-1, nchar(x)-1) %in% c("a","o","i","u")) {
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
    if(!x %in% c("piano", "halo", "photo")) {
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

# Gender
Mr_Ms <- function(gender_var) {
  if (gender_var == "m") {return("Mr.")}
  else if (gender_var == "f") {return("Ms.")}
  else {return("Mx.")}
}

He_She <- function(gender_var) {
  if (gender_var == "m") {return("He")}
  else if (gender_var == "f") {return("She")}
  else {return("They")}
}

he_she <- function(gender_var) {tolower(He_She(gender_var))}

His_Her <- function(gender_var) {
  if (gender_var == "m") {return("His")}
  else if (gender_var == "f") {return("Her")}
  else {return("Their")}
}

his_her <- function(gender_var) {tolower(His_Her(gender_var))}

Him_Her <- function(gender_var) {
  if (gender_var == "m") {return("Him")}
  else if (gender_var == "f") {return("Her")}
  else {return("Them")}
}

him_her <- function(gender_var) {tolower(Him_Her(gender_var))}

# if plaintiff$number is 1: Mr. Plaintiff; if plaintiff$number is 2: Mr. Plaintiff1 and/or Mr. Plaintiff2 (and/or depending on which word is put as an argument for the function)
Mr_Pl_Lastname <- function(conjunction = "and") {
  if (plaintiff$number == 1) {
    result <- paste(Mr_Ms(plaintiff$gender[1]), plaintiff$last_name[1], sep = " ")
  } else if (plaintiff$number == 2) {
    result <- paste0(Mr_Ms(plaintiff$gender[1]), " ", ifelse(plaintiff$last_name[1] == pl2_last_name, "", paste0(plaintiff$last_name[1], " ")), conjunction, " ", Mr_Ms(plaintiff$gender[2]), " ", pl2_last_name)
  } else {
    result <- "NAME ERROR"
  }
  return(result)
}

# if plaintiff$number is 1: Mr. Plaintiff; if plaintiff$number is 2: Mr. Plaintiff1 and/or Mr. Plaintiff2 (and/or depending on which word is put as an argument for the function)
Mr_Pl_Lastname_s <- function(conjunction = "and") {
  if (plaintiff$number == 1) {
    result <- paste0(Mr_Ms(plaintiff$gender[1]), "", plaintiff$last_name[1], "'s")
  } else if (plaintiff$number == 2) {
    result <- paste0(Mr_Ms(plaintiff$gender[1]), " ", ifelse(plaintiff$last_name[1] == plaintiff$last_name[2], "", paste0(plaintiff$last_name[1], " ")), conjunction, " ", Mr_Ms(plaintiff$gender[2]), " ", plaintiff$last_name[2], "'s")
  } else {
    result <- "NAME ERROR"
  }
  return(result)
}

# if plaintiff$number is 1: Plaintiff full name; if plaintiff$number is 2: Plaintiff1 full name and/or Plaintiff2 full name (and/or depending on which word is put as an argument for the function)
Pl_Firstname_Lastname <- function(conjunction = "and") {
  if (plaintiff$number == 1) {
    result <- paste(plaintiff$first_name[1], plaintiff$last_name[1])
  } else if (plaintiff$number == 2) {
    result <- c(plaintiff$first_name[1],
                if(plaintiff$last_name[1] != plaintiff$last_name[2]) plaintiff$last_name[1],
                conjunction, 
                plaintiff$first_name[2], plaintiff$last_name[2])
    result <- paste(result, collapse = " ")
  } else {
    result <- "NAME ERROR"
  }
  return(result)
}