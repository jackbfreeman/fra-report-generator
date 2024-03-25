# # Load the existing Word document
# doc_split <- read_docx(background_facts_recon_file_name)
# 
# # Get the document's blocks
# content <- docx_summary(doc_split)
# 
# # Find the position where the document says "Reconstruction"
# split_position <- NULL
# for (i in seq_len(nrow(content))) {
#   if (grepl("Reconstruction", content$text[i])) {
#     split_position <- i
#     break
#   }
# }
# 
# if (is.null(split_position)) {
#   stop("Text 'Reconstruction' not found in the background facts/reconstruction document.")
# }
# 
# # Split the document into two parts
# part1 <- block_list(doc_split)[1:(split_position - 1)]
# part2 <- block_list(doc_split)[split_position:nrow(content)]
# 
# # Create new documents for each part
# doc1 <- read_docx()
# doc2 <- read_docx()
# 
# # Add blocks to each document
# for (block in part1) {
#   doc1 <- body_add(doc1, block)
# }
# for (block in part2) {
#   doc2 <- body_add(doc2, block)
# }
# 
# # Write each part into separate Word documents
# print(doc1, target = "background_facts.docx")
# print(doc2, target = "reconstruction.docx")


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