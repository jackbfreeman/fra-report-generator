receipt <- list(
  fps(
    ftext(
      paste("Dear", Mr_Ms_Lastname(lawyer))
    ),
    ftext(",")
  ),
  fps(),
  fps(
    ftext(
      "I am in receipt of your correspondence regarding the above-named "),
    ftext(
      if (case == "yes") {
        "action"
      } else if (length(plaintiff$first_name) > 1) {
        "individuals"
      } else {
        "individual"
      }),
    ftext(
      ". I have reviewed the documentation accompanying your correspondence including medical records, information regarding the subject crash, litigation documents, and other materials"
    ),
    if (doc_type == "causation")
      ftext(
        "."
      ) else if (doc_type == "rebuttal") {
        ftext(
          paste0(
            ", including the ",
            if(defense_biomech_expert$depo_reviewed == "yes")
              paste0(
                convert_date_format(defense_biomech_expert$depo_date), 
                ", deposition transcript and the "),
            convert_date_format(defense_biomech_expert$report_date), 
            ", report from the defendant's crash reconstruction and biomechanical expert, ",
            defense_biomech_expert$title,
            " ",
            defense_biomech_expert$first_name,
            " ",
            defense_biomech_expert$last_name,
            "."
          ))}),
  fps())