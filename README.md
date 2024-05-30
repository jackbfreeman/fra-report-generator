# USE ME

## Reference for replacing grammar in report language:
Mr_Ms_Lastname(person = "plaintiff", number = "1")/Firstname_Lastname(person = "plaintiff", number = "1") - defaults to plaintiff; otherwise argument will be "defendant" or "lawyer" - includes all plaintiffs,
genders for single and naturalizes language for multiple,
for plaintiff, if just want to refer to one plaintiff, use number = "1" argument to refer to specific person

he_she()/He_She() him_her()/Him_Her() his_her()/His_Her() - defaults to
plaintiff; otherwise argument will be "defendant" or "lawyer"

single_plural("word") - argument ("in quotes") will be single if
length(plaintiff\$first_name) == 1, otherwise pluralize; also "it" -> "they" (not ideal, could be "them")
conjugate("verb") - (is, isn't, was, wasn't, has, hasn't) -> (are, aren't, were, weren't, have, haven't)


## Style guide for block_add_fps_fun() function
"Normal": at least 16 pt line spacing; majority doc style
"Body Text 2": Single line spacing and 3.75 tab distance
"Quote": block quote style indentation on both sides
"Definition": bullet point in summary
"Body Text 3": inverted indent in injury biomech section
"caption": size 9, bold, justified, margins 2.25 in from both sides, for biomech image description subtitles
"Subtitle": (for images and crash summary image descriptions) size 10, bold, centered, margins 2.25 in from both sides
"footnote text": invisible for footnotes (when more than 2 in one text)
"Author": size 10, everything else Normal (for signature block)


## General text structure:
list_name <- list(
    fps(
        ftext(
            paste0(
                "text here"
            ),
            prop = font_text_here
        ),
        style = "paragraph_style_name"
    )
)

to create a blank line, use fps()