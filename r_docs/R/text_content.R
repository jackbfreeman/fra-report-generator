heading <- list()

if (doc_info$type == "report") {
  heading <- list(
    fps(
      ftext(
        convert_date_format(Sys.Date())
      )),
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



# I am in receipt...
if (doc_info$type == "report") {
  if (doc_info$short$yes_no == "yes") {
    if (doc_info$rebuttal$yes_no == "yes") {
      receipt <- list(
        fps(
          ftext(
            paste0("Dear ", Mr_Ms_Lastname(lawyer), ",")
          )
        ),
        fps(),
        fps(
          ftext(
            paste0(
              "I have reviewed the documentation accompanying your correspondence, including the ", convert_date_format(defense_expert$report_date), ", report from the defendant's crash reconstruction and biomechanical engineering expert ", Dr_Mr_Ms_Expert_Lastname, "."
            )
          )
        ),
        fps()
      )
      
    }
  } else {
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
        
        # 
        if (doc_info$type == "report") {
          if (doc_info$rebuttal$yes_no == "no") {
            ftext(
              "."
            )
          }
          else {
            ftext(
              paste0(
                ", including the ",
                if(defense_expert$depo_reviewed == "yes")
                  paste0(
                    convert_date_format(defense_expert$depo_date), 
                    ", deposition transcript and the "),
                convert_date_format(defense_expert$report_date), 
                ", report from the defendant's crash reconstruction and biomechanical expert, ",
                defense_expert$title,
                " ",
                defense_expert$first_name,
                " ",
                defense_expert$last_name,
                "."
              )
            )
          }
        }
      ),
      fps()
    )
  }
}





# The purpose of this report....
if (doc_info$type == "report") {
  purpose <- list()
  # causation report
  if (doc_info$rebuttal$yes_no == "no") {
    # rollover
    if (crash$pdof == "rollover") {
      purpose <- list(
        fps(
          ftext(
            paste0(
              "The purpose of this report is to provide an opinion regarding the causal relationship between the degree of roof crush observed in the subject ", plaintiff$car_make, " ", plaintiff$car_model, " and the severe spine and spinal cord injuries sustained by ", Mr_Ms_Lastname(person = plaintiff), " in the ", convert_date_format(crash$date), ", rollover crash. Specifically, my opinions address the theory of occupant \"diving\" in rollover crashes as the cause of serious head and neck injury, versus excessive roof crush. The methods and conclusions described in this report are largely based on peer-reviewed published research that I supervised and co-authored, specifically:"
            ))),
        fps(),
        fps(
          ftext(
            "Dobbertin KM, Freeman MD, Lambert WE, Lasarev MR, Kohles SS. The relationship between vehicle roof crush and head, neck and spine injury in rollover crashes. Accid Anal Prev 2013;58:46-52"
          ), style = "Quote"
        ),
        fps(
          ftext(
            "Freeman MD, Dobbertin K, Kohles SS, Uhrenholt L, Eriksson A. Serious head and neck injury as a predictor of occupant position in fatal rollover crashes. Forensic Sci Int 2012;222:228–33."
          ), style = "Quote"
        ),
        fps(),
        fps(
          ftext(
            paste("The conclusions of the investigation described herein, as they apply to", Mr_Ms_Lastname(person = plaintiff), "'s injuries and the subject crash, are described beginning on page 41 of this report.")
          )
        ),
        fps()
      )
      
      
      
      # non-rollover causation short    
    } else {
      if (doc_info$short$yes_no == "yes") {
        purpose <- list(
          fps(
            ftext(
              paste0(
                "Placeholder non-rollover short causation 'The purpose of this report'"
              )
            )
          ),
          fps()
        )
      } else {
        # non-rollover causation
        purpose <- list(
          fps(
            ftext(
              paste0("The purpose of this report is to provide an analysis of the causal relationship between the subject ", crash$pdof_text, " impact collision and ", Mr_Ms_Lastname(person = plaintiff), "’s subsequently diagnosed ", plaintiff$injury_location[1], " injuries and need for treatment.")
            )
          ),
          fps()
        )
      }
    }
    
    
    
    # rebuttal causation short   
  } else {
    if (doc_info$short$yes_no == "yes") {
      purpose <- list(
        fps(
          ftext(
            paste0(
              "The purpose of this report is primarily to provide an analysis of the opinions given by ", Dr_Mr_Ms_Expert_Lastname, ", particularly with regard to the potential of the crash to cause the injuries diagnosed in ", Mr_Ms_Lastname(person = plaintiff), ". I have also provided comments on some of the opinions provided by the defendant’s medical experts at the end of this report."
            )
          )
        ),
        fps()
      )
    } else {
      # rebuttal report
      purpose <- list(
        fps(
          ftext(
            paste0(
              "The purpose of this report is to assess the methods and conclusions of ", Dr_Mr_Ms_Expert_Lastname, " as they pertain to the injury potential of the subject collision, relative to ", Mr_Ms_Lastname(person = plaintiff), "’s post-crash diagnoses and treatment."
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
    }
  }
}  

summary_opinions <- list()
if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "yes"){
    summary_opinions <- list(
      fps(
        ftext(
          paste0(
            Dr_Mr_Ms_Expert_Lastname, "'s assertion that the subject collision did not have the capacity to cause or exacerbate any of the injuries indisputably diagnosed in ", Mr_Ms_Lastname(person = plaintiff), " is lacking a foundation in science, medicine, or the facts in this case. ", Dr_Mr_Ms_Expert_Lastname, "'s opinions are based on a confusing and disingenuous presentation of a novel and distorted approach to causality and a misrepresentation and misuse of published literature."
          ), fp_text_lite(bold = TRUE)),
        run_linebreak(), style =  "Definition"),
      fps(
        ftext(
          paste0(
            Dr_Mr_Ms_Expert_Lastname, "'s assertion that the subject crash only produced minimal and benign forces that could not have cause ", Mr_Ms_Lastname(person = plaintiff), "'s diagnosed spinal disk and other injuries because the forces in the collision were supposedly equal to those of ordinary and benign forces is not a reliable, relevant, or validated method of assessing injury cause. Using ", Dr_Mr_Ms_Expert_Lastname, "'s claimed delta V of ", defense_expert$deltaV, " mph for the subject collision indicates significant occupant motion and forces that in no way resemble any of the absurdly innocuous comparisons claimed by ", Dr_Mr_Ms_Expert_Lastname, ". Such comparisons are demonstrably unscientific and highly misleading, and irrelevant to any disputed issues in ", Mr_Ms_Lastname(person = plaintiff), "'s case."
          ), fp_text_lite(bold = TRUE)),
        run_linebreak(), style =  "Definition"),
      fps(
        ftext(
          paste0(
            "There is no scientific or factual basis for ", Dr_Mr_Ms_Expert_Lastname, "'s claim that ", Mr_Ms_Lastname(person = plaintiff), "'s previous spinal injuries could not or should not have been \"exacerbated\" by the subject crash. Indeed, ", Dr_Mr_Ms_Expert_Lastname, "'s use of the term is both meaningless and misleading, and neither ", he_she(person = defense_expert), " nor anyone else has the faintest idea of what forces would have been required to have caused ", Mr_Ms_Lastname(person = plaintiff), "'s previously diagnosed spinal disk and other injuries to become symptomatic, or to worsen. To suggest otherwise is frankly dishonest."
          ), fp_text_lite(bold = TRUE)
        ),
        run_linebreak(), style =  "Definition"),
      fps(
        ftext(
          paste0(
            "The methodology and principles used by ", Dr_Mr_Ms_Expert_Lastname, " to arrive at ", his_her(person = defense_expert), " opinions regarding the risk of injury from the crash to ", Mr_Ms_Lastname(person = plaintiff), " are not scientifically reliable, either in general or as they were applied to the facts of this case. Despite a superficial appearance of scientific validity, ", Dr_Mr_Ms_Expert_Lastname, "'s methods are speculative, unscientific, and unreliable, and ", his_her(person = defense_expert), " conclusions are meaningless."
          ), fp_text_lite(bold = TRUE)
        ),
        run_linebreak(), style =  "Definition")
    )
  }
}






if (doc_info$type == "report") {
  qualifications <- list()
  # short rebuttal qualifications
  if (doc_info$short$yes_no == "yes") {
    if (doc_info$rebuttal$yes_no == "yes") {
      qualifications <- list(
        fps(
          ftext(
            "In brief (as they are described at greater length in previous report in this matter and in my CV), my qualifications to provide the opinions in this report are as follows: I am Professor and Chair of Forensic and Legal Medicine with the Faculty of Forensic and Legal Medicine of the Royal College of Physicians (UK) and a consultant in the fields of forensic medicine and forensic epidemiology. I am credentialed as a Fellow of the Royal College of Pathologists (UK), Fellow of the Faculty of Forensic and Legal Medicine (FFLM) of the Royal College of Physicians (UK), and member of the British Association in Forensic Medicine, "), 
          ftext(
            "i.a.", prop = fp_text_italic)),
        fps(),
        fps(
          ftext(
            "In addition to my academic credentials, publications, etc. which are described in the attached CV, I have been a crash reconstructionist since 1996 and have had ACTAR accreditation (the Accreditation Commission on Traffic Accident Reconstruction) since 2005. I am a member of the American Society of Biomechanics and have more than 60 scientific publications pertaining to injury biomechanics and have served as a consultant on injury biomechanics to state and federal government."
          )
        ),
        run_pagebreak()
      )
    }  
    
    
    
    
    
    
  } else {
    qualifications <- list(
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
          "I am an associate editor of the Journal of Forensic and Legal Medicine and serve or have served as an associate editor or editorial board member of 14 additional scientific peer-reviewed journals. I have published approximately 230 scientific papers, abstracts, book chapters and books on topics that include traffic crash injuries, crash reconstruction, injury causation and injury biomechanics, including the text for Elsevier, Forensic Epidemiology: Principles and Practice (2016). My publications have been cited by other authors more than 4,900 times."
        )),
      fps(),
      fps(
        ftext(
          "I have provided testimony in more than 450 civil and criminal trials in state and Federal courts throughout the United States, Canada, and Australia. Please see my CV for further details."
        ),
        run_pagebreak()
      )
    )
  }
}















# background facts and medical history are imported from other documents here in final product
















# (for rebuttals) import opinions of expert from external document, then general comments on expert opinions

if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "yes") {
    opinions_general_comments <- list(
      block_pour_docx(opinions_new_path),
      fps(),
      fps(
        ftext(
          paste0(
            "General comments on ", Dr_Mr_Ms_Expert_Lastname, "’s approach"
          ), prop = fp_text_italic_underline)),
      fps(
        ftext(
          paste0(
            "The purpose of ", Dr_Mr_Ms_Expert_Lastname, "'s opinion is to provide a backdoor medical causation opinion that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " not injured in the subject collision because ", he_she(person = defense_expert), " (", Dr_Mr_Ms_Expert_Lastname, ") deemed any injury to be ")), 
        ftext(
          "impossible", prop = fp_text_lite(italic = TRUE)), 
        ftext(
          paste0(
            " in the crash. ", Dr_Mr_Ms_Expert_Lastname, " made no attempt to assess the actual probability of injury from any real-world crash like the subject collision, information which can only come from observational (epidemiologic) study of injuries associated with real world crashes, not from intellectually dishonest comparisons between one of the most common causes of injury in the US to innocuous activities of daily living. ", Dr_Mr_Ms_Expert_Lastname, " cites to multiple (", paste0(defense_expert$report_citations_number, ifelse(defense_expert$report_citations_number >39, "!", "")), ") publications in ", his_her(person = defense_expert), " ", defense_expert$report_pages_number, "-page report, yet none of them provide valid or reliable evidence that the injuries diagnosed in ", Mr_Ms_Lastname(person = plaintiff), " cannot, or did not, result from the collision that ", he_she(person = plaintiff), " ", conjugate("was"), " exposed to."
          )
        )
      )
    )
  }
}













# injury biomechanics intro

if (doc_info$type == "report") {
  inj_biomech <- list()
  if (doc_info$rebuttal$yes_no == "no") {
    inj_biomech$intro <- list(
      fps(),
      fps(
        ftext(
          "Injury Causation Analysis",
          prop = fp_text_bold_italic)),
      fps(
        ftext(
          "A crash-related injury causation analysis for a specific individual is performed by assessing the risk of injury from the collision and comparing it to the probability that the injuries or conditions would have been present at the same point in time if the collision had not occurred. The process is referred to as a \"3-step\" injury causation method in which improbable alternative causes are ruled out and the single most likely cause is identified. The analysis is accomplished via the application of crash reconstruction, biomechanical, medical, and epidemiologic (risk assessment) principles."),
        run_footnote(x = footnotes_blocklist[1], prop = fp_text_refnote),
        ftext(",", prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[2], prop = fp_text_refnote),
        ftext(" This 3-step methodology has been extensively described in the peer-reviewed literature, been deemed generally accepted by Courts in the United States, and has been adopted as part of case law in the U.S."),
        run_footnote(x = footnotes_blocklist[3], prop = fp_text_refnote),
        ftext(",", prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[4], prop = fp_text_refnote),
        ftext(
          " See the Appendix at the end of this report for more information.")),
      fps(),
      # must be rendered with style "Body Text 3" for inverted indentation
      fps(
        ftext(
          "The three fundamental elements or steps of an injury causation analysis are as follows:")),
      fps(
        ftext(
          "1.\tWhether the injury mechanism had the potential to cause the injury in question (aka general causation);"), style = "Body Text 3"),
      fps(
        ftext(
          "2.\tThe degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury; and"), style = "Body Text 3"),
      fps(
        ftext(
          "3.\tWhether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology)."), style = "Body Text 3"),
      fps(),
      fps(
        ftext("As applied to the facts in the subject case, these 3 steps are as follows:")),
      fps(),
      fps(
        ftext("Injury mechanism: reconstruction of the crash, injury biomechanics", prop = fp_text_lite(italic = TRUE))),
      
      fps(
        ftext(
          "Reconstruction:",
          prop = fp_text_italic_underline
        )),
      block_pour_docx(recon_new_path),
      fps(),
      fps(
        ftext(
          "Analysis:",
          prop = fp_text_italic_underline
        )),
      block_pour_docx(analysis_new_path),
      fps(),
      fps(ftext("Injury biomechanics", prop = fp_text_lite(italic = TRUE))))
    
    
    
    
  } else {
    # rebuttal short/long intro
    inj_biomech$intro <- list(
      fps(),
      fps(
        ftext(
          paste0(
            ifelse(doc_info$short$yes_no == "yes", "As I noted in my original report in this matter, t", "T"),
            "he generally accepted and peer-reviewed method of crash-related injury causation analysis for a specific individual is performed by assessing the risk of injury from the collision and comparing it to the probability that the injuries or conditions would have been present at the same point in time if the collision had not occurred. The process is referred to as a \"3-step\" injury causation method in which improbable alternative causes are ruled out and the single most likely cause is identified. The analysis is accomplished via the application of crash reconstruction, biomechanical, medical, and epidemiologic (risk assessment) principles.")),
        run_footnote(x = footnotes_blocklist[1], prop = fp_text_refnote),
        ftext("-", prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[5], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[6], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[7], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[2], prop = fp_text_refnote),
        ftext(" This 3-step methodology has been extensively described in the peer-reviewed literature, been deemed generally accepted by Courts in the United States, and has been adopted as part of case law in the U.S."),
        run_footnote(x = footnotes_blocklist[3], prop = fp_text_refnote),
        ftext("-", prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[7], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[8], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[9], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[4], prop = fp_text_refnote)),
      # must be rendered with style "Body Text 3" for inverted indentation
      fps()
    )
    if (doc_info$short$yes_no == "no") {
      inj_biomech$intro <- c(
        inj_biomech$intro,
        list(
          fps(
            ftext(
              "The three fundamental elements or steps of an injury causation analysis are as follows:"
            )),
          fps(
            ftext(
              "Whether the injury mechanism had the potential to cause the injury in question (aka general causation);"
            ), style = "Body Text 3"),
          fps(
            ftext(
              "The degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury;"
            ), style = "Body Text 3"),
          fps(
            ftext(
              "Whether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology)."
            ), style = "Body Text 3"),
          fps()
        )
      )
    }
  }
}

# injury biomechanics meat
# frontal disk
if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "no") {
    if (crash$pdof == "frontal") {
      if (plaintiff$injury_location == "disk") {
        inj_biomech$meat <- list(
          fps(
            ftext(
              paste0(
                "The subject high speed frontal collision would have produced high loads in ", Mr_Ms_Lastname(person = plaintiff), "’s entire ", single_plural("body"), ", as ", he_she(person = "plaintiff"), " continued to travel forward inside the vehicle and into the deploying airbags, seatbelts, steering wheel, and dashboard at ", mdf_deltaV, " mph. The loads on ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("spine"), " and spinal ", single_plural("disk")," would have included high levels of compression, rotation, and shear, and would have had the potential to cause any level of injury severity to ", Mr_Ms_Lastname(person = plaintiff), ", including all of the injuries that ", he_she(person = plaintiff), " ", conjugate("was"), " ultimately diagnosed with. The US National Highway Traffic Safety Administration reports that at an approximately ", mdf_deltaV, " mph crash, nearly AMOUNT% of occupants will sustain some degree of injury that is immediately apparent and requires medical evaluation, around AMOUNT% will sustain a fracture or more significant injury, and around AMOUNT% will sustain a life-threatening injury (i.e., spinal cord injury, skull fracture, etc.)."
              )),
            run_footnote(x = footnotes_blocklist[10], prop = fp_text_refnote)),
          fps(
            ftext(
              paste0(
                "Thus, all of the injuries diagnosed in ", Mr_Ms_Lastname(person = plaintiff), " after the subject collision, and the associated treatments that ", he_she(person = plaintiff), " sought for ", his_her(person = plaintiff), " symptoms of significant and persisting spinal injury, are entirely explained by the exceedingly dangerous high speed frontal crash that ", he_she(person = plaintiff), " ", conjugate("was"), " exposed to."
              ))),
          fps())
        
        
        
        #frontal shoulder
      } else if (plaintiff$injury_location == "shoulder") {
        inj_biomech$meat <- list(
          fps(ftext("Frontal shoulder injury biomechanics causation placeholder"))
        )
      }
      
      
      
      # rear disk
    } else if (crash$pdof == "rear") {
      if (plaintiff$injury_location == "disk") {
        inj_biomech$meat <- list(
          fps(
            ftext(
              paste0(
                "The rear impact would have resulted in ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around ", mdf_deltaV, " mph, and then rebounding forward into the restraining seat belt and toward the steering wheel (the first part of the crash kinematics that ", he_she(person = plaintiff), " ", conjugate("recall"), "). ", he_she(person = plaintiff), " would have sustained substantial complex loads on ", his_her(person = plaintiff), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs)."))),
          fps(),
          fps(
            ftext(
              paste0("The National Highway Traffic Safety Administration (NHTSA) has published injury risk curves for rear impact crashes, demonstrating a rate of minor or greater “MAIS 1+” (Maximum Abbreviated Injury Scale injury severity grade of 1 or more) injuries, nearly all requiring an emergency department visit, of ", round(
                mais1_probability_rear(mdf_deltaV)*100, 
                digits = ifelse(
                  mais1_probability_rear(mdf_deltaV) < .1, 1, 0)), 
                "% for a ", mdf_deltaV, " mph delta V rear impact collision (see the blue arrow in the chart below).  Approximately 94% of spinal disk injuries would be included in this category of injuries, as this is the rate at which disk injuries are initially diagnosed as strains (i.e., MAIS 1 [minor injuries]) in the emergency department in the first day or 2 after a crash, which is the source of the NHTSA data.  There is also an approximately ", 
                round(
                  mais2_probability_rear(mdf_deltaV)*100, 
                  digits = ifelse(
                    mais2_probability_rear(mdf_deltaV) < .1, 1, 0)), 
                "% chance of an immediately apparent more serious injury, including fracture, organ injury, or intracranial bleeding, etc. in a ", crash_speed_low_moderate_high, " speed rear impact crash of the same severity (see the red arrow in the chart below)."))),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "delta_V_binomial.png"), width = 4.2), style = "Subtitle"),
          fps(ftext("Chart showing the relationship between a ~5 to 6 mph delta V (red band) rear impact and cervical disk injury risk observed in 113 people exposed to real-world crashes. As demonstrated in the chart, the risk of a cervical disk injury ranges from 2.5 to 3.3%, or around 1 in 40 to 1 in 30 in such a crash. The risk to the low back is approximately 60% that of the risk to the neck. "), ftext("Note:", prop = fp_text_italic), ftext(" 5 to 6 mph is approximately equal to 8 to 10 km/h on the chart."), style = "caption"),
          fps(),
          fps(
            ftext(
              "Discussion")),
          fps(
            ftext(
              paste0(
                "The types of spinal injuries that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " diagnosed with (primarily chronically symptomatic disk derangements) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(person = plaintiff, number = 1), " (who was ", plaintiff$age[1], " at the time of the crash) ",
              ifelse(plaintiff$age[1] < 30,
                     paste0("may or may not have mild"),
                     paste0("typically have ", degeneration_level, " age-related")),
              " degenerative changes of the disks of the spine, a fact that makes the post-crash findings in ", Mr_Ms_Lastname(person = plaintiff), "’s imaging reasonably a combination of post-traumatic overlaying ", 
              ifelse(plaintiff$age[1] < 30,
                     paste0("some degree of mild "),
                     paste0("")),
              "degeneration, as opposed to solely due to either trauma or pre-existing degeneration."))),
          fps(),
          fps(
            ftext(
              paste0(
                "The symptoms of spinal disk injury may, in some cases, be instantly recognizable after a traffic crash because of the sudden onset of radiculopathy, but recent research has demonstrated that only about 1 in 17 cervical disk injuries are recognized as such in the ED after a crash.")),
            run_footnote(x = footnotes_blocklist[13], prop = fp_text_refnote),
            ftext(
              " By far, the majority (94%) of what are later determined to be spinal disk injuries are initially diagnosed as in the ED as spinal strains.")),
          fps(),
          fps(
            ftext(
              "Although the subject crash was no \"bumper tap\" it is well established in science and medicine that an excessive level of force is not required to cause symptomatic injury to a degenerated disk, and that in most cases, the diagnostic imaging of the disk will not reveal whether related symptoms are of a traumatic origin or not, in the absence of fracture."),
            run_footnote(x = footnotes_blocklist[14], prop = fp_text_refnote),
            ftext(
              " Traumatic disk injuries have been described in the peer-reviewed literature as resulting from low to moderate force events, including minimal or no damage traffic crashes, roller coaster rides, and even more mild forces such as sneezing."),
            run_footnote(x = footnotes_blocklist[15], prop = fp_text_refnote),
            ftext("-", prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[16], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[17], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[18], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[19], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[20], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[21], prop = fp_text_refnote),
            ftext(
              " It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur.")),
          fps(),
          fps(
            ftext(
              paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("body"), " in the subject collision to have caused ", his_her(person = plaintiff), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(person = plaintiff), " spinal pain management procedures, etc."
              ))),
          fps())
        
        
        
        # rear shoulder
      } else if (plaintiff$injury_location == "shoulder") {
        inj_biomech$meat <- list(
          fps(
            ftext(
              paste0(
                "The rear impact would have resulted in ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around ", mdf_deltaV, " mph, and then rebounding forward into the restraining seat belt and toward the steering wheel. ", Mr_Ms_Lastname(person = plaintiff), " would have sustained substantial complex loads on ", his_her(person = plaintiff), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs). The load on ", his_her(person = plaintiff), " left ", single_plural("shoulder"), ", when ", single_plural("it"), " ", conjugate("was"), " restrained by the shoulder belt, would have likely exceeded several hundred lbs. The peak cervical, thoracic, and lumbar spinal disk loads could have ranged from 150 to 400 or more lbs., respectively, more than sufficient to cause a wide range of musculoligamentous and skeletal injuries."))),
          fps(),
          fps(
            ftext(
              paste0("While a ", mdf_deltaV, " mph rear impact collision may not sound like a very significant event, such collisions can result in surprisingly violent occupant movement. This concept is more easily understood from a series of video still shots, reproduced below, from a rear impact collision crash test conducted at 5.2 mph delta V (the same as estimated for the subject crash), and resulting in no vehicle damage. The occupant depicted in the test sustained a measured 12.5 g of peak head acceleration:"))),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder1.png"), width = 4.2), style = "Subtitle"),
          fps(ftext("Time = 0 msec: Occupant in neutral position at time of impact. Note the distance between the knee and the front of the seat."), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder2.png"), width = 4.2), style = "Subtitle"),
          fps(ftext("Time = 175 msec: The occupant’s torso completely compresses the seatback and the head and neck are at maximum extension. The hand comes off the steering wheel and the distance between the knee and the front of the seat now increases, as the hips begin to rebound forward ahead of the torso and head, indicating shear forces in the low back."), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder3.png"), width = 4.2), style = "Subtitle"),
          fps(ftext("Time = 200 msec: The occupant’s torso and head begin to rebound off of the compressed seatback. His right hand strikes the steering wheel and his knees move toward the dashboard."), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder4.png"), width = 4.2), style = "Subtitle"),
          fps(ftext("Time = 250 msec: The occupant is projected forward past his pre-crash position in the vehicle and loads the now locked shoulder belt with his left shoulder."), style = "caption"),
          fps(),
          fps(
            ftext(
              "The stills were part of a peer-reviewed research publication that I co-authored, which I will make available for demonstrative purposes upon request."
            ),
            run_footnote(x = footnotes_blocklist[22], prop = fp_text_refnote),
            ftext(",", prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[23], prop = fp_text_refnote)),
          fps(),
          fps(
            ftext(
              paste0(
                "The crash testing and epidemiologic literature provides good information regarding the forces associated with a 5-6 mph rear impact delta V crash, which can be quite substantial. A recently published analysis of the world literature on the topic demonstrated the distribution of body accelerations and injury risks illustrated in the charts below:"
              ))),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder5.png"), width = 4.2), style = "Subtitle"),
          fps(
            ftext(
              paste(
                "Chart showing the relationship between a 5-6 mph delta V rear impact and peak head acceleration measured in 126 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(person = plaintiff), conjugate("was"), "exposed to. As demonstrated in the chart, peak head accelerations can exceed 17g (17 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder6.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and peak low back acceleration measured in 39 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(person = plaintiff), conjugate("was"), "exposed to. As demonstrated in the chart, peak low back accelerations can exceed 7g (7 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "rear_shoulder7.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and cervical disk injury risk observed in 113 people exposed to real-world crashes. The red band shows the magnitude of the crash", Mr_Ms_Lastname(person = plaintiff), conjugate("was"), "exposed to. As demonstrated in the chart, the risk of a cervical disk injury ranges from 2.5 to 3.2% or around 1 in 31 to 1 in 40. Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
          fps(),
          fps(
            ftext(
              paste0(
                "The types of shoulder and spinal injuries that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " diagnosed with (a SLAP lesion and cervical and thoracic disk derangements) are consistent with the injury mechanism of the crash. The sheer forces exerted on ", Mr_Ms_Lastname(person = plaintiff), "’s left shoulder by the shoulder belt (or possibly transmitted by transferred forces through ", Mr_Ms_Lastname(person = plaintiff), "’s grip on the steering wheel), would have had the potential to cause the SLAP lesion diagnosed by ", plaintiff$dx_dr, ". This is one of the reasons that the American Academy of Orthopedic Surgeons lists traffic crashes prominently as one of the causes of SLAP lesions, along with falls, sports involving overhead movement, and dislocations.  The risk of SLAP lesions is closely associated with age, and ", men_women, " in ", Mr_Ms_Lastname(person = plaintiff), "’s age group are at nearly ")), ftext("3", prop = fp_text_bold), 
            ftext(
              paste0(
                " times the risk of the injury as ", men_women, " in their ", 10 * floor(plaintiff$age[1]/10) , "s, regardless of activity.  This is due to the normal wear and tear-related degenerative changes that occur in the shoulder over time, which has the tendency to make the shoulder more susceptible to injury in the event of a sudden traumatic load. There is no lower threshold of crash force for causing a SLAP lesion; any force that could cause a strain could also potentially cause a SLAP lesion, as the same structures are loaded regardless of the diagnosis. A study of rear impact crashes with an average delta V of 4 mph reported that around 1 in 10 subjects had persisting symptoms and diagnosis of shoulder injury at 5 or more weeks post-crash."
              )
            )
          ),
          fps(),
          fps(
            ftext(
              paste0(
                "The types of spinal injuries that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " diagnosed with (primarily symptomatic disk derangements in the neck and middle back) are highly consistent with the injury mechanism of the crash as well. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, " like ", Mr_Ms_Lastname(person = plaintiff, number = 1), " typically have ", degeneration_level, " age-related degenerative changes of the disks of the spine, a factor that increases the risk of injury in the event of the crash like the subject rear impact. "
              ))),
          fps(),
          fps(
            ftext(
              "Although the subject crash was no mere \"bumper tap\", traumatic spinal disk injuries do not require excessive levels of force. Traumatic disk injuries have been described in the peer-reviewed literature as resulting from low to moderate force events, including minimal or no damage traffic crashes, roller coaster rides, and even more mild forces such as sneezing."),
            run_footnote(x = footnotes_blocklist[15], prop = fp_text_refnote),
            ftext("-", prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[16], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[17], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[18], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[19], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[20], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[21], prop = fp_text_refnote),
            ftext(
              " It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur.")),
          fps(),
          fps(
            ftext(
              paste0(
                "Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(person = plaintiff), "’s", single_plural("body"), " in the subject collision to have caused ", his_her(person = plaintiff), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(person = plaintiff), " left shoulder SLAP repair surgery, etc."
              )
            )
          )
        )
      }
      
      
      
      # near-side disk
    } else if (crash$pdof == "near-side") {
      if (plaintiff$injury_location == "disk") {
        inj_biomech$meat <- list(
          fps(
            ftext(
              paste0(
                "The driver’s-side impact would have resulted in ", Mr_Ms_Lastname(person = plaintiff, number = 1), "’s torso and head to initially move to the left and somewhat forward at ", mdf_deltaV, " mph, until ", Mr_Ms_Lastname(person = plaintiff, number = 1), " struck the door and window to ", his_her(person = plaintiff, number = 1), " left with ", his_her(person = plaintiff, number = 1), " lower extremities and was restrained by ", his_her(person = plaintiff, number = 1), " seatbelt which would have caused ", his_her(person = plaintiff, number = 1), " head to continue to accelerate left and forward and create high bending loads on the joints and disks of ", his_her(person = plaintiff, number = 1), " neck, combined with sudden muscular protective forces which would have produced high levels of compression on the spinal disks in the neck and back.")),
            run_footnote(x = footnotes_blocklist[28], prop = fp_text_refnote),
            ftext(
              paste0(" Per ", his_her(person = plaintiff), " description, ", Mr_Ms_Lastname(person = plaintiff), " then rebounded back to ", his_her(person = plaintiff), " right and struck the passenger side door and window. This all would have taken less time than it takes to blink an eye (around 250 msecs)."))),
          fps(),
          fps(
            ftext(
              paste0(
                "Although a ", mdf_deltaV, " mph side impact collision does not sound like a particularly severe crash, such collisions have the potential to produce relatively violent occupant movements. This fact is illustrated in the photographic stills on the following pages, which show the sequential occupant kinematics of a healthy crash test volunteer undergoing a 3.1 mph far-side impact delta V, with forces that are around 40% of the subject crash.")),
            run_footnote(x = footnotes_blocklist[29], prop = fp_text_refnote)),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "neardisk1.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Figure 1: The bullet vehicle is approaching at 7.5 mph.")), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "neardisk2.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Figure 3: The target vehicle is starting to rotate, and the center of mass of the vehicle is accelerated to 3.1 mph (this is the delta V). The occupant begins to move to the right, relative to the vehicle interior.")), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "neardisk3.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Figure 4: The occupant’s head and torso flexes violently to the right as the vehicle continues to rotate from under her.")), style = "caption"),
          fps(),
          fps(
            ext_img(src = file.path(imgpath, "biomech", "neardisk4.png"), width = 4.2), style = "Subtitle"),
          fps(ftext(paste("Figure 5: Inertial forces on the occupant’s head and torso continue to cause flexion to the right as the vehicle continues to rotate, with the impact to final frame above occurring over approximately 1/5th of a second. The subject experiences compression, rotation, and shear in the low back and neck.")), style = "caption"),
          fps(),
          fps(),
          fps(
            ftext(
              "Discussion", prop = fp_text_italic)),
          fps(
            ftext(
              paste0(
                "The types of spinal injuries that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " diagnosed with (primarily symptomatic disk derangements and associated sequelae) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(person = plaintiff), " (who was ", plaintiff$age[[1]], " at the time of the crash) typically have ", degeneration_level, " age-related degenerative changes of the disks of the spine, a fact that makes the collision more likely to have \"converted\" at least some asymptomatic disk degeneration to a symptomatic state, rather than being the sole cause of all of the pathology identified in the post-crash imaging."))),
          fps(),
          fps(
            ftext(
              paste0(
                "The symptoms of spinal disk injury may, in some cases, be instantly recognizable after a traffic crash because of the sudden onset of radiculopathy, but recent research has demonstrated that only about 1 in 17 cervical disk injuries are recognized as such in the ED after a crash.")),
            run_footnote(x = footnotes_blocklist[13], prop = fp_text_refnote),
            ftext(
              " By far, the majority (94%) of what are later determined to be spinal disk injuries are initially diagnosed as in the ED as spinal strains.")),
          fps(),
          fps(
            ftext(
              paste0(
                "Although the subject crash was no \"bumper tap\" it is well established in biomechanics, medicine, and epidemiology that an excessive level of force is not required to cause symptomatic injury to a spinal disk with any degree of degeneration, and that in most cases, the diagnostic imaging of the disk will not reveal whether related symptoms are of a traumatic origin or not, in the absence of fracture.")),
            run_footnote(x = footnotes_blocklist[14], prop = fp_text_refnote),
            ftext(
              " Traumatic disk injuries have been described in the peer-reviewed literature as resulting from low to moderate force events, including minimal or no damage traffic crashes, roller coaster rides, and even more mild forces such as sneezing."),
            run_footnote(x = footnotes_blocklist[15], prop = fp_text_refnote),
            ftext("-", prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[16], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[17], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[18], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[19], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[20], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[21], prop = fp_text_refnote),
            ftext(
              paste0(
                " It is accurate to state, both from a biomechanical and epidemiological perspective, that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur, and that the load threshold at which individual’s disk may injured is only known after the injury has occurred, and the external load has been estimated. it is impossible to estimate the additional compression due to internal forces, however, and the precise load associated with a temporally proximate spinal disk injury is often impossible to accurately determine after the fact."))),
          fps(),
          fps(
            ftext(
              paste0(
                "Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("body"), " in the subject collision to have caused ", his_her(person = plaintiff), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(person = plaintiff), " spinal pain management procedures and cervical spine surgery."
              )
            )
          ),
          fps()
        )
        
        
        
        
        # near-side shoulder
      } else if (plaintiff$injury_location == "shoulder") {
        inj_biomech$meat <- list(
          fps(
            ftext(
              paste0("The initial impact would have resulted in ", Mr_Ms_Lastname(person = plaintiff), "’s body initially being thrown forward and to the left at around a 10:30 vector at around ", mdf_deltaV, " mph and into ", his_her(person = plaintiff), " restraining shoulder ", single_plural("belt"), " and toward the driver’s side door as well as the steering wheel. ", He_She(person = plaintiff), " would have sustained substantial complex loads on ", his_her(person = plaintiff), single_plural("spine"), " in the collision, loads that include compression, rotation, forward and lateral flexion, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs). ", Mr_Ms_Lastname(person = plaintiff), "’s left shoulder would have sustained a sudden transient load potentially exceeding 500 lbs. as it interacted with the shoulder belt, or possibly the driver’s side door."))),
          fps(),
          fps(
            ftext(
              "Discussion", prop = fp_text_italic)),
          fps(
            ftext(
              paste0(
                "The types of spine and extremity injuries that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " diagnosed with are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(person = plaintiff, number = 1), " (who was ", plaintiff$age[[1]], " at the time of the crash) typically have ", degeneration_level, " age-related degenerative changes of the disks of the spine, a fact that makes the post-crash findings in ", Mr_Ms_Lastname(person = plaintiff), "’s imaging more likely due to a combination of the trauma of the crash, and some degree of pre-existing degeneration. The same principles apply to ", Mr_Ms_Lastname(person = plaintiff), "’s left shoulder injury; ", plaintiff$age[[1]], "-year-old ", men_women, " typically have some degenerative changes in the joints and rotator cuff of the shoulder, but the frank tear and other injuries observed in ", Mr_Ms_Lastname(person = plaintiff), "’s MRI and during the arthroscopic procedure performed on ", his_her(person = plaintiff), " left shoulder are likely a result of the acute trauma of the subject collision, rather than purely a pre-existing asymptomatic condition that was converted to symptomatic by the crash."))),
          fps(
            ftext(
              paste0("It is well established in science and medicine that an excessive level of force is not required to cause symptomatic injury to a degenerated disk, and that in most cases, the diagnostic imaging of the disk will not reveal whether related symptoms are of a traumatic origin or not, in the absence of fracture.  Traumatic disk injuries have been described in the peer-reviewed literature as resulting from low to moderate force events, including minimal or no damage traffic crashes, roller coaster rides, and even more mild forces such as sneezing.")),
            run_footnote(x = footnotes_blocklist[15], prop = fp_text_refnote),
            ftext("-", prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[16], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[17], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[18], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[19], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[20], prop = fp_text_refnote),
            run_footnote(x = footnotes_blocklist[21], prop = fp_text_refnote),
            ftext(
              paste0(
                " It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur. The same principle applies to traumatic derangement of the joints and rotator cuff of the shoulder."))),
          fps(
            ftext(
              paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("body"), " in the subject collision to have caused ", his_her(person = plaintiff), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(person = plaintiff), " spinal pain management procedures, etc."
              )
            )
          ),
          fps()
        )
      }
      
      
      
      # far-side disk
    } else if (crash$pdof == "far-side") {
      if (plaintiff$injury_location == "disk") {
        inj_biomech$meat <- list(
          fps(ftext("Far-side disk injury biomechanics causation placeholder"))
        )
        
        
        
        # far-side shoulder
      } else if (plaintiff$injury_location == "shoulder") {
        inj_biomech$meat <- list(
          fps(ftext("Far-side shoulder injury biomechanics causation placeholder"))
        )
      }
      
      
      # rollover spine
    } else if (crash$pdof == "rollover") {
      if (plaintiff$injury_location == "spine") {
        inj_biomech$meat <- list(
          fps(ftext("Rollover spinal injury biomechanics causation placeholder"))
        )
      } else {
        inj_biomech$meat <- list(
          fps(ftext("Rollover other injury biomechanics causation placeholder")))
      }
    }
    
    
    
    # rebuttal injury biomechanics
  } else {
    if (defense_expert$firm == "BRC") {
      inj_biomech$meat <- list(
        fps(ftext("BRC injury biomechanics sample"))
      )
      
      
      
      # all other rebuttal inj biomech meat
    } else {
      inj_biomech$meat <- list(
        fps(
          ftext(
            paste0(
              Dr_Mr_Ms_Expert_Lastname, "’s frankly absurd comparisons to everyday activities and volunteer crash tests in no way addressed whether the subject collision could have caused the injuries and sequelae observed in ", Mr_Ms_Lastname(person = plaintiff), ", the first element of the causal analysis. ", Dr_Mr_Ms_Expert_Lastname, "’s blanket denial that a mechanism existed in the subject collision for any of ", Mr_Ms_Lastname(person = plaintiff), "’s diagnosed and persisting injuries is an uninformed assertion with no basis in science, medicine, or the facts in this case and does not constitute an assessment of the plausibility of ", his_her(person = plaintiff), " injuries resulting from the collision."))),
        fps(),
        fps(
          ftext(
            paste0(
              Dr_Mr_Ms_Expert_Lastname, " has no information on the pre-crash condition of ", Mr_Ms_Lastname(person = plaintiff), "’s ", single_plural("spine"), ", or any other part of ", his_her(person = plaintiff), " ", single_plural("body"), ". ", He_She(person = defense_expert), " couldn’t pick ", him_her(person = plaintiff), " out of a lineup and hasn’t the faintest idea of ", his_her(person = plaintiff), " tolerance to any type of trauma, including the subject crash. ")), ftext("The tolerance of an individual to forceful external loads is only defined once it has been exceeded,", prop = fp_text_bold), ftext(paste0(" not based on comparisons to studies of dissimilar forces applied to bits and pieces of dead bodies (part of the basis for ", Dr_Mr_Ms_Expert_Lastname, "’s opinion). A review of all of the evidence in the subject case clearly established the fact that ", Mr_Ms_Lastname(person = plaintiff), "’s tolerance was exceeded by the forces of the subject crash."))),
        fps(),
        fps(
          ftext(
            paste0("As ", Dr_Mr_Ms_Expert_Lastname, " does not (and cannot) dispute any of ", Mr_Ms_Lastname(person = plaintiff), "’s diagnoses, and ", he_she(person = defense_expert), " does not provide an alternative explanation for how ", his_her(person = plaintiff), " diagnosed injuries would have occurred at the same time as the collision, ", his_her(person = defense_expert), " analysis is incomplete, and fails to account for the undeniable evidence of injury following the crash."))),
        fps(),
        fps(
          ftext(
            paste0("The generally accepted 3-step approach to causation described above dictates that if there are no other contemporaneous competing causes for the injury that are more likely than an investigated plausible cause of the injury, then it is the investigated cause that is the most likely cause. ", Dr_Mr_Ms_Expert_Lastname, " simply ignored ", Mr_Ms_Lastname(person = plaintiff), "’s medical history like it never happened; ", his_her(person = defense_expert), " approach to \"assessing\" the cause of ", his_her(person = plaintiff), " injuries was to reject any evidence that ", he_she(person = plaintiff), " ", single_plural("was"), " injured in the first place. ", Dr_Mr_Ms_Expert_Lastname, " doesn’t consider, much less mention the fact, that there are no plausible competing causes of ", Mr_Ms_Lastname(person = plaintiff), "’s injuries occurring at the same time as the crash."))),
        fps(),
        fps(
          ftext(
            paste0("The concept of injury thresholds as a bright line below which no injury can occur is one that has been evaluated and rejected by the biomechanical community that is involved with the evaluation of occupant forces in motor vehicle crashes. Injury thresholds have nothing to do with the evaluation of real-world collisions and can never be used to deny the presence of a real-world injury following a collision. This is made clear in an SAE publication (J885) that summarizes human threshold data for use in government crash testing:")),
          run_footnote(x = footnotes_blocklist[13], prop = fp_text_refnote)
        ),
        fps(),
        fps(
          ftext(
            paste0("\"Such [tolerance] specifications are beyond the state-of-the-art in biomechanics except perhaps for a few academic situations. There are several difficulties which prevent a ready establishment of human tolerance levels. First, there are differences in judgment as to the specific degree of injury severity that should serve as the tolerance level. Second, large differences exist in the tolerances of different individuals. It is not unusual for bone fracture tests on a sample of adult cadavers to show a three-to-one load variation. Presumably, variations of at least this magnitude exist in the living population. Finally, most tolerance levels are sensitive to modest changes in the direction, shape, and stiffness of the loading source. The above considerations indicate that complete and precise definitions of human tolerance levels will require large amounts of data based on controlled statistical samples. Only in this way can the influence of age, size, sex, and weight be comprehensively assessed and only in this way can mean loads and statistical measures of scatter be linked to specific tolerance levels.\""
            )), style = "Quote"),
        fps(),
        fps(
          ftext(
            paste0("Crash severity analysis"), prop = fp_text_italic_underline)),
        fps(),
        fps(
          ftext(
            "Reconstruction:",
            prop = fp_text_italic_underline
          )),
        block_pour_docx(recon_new_path),
        fps(),
        fps(
          ftext(
            "Analysis:",
            prop = fp_text_italic_underline
          )),
        block_pour_docx(analysis_new_path)
      )
    }
  }}






















# causation three steps
if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "no") {
    three_steps <- list()
    if (plaintiff$injury_location == "disk") {
      three_steps <- list(
        fps(),
        fps(
          ftext(
            "Temporal relationship between the crash and symptoms indicative of injury", prop = fp_text_bold)),
        fps(
          ftext(
            paste0(
              "The second step of the injury causation analysis is the assessment of the timing between the trauma and the onset of symptoms indicative of injury. The hallmark of injury is that \"you know it when it happens;\" ")),
          ftext("i.e.", prop = fp_text_italic),
          ftext(
            paste0(
              " the causal relationship between the trauma and onset of the symptoms indicative of the injury is usually close enough in time that it is easy to recognize when the injury was incurred. There are some injuries that exhibit a delayed onset of symptoms, including injuries to intervertebral disks, which can first manifest with identical symptoms to a simple spinal strain. Other injuries are always immediately apparent, such as bony fractures. Some injuries are considered \"distracting\" from others because the pain they generate distracts attention from other, less painful injuries. There are still other injuries that can \"mask\" pain from nearby parts of the body through complicated pain accommodation mechanisms that are mediated at the spinal cord and in the brain. The assessment of the timing of the onset of symptoms reasonably attributed to an injury can sometimes be nuanced and complicated, and sometimes requires expert assessment."))),
        fps(),
        fps(
          ftext(
            paste0(
              Mr_Ms_Lastname(person = plaintiff, number = 1), " experienced the onset of symptoms indicative of acute spinal injury immediately after the crash, and ", he_she(person = plaintiff), " ", conjugate("was"), " diagnosed with neck and back injuries directly by 3 days following the crash, including the presentation of lower extremity radicular symptoms, an ominous early sign of injury to the intervertebral disks in the spine. The symptoms and diagnoses progressively evolved and worsened over the weeks and months following the crash and demonstrate a well-documented contiguous chain of causation linking the subject crash and ", Mr_Ms_Lastname(person = plaintiff), "'s diagnosed low back and cervical spinal injuries, and associated need for treatment."))),
        fps(),
        fps(
          ftext(
            paste0(
              "Based on this history, there was a strong temporal relationship between the subject collision and ", Mr_Ms_Lastname(person = plaintiff), "’s first development of symptoms indicative of spinal injury."))),
        fps(),
        fps(),
        fps(
          ftext(
            "Alternative explanations", prop = fp_text_bold)),
        fps(
          ftext(
            paste0(
              "This last step of the injury causation analysis specific to the individual involves the assessment of the probability of the same symptoms, injuries, diagnoses, and need for treatment occurring at the same point in time, but in the absence of the investigated crash."))),
        fps(),
        fps(
          ftext(
            paste0("This part of the analysis is accomplished in 2 ways; first and most obviously, any competing contemporaneous traumatic cause of injury must be ruled out. There is, however, no such history for ", Mr_Ms_Lastname(conjunction = "or"), ", and the only source of trauma apparent in my review of materials that is temporally proximate to ", his_her(person = plaintiff), " post-crash injuries is the ", convert_date_format(crash$date), ", ", crash_speed_low_moderate_high, " speed ", crash$pdof_text, " impact crash."))),
        fps(),
        fps(
          ftext(
            paste0(
              "The second part of the analysis requires an assessment of the probability that ", Mr_Ms_Lastname(conjunction = "or"), " would have developed the symptoms and diagnoses of spine injury at the same point in time had ", he_she(person = plaintiff), " not been initially injured in the ", convert_date_format(crash$date), ", ", crash$pdof_text, " impact crash. As a generally healthy ", plaintiff$age, "-year-old ", if(plaintiff$gender[1] == "m") paste0("male") else if (plaintiff$gender[1] == "f") paste0("female") else (paste0("person")), ", ", Mr_Ms_Lastname(person = plaintiff), " was at a negligible annual risk of spontaneously developing chronically painful and potentially surgical cervical or lumbar spinal disk derangements; less than 1 in 2,000 is indicated by epidemiologic study and national hospital data.")),
          run_footnote(x = footnotes_blocklist[31], prop = fp_text_refnote),
          ftext(
            paste0(
              " The chance that ", he_she(person = plaintiff), conjugate("was"), " going to develop the onset of chronic neck or low back pain attributable to symptomatic disk derangements on the same day as the crash by pure coincidence is obviously much smaller; less than 1 in 730,000 (the annual risk divided by 365 days). In comparison the risk of any acute spine injury in the subject crash was likely more than 50%, and the risk of a spinal disk injury was likely no less than 1 in 25 in the general population.")),
          run_footnote(x = footnotes_blocklist[24], prop = fp_text_refnote),
          ftext(
            paste0(
              " Based on this comparison of risk during the timeframe of interest, the crash is the most likely cause of ", Mr_Ms_Lastname(person = plaintiff), "’s chronic spinal injuries by >99%."))),
        fps(),
        fps(
          ftext(
            paste0("A relatively common medicolegal question is whether persisting symptoms of back or neck pain after a traffic crash are truly related to the crash, or more probably due to other factors incidental to an acute crash-related injury to the spine. Most typically, the \"other factors\" that are raised in a medicolegal setting are the presence of pre-existing degenerative changes in the spine, or pre-crash history of low level or sporadic symptoms."))),
        fps(),
        fps(
          ftext(
            paste0("The answer to this question is now decided science. Along with my research colleagues, I have recently published 2 analyses and systematic reviews of nearly 10,000 articles regarding the long-term effects of traffic crash-related injury to the neck and low back and associated chronic pain.")),
          run_footnote(x = footnotes_blocklist[32], prop = fp_text_refnote),
          ftext(",", prop = fp_text_refnote),
          run_footnote(x = footnotes_blocklist[33], prop = fp_text_refnote),
          ftext(
            paste0(
              " Systematic reviews are considered the most reliable and strongest form of scientific evidence (i.e. Level I evidence), as they consist of a comprehensive synthesis of world literature on a topic.")),
          run_footnote(x = footnotes_blocklist[34], prop = fp_text_refnote),
          ftext(
            paste0(
              " The result of the analyses indicate that when ", men_women, " like ", Mr_Ms_Lastname(person = plaintiff), " have persisting neck or back pain after an acute crash-related injury, ")), ftext("more often than not", prop = fp_text_italic), ftext(" (>50% of the time) the symptoms are due to the crash, versus all other causes, regardless of pre-crash medical history."
              )))
      
      
      
      # shoulder three steps
    } else if (plaintiff$injury_location == "shoulder") {
      three_steps <- list(
        fps(ftext(
          "Shoulder three steps placeholder"
        )))
    }
    
    
    # rebuttal three steps
  } else {
    three_steps <- list(
      fps(),
      fps(
        ftext(
          "Can the injury potential of the subject collision be determined from crash testing of volunteers?", prop = fp_text_italic_underline)),
      fps(
        ftext(
          paste0(
            Dr_Mr_Ms_Expert_Lastname, " cited to human volunteer crash testing for ", his_her(person = defense_expert), " opinion that ", Mr_Ms_Lastname(person = plaintiff), " could not have sustained any significant injury in the subject crash. The comparison between a real-world crash and the results of volunteer crash tests as a means of assessing injury causation is a practice that has been rejected by the relevant scientific and automotive engineering community as improper and unreliable. I have written and had published a number of peer-reviewed papers as well as a book on human volunteer crash testing and can state as a certainty that it is well established in the scientific literature that human volunteer testing (mostly crash testing) is not a valid basis for any determination of injury risk, probability, or cause in real world crashes. ")), ftext(paste0("There are no crash tests that have ever been structured like the subject crash ("), prop = fp_text_italic), ftext(paste0("", crash$pdof_text, " impact of ", mdf_deltaV, " mph delta V"), prop = fp_text_bold_italic), ftext("), as it would be irresponsible to perform such a test.", prop = fp_text_italic)),
      fps(),
      fps(
        ftext(
          paste0(
            "Earlier in this report I cited the SAE publication J885 as the basis for a quotation regarding absolute injury thresholds. This paper is an authoritative publication on the topic of human injury thresholds. In the section of the paper, on page 11, under ")), ftext(paste0("\"4. Introduction to Biomechanics, 4.1 Test Subjects,\""), prop = fp_text_italic), ftext(paste0(" is the following section:"))),
      fps(),
      fps(
        ext_img(src = file.path(imgpath, "three_steps_alt_explan", "rebuttal1.png"), width = 6), style = "Subtitle"),
      fps(),
      fps(
        ftext(
          paste0("Despite the warning that \"true tolerance levels cannot be determined with volunteers\" from ")), ftext("the", prop = fp_text_bold), ftext(paste0(" authoritative publication on automotive testing and human tolerance, ", Dr_Mr_Ms_Expert_Lastname, " described and referred to studies primarily consisting of single ", crash$pdof_text, " impact collisions of less than 5 mph (with no secondary frontal crash) on healthy male volunteers, and from these papers drew the conclusion that it was essentially impossible for ", Mr_Ms_Lastname(person = plaintiff), " to have been injured in the subject collision."))),
      fps(),
      fps(
        ftext(
          paste0("Human volunteer crash testing is designed to ")), ftext("not produce injury", prop = fp_text_italic), ftext(paste0(", and the utmost care is taken to ensure that injury is unlikely. The people who volunteer to participate in experimental crash tests are not comparable to those who are injured in similar crashes in many respects, and this includes the plaintiff. For any published crash test, the authors ")), ftext("typically", prop = fp_text_italic), ftext(paste0(" must secure Institutional Review Board (IRB) approval in order to assure the safety of the volunteers (this is in accordance with the Declaration of Helsinki, an international treaty on human subject experimentation)."))),
      fps(),
      fps(
        ftext(
          paste0("As mentioned earlier, the peer-reviewed authoritative automotive engineering and biomechanical literature specifically states that crash tests are not an appropriate basis for any determination of real-world injury thresholds. In 1999 I published a peer-reviewed paper in the premier journal in the world on Spine surgery at that time (")), ftext("Spine", prop = fp_text_italic), ftext(paste0("), which specifically criticized some of the volunteer crash test publications cited by ", Dr_Mr_Ms_Expert_Lastname, " in ", his_her(person = defense_expert), " report for erroneously claiming an injury threshold from such testing.")),
        run_footnote(x = footnotes_blocklist[35], prop = fp_text_refnote),
        ftext(
          paste0(
            " ", Dr_Mr_Ms_Expert_Lastname, " presents no evidence to demonstrate that the basic scientific principles described in this 23-year old publication should be violated for ", his_her(person = defense_expert), " assertions regarding the cause of ", Mr_Ms_Lastname(person = plaintiff), "’s post-collision diagnoses and need for treatment."))),
      fps(),
      fps(
        ftext(
          paste0("Is any collision comparable to activities of daily living?"), prop = fp_text_italic_underline)),
      fps(
        ftext(
          paste0("As noted above, ", Dr_Mr_Ms_Expert_Lastname, " claimed that the subject collision produced forces no greater than the loads observed in studies of \"activities of daily living.\" Such comparisons are misleading and deceptive, and based on the junk science premise that if the occupant acceleration value of a crash can be said to be similar to that of some trivial sounding event, then this means that the injury potential of the crash and the trivial event is the same. This antiscientific myth has no application or use outside of the defense of injury litigation."))),
      fps(),
      fps(
        ftext(
          paste0("It should be patently obvious how ridiculous and frankly dishonest the comparison is between any collision and ")), ftext("any", prop = fp_text_italic),
        ftext(
          paste0(
            " everyday activity; there is no biomechanical similarity between a crash and an ADL. The direction, duration, and rapidity of acceleration that results in the kind of violent movement that occurs even in a low-speed crash is noncomparable in all respects to the self-generated, slow onset and long duration accelerations of daily activities."))),
      fps(),
      fps(
        ftext(
          paste0(
            "The actual risk of injury from a lower speed crash is not determined by a comparison to an activity that never causes injury, of course. Such determinations are made by examining epidemiologic data regarding real world crashes and the types of injuries that result from them. This is precisely what my colleagues and I did in a recent peer-reviewed research publication, in which we noted the following:"
          )),
        run_footnote(x = footnotes_blocklist[36], prop = fp_text_refnote)),
      fps(),
      fps(
        ftext(
          "\"…the theory that serves as the operating principle for the methodology, that acceleration is a proxy for injury risk in low speed or minimal damage crashes, which is the rationale for the comparison between a crash and non-injurious ADLs, is demonstrably false. Even at the lowest levels of impact severity in a rear impact crash, the results of both crash testing and epidemiologic data from real-world crashes indicate a substantial (i.e., >20%) risk of at least some degree of injury. "), ftext("In contrast, everyday activities are benign events with virtually no injury risk whatsoever.", prop = fp_text_bold), style = "Quote"),
      fps(),
      fps(
        ftext(
          "If the magnitude of the accelerations resulting from crashes and ADLs can be said to be even roughly comparable, this fact only serves as concrete evidence that occupant acceleration is not a proxy for injury risk.\"", prop = fp_text_bold), style = "Quote"),
      fps(),
      fps(
        ftext(
          "Regarding the novel nature of such comparisons as a basis for evaluating injury risk, we wrote:")),
      fps(),
      fps(
        ftext(
          " \"There is no other example in the biomedical literature in which the established injury risk of any traumatic event is overlooked in favor of a comparison between the acceleration of the event and a non-injurious activity.", prop = fp_text_bold),
        ftext(
          " Although there may be multiple shared attributes of traffic crashes and some ADLs, just as there are multiple shared attributes of stepping down from a stair and falling down a stair (i.e., the travel distances are the same, gravity is 9.81 m/s2 in both scenarios), alluding to the absence of injury while ordinarily walking down stairs sheds no light on the frequency of injury from falling down stairs. "), ftext("The comparison is inapt and should not be made.\"", prop = fp_text_bold), style = "Quote"),
      fps(),
      fps(
        ftext(
          paste0(
            "If we use the real world 11 km/h [6.8 mph] delta V rear impact injury risk from the present study (54%) and compare it to the highest estimated ADL-related risk (<<1 in 3,650 [0.027%] for sitting),")), ftext(" then even using the most conservative estimates, the crash presents a risk of injury that is at least 2,000 times greater than the \"high risk\" ADL of sitting.", prop = fp_text_bold), ftext(" This ratio likely underestimates the actual injury risk disparity between frontal-side impacts and ADLs by a factor of at least 10 times."), style = "Quote"),
      fps(),
      fps(
        ftext(
          paste0("The National Highway Traffic Safety Administration (NHTSA) has recently published injury risk curves for rear impact crashes, demonstrating a rate of \"MAIS 1+\" (Maximum Abbreviated Injury Scale injury severity grade of 1 or more) injuries of 27% to 36% for 5 to 10 mph delta V rear impact collisions (see the red bracket in the chart below).")),
        run_footnote(x = footnotes_blocklist[10], prop = fp_text_refnote),
        ftext(
          paste0(
            " Approximately 94% of spinal disk injuries would be included in this category of injuries, as this is the rate at which disk injuries are initially diagnosed as strains in the emergency department in the first day or 2 after a crash, which is the source of the NHTSA data.")),
        run_footnote(x = footnotes_blocklist[37], prop = fp_text_refnote)),
      fps(),
      fps(
        ftext(
          paste0("The fact that ", Dr_Mr_Ms_Expert_Lastname, " compared an event (a less than 10 mph ", crash$pdof_text, " impact collision) that is irrefutably established by US national crash data to cause injury at least 1 out 4 times to ADLs which virtually ")), ftext("never cause injury", prop = fp_text_bold), ftext(" is a perfect illustration of how misleading and frankly dishonest the comparison is.")),
      fps(),
      fps(
        ext_img(src = file.path(imgpath, "three_steps_alt_explan", "rebuttal2.png"), width = 6.3), style = "Subtitle"),
      fps(),
      fps(
        ftext(
          paste0(
            "Can a biomechanical analysis demonstrate that ", Mr_Ms_Lastname(person = plaintiff), " ", conjugate("was"), " not injured in the subject crash?"), prop = fp_text_italic_underline)),
      fps(
        ftext(
          paste0("Traumatic spinal disk injuries have been described in the peer-reviewed literature as occurring in low to moderate force events, such as minimal damage traffic crashes and roller coaster rides, but also with even more mild forces, including therapeutic manipulation of the spine, and even sneezing.")),
        run_footnote(x = footnotes_blocklist[15], prop = fp_text_refnote),
        ftext("-", prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[16], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[17], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[18], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[19], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[20], prop = fp_text_refnote),
        run_footnote(x = footnotes_blocklist[21], prop = fp_text_refnote),
        ftext(
          paste0(
            " It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur. ", Dr_Mr_Ms_Expert_Lastname, "’s claims to the contrary are contrived and easily disproven, not to mention at odds with the specific facts in ", Mr_Ms_Lastname(person = plaintiff), "’s case."))),
      fps(),
      fps(
        ftext(
          paste0(
            Dr_Mr_Ms_Expert_Lastname, "’s offhand claim that a spinal disk could not be \"exacerbated\" by the subject crash (i.e., either symptomatically activated, or worsened) is a fantasy, with no theoretical, much less factual or scientific basis. In making this entirely speculative and meaningless claim, ", Dr_Mr_Ms_Expert_Lastname, " engages in magical thinking, which collapses under the slightest bit of scrutiny."))),
      fps(),
      fps(
        ftext(
          paste0(
            "In ", his_her(person = defense_expert), " report, ", Dr_Mr_Ms_Expert_Lastname, " twice cited to publications on spinal disk biomechanics by a leading authority on the topic, Prof. Michael Adams. This very same author (Michael Adams PhD), in a 2012 textbook called \"The Biomechanics of Back Pain,\"")),
        run_footnote(x = footnotes_blocklist[28], prop = fp_text_refnote),
        ftext(
          paste0(
            "  wrote that"))),
      fps(),
      fps(
        ftext(
          "\"The magnitude of forces required to cause an individual disc to prolapse cannot reliably be predicted on the basis of gender, age, and spinal level.\" [page 263],"), style = "Quote"),
      fps(),
      fps(
        ftext("and that")),
      fps(),
      fps(
        ftext(
          "\"Most spinal compressive loading comes from back muscles, and forces are likely to rise to high levels during sudden and alarming incidents. These forces are difficult to quantify in retrospective analysis.\" [page 264],"), style = "Quote"),
      fps(),
      fps(
        ftext("and")),
      fps(),
      fps(
        ftext(
          "\"Clearly, to assume that the forces acting on the spine during whiplash are small just because the vehicle impacts are usually of low velocity would be a serious mistake. Muscle forces can be magnified in alarming situations, and if the muscles do not have time to react, then the underlying cervical spine is extremely vulnerable to bending.\" [pages 170-1]"), style = "Quote"),
      fps(),
      fps(
        ftext(
          paste0("It is clear that ", Dr_Mr_Ms_Expert_Lastname, "’s approach to providing ", his_her(person = defense_expert), " opinions regarding ", Mr_Ms_Lastname(person = plaintiff), "’s injuries is characterized by experts that ", he_she(person = defense_expert), " deems to be authorities in the field of spinal biomechanics as a \"serious mistake.\""))))
  }
}





if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "yes") {
    conclusions <- list(
      fps(
        ftext(
          "Thus, based on the most current evaluation of the totality of the scientific evidence, and given the lack of evidence for an intervening event, ", Mr_Ms_Lastname(person = plaintiff), "’s current persisting symptoms, need for treatment, and disability is solely attributable to the subject ", crash$date, " rear impact crash. The opinions to the contrary by the defendant’s medical expert Dr. Francis are not based in a valid factual, medical or scientific basis."
        )))
  } else {
    conclusions <- list(
      fps(),
      fps(
        ftext(
          "Conclusions", prop = fp_text_bold_underline
        )))
  }
  conclusions <- c(
    conclusions,
    list(
      fps(
        ftext(
          paste0(
            "Given the contiguous chain of causation from the day of the crash through ", Mr_Ms_Lastname(person = plaintiff), "’s most recent medical records, the lack of any significant pre-crash history of persisting spine pain and need for treatment in the years prior to the crash, as well as the relative risk of significant and persisting spine injury from the subject ", crash$pdof_text, " impact crash, I conclude that the most probable cause of the post-crash acute and chronic neck and low back injuries described in ", Mr_Ms_Lastname(person = plaintiff), "’s medical records and summarized in this report, including ", his_her(person = plaintiff), " symptomatic cervical and lumbar disk derangements, is the subject ", convert_date_format(crash$date), ", ", crash_speed_low_moderate_high, " speed ", crash$pdof_text, " impact crash."
          ))),
      fps(),
      fps(
        ftext(
          paste0(
            "I have ", ifelse(length(plaintiff$first_name) == 1, "not ", ""), "examined ", ifelse(length(plaintiff$first_name) == 1, "", "neither "), Mr_Ms_Lastname(conjunction = "nor"), " and I therefore have no opinions about ", his_her(person = plaintiff), " diagnoses, treatment, or prognoses outside of what is reflected in the medical record."
          )))))
}








if (doc_info$type == "report") {
  signature_block <- list(
    fps(),
    fps(
      ftext(
        "The preceding opinions were given as reasonable medical, and scientific probabilities. I reserve the right to amend any of my opinions should new information come to light.")),
    fps(),
    fps(
      ftext(
        "Very truly yours,")),
    fps(),
    fps(ext_img(src = file.path(imgpath, "MDF_signature.png"), width = 2.6)),
    fps(),
    fps(
      ftext(
        "Michael D. Freeman, MedDr, PhD, MScFMS, MPH, FRCPath, FFFLM, FACE, DLM")),
    fps(),
    fps(
      ftext(
        "David Jenkins Memorial Professor and Chair in Forensic and Legal Medicine", prop = fp_text_bold),
      run_linebreak(),
      ftext(
        "Faculty of Forensic and Legal Medicine, Royal College of Physicians (London, UK)"),
      run_linebreak(),
      run_linebreak(),
      ftext(
        "Associate Professor of Forensic Medicine,", prop = fp_text_bold),
      run_linebreak(),
      ftext(
        "Care and Primary Healthcare Research Institute, Faculty of Health, Medicine, and Life Sciences, Maastricht University, Maastricht, Netherlands"),
      run_linebreak(),
      run_linebreak(),
      ftext(
        "Clinical Professor of Forensic Psychiatry", prop = fp_text_bold),
      run_linebreak(),
      ftext(
        "Department of Psychiatry, School of Medicine, Oregon Health & Science University"),
      run_linebreak(),
      run_linebreak(),
      ftext(
        "Fellow, Royal College of Pathologists (UK)"),
      run_linebreak(),
      ftext(
        "Fellow, Faculty of Forensic and Legal Medicine, Royal College of Physicians (London, UK)"),
      run_linebreak(),
      ftext(
        "Fellow, American College of Epidemiology"),
      run_linebreak(),
      ftext(
        "Member, American Society of Biomechanics"
      ), style = "Author"
    )
  )
}



if (doc_info$type == "report") {
  if (doc_info$rebuttal$yes_no == "no") {
    if (plaintiff$injury_location == "disk") {
      appendix <- list(
        run_pagebreak(),
        # needs to be fpar (not fps) to allow center aligned text
        fpar(
          ftext(
            "Appendix", prop = fp_text_bold), fp_p = fp_par(text.align = "center")),
        fps(),
        fps(
          ftext(
            "The 3-step causation methodology that I have used in this case is set forth in a number of my peer-reviewed publications, including a paper entitled "), ftext("A Systematic Approach to Clinical Determinations of Causation in Symptomatic Spinal Disk Injury Following Motor Vehicle Crash Trauma", prop = fp_text_italic), ftext(", published in the "), ftext("Journal of Physical Medicine & Rehabilitation", prop = fp_text_underline), ftext(" in 2009. I first described this 3-step methodology in a paper published in 2008 and have since published more than a dozen papers describing some of the manifold applications of the causation methodology. As I describe below, the 3-step causal methodology has recently become part of United States Appellate Court case law on injury causation.")),
        fps(),
        fps(
          ftext(
            "The methodology set forth in my 2009 paper consists of 3 steps or elements that need to be satisfied in an injury causation analysis in order to conclude that an injury resulted from a particular event to a reasonable degree of medical/scientific probability, which are as follows:")),
        fps(),
        fps(
          ftext(
            "1.\t"), ftext("Plausibility", prop = fp_text_underline), ftext(": This first step addresses whether it is biologically "), ftext("possible", prop = fp_text_italic), ftext(" for the injury event to have caused the condition (a.k.a general causation). A finding of plausibility is unrelated to the "), ftext("frequency", prop = fp_text_italic), ftext(" of the injury, because even if the injury occurs in only 1 in 100 or fewer cases of exposure to the event (e.g. a spinal disk injury following a car crash), it is still "), ftext("plausibly", prop = fp_text_italic), ftext(" caused by the event. Plausibility is a relatively low hurdle to clear in a causal analysis and is largely satisfied by the lack of evidence of "), ftext("implausibility", prop = fp_text_italic), ftext(" of the relationship. Although it is common in crash injury litigation for the defendant to assert minimal vehicle damage as a basis for disputing injury causation, the approach is unhelpful for evaluating plausibility, as such an analysis does not have a sufficiently low error rate to establish impossibility, and at best can only be used to suggest a low frequency of injury in the general population. An example of an "), ftext("impossible", prop = fp_text_italic), ftext(" causal relationship is the discovery of leukemia the day after a crash, as it is well established that it is not biologically plausible for trauma to cause leukemia. Plausibility is often, but not necessarily, established with epidemiologic data or information."), style = "NumberList"),
        fps(),
        fps(
          ftext(
            "2.\t"), ftext("Temporality", prop = fp_text_underline), ftext(": This second step examines the clinical and other evidence of the timing between the onset of the symptoms of injury and the injury event and must be satisfied to assess specific causation. First, it must be established that the sequence of the injury and the event is appropriate; the symptoms cannot be identically present prior to the event. Further, the onset of the symptoms of injury cannot be implausibly latent, relative to the injury event. For example, while the symptoms of a spinal disk injury in the neck may not immediately include upper extremity radiculopathy (most such injuries are initially diagnosed as a simple sprain or strain), a complete absence of symptoms in the neck for 3 months after a traffic crash, followed by the sudden insidious onset of symptoms of a cervical disk injury with radiculopathy, could not be plausibly related to the crash in most cases."), style = "NumberList"),
        fps(),
        fps(
          ftext(
            "3.\t"), ftext("Lack of a more probable alternative explanation", prop = fp_text_underline), ftext(": This final step examines the probability of the injury condition occurring at the same point in time in the plaintiff, given what is known about the plaintiff from the review of medical records and other evidence, but in the absence of the injury event (a.k.a. differential etiology). First, evidence of competing injury events must be evaluated, and compared for injury risk. Then, the likelihood of the condition occurring spontaneously must be assessed. For example, the plaintiff may have evidence of degenerative changes in the spinal disks pre-existing a traffic crash, but no symptoms. The question of interest (after the first 2 steps are satisfied) is what the probability was that the condition would have \"converted\" from asymptomatic to symptomatic in the absence of (\"but-for\") the crash. More probable alternative explanations are often intervening traumatic events that alter the clinical history in a substantive way."), style = "NumberList"),
        fps(),
        fps(
          ftext(
            "The methodology described above was used to evaluate the cause of the Plaintiff’s injury in Etherton v Owners Insurance Company, entered on March 3, 2014 in United States District Court for the District of Colorado. In Etherton, the Plaintiff’s medical expert relied on the above referenced article to support her methodology (see footnote 3 on page 8 of the decision). The expert specified the same 3-step approach to assessing causation outlined above, described by the Court on page 8 of the order as follows:")),
        fps(),
        fps(
          ftext(
            "\"…his first step was to determine general causation… whether or not the type of injury that the plaintiff sustained could have been caused by the type of collision that the plaintiff was in… her second step was to consider whether there was a temporal relationship between plaintiff’s injury and the collision… her third step was to… rule out alternative causes of plaintiff’s injury.\""), style = "Quote"),
        fps(),
        fps(
          ftext(
            "The defense challenged, among other things, the reliability and fit of the methods described by the expert. After an extensive examination and discussion of the 3-step process used by the expert, the Court found that the methodology appropriately fit the specific facts of the case, and that a population-based (epidemiologic) approach was an appropriate part of the causal methodology. The Court denied the Defendant’s motion to strike the expert’s testimony.")),
        fps(),
        fps(
          ftext(
            "The Defendant appealed the ruling from the District Court, and in July of 2016, the Tenth Circuit U.S. Court of Appeals unanimously affirmed the 3-step causal methodology described in my 2009 publication cited above as generally accepted and well established for assessing injury causation (see "),
          ftext("Etherton v. Owners Insurance Company", prop = fp_text_italic),
          ftext(", No. 14-1164, 10th Cir, entered on July 19, 2016). Using the 3-step methodology, the Court determined the expert’s methodology fit the specific facts in the case, and that the District Court properly applied Rule 702/Daubert standard to the expert’s testimony in finding his methodology reliable. The judicial panel included current Supreme Court Justice Neil Gorsuch.")),
        fps(),
        fps(
          ftext(
            "Below is a partial list of publications in scientific journals in which my descriptions of the 3-step methodology described in the "), ftext("Etherton", prop = fp_text_italic), ftext(" decision and its various applications have been subjected to peer review. The foundation for the specific causation methodology described in all of these papers is the \"Hill criteria,\" a guideline for the assessment of general causation that has been universally relied on in medicine and science for more than 50 years.")),
        fps(),
        fps(
          ftext(
            "Dianita Ika Melia P, Zeegers MP, Herkutanto H, Freeman MD. Medicolegal causation investigation of bacterial endocarditis associated with an oral surgery practice using the INFERENCE approach. "), ftext("Int J Environ Res Public Health", prop = fp_text_italic), ftext(" 2021:18,7530. https://doi.org/10.3390/ijerph18147530."), style = "Bibliography"),
        fps(
          ftext(
            "Dianita Ika Melia P, Zeeger MP, Herkutanto H, Freeman MD. Development of the INFERENCE (INtegration of Forensic Epidemiology and the Rigorous EvaluatioN of Causation Elements) approach to causal inference in forensic medicine. "), ftext("Int J Environ Res Public Health", prop = fp_text_italic), ftext(" 2020;17:8353; doi:10.3390/ijerph17228353"), style = "Bibliography"),
        fps(
          ftext(
            "Dianita Ika Melia P, Freeman MD, Herkutanto H, Zeeger MP. A review of causal inference in forensic medicine. "), ftext("For Sci Med Path", prop = fp_text_italic), ftext(" 2020:doi.org/10.1007/s12024-020-00220-9."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD. A practicable and systematic approach to medicolegal causation. "), ftext("Orthopedics", prop = fp_text_italic), ftext(" 2018;41(2):70-2."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Zeegers M. Principles and applications of forensic epidemiology in the medicolegal setting. "), ftext("Law, Probability, & Risk", prop = fp_text_italic), ftext(" 2015; doi:10.1093/lpr/mgv010."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD. Medicolegal causation analysis of a lumbar spine fracture following a low speed rear impact traffic crash. "), ftext("J Case Rep Prac", prop = fp_text_italic), ftext(" 2015; 3(2): 23-29."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Cahn PJ, Franklin FA. Applied forensic epidemiology. Part 1: medical negligence. "), ftext("OA Epidemiology", prop = fp_text_italic), ftext(" 2014;2(1):2."), style = "Bibliography"),
        fps(
          ftext(
            "Koehler S, Freeman MD. Forensic epidemiology; a methodology for investigating and quantifying specific causation. "), ftext("Forens Sci Med Path", prop = fp_text_italic), ftext(" 2014 Jun;10(2):217-22."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Kohles SS. An examination of the threshold criteria for the evaluation of specific causation of mesothelioma following a history of significant exposure to chrysotile asbestos-containing brake dust, "), ftext("Int J Occ Env Hlth", prop = fp_text_italic), ftext(" 2012;18(4):329-36."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Everson T, Kohles SS. Forensic epidemiologic and biomechanical analysis of a pelvic cavity blowout injury associated with ejection from a personal watercraft (jet-ski). "), ftext("J Forens Sci", prop = fp_text_italic), ftext(" 2012 doi: 10.1111/j.1556-4029.2012.02250.x"), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Kohles SS. Plasma levels of polychlorinated biphenyls, non-Hodgkin lymphoma, and causation. "), ftext("J Environ Public Health", prop = fp_text_italic), ftext(" 2012;2012:258981. doi: 10.1155/2012/258981. Review."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Kohles SS. Application of the Hill Criteria to the Causal Association of Post-Traumatic Headache and Assault. "), ftext("Egypt J Forensic Sci", prop = fp_text_italic), ftext(" 2011;1:35-40."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Kohles SS. Application of the Bradford-Hill Criteria for Assessing Specific Causation in Post-Traumatic Headache. "), ftext("Brain Inj Prof", prop = fp_text_italic), ftext(" 2011;8(1):26-8."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Kohles SS. An Evaluation of Applied Biomechanics as an adjunct to systematic specific causation in forensic medicine. "), ftext("Wien Med Wochenschr", prop = fp_text_italic), ftext(" 2011;161:1-11."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Centeno CJ, Kohles SS. A systematic approach to clinical determinations of causation in symptomatic spinal disc injury following motor vehicle crash trauma. "), ftext("PM R", prop = fp_text_italic), ftext(" 2009;1(10):951-6."), style = "Bibliography"),
        fps(
          ftext(
            "Freeman MD, Rossignol AC, Hand M. Forensic Epidemiology: A systematic approach to probabilistic determinations in disputed matters. "), ftext("J Forensic Legal Med", prop = fp_text_italic), ftext(" 2008;15(5):281-90."), style = "Bibliography"
        )
      )
    }
  }
}
