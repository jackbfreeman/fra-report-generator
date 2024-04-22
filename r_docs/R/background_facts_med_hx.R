# Load the existing Word document for Background Facts
doc_split_bkgrd <- read_docx(background_facts_recon_file_name) %>%
  # Move cursor to beginning of Reconstruction section
  cursor_reach(keyword = "Reconstruction")

# Store reconstruction break point
recon_point <- doc_split_bkgrd$officer_cursor$which

# Move cursor backward to delete empty line in recon document
doc_split_bkgrd <- cursor_backward(doc_split_bkgrd)

# create loop to delete amount of objects after background facts segment
for (i in recon_point:(length(doc_split_bkgrd$officer_cursor$nodes_names)+1)) {
  body_remove(doc_split_bkgrd)
}

# print remaining document to new background facts docx
print(doc_split_bkgrd, target = file.path(datapath, "temp_import_docx", "background_facts.docx"))



# Load the existing Word document for Reconstruction
doc_split_recon <- read_docx(background_facts_recon_file_name) %>%
  cursor_begin()

# create loop to delete objects before reconstruction segment
for (i in 1:(ifelse(doc_type == "notes", recon_point-1, recon_point))) {
  body_remove(doc_split_recon)
}


# delete rebuttal section if doc_type is rebuttal
if (doc_type == "rebuttal") {
  doc_split_recon <- doc_split_recon %>%
    # Move cursor to beginning of Opinions section
    cursor_reach(keyword = "Opinions of")
  
  # save recon as rebuttal
  doc_split_opinions <- doc_split_recon
  
  # move cursor backward to delete empty line before opinion section
  doc_split_recon <- cursor_backward(doc_split_recon)
  
  # loop to delete opinion section
  for (i in doc_split_recon$officer_cursor$which:(length(doc_split_recon$officer_cursor$nodes_names)-recon_point)) {
    body_remove(doc_split_recon)
  }
}


# Print remaining document to new reconstruction docx
print(doc_split_recon, target = file.path(datapath, "temp_import_docx", "reconstruction.docx"))


# if rebuttal, create document with opinions of defendant expert
if (doc_type == "rebuttal") {
  # make opinions document
  doc_split_opinions <- read_docx(background_facts_recon_file_name) %>%
    cursor_reach(keyword = "Opinions of")
  
  # store reconstruction break point
  opinion_point <- doc_split_opinions$officer_cursor$which
  
  # return cursor to beginning
  doc_split_opinions <- cursor_begin(doc_split_opinions)
  
  for (i in 1:opinion_point) {
    body_remove(doc_split_opinions)
  }
  
  # Print remaining document to new opinion docx
  print(doc_split_opinions, target = file.path(datapath, "temp_import_docx", "opinions.docx"))
}



# Load the existing Word document for Medical History
doc_split_med_hx <- read_docx(med_hx_file_name) %>%
  cursor_reach("Post-crash medical history")

# Store location of first line of useful med hx info
med_hx_point <- doc_split_med_hx$officer_cursor$which

# Move cursor back to beginning
doc_split_med_hx <- cursor_begin(doc_split_med_hx)

# Delete first lines
for (i in 1:(ifelse(doc_type == "notes", med_hx_point-1, med_hx_point))) {
  body_remove(doc_split_med_hx)
}

# Print remaining document to new medical history docx
print(doc_split_med_hx, target = file.path(datapath, "temp_import_docx", "med_hx.docx"))





background_facts <- list()

background_facts_new_path <- file.path(datapath, "temp_import_docx", "background_facts.docx")
med_hx_new_path <- file.path(datapath, "temp_import_docx", "med_hx.docx")
recon_new_path <- file.path(datapath, "temp_import_docx", "reconstruction.docx")
opinions_new_path <- file.path(datapath, "temp_import_docx", "opinions.docx")

background_facts$notes <- list(
  block_pour_docx(background_facts_new_path),
  fps(),
  fps(),
  block_pour_docx(med_hx_new_path),
  fps(),
  fps(),
  block_pour_docx(recon_new_path)
)

background_facts$causation <- list(
  block_pour_docx(background_facts_new_path),
  fps(),
  fps(
    ftext(
      "At the time of the crash, "
    )),
  block_pour_docx(med_hx_new_path)
)

background_facts$rebuttal <- list(
  block_pour_docx(background_facts_new_path),
  fps(),
  fps(
    ftext(
      "At the time of the crash, "
    )),
  block_pour_docx(med_hx_new_path),
  fps(),
  fps(),
  block_pour_docx(opinions_new_path)
)