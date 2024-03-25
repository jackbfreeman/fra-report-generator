heading <- list()

if (doc_type != "notes") {
  heading <- list(
    fps(
      ftext(
        convert_date_format(
          ddd
        ))),
    fps(),
    fps(
      ftext(
        paste(
          lawyer$first_name, 
          lawyer$last_name, 
          "Esquire"
        ))),
    fps(
      ftext(
        lawyer$firm_name
      )),
    fps(
      ftext(
        lawyer$address
      )),
    fps(
      ftext(
        paste0(
          lawyer$city,
          ", ",
          lawyer$state,
          " ",
          lawyer$zip
        ))),
    fps(),
    fps(
      ftext(
        paste0(
          "Tel: ",
          phone_fun(
            lawyer$phone
          )))),
    fps(),
    fps()
  )
}

heading <- c(heading, list(
  fps(
    ftext(
      paste0(
        "RE:\t")),
    ftext(case_name, prop = fp_text_lite(italic = TRUE))
  ),
  fps(),
  fps(),
  fps(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date
        ))))))

for (i in 1:length(plaintiff$first_name)) {
  heading <- c(heading,
               list(fps(
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

heading <- c(heading, list(fps(), fps()))

#all par need style "Body Text 2"
for(i in 1:length(heading)) {
  heading[[i]]$style <- "Body Text 2"
}
