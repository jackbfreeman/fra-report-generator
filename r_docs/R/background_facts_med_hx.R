# Isolate and save Background Facts section
# Load the existing Word document for Background Facts
doc_split_bkgrd <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = "Reconstruction")

# Move cursor backward to delete empty line in recon document
doc_split_bkgrd <- cursor_backward(doc_split_bkgrd)

# Create loop to delete amount of objects after background facts segment
for (i in recon_point:length(doc_split_bkgrd$officer_cursor$nodes_names)) {
  doc_split_bkgrd <- body_remove(doc_split_bkgrd)
}

# print remaining document to new background facts docx
print(doc_split_bkgrd, target = file.path(datapath, "temp_import_docx", "background_facts.docx"))




# Isolate and save Reconstruction section
# Load the existing Word document for Reconstruction
doc_split_recon <- read_docx(background_facts_recon_file_name) %>%
  cursor_begin()

# create loop to delete background facts section (before)
for (i in 1:recon_point) {
  doc_split_recon <- body_remove(doc_split_recon)
}

# set cursor at point after reconstruction (before analysis)
doc_split_recon <- doc_split_recon %>%
  cursor_reach(keyword = "Opinions of defendant’s")

opinions_point <- doc_split_recon$officer_cursor$which

# Move cursor backward to delete empty line in reconstruction document
doc_split_recon <- cursor_backward(doc_split_recon)

# Create loop to delete amount of objects after reconstruction section
for (i in opinions_point:length(doc_split_recon$officer_cursor$nodes_names) + 1) {
  doc_split_recon <- body_remove(doc_split_recon)
}

# print remaining document to new background facts docx
print(doc_split_recon, target = file.path(datapath, "temp_import_docx", "reconstruction.docx"))










# isolate opinions section if doc_info$type is rebuttal
if (doc_info$rebuttal$yes_no == "yes") {
  # Load the existing Word document for Reconstruction
  doc_split_opinions <- read_docx(background_facts_recon_file_name) %>%
    cursor_reach(keyword = "Opinions of defendant’s")
  
  # Store opinions break point
  opinions_point <- doc_split_opinions$officer_cursor$which
  
  # return cursor to beginning
  doc_split_opinions <- cursor_begin(doc_split_opinions)
  
  # create loop to delete background facts section (before)
  for (i in 1:(opinions_point - 1)) {
    doc_split_opinions <- body_remove(doc_split_opinions)
  }
  
  # set cursor at point after reconstruction (before analysis)
  doc_split_opinions <- doc_split_opinions %>%
    cursor_reach(keyword = "Crash Analysis")
  
  # Store analysis break point
  analysis_point <- doc_split_opinions$officer_cursor$which
  
  # Move cursor backward to delete empty line in recon document
  doc_split_opinions <- cursor_backward(doc_split_opinions)
  
  # Create loop to delete amount of objects after reconstruction section
  for (i in analysis_point:length(doc_split_opinions$officer_cursor$nodes_names) + 1) {
    doc_split_opinions <- body_remove(doc_split_opinions)
  }
  
  # print remaining document to new background facts docx
  print(doc_split_opinions, target = file.path(datapath, "temp_import_docx", "opinions.docx"))
}



# Isolate and save Analysis section
# Load the existing Word document for Reconstruction
doc_split_analysis <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = "Crash Analysis")

analysis_point <- doc_split_analysis$officer_cursor$which

doc_split_analysis <- cursor_begin(doc_split_analysis)

# create loop to delete background facts section (before)
for (i in 1:analysis_point) {
  doc_split_analysis <- body_remove(doc_split_analysis)
}

# print remaining document to new background facts docx
print(doc_split_analysis, target = file.path(datapath, "temp_import_docx", "analysis.docx"))




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
    doc_split_med_hx[[x]] <- body_remove(doc_split_med_hx[[x]])
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
analysis_new_path <- file.path(datapath, "temp_import_docx", "analysis.docx")


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

# notes 
if (doc_info$type == "notes") {
  background_facts <- c(
    background_facts,
    list(
      block_pour_docx(background_facts_new_path),
      fps(),
      fps(
        ftext(
          "Post-crash history",
          prop = fp_text_italic_underline))
    ),
    med_hx_build_list,
    list(
      fps(
        ftext(
          "Reconstruction:",
          prop = fp_text_italic_underline
        )),
      block_pour_docx(recon_new_path)
    )
  )
  if (doc_info$rebuttal$yes_no == "yes") {
    background_facts <- c(
      background_facts,
      list(
        block_pour_docx(opinions_new_path),
        fps(),
        fps(
          ftext(
            "Crash Analysis:",
            prop = fp_text_italic_underline
          )),
        block_pour_docx(analysis_new_path),
        fps()
      )
    )
  }
} else if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "no") {
    background_facts <- c(
      background_facts,
      list(
        block_pour_docx(background_facts_new_path),
        fps()
      ),
      med_hx_build_list
    )
    # short rebuttal
  } else {
    background_facts <- c(
      background_facts,
      list(
        block_pour_docx(background_facts_new_path),
        fps()
      ),
      med_hx_build_list
    )
  }
}
