# Replace all text in headers
doc <- read_docx(ifelse(doc_info$type == "notes", file.path(datapath, "fra-template-notes.dotx"), file.path(datapath, "fra-template-caus-rebut.dotx")))
headers_replace_all_text(x = doc, old_value = "Line1", new_value = paste0(lawyer$first_name, " ", lawyer$last_name, ", Esquire"), warn = FALSE)
headers_replace_all_text(x = doc, old_value = "Line2", new_value = "Attorney at Law", warn = FALSE)
headers_replace_all_text(x = doc, old_value = "Line3", new_value = case_name, warn = FALSE)
headers_replace_all_text(x = doc, old_value = "ddd_date", new_value = convert_date_format(Sys.Date()), warn = FALSE)