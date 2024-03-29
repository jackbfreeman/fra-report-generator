background_facts <- list()

background_facts$notes <- list(
  block_pour_docx(background_facts_recon_file_name),
  fpar(),
  fpar(),
  block_pour_docx(med_hx_file_name),
  fpar()
)

background_facts$causation <- list(
  block_pour_docx(background_facts_recon_file_name),
  fpar(
    ftext(
      "At the time of the crash, "
    )),
  fpar(),
  fpar(),
  block_pour_docx(med_hx_file_name),
  fpar()
)

background_facts$rebuttal <- list(
  block_pour_docx(background_facts_recon_file_name),
  fpar(
    ftext(
      "At the time of the crash, "
    )),
  fpar(),
  fpar(),
  block_pour_docx(med_hx_file_name),
  fpar()
)