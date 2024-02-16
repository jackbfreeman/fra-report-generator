# paragraph styles
fp_par_normal_body <- fp_par(word_style = "Normal")
fp_par_heading <- fp_par(word_style = "Body Text 2")
fp_par_footnote <- fp_par(line_spacing = 1, word_style = "Compact")

# text styles
fp_text_refnote <- fp_text_lite(vertical.align = "superscript")
fp_text_italic <- fp_text_lite(italic = TRUE)
fp_text_bold <- fp_text_lite(bold = TRUE)
fp_text_underline <- fp_text_lite(underline = TRUE)
fp_text_normal <- fp_text_lite()