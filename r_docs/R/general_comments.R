opinions_general_comments <- list(
  block_pour_docx(background_facts_new_path),
  fps(),
  fps(),
  fps(
    ftext(
      "General comments on SAMPLE-BIOMECH-LN’s approach",
      prop = fp_text_lite(italic = TRUE)
    )),
  fps(
    ftext(
      paste0(
        "The purpose of ", Dr_Mr_Ms_Expert_Lastname, "'s opinion is to provide a backdoor medical causation opinion that ", Mr_Ms_Lastname(), " ", single_plural("was"), " not injured in the subject collision because ", he_she(), " (", Dr_Mr_Ms_Expert_Lastname, ") deemed any injury to be impossible in the crash. ", Dr_Mr_Ms_Expert_Lastname, " made no attempt to assess the actual probability of injury from any real-world crash like the subject collision, information which can only come from observational (epidemiologic) study of injuries associated with real world crashes, not from intellectually dishonest comparisons between one of the most common causes of injury in the US to innocuous activities of daily living. ", Dr_Mr_Ms_Expert_Lastname, " cites to multiple (", paste0(defense_biomech_expert$report_citations_number, ifelse(defense_biomech_expert$report_citations_number >39, "!", "")), ") publications in his ", defense_biomech_expert$report_pages_number, "-page report, yet none of them provide valid or reliable evidence that the injuries diagnosed in ", Mr_Ms_Lastname(), " cannot, or did not, result from the collision that ", he_she(), " ", single_plural("was"), " exposed to.")
    )
  ),
  fps()
)