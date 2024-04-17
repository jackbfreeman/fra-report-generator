# Replace all text in headers
doc <- read_docx(ifelse(doc_type == "notes", file.path(datapath, "fra-template-notes.dotx"), file.path(datapath, "fra-template-caus-rebut.dotx")))
headers_replace_all_text(x = doc, old_value = "Line1", new_value = paste0(lawyer$first_name, " ", lawyer$last_name, ", Esquire"), warn = FALSE)
headers_replace_all_text(x = doc, old_value = "Line2", new_value = "Attorney at Law", warn = FALSE)
headers_replace_all_text(x = doc, old_value = "Line3", new_value = case_name, warn = FALSE)
headers_replace_all_text(x = doc, old_value = "ddd_date", new_value = convert_date_format(ddd), warn = FALSE)


heading <- list()

if (doc_type != "notes") {
  heading <- list(
    fps(
      ftext(
        convert_date_format(
          ddd
        ))),
    fps(),
    fps(
      ftext(
        paste(
          lawyer$first_name, 
          lawyer$last_name, 
          "Esquire"
        ))),
    fps(
      ftext(
        lawyer$firm_name
      )),
    fps(
      ftext(
        lawyer$address
      )),
    fps(
      ftext(
        paste0(
          lawyer$city,
          ", ",
          lawyer$state,
          " ",
          lawyer$zip
        ))),
    fps(),
    fps(
      ftext(
        paste0(
          "Tel: ",
          phone_fun(
            lawyer$phone
          )))),
    fps(),
    fps()
  )
}

heading <- c(heading, list(
  fps(
    ftext(
      paste0(
        "RE:\t")),
    ftext(case_name, prop = fp_text_lite(italic = TRUE))
  ),
  fps(),
  fps(),
  fps(
    ftext(
      paste0(
        "Date of Crash:\t", 
        convert_date_format(
          crash$date
        ))))))

for (i in 1:length(plaintiff$first_name)) {
  heading <- c(heading,
               list(fps(
                 ftext(
                   ifelse(i == 1, "Date of Birth:\t", "\t")),
                 ftext(paste0(
                   plaintiff$first_name[i],
                   " ",
                   plaintiff$last_name[i],
                   ": "),
                   prop = fp_text_lite(italic = TRUE)),
                 ftext(
                   convert_date_format(
                     plaintiff$dob[i]
                   )), 
                 ftext(" ["), ftext(plaintiff$age[i]), 
                 ftext(" years old at time of crash]")))
  )
}

heading <- c(heading, list(fps(), fps()))

#all par need style "Body Text 2"
for(i in 1:length(heading)) {
  heading[[i]]$style <- "Body Text 2"
}


receipt <- list(
  fps(
    ftext(
      paste("Dear", Mr_Ms_Lastname(lawyer))
    ),
    ftext(",")
  ),
  fps(),
  fps(
    ftext(
      "I am in receipt of your correspondence regarding the above-named "),
    ftext(
      if (case == "yes") {
        "action"
      } else if (length(plaintiff$first_name) > 1) {
        "individuals"
      } else {
        "individual"
      }),
    ftext(
      ". I have reviewed the documentation accompanying your correspondence including medical records, information regarding the subject crash, litigation documents, and other materials"
    ),
    if (doc_type == "causation")
      ftext(
        "."
      ) else if (doc_type == "rebuttal") {
        ftext(
          paste0(
            ", including the ",
            if(defense_biomech_expert$depo_reviewed == "yes")
              paste0(
                convert_date_format(defense_biomech_expert$depo_date), 
                ", deposition transcript and the "),
            convert_date_format(defense_biomech_expert$report_date), 
            ", report from the defendant's crash reconstruction and biomechanical expert, ",
            defense_biomech_expert$title,
            " ",
            defense_biomech_expert$first_name,
            " ",
            defense_biomech_expert$last_name,
            "."
          ))}),
  fps())



purpose <- list()
purpose$causation$rollover$part1 <- list(
  fps(
    ftext(
      paste0(
        "The purpose of this report is to provide an opinion regarding the causal relationship between the degree of roof crush observed in the subject ", plaintiff$car_make, " ", plaintiff$car_model, " and the severe spine and spinal cord injuries sustained by ", Mr_Ms_Lastname(), " in the ", convert_date_format(crash$date), ", rollover crash. Specifically, my opinions address the theory of occupant \"diving\" in rollover crashes as the cause of serious head and neck injury, versus excessive roof crush. The methods and conclusions described in this report are largely based on peer-reviewed published research that I supervised and co-authored, specifically:"
      )
    )
    
  ),
  fps()
)

purpose$causation$rollover$publications <- list(
  fps(
    ftext(
      "Dobbertin KM, Freeman MD, Lambert WE, Lasarev MR, Kohles SS. The relationship between vehicle roof crush and head, neck and spine injury in rollover crashes. Accid Anal Prev 2013;58:46-52"
    )
  ),
  fps(
    ftext(
      "Freeman MD, Dobbertin K, Kohles SS, Uhrenholt L, Eriksson A. Serious head and neck injury as a predictor of occupant position in fatal rollover crashes. Forensic Sci Int 2012;222:228–33."
    )
  ),
  fps()
)

purpose$causation$rollover$part2 <- list(
  fps(
    ftext(
      paste("The conclusions of the investigation described herein, as they apply to", Mr_Ms_Lastname(), "'s injuries and the subject crash, are described beginning on page 41 of this report.")
    )
  ),
  fps()
)

purpose$causation$general <- list(
  fps(
    ftext(
      paste0("The purpose of this report is to provide an analysis of the causal relationship between the subject ", crash$pdof, " impact collision and ", Mr_Ms_Lastname(), "’s subsequently diagnosed ", plaintiff$injury_location[1], " injuries and need for treatment.")
    )
  ),
  fps()
)

purpose$rebuttal <- list(
  fps(
    ftext(
      paste0("The purpose of this report is to assess the methods and conclusions of ", Dr_Mr_Ms_Expert_Lastname, " as they pertain to the injury potential of the subject collision, relative to ", Mr_Ms_Lastname(), "’s post-crash diagnoses and treatment.)"
      )
    )
  ),
  fps(),
  fps(
    ftext(
      "My summary opinions in this matter are as follows:", fp_text_lite(bold = TRUE) 
    )
  )
)



summary_opinions <- list(
  fpar(
    ftext(
      paste0(
        Dr_Mr_Ms_Expert_Lastname, "'s assertion that the subject collision did not have the capacity to cause or exacerbate any of the injuries indisputably diagnosed in ", Mr_Ms_Lastname(), "are lacking a foundation in science, medicine, or the facts in this case. ", Dr_Mr_Ms_Expert_Lastname, "'s opinions are based on a confusing and disingenuous presentation of a novel and distorted approach to causality and a misrepresentation and misuse of published literature."
      ), fp_text_lite(bold = TRUE)),
    run_linebreak()),
  fpar(
    ftext(
      paste0(
        Dr_Mr_Ms_Expert_Lastname, "'s assertion that the subject crash only produced minimal and benign forces that could not have cause ", Mr_Ms_Lastname(), "'s diagnosed spinal disk and other injuries because the forces in the collision were supposedly equal to those of ordinary and benign forces is not a reliable, relevant, or validated method of assessing injury cause. Using ", Dr_Mr_Ms_Expert_Lastname, "'s claimed delta V of ", defense_biomech_expert$deltaV, " mph for the subject collision indicates significant occupant motion and forces that in no way resemble any of the absurdly innocuous comparisons claimed by ", Dr_Mr_Ms_Expert_Lastname, ". Such comparisons are demonstrably unscientific and highly misleading, and irrelevant to any disputed issues in ", Mr_Ms_Lastname(), "'s case."
      ), fp_text_lite(bold = TRUE)),
    run_linebreak()),
  fpar(
    ftext(
      paste0(
        "There is no scientific or factual basis for ", Dr_Mr_Ms_Expert_Lastname, "'s claim that ", Mr_Ms_Lastname(), "'s previous spinal injuries could not or should not have been \"exacerbated\" by the subject crash. Indeed, ", Dr_Mr_Ms_Expert_Lastname, "'s use of the term is both meaningless and misleading, and neither ", he_she(person = defense_biomech_expert), " nor anyone else has the faintest idea of what forces would have been required to have caused ", Mr_Ms_Lastname(), "'s previously diagnosed spinal disk and other injuries to become symptomatic, or to worsen. To suggest otherwise is frankly dishonest."
      ), fp_text_lite(bold = TRUE)
    ),
    run_linebreak()
  ),
  fpar(
    ftext(
      paste0(
        "The methodology and principles used by ", Dr_Mr_Ms_Expert_Lastname, " to arrive at ", his_her(person = defense_biomech_expert), " opinions regarding the risk of injury from the crash to ", Mr_Ms_Lastname(), " are not scientifically reliable, either in general or as they were applied to the facts of this case. Despite a superficial appearance of scientific validity, ", Dr_Mr_Ms_Expert_Lastname, "'s methods are speculative, unscientific, and unreliable, and ", his_her(person = defense_biomech_expert), " conclusions are meaningless."
      ), fp_text_lite(bold = TRUE)
    ),
    run_linebreak(),
    run_linebreak()
  )
)



qualifications <- list()
qualifications$causation <- list(
  fps(
    ftext(
      "My qualifications to provide opinions concerning the matters herein, particularly on issues of the causal relationship between trauma and injury, are as follows:",
      prop = fp_text_lite(italic = TRUE))),
  fps(),
  fps(
    ftext(
      "I am Professor and Chair of Forensic and Legal Medicine with the Faculty of Forensic and Legal Medicine of the Royal College of Physicians (UK), and a consultant in the fields of forensic medicine and forensic epidemiology. I am credentialed as a Fellow of the Royal College of Pathologists (UK), Fellow of the Faculty of Forensic and Legal Medicine (FFLM) of the Royal College of Physicians (UK) and member of the British Association in Forensic Medicine. I hold the following relevant academic degrees and certifications: a Doctor of Medicine degree (Med.Dr.) from Umeå University, a Doctor of Philosophy (Ph.D.) in public health/epidemiology from Oregon State University, a Master of Public Health (MPH) in epidemiology and biostatistics, also from Oregon State University, a master’s degree in forensic medical sciences (MScFMS) with the Academy of Forensic Medical Sciences in the United Kingdom, i.a. In addition to my degreed education, I have completed a 2-year post-doctoral fellowship in forensic pathology at Umeå University in Sweden and hold a Diploma of Legal Medicine (DLM) with the FFLM. I am also a fellow of both the American Academy of Forensic Sciences and the American College of Epidemiology. I am a Fulbright Fellow and held a 3-year roster appointment (2017-20) with the United States Department of State as a Fulbright Specialist in the field of forensic medicine. I serve as tenured Associate Professor of Forensic Medicine at Maastricht University and a joint Clinical Professor of Psychiatry and Public Health and Preventative Medicine at Oregon Health and Science University School of Medicine, where I have taught courses for the past 24 years in forensic medicine, forensic epidemiology, and injury epidemiology. From 2005-2017 I held an appointment as an Adjunct Professor of Forensic Medicine and Epidemiology at the Institute of Forensic Medicine, Faculty of Health Sciences, Aarhus University, Aarhus, Denmark, and am a recent (2020-21) visiting professor at University of Indonesia in the Faculty of Medicine."
    )),
  fps(),
  fps(
    ftext(
      "I have been a crash reconstructionist since 1996 and have had ACTAR accreditation (the Accreditation Commission on Traffic Accident Reconstruction) since 2005. Over the past >25 years I have participated in the reconstruction of more than 3,000 crashes, including more than 300 fatalities. From 1999 through 2007 I served as a vehicular homicide investigator for law enforcement (consultant to the state medical examiner and special deputy sheriff), and I am a former affiliate medical examiner with the Allegheny County Medical Examiner’s office."
    )),
  fps(),
  fps(
    ftext(
      "I am a member of the American Society of Biomechanics and have more than 60 scientific publications pertaining to injury biomechanics, including a book for the Society of Automotive Engineering and taught injury biomechanics in a faculty peer-reviewed course at OHSU for 15 years. I have served as a consultant on injury biomechanics to state and federal government."
    )),
  fps(),
  fps(
    ftext(
      "I am an associate editor of the Journal of Forensic and Legal Medicine and serve or have served as an associate editor or editorial board member of 14 additional scientific peer-reviewed journals. I have published approximately 230 scientific papers, abstracts, book chapters and books on topics that include traffic crash injuries, crash reconstruction, injury causation and injury biomechanics, including the text for Elsevier, Forensic Epidemiology: Principles and Practice (2016). My publications have been cited by other authors more than 4,700 times."
    )),
  fps(),
  fps(
    ftext(
      "I have provided testimony in more than 400 civil and criminal trials in state and Federal courts throughout the United States, Canada, and Australia. Please see my CV for further details."
    ),
    run_pagebreak()
  )
)

qualifications$rebuttal_short <- list(
  fps(ftext("As I have already outlined my qualifications in my prior report in this matter, I will not repeat them here, but rather refer the reader to my current CV, which is attached.")),
  fps())