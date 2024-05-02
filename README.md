# Why are you looking at this?
This is for building a report.

## Reference for replacing grammar in report language:
Mr_Ms_Lastname()/Firstname_Lastname() - defaults to plaintiff; otherwise argument will be "defendant" or "lawyer" - includes all plaintiffs,
genders for single and naturalizes language for multiple

he_she()/He_She() him_her()/Him_Her() his_her()/His_Her() - defaults to
plaintiff; otherwise argument will be "defendant" or "lawyer"

single_plural() - argument ("in quotes") will be single if
length(plaintiff\$first_name) == 1, otherwise pluralize - pluralizes
verbs too (is, isn't, was, wasn't, has, hasn't)
added "it" -> "they" which is not ideal because could be they or them


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