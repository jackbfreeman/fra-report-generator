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
    )), fp_p = fp_par_heading)

heading_blocklist_notes <- block_list(
  fpar(
    ftext(
      paste0(
        "RE:\t",
        case_name
      )), fp_p = fp_par_heading), 
  fpar(), 
  fpar(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date
        )))), fp_p = fp_par_heading)

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
      )), fp_p = fp_par_heading),
  fpar(),
  fpar(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date)
      )), fp_p = fp_par_heading),
  fpar(
    ftext(
      "Date of Birth:\t"
    ),
    ftext(paste0(
      plaintiff$first_name[1],
      plaintiff$last_name[1],
      ": "),
      prop = fp_text_italic),
    ftext(
      convert_date_format(
        plaintiff$dob[1]
      )), fp_p = fp_par_heading),
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
        )), fp_p = fp_par_heading)
  },
  fpar(),
  fpar())