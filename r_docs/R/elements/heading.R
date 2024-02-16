fp_par_heading <- fp_par(word_style = "Body Text 2")
#source("r_docs/R/styles.R")

heading_dob_fpar <- fpar(
  ftext(
    "\t"
  ),
  ftext(paste0(
    plaintiff$first_name[2],
    plaintiff$last_name[2],
    ": "),
    prop = fp_text_italic),
  ftext(
    convert_date_format(
      plaintiff$dob[2]
    )))

heading_blocklist_notes <- block_list(
  fpar(
    ftext(
      paste0(
        "RE:\t",
        case_name
      ))), 
  fpar(), 
  fpar(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date
        )))))

heading_blocklist_caus_etc <- block_list(
  fpar(
    ftext(
      convert_date_format(
        ddd
      ))), 
  fpar(),
  fpar(
    ftext(
      paste(
        lawyer$first_name, 
        lawyer$last_name, 
        "Esquire"
      ))),
  fpar(
    ftext(
      lawyer$firm_name
    )),
  fpar(
    ftext(
      lawyer$address
    )),
  fpar(
    ftext(
      paste0(
        lawyer$city,
        ", ",
        lawyer$state,
        " ",
        lawyer$zip
      ))),
  fpar(),
  fpar(
    ftext(
      paste0(
        "Tel: ",
        phone_fun(
          lawyer$phone
        )))),
  fpar(),
  fpar(),
  fpar(
    ftext(
      paste0(
        "RE:\t", 
        case_name
      ))),
  fpar(),
  fpar(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date)
      ))),
  fpar(
    ftext(
      "Date of Birth:\t"
    ),
    ftext(paste0(
      plaintiff$first_name[1],
      plaintiff$last_name[1],
      ": "),
      prop = fp_text_lite(italic = TRUE)),
    ftext(
      convert_date_format(
        plaintiff$dob[1]
      ))),
  if (plaintiff$number == 2) {
    fpar(
      ftext(
        "\t"
      ),
      ftext(paste0(
        plaintiff$first_name[2],
        plaintiff$last_name[2],
        ": "),
        prop = fp_text_italic),
      ftext(
        convert_date_format(
          plaintiff$dob[2]
        )))
  },
  fpar(),
  fpar())