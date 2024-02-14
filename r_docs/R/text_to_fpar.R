replace_line_and_page_breaks_fun <- function(text) {
  modified_text <- text %>%
    gsub("@@linebreak", "'), run_linebreak(), ftext('", .) %>%
    gsub("@@pagebreak", "'), run_pagebreak(), ftext('", .) %>%
    return()
}

replace_vars_fun <- function(text) {
  text <- gsub("@([[:alnum:]_\"\\)(]+)", "'), ftext(\\1), ftext('", text) %>%
    return()
}

# add fpar in front in string
add_fpar_prefix_and_suffix <- function(text) {
  paste0("fpar(ftext('", text, "'))") %>%
    return()
}

add_fpar_prefix_and_suffix_italic <- function(text) {
  paste0("fpar(ftext('", text, "'), fp_t =)") %>%
    return()
}

#execute fpar code to create fpar object so it can be pumped through officer
execute_fpar <- function(text) {
  eval(parse(text = text)) %>%
    return()
}

transform_text_to_fpar <- function(text) {
  text %>%
    replace_line_and_page_breaks_fun() %>%
    replace_vars_fun() %>%
    add_fpar_prefix_and_suffix() %>%
    execute_fpar() %>%
    return()
}

#test_text <- 'This will contain a line break.@@linebreak@@linebreakAnd there it was!@@pagebreakAnd now it is time to test the @Pl_Firstname_Lastname("and") function'
#fpar_test_text <- transform_text_to_fpar(qualifications$causation)
#fpar_test_text <- replace_line_and_page_breaks_fun(qualifications$causation) %>%
#  add_fpar_prefix_and_suffix() %>%
#  execute_fpar()