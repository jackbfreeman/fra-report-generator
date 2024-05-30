# Load the existing Word document for Background Facts
doc_split_bkgrd <- read_docx(background_facts_recon_file_name) %>%
  # Move cursor to beginning of Reconstruction section
  cursor_reach(keyword = "Crash reconstruction")

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
for (i in 1:(ifelse(doc_info$type == "notes", recon_point-1, recon_point))) {
  body_remove(doc_split_recon)
}


# delete opinion section if doc_info$type is rebuttal
if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "yes") {
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
}


# Print remaining document to new reconstruction docx
print(doc_split_recon, target = file.path(datapath, "temp_import_docx", "reconstruction.docx"))


# if rebuttal, create document with opinions of defendant expert
if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "yes") {
    # make opinions document
    doc_split_opinions <- read_docx(background_facts_recon_file_name) %>%
      cursor_reach(keyword = "Opinions of")
    
    # store reconstruction break point
    opinion_point <- doc_split_opinions$officer_cursor$which
    
    # return cursor to beginning
    doc_split_opinions <- cursor_begin(doc_split_opinions)
    
    for (i in 1:(opinion_point-1)) {
      body_remove(doc_split_opinions)
    }
    
    # Print remaining document to new opinion docx
    print(doc_split_opinions, target = file.path(datapath, "temp_import_docx", "opinions.docx"))
  }
}

doc_split_med_hx <- NULL

for (x in 1:length(med_hx_file_name)) {
# Load the existing Word document for Medical History
doc_split_med_hx[[x]] <- read_docx(med_hx_file_name[x]) %>%
  cursor_reach("Post-crash medical history")

# Store location of first line of useful med hx info
med_hx_point <- doc_split_med_hx[[x]]$officer_cursor$which

# Move cursor back to beginning
doc_split_med_hx[[x]] <- cursor_begin(doc_split_med_hx[[x]])

# Delete first lines
for (i in 1:med_hx_point) {
  body_remove(doc_split_med_hx[[x]])
}

# Print remaining document to new medical history docx
print(doc_split_med_hx[[x]], target = file.path(datapath, "temp_import_docx", paste0("med_hx", x, ".docx")))
}

background_facts_new_path <- file.path(datapath, "temp_import_docx", "background_facts.docx")
# create object
med_hx_new_path <- NULL
for (x in 1:length(med_hx_file_name)) {
  med_hx_new_path[x] <- file.path(datapath, "temp_import_docx", paste0("med_hx", x, ".docx"))
}
recon_new_path <- file.path(datapath, "temp_import_docx", "reconstruction.docx")
opinions_new_path <- file.path(datapath, "temp_import_docx", "opinions.docx")




med_hx_build_list <- list()

if (length(med_hx_file_name) > 1) {
  for (x in 1:length(med_hx_file_name)) {
    med_hx_build_list <- append(med_hx_build_list, list(
      fps(ftext(paste0("Post-crash history, ", plaintiff$first_name[[x]], " ", plaintiff$last_name[[x]], " (", plaintiff$seat_position[[x]], ")"), prop = fp_text_italic_underline)),
      block_pour_docx(paste0(med_hx_new_path[[x]])),
      fps()
    ))
  }
} else {
  for (x in 1:length(med_hx_file_name)) {
    med_hx_build_list <- append(med_hx_build_list, list(
      fps(),
      block_pour_docx(paste0(med_hx_new_path[[x]])),
      fps()
    ))
  }
}




background_facts <- list()

if (doc_info$type == "notes") {
  background_facts <- c(
    background_facts,
    list(
      block_pour_docx(background_facts_new_path),
      fps()),
    med_hx_build_list,
    list(
      block_pour_docx(recon_new_path)
    ))
} else if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "no") {
    background_facts <- c(
      background_facts,
      list(
        block_pour_docx(background_facts_new_path),
        fps()),
      med_hx_build_list
    )
  } else {
    background_facts <- c(
      background_facts,
      list(
        block_pour_docx(background_facts_new_path),
        fps()),
      med_hx_build_list,
      list(
        block_pour_docx(opinions_new_path)
      ))
  }
}