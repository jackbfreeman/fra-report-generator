background_facts <- list()

background_facts$notes <- list(
  block_pour_docx(background_facts_recon_file_name),
  fps(),
  fps(),
  block_pour_docx(med_hx_file_name),
  fps()
)

background_facts$causation <- list(
  block_pour_docx(background_facts_recon_file_name),
  fps(
    ftext(
      "At the time of the crash, "
    )),
  fps(),
  fps(),
  block_pour_docx(med_hx_file_name),
  fps()
)

background_facts$rebuttal <- list(
  block_pour_docx(background_facts_recon_file_name),
  fps(
    ftext(
      "At the time of the crash, "
    )),
  fps(),
  fps(),
  block_pour_docx(med_hx_file_name),
  fps()
)