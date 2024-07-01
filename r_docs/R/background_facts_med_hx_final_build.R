# Save all these items to local memory so there are fewer issues with broken image links in import during doc build

# Isolate and save Background Facts section
# Load the existing Word document for Background Facts
doc_split_bkgrd <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = recon_heading)

# store point after Background Facts (before Reconstruction)
after_bkgrd_point <- doc_split_bkgrd$officer_cursor$which

# Move cursor backward to delete empty line in recon document
doc_split_bkgrd <- cursor_backward(doc_split_bkgrd)

# Create loop to delete amount of objects after background facts segment
for (i in after_bkgrd_point:(length(doc_split_bkgrd$officer_cursor$nodes_names) + 1)) {
  doc_split_bkgrd <- body_remove(doc_split_bkgrd)
}

# print remaining document to new background facts docx
print(doc_split_bkgrd, target = file.path(temp_files_path, "background_facts.docx"))




# Isolate and save Reconstruction section
# Load the existing Word document for Reconstruction
doc_split_recon <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = recon_heading)

recon_point <- doc_split_recon$officer_cursor$which

doc_split_recon <- cursor_begin(doc_split_recon)

# create loop to delete background facts section (before)
for (i in 1:recon_point) {
  doc_split_recon <- body_remove(doc_split_recon)
}

doc_split_recon <- doc_split_recon %>%
  cursor_reach(keyword = ifelse(doc_info$rebuttal$yes_no == "yes", opinions_heading, analysis_heading))

after_recon_point <- doc_split_recon$officer_cursor$which

# Move cursor backward to delete empty line in reconstruction document
doc_split_recon <- cursor_backward(doc_split_recon)

# Create loop to delete amount of objects after reconstruction section
for (i in after_recon_point:(length(doc_split_recon$officer_cursor$nodes_names) + 1)) {
  doc_split_recon <- body_remove(doc_split_recon)
}

# print remaining document to new background facts docx
print(doc_split_recon, target = file.path(temp_files_path, "reconstruction.docx"))










# isolate opinions section if doc_info$type is rebuttal
if (doc_info$rebuttal$yes_no == "yes") {
  # Load the existing Word document for Opinions
  doc_split_opinions <- read_docx(background_facts_recon_file_name) %>%
    cursor_reach(keyword = opinions_heading)
  
  # Store opinions break point
  opinions_point <- doc_split_opinions$officer_cursor$which
  
  # return cursor to beginning
  doc_split_opinions <- cursor_begin(doc_split_opinions)
  
  # create loop to delete everything before opinions section
  for (i in 1:(opinions_point - 1)) {
    doc_split_opinions <- body_remove(doc_split_opinions)
  }
  
  # set cursor at point after opinions (before analysis)
  doc_split_opinions <- doc_split_opinions %>%
    cursor_reach(keyword = analysis_heading)
  
  # Store analysis break point
  analysis_point <- doc_split_opinions$officer_cursor$which
  
  # Move cursor backward to delete empty line in recon document
  doc_split_opinions <- cursor_backward(doc_split_opinions)
  
  # Create loop to delete amount of objects after reconstruction section
  for (i in analysis_point:(length(doc_split_opinions$officer_cursor$nodes_names) + 1)) {
    doc_split_opinions <- body_remove(doc_split_opinions)
  }
  
  # print remaining document to new background facts docx
  print(doc_split_opinions, target = file.path(temp_files_path, "opinions.docx"))
}



# Isolate and save Analysis section
# Load the existing Word document for Reconstruction
doc_split_analysis <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = analysis_heading)

analysis_point <- doc_split_analysis$officer_cursor$which

doc_split_analysis <- cursor_begin(doc_split_analysis)

# create loop to delete background facts section (before)
for (i in 1:analysis_point) {
  doc_split_analysis <- body_remove(doc_split_analysis)
}

# set cursor at point after analysis (before Documents Reviewed)
doc_split_analysis <- doc_split_analysis %>%
  cursor_reach(keyword = docs_reviewed_heading)

# Store analysis break point
docs_reviewed_point <- doc_split_analysis$officer_cursor$which

# Move cursor backward to delete empty line in analysis document
doc_split_analysis <- cursor_backward(doc_split_analysis)

# Create loop to delete amount of objects after analysis section
for (i in docs_reviewed_point:(length(doc_split_analysis$officer_cursor$nodes_names) + 1)) {
  doc_split_analysis <- body_remove(doc_split_analysis)
}

# print remaining document to new analysis docx
print(doc_split_analysis, target = file.path(temp_files_path, "analysis.docx"))



# Isolate and save Documents reviewed section of background facts
# Load the existing Word document for Documents reviewed
doc_split_docs_reviewed <- read_docx(background_facts_recon_file_name) %>%
  cursor_reach(keyword = docs_reviewed_heading)

docs_reviewed_point <- doc_split_docs_reviewed$officer_cursor$which

doc_split_docs_reviewed <- cursor_begin(doc_split_docs_reviewed)

# create loop to delete background facts section (before)
for (i in 1:docs_reviewed_point) {
  doc_split_docs_reviewed <- body_remove(doc_split_docs_reviewed)
}

# print remaining document to new analysis docx
print(doc_split_docs_reviewed, target = file.path(temp_files_path, "docs_reviewed.docx"))




doc_split_med_hx <- NULL
doc_split_med_hx_docs_reviewed <- NULL

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
  
  # Find location of "Documents reviewed" section
  doc_split_med_hx[[x]] <- doc_split_med_hx[[x]] %>%
    cursor_reach(med_hx_docs_reviewed)
  
  # Store location of "Documents reviewed" section
  med_hx_docs_reviewed_point <- doc_split_med_hx[[x]]$officer_cursor$which
  
  # Delete "Documents reviewed" section
  for (i in med_hx_docs_reviewed_point:(length(doc_split_med_hx[[x]]$officer_cursor$nodes_names))) {
    doc_split_med_hx[[x]] <- body_remove(doc_split_med_hx[[x]])
  }
  
  # Print remaining document to new medical history docx
  print(doc_split_med_hx[[x]], target = file.path(temp_files_path, paste0("med_hx", x, ".docx")))
  
  
  
  # Load the existing Word document for Medical History
  doc_split_med_hx_docs_reviewed[[x]] <- read_docx(med_hx_file_name[x]) %>%
    cursor_reach(med_hx_docs_reviewed)
  
  # Store location of "Documents reviewed" section
  med_hx_docs_reviewed_point <- doc_split_med_hx_docs_reviewed[[x]]$officer_cursor$which
  
  # Move cursor back to beginning
  doc_split_med_hx_docs_reviewed[[x]] <- cursor_begin(doc_split_med_hx_docs_reviewed[[x]])
  
  # Delete everything until "Documents reviewed" section
  for (i in 1:med_hx_docs_reviewed_point) {
    doc_split_med_hx_docs_reviewed[[x]] <- body_remove(doc_split_med_hx_docs_reviewed[[x]])
  }
  
  # Print remaining document to new medical history docx
  print(doc_split_med_hx_docs_reviewed[[x]], target = file.path(temp_files_path, paste0("med_hx_docs_reviewed", x, ".docx")))
}


background_facts_new_path <- file.path(temp_files_path, "background_facts.docx")
docs_reviewed_new_path <- file.path(temp_files_path, "docs_reviewed.docx")
med_hx_new_path <- NULL
med_hx_docs_reviewed_new_path <- NULL
for (x in 1:length(med_hx_file_name)) {
  med_hx_new_path[x] <- file.path(temp_files_path, paste0("med_hx", x, ".docx"))
  med_hx_docs_reviewed_new_path[x] <- file.path(temp_files_path, paste0("med_hx_docs_reviewed", x, ".docx"))
}
recon_new_path <- file.path(temp_files_path, "reconstruction.docx")
opinions_new_path <- file.path(temp_files_path, "opinions.docx")
analysis_new_path <- file.path(temp_files_path, "analysis.docx")


med_hx_build_list <- list()

if (length(med_hx_file_name) > 1) {
  for (x in 1:length(med_hx_file_name)) {
    med_hx_build_list <- c(
      med_hx_build_list, 
      list(
        fps(
          ftext(
            paste0(
              "Post-crash history, ", plaintiff$first_name[[x]], " ", plaintiff$last_name[[x]], " (", plaintiff$seat_position[[x]], ")"), prop = fp_text_italic_underline)),
        block_pour_docx(paste0(med_hx_new_path[[x]])),
        fps()
      ))
  }
} else {
  for (x in 1:length(med_hx_file_name)) {
    med_hx_build_list <- c(
      med_hx_build_list, 
      list(
        fps(),
        block_pour_docx(paste0(med_hx_new_path[[x]])),
        fps()
      ))
  }
}

# Add Documents Reviewed header to end of Med Hx section
med_hx_build_list <- c(
  med_hx_build_list,
  list(
    fps(
      ftext(
        "Documents Reviewed",
        prop = fp_text_bold_underline
      )
    )
  )
)

# add all medical history documents under "Documents Reviewed" heading
for (x in 1:length(med_hx_file_name)) {
  med_hx_build_list <- c(
    med_hx_build_list, 
    list(
      block_pour_docx(paste0(med_hx_docs_reviewed_new_path[[x]]))
    ))
}

# add "Documents Reviewed" from background facts document
med_hx_build_list <- c(
  med_hx_build_list, 
  list(
    block_pour_docx(paste0(docs_reviewed_new_path))
  ))


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
        fps(),
        block_pour_docx(opinions_new_path),
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

# add analysis to end of notes
if (doc_info$type == "notes") {
  background_facts <- c(
    background_facts,
    list(
      fps(),
      fps(
        ftext(
          "Crash Analysis:",
          prop = fp_text_italic_underline
        )),
      block_pour_docx(analysis_new_path))
  )
}


# final doc build
if (doc_info$type == "notes") {
  final_build <- list(
    heading,
    background_facts
  )
} else {
  if (doc_info$rebuttal$yes_no == "no") {
    final_build <- list(
      heading,
      receipt,
      purpose,
      qualifications,
      background_facts,
      inj_biomech$intro,
      inj_biomech$meat,
      three_steps,
      conclusions,
      signature_block
    )
    if (plaintiff$injury_location == "disk") {
      final_build <- c(final_build, list(appendix))
    }
  } else {
    if (doc_info$short$yes_no == "yes") {
      final_build <- list(
        heading,
        receipt,
        purpose,
        qualifications,
        opinions_general_comments,
        inj_biomech$intro,
        inj_biomech$meat
      )
    } else {
      final_build <- list(
        heading,
        receipt,
        purpose,
        summary_opinions,
        qualifications,
        background_facts,
        opinions_general_comments,
        inj_biomech$intro,
        inj_biomech$meat,
        three_steps,
        conclusions,
        signature_block
      )
    }
  }
}