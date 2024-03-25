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
      paste0("The purpose of this report is to assess the methods and conclusions of ", Dr_Mr_Ms_Expert_Lastname(), " as they pertain to the injury potential of the subject collision, relative to ", Mr_Ms_Lastname(), "’s post-crash diagnoses and treatment.)"
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