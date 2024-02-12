library(magrittr)
library(officer)
source("r_docs/variables.R")
source("r_docs/grammar_functions.R")

test_fpar <- fpar(ftext("line 1"), run_linebreak(), ftext("line 2"))

read_docx("data/fra-template.docx") %>%
  body_add(test_fpar) %>%
  headers_replace_all_text("dummyheader", "header_text placeholder", warn = FALSE) %>%
  #body_replace_all_text("addressblock", "replacement address block temporary") %>%
  print(target = "mytest_updated_test.docx")

bold_face <- shortcuts$fp_bold(font.size = 11)
bold_redface <- update(bold_face, color = "red")
fpar_ <- fpar(
  ftext("Hello "), run_linebreak(), run_linebreak(),
  ftext("World"), 
  ftext(", how are you?")
)
doc <- read_docx() %>%
body_add_fpar(text_1_fpar_linebreak) %>%
print(target = "test.docx")
