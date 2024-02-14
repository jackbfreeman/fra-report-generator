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

add_fpar_prefix_and_suffix_fpt_fpp <- function(text, fp_t = NULL, fp_p = "fp_par_normal_body") {
  paste0("fpar(ftext('", text, "'), fp_t = ", fp_t, ", fp_p = ", fp_p, ")") %>%
    return()
}

#execute fpar code to create fpar object so it can be pumped through officer
execute_fpar <- function(text) {
  eval(parse(text = text)) %>%
    return()
}

test_text <- "test"
#fpar_test_text <- add_fpar_prefix_and_suffix_fpt_fpp(test_text, fp_p = "fp_par_single_space")
#executed_fpar_test_text <- execute_fpar(fpar_test_text)
#executed_fpar_test_text_functioned <- transform_text_to_fpar(test_text, fp_t = "fp_text_italic", fp_p = "fp_par_normal_body")

transform_text_to_fpar <- function(text, fp_t = NULL, fp_p = "fp_par_normal_body") {
  text %>%
    replace_line_and_page_breaks_fun() %>%
    replace_vars_fun() %>%
    add_fpar_prefix_and_suffix_fpt_fpp(fp_t, fp_p) %>%
    execute_fpar() %>%
    return()
}

#test_text <- 'This will contain a line break.@@linebreak@@linebreakAnd there it was!@@pagebreakAnd now it is time to test the @Pl_Firstname_Lastname("and") function'
#fpar_test_text <- transform_text_to_fpar(qualifications$causation)
#fpar_test_text <- replace_line_and_page_breaks_fun(qualifications$causation) %>%
#  add_fpar_prefix_and_suffix() %>%
#  execute_fpar()