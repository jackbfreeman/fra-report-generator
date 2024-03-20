inj_biomech <- list()

inj_biomech$intro$causation <- list(
  fpar(
    ftext(
      "Injury Causation Analysis", 
      prop = fp_text_lite(italic = TRUE, bold = TRUE))), 
  fpar(
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
  fpar(),
  # must be rendered with style "Body Text 3" for inverted indentation
  fpar(
    ftext(
      "The three fundamental elements or steps of an injury causation analysis are as follows: Whether the injury mechanism had the potential to cause the injury in question (aka general causation);")),
  fpar(
    ftext("The degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury; and")),
  fpar(
    ftext("Whether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology).")),
  fpar(),
  fpar(
    ftext("As applied to the facts in the subject case, these 3 steps are as follows:")),
  fpar(),
  fpar(
    ftext("Reconstruction of the crash", prop = fp_text_lite(italic = TRUE))),
  fpar((ftext("CRASH RECONSTRUCTION", prop = fp_text_lite(italic = TRUE, bold = TRUE)))),
  fpar(),
  fpar(ftext("Injury biomechanics", prop = fp_text_lite(italic = TRUE))))

inj_biomech$intro$rebuttal <- list(
  fpar(
    ftext(
      "The generally accepted and peer-reviewed method of crash-related injury causation analysis for a specific individual is performed by assessing the risk of injury from the collision and comparing it to the probability that the injuries or conditions would have been present at the same point in time if the collision had not occurred. The process is referred to as a \"3-step\" injury causation method in which improbable alternative causes are ruled out and the single most likely cause is identified. The analysis is accomplished via the application of crash reconstruction, biomechanical, medical, and epidemiologic (risk assessment) principles."),
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
  fpar(
    ftext(
      "The three fundamental elements or steps of an injury causation analysis are as follows: Whether the injury mechanism had the potential to cause the injury in question (aka general causation);"
    )),
  fpar(
    ftext(
      "The degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury;"
    )),
  fpar(
    ftext(
      "Whether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology)."
    )),
  fpar())

inj_biomech$meat$caus$frontal$disk <- list(
  fpar(
    ftext(
      paste0(
        "The subject high speed frontal collision would have produced high loads in ", Mr_Ms_Lastname(), "’s entire ", single_plural("body"), ", as they continued to travel forward inside the vehicle and into the deploying airbags, seatbelts, steering wheel, and dashboard at ", mdf_deltaV, " mph. The loads on ", Mr_Ms_Lastname(), "’s ", single_plural("spine"), " and spinal ", single_plural("disk")," would have included high levels of compression, rotation, and shear, and would have had the potential to cause any level of injury severity to ", Mr_Ms_Lastname(), ", including all of the injuries that ", he_she(), " ", single_plural("was"), " ultimately diagnosed with. The US National Highway Traffic Safety Administration reports that at an approximately ", mdf_deltaV, " mph crash, nearly AMOUNT% of occupants will sustain some degree of injury that is immediately apparent and requires medical evaluation, around AMOUNT% will sustain a fracture or more significant injury, and around AMOUNT% will sustain a life-threatening injury (i.e., spinal cord injury, skull fracture, etc.)."
      )),
    run_footnote(x = footnotes_blocklist[10], prop = fp_text_refnote)),
  fpar(
    ftext(
      paste0(
        "Thus, all of the injuries diagnosed in ", Mr_Ms_Lastname(), " after the subject collision, and the associated treatments that ", he_she(), " sought for ", his_her(), " symptoms of significant and persisting spinal injury, are entirely explained by the exceedingly dangerous high speed frontal crash that ", he_she(), " ", single_plural("was"), " exposed to."
      ))),
  fpar())

inj_biomech$meat$caus$rear$disk <- list(
  fpar(
    ftext(
      paste0(
        "The rear impact would have resulted in ", Mr_Ms_Lastname(), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around ", mdf_deltaV, " mph, and then rebounding forward into the restraining seat belt and toward the steering wheel (the first part of the crash kinematics that ", he_she(), " recall", ifelse(length(plaintiff$first_name) > 1, "", "s"), "). ", He_She(), " would have sustained substantial complex loads on ", his_her(), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs)."))),
  fpar(),
  fpar(
    ftext(
      paste0("The most reliable and largest set of published data on occupant forces in rear impacts indicate that, for a ", plaintiff$age[1], "-year-old ", if(plaintiff$gender[1] == "m") paste0("male") else if (plaintiff$gender[1] == "f") paste0("female") else (paste0("person")), " the average peak head acceleration of a ", mdf_deltaV, "-mph rear impact delta V would be around ", mdf_accel, " g, which would translate to a peak cervical spinal disk load of around ")), 
    # change, see where this number comes from
    ftext("100", prop = fp_text_lite(bold = TRUE)), 
    ftext(
      paste0(" lbs. on ", his_her(), " ", single_plural("neck"), ".  The same data indicate a load of around ", mdf_accel, " g on ", his_her(), " low ", single_plural("back"), ", which would translate to a peak load of around ")), 
    # change, see where this number comes from
    ftext("360", prop = fp_text_lite(bold = TRUE)), 
    ftext(
      paste0(" lbs. on ", his_her(), " lumbar spinal ", single_plural("disk"), ". These loads are more than sufficient to cause a wide range of musculoligamentous and skeletal injuries, including injuries to the intervertebral disks of the low back and neck. In the general population, the risk of a symptomatic cervical disk in a rear impact crash like the subject collision is represented in the chart below:"))),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "delta_V_binomial.png"), width = 4.2, height = 3.4), fp_p = fp_par(text.align = "center")),
  fpar(ftext("Chart showing the relationship between a ~5 to 6 mph delta V (red band) rear impact and cervical disk injury risk observed in 113 people exposed to real-world crashes. As demonstrated in the chart, the risk of a cervical disk injury ranges from 2.5 to 3.3%, or around 1 in 40 to 1 in 30 in such a crash. The risk to the low back is approximately 60% that of the risk to the neck. "), ftext("Note:", prop = fp_text_italic), ftext(" 5 to 6 mph is approximately equal to 8 to 10 km/h on the chart.")),
  fpar(),
  fpar(
    ftext(
      "Discussion")),
  fpar(
    ftext(
      paste0(
        "The types of spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (primarily chronically symptomatic disk derangements) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", men_women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(plaintiff, number = 1), " (who was ", plaintiff$age[1], " at the time of the crash) typically have ", asymptomatic_moderate, " age-related degenerative changes of the disks of the spine, a fact that makes the post-crash findings in ", Mr_Ms_Lastname(), "’s imaging more likely to be a combination of post-traumatic overlaying degeneration, as opposed to solely due to either trauma or pre-existing degeneration."))),
  fpar(),
  fpar(
    ftext(
      paste0(
        "The symptoms of spinal disk injury may, in some cases, be instantly recognizable after a traffic crash because of the sudden onset of radiculopathy, but recent research has demonstrated that only about 1 in 17 cervical disk injuries are recognized as such in the ED after a crash.")),
    run_footnote(x = footnotes_blocklist[13], prop = fp_text_refnote),
    ftext(
      " By far, the majority (94%) of what are later determined to be spinal disk injuries are initially diagnosed as in the ED as spinal strains.")),
  fpar(),
  fpar(
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
  fpar(),
  fpar(
    ftext(
      paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(), "’s body in the subject collision to have caused ", his_her(), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(), " spinal pain management procedures, etc."
      ))),
  fpar())

inj_biomech$meat$caus$rear$shoulder <- list(
  fpar(
    ftext(
      paste0(
        "The rear impact would have resulted in ", Mr_Ms_Lastname(), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around 5-6 mph, and then rebounding forward into the restraining seat belt and toward the steering wheel. ", Mr_Ms_Lastname(), " would have sustained substantial complex loads on ", his_her(), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs). The load on ", his_her(), " left ", single_plural("shoulder"), ", when ", single_plural("it"), " ", single_plural("was"), " restrained by the shoulder belt, would have likely exceeded several hundred lbs. The peak cervical, thoracic, and lumbar spinal disk loads could have ranged from 150 to 400 or more lbs., respectively, more than sufficient to cause a wide range of musculoligamentous and skeletal injuries."))),
  fpar(),
  fpar(
    ftext(
      paste0("While a 5-6 mph rear impact collision may not sound like a very significant event, such collisions can result in surprisingly violent occupant movement. This concept is more easily understood from a series of video still shots, reproduced below, from a rear impact collision crash test conducted at 5.2 mph delta V (the same as estimated for the subject crash), and resulting in no vehicle damage. The occupant depicted in the test sustained a measured 12.5 g of peak head acceleration:"))),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder1.png"), width = 4.2, height = 3.0)),
  fpar(ftext("Time = 0 msec: Occupant in neutral position at time of impact. Note the distance between the knee and the front of the seat.")),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder2.png"), width = 4.2, height = 3.0)),
  fpar(ftext("Time = 175 msec: The occupant’s torso completely compresses the seatback and the head and neck are at maximum extension. The hand comes off the steering wheel and the distance between the knee and the front of the seat now increases, as the hips begin to rebound forward ahead of the torso and head, indicating shear forces in the low back.")),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder3.png"), width = 4.2, height = 3.0)),
  fpar(ftext("Time = 200 msec: The occupant’s torso and head begin to rebound off of the compressed seatback. His right hand strikes the steering wheel and his knees move toward the dashboard.")),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder4.png"), width = 4.2, height = 3.0)),
  fpar(ftext("Time = 250 msec: The occupant is projected forward past his pre-crash position in the vehicle and loads the now locked shoulder belt with his left shoulder.")),
  fpar(),
  fpar(
    ftext(
      "The stills were part of a peer-reviewed research publication that I co-authored, which I will make available for demonstrative purposes upon request."
    ),
    run_footnote(x = footnotes_blocklist[22], prop = fp_text_refnote),
    ftext(",", prop = fp_text_refnote),
    run_footnote(x = footnotes_blocklist[23], prop = fp_text_refnote)),
  fpar(),
  fpar(
    ftext(
      paste0(
        "The crash testing and epidemiologic literature provides good information regarding the forces associated with a 5-6 mph rear impact delta V crash, which can be quite substantial. A recently published analysis of the world literature on the topic demonstrated the distribution of body accelerations and injury risks illustrated in the charts below:"
      ))),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder5.png"), width = 4.2, height = 3.4)),
  fpar(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and peak head acceleration measured in 126 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, peak head accelerations can exceed 17g (17 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart."))),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder6.png"), width = 4.2, height = 3.4)),
  fpar(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and peak low back acceleration measured in 39 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, peak low back accelerations can exceed 7g (7 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart."))),
  fpar(),
  fpar(
    external_img(src = file.path("..", "images", "biomech", "rear_shoulder7.png"), width = 4.2, height = 3.4)),
  fpar(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and cervical disk injury risk observed in 113 people exposed to real-world crashes. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, the risk of a cervical disk injury ranges from 2.5 to 3.2% or around 1 in 31 to 1 in 40. Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart."))),
  fpar(),
  fpar(
    ftext(
      paste0(
        "The types of shoulder and spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (a SLAP lesion and cervical and thoracic disk derangements) are consistent with the injury mechanism of the crash. The sheer forces exerted on ", Mr_Ms_Lastname(), "’s left shoulder by the shoulder belt (or possibly transmitted by transferred forces through ", Mr_Ms_Lastname(), "’s grip on the steering wheel), would have had the potential to cause the SLAP lesion diagnosed by ", plaintiff$dx_dr, ". This is one of the reasons that the American Academy of Orthopedic Surgeons lists traffic crashes prominently as one of the causes of SLAP lesions, along with falls, sports involving overhead movement, and dislocations.  The risk of SLAP lesions is closely associated with age, and ", men_women, " in ", Mr_Ms_Lastname(), "’s age group are at nearly ")), ftext("3", prop = fp_text_bold), ftext(paste0(" times the risk of the injury as ", men_women, " in their ", 10 * floor(plaintiff$age[1]/10) , "s, regardless of activity.  This is due to the normal wear and tear-related degenerative changes that occur in the shoulder over time, which has the tendency to make the shoulder more susceptible to injury in the event of a sudden traumatic load. There is no lower threshold of crash force for causing a SLAP lesion; any force that could cause a strain could also potentially cause a SLAP lesion, as the same structures are loaded regardless of the diagnosis. A study of rear impact crashes with an average delta V of 4 mph reported that around 1 in 10 subjects had persisting symptoms and diagnosis of shoulder injury at 5 or more weeks post-crash."
      ))),
  fpar(),
  fpar(
    ftext(
      paste0(
        "The types of spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (primarily symptomatic disk derangements in the neck and middle back) are highly consistent with the injury mechanism of the crash as well. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", men_women, " in their ", nth_decade, " like ", Mr_Ms_Lastname(plaintiff, number = 1), " typically have ", asymptomatic_moderate, " age-related degenerative changes of the disks of the spine, a factor that increases the risk of injury in the event of the crash like the subject rear impact. "
      ))),
  fpar(),
  fpar(
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
  fpar(),
  fpar(
    ftext(
      paste0(
        "Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(), "’s body in the subject collision to have caused ", his_her(), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(), " left shoulder SLAP repair surgery, etc."
      ))))

