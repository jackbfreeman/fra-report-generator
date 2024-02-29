heading <- list()

if (doc_type != "notes") {
  heading <- list(
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
    fpar()
  )
}

heading <- c(heading, list(
  fpar(
    ftext(
      paste0(
        "RE:\t")),
    ftext(case_name, prop = fp_text_lite(italic = TRUE))
  ),
  fpar(),
  fpar(),
  fpar(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date
        ))))))

for (i in 1:length(plaintiff$first_name)) {
  heading <- c(heading,
               list(fpar(
                 ftext(
                   ifelse(i == 1, "Date of Birth:\t", "\t")),
                 ftext(paste0(
                   plaintiff$first_name[i],
                   " ",
                   plaintiff$last_name[i],
                   ": "),
                   prop = fp_text_lite(italic = TRUE)),
                 ftext(
                   convert_date_format(
                     plaintiff$dob[i]
                   )), 
                 ftext(" ["), ftext(plaintiff$age[i]), 
                 ftext(" years old at time of crash]")))
  )
}

heading <- c(heading, list(fpar(), fpar()))