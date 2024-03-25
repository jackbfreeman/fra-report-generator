inj_biomech <- list()

inj_biomech$intro$causation <- list(
  fps(
    ftext(
      "Injury Causation Analysis", 
      prop = fp_text_lite(italic = TRUE, bold = TRUE))), 
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
      "The three fundamental elements or steps of an injury causation analysis are as follows: Whether the injury mechanism had the potential to cause the injury in question (aka general causation);")),
  fps(
    ftext("The degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury; and")),
  fps(
    ftext("Whether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology).")),
  fps(),
  fps(
    ftext("As applied to the facts in the subject case, these 3 steps are as follows:")),
  fps(),
  fps(
    ftext("Reconstruction of the crash", prop = fp_text_lite(italic = TRUE))),
  fps((ftext("CRASH RECONSTRUCTION", prop = fp_text_lite(italic = TRUE, bold = TRUE)))),
  fps(),
  fps(ftext("Injury biomechanics", prop = fp_text_lite(italic = TRUE))))

inj_biomech$intro$rebuttal <- list(
  fps(
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
  fps(
    ftext(
      "The three fundamental elements or steps of an injury causation analysis are as follows: Whether the injury mechanism had the potential to cause the injury in question (aka general causation);"
    )),
  fps(
    ftext(
      "The degree of temporal proximity between the injury mechanism and the onset of the symptoms reasonably indicating the presence of the injury;"
    )),
  fps(
    ftext(
      "Whether there is a more likely alternative explanation for the occurrence of the symptoms at the same point in time (aka differential etiology)."
    )),
  fps())

inj_biomech$meat$caus$frontal$disk <- list(
  fps(
    ftext(
      paste0(
        "The subject high speed frontal collision would have produced high loads in ", Mr_Ms_Lastname(), "’s entire ", single_plural("body"), ", as they continued to travel forward inside the vehicle and into the deploying airbags, seatbelts, steering wheel, and dashboard at ", mdf_deltaV, " mph. The loads on ", Mr_Ms_Lastname(), "’s ", single_plural("spine"), " and spinal ", single_plural("disk")," would have included high levels of compression, rotation, and shear, and would have had the potential to cause any level of injury severity to ", Mr_Ms_Lastname(), ", including all of the injuries that ", he_she(), " ", single_plural("was"), " ultimately diagnosed with. The US National Highway Traffic Safety Administration reports that at an approximately ", mdf_deltaV, " mph crash, nearly AMOUNT% of occupants will sustain some degree of injury that is immediately apparent and requires medical evaluation, around AMOUNT% will sustain a fracture or more significant injury, and around AMOUNT% will sustain a life-threatening injury (i.e., spinal cord injury, skull fracture, etc.)."
      )),
    run_footnote(x = footnotes_blocklist[10], prop = fp_text_refnote)),
  fps(
    ftext(
      paste0(
        "Thus, all of the injuries diagnosed in ", Mr_Ms_Lastname(), " after the subject collision, and the associated treatments that ", he_she(), " sought for ", his_her(), " symptoms of significant and persisting spinal injury, are entirely explained by the exceedingly dangerous high speed frontal crash that ", he_she(), " ", single_plural("was"), " exposed to."
      ))),
  fps())

inj_biomech$meat$caus$rear$disk <- list(
  fps(
    ftext(
      paste0(
        "The rear impact would have resulted in ", Mr_Ms_Lastname(), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around ", mdf_deltaV, " mph, and then rebounding forward into the restraining seat belt and toward the steering wheel (the first part of the crash kinematics that ", he_she(), " recall", ifelse(length(plaintiff$first_name) > 1, "", "s"), "). ", He_She(), " would have sustained substantial complex loads on ", his_her(), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs)."))),
  fps(),
  fps(
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
        "The types of spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (primarily chronically symptomatic disk derangements) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(plaintiff, number = 1), " (who was ", plaintiff$age[1], " at the time of the crash) typically have ", asymptomatic_moderate, " age-related degenerative changes of the disks of the spine, a fact that makes the post-crash findings in ", Mr_Ms_Lastname(), "’s imaging more likely to be a combination of post-traumatic overlaying degeneration, as opposed to solely due to either trauma or pre-existing degeneration."))),
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
      paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(), "’s body in the subject collision to have caused ", his_her(), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(), " spinal pain management procedures, etc."
      ))),
  fps())

inj_biomech$meat$caus$rear$shoulder <- list(
  fps(
    ftext(
      paste0(
        "The rear impact would have resulted in ", Mr_Ms_Lastname(), "’s ", single_plural("torso"), " and ", single_plural("head"), " initially being thrown rearwards into the seatback at around 5-6 mph, and then rebounding forward into the restraining seat belt and toward the steering wheel. ", Mr_Ms_Lastname(), " would have sustained substantial complex loads on ", his_her(), " ", single_plural("spine"), " in the collision, loads that include compression, rotation, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs). The load on ", his_her(), " left ", single_plural("shoulder"), ", when ", single_plural("it"), " ", single_plural("was"), " restrained by the shoulder belt, would have likely exceeded several hundred lbs. The peak cervical, thoracic, and lumbar spinal disk loads could have ranged from 150 to 400 or more lbs., respectively, more than sufficient to cause a wide range of musculoligamentous and skeletal injuries."))),
  fps(),
  fps(
    ftext(
      paste0("While a 5-6 mph rear impact collision may not sound like a very significant event, such collisions can result in surprisingly violent occupant movement. This concept is more easily understood from a series of video still shots, reproduced below, from a rear impact collision crash test conducted at 5.2 mph delta V (the same as estimated for the subject crash), and resulting in no vehicle damage. The occupant depicted in the test sustained a measured 12.5 g of peak head acceleration:"))),
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
  fps(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and peak head acceleration measured in 126 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, peak head accelerations can exceed 17g (17 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
  fps(),
  fps(
    ext_img(src = file.path(imgpath, "biomech", "rear_shoulder6.png"), width = 4.2), style = "Subtitle"),
  fps(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and peak low back acceleration measured in 39 volunteers. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, peak low back accelerations can exceed 7g (7 times the forces of gravity). Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
  fps(),
  fps(
    ext_img(src = file.path(imgpath, "biomech", "rear_shoulder7.png"), width = 4.2), style = "Subtitle"),
  fps(ftext(paste("Chart showing the relationship between a 5-6 mph delta V rear impact and cervical disk injury risk observed in 113 people exposed to real-world crashes. The red band shows the magnitude of the crash", Mr_Ms_Lastname(), "was exposed to. As demonstrated in the chart, the risk of a cervical disk injury ranges from 2.5 to 3.2% or around 1 in 31 to 1 in 40. Note: 5-6 mph is approximately equal to 8 to 10 km/h on the chart.")), style = "caption"),
  fps(),
  fps(
    ftext(
      paste0(
        "The types of shoulder and spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (a SLAP lesion and cervical and thoracic disk derangements) are consistent with the injury mechanism of the crash. The sheer forces exerted on ", Mr_Ms_Lastname(), "’s left shoulder by the shoulder belt (or possibly transmitted by transferred forces through ", Mr_Ms_Lastname(), "’s grip on the steering wheel), would have had the potential to cause the SLAP lesion diagnosed by ", plaintiff$dx_dr, ". This is one of the reasons that the American Academy of Orthopedic Surgeons lists traffic crashes prominently as one of the causes of SLAP lesions, along with falls, sports involving overhead movement, and dislocations.  The risk of SLAP lesions is closely associated with age, and ", men_women, " in ", Mr_Ms_Lastname(), "’s age group are at nearly ")), ftext("3", prop = fp_text_bold), ftext(paste0(" times the risk of the injury as ", men_women, " in their ", 10 * floor(plaintiff$age[1]/10) , "s, regardless of activity.  This is due to the normal wear and tear-related degenerative changes that occur in the shoulder over time, which has the tendency to make the shoulder more susceptible to injury in the event of a sudden traumatic load. There is no lower threshold of crash force for causing a SLAP lesion; any force that could cause a strain could also potentially cause a SLAP lesion, as the same structures are loaded regardless of the diagnosis. A study of rear impact crashes with an average delta V of 4 mph reported that around 1 in 10 subjects had persisting symptoms and diagnosis of shoulder injury at 5 or more weeks post-crash."
        ))),
  fps(),
  fps(
    ftext(
      paste0(
        "The types of spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (primarily symptomatic disk derangements in the neck and middle back) are highly consistent with the injury mechanism of the crash as well. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, " like ", Mr_Ms_Lastname(plaintiff, number = 1), " typically have ", asymptomatic_moderate, " age-related degenerative changes of the disks of the spine, a factor that increases the risk of injury in the event of the crash like the subject rear impact. "
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
        "Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(), "’s", single_plural("body"), " in the subject collision to have caused ", his_her(), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(), " left shoulder SLAP repair surgery, etc."
      ))))


inj_biomech$meat$caus$near_side$disk <- list(
  fps(
    ftext(
      paste0(
        "The driver’s-side impact would have resulted in the ", plaintiff$car_make, "’s ", single_plural("occupant"), " to initially move to the left and somewhat forward at ", mdf_deltaV, " mph, until ", Mr_Ms_Lastname(), " struck the center console ", ifelse(length(plaintiff$first_name > 1), "and passenger door")," with ", his_her(), " lower extremities and ", single_plural("was"), " restrained by ", his_her(), " ",  single_plural("seatbelt"), " which would have caused ", his_her(), " ", single_plural("head"), " to continue to accelerate left and forward and create high bending loads on the joints and disks of ", his_her(), " ", single_plural("neck"), ", combined with sudden muscular protective forces which would have produced high levels of compression on the spinal disks in the neck and back.")),
    run_footnote(x = footnotes_blocklist[28], prop = fp_text_refnote), 
    ftext(
      paste0(" Per ", his_her(), " description, ", Mr_Ms_Lastname(), " then rebounded back to ", his_her(), " right and struck the passenger side door and window. This all would have taken less time than it takes to blink an eye (around 250 msecs)."))),
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
  fps(
    ftext(
      "Discussion", prop = fp_text_italic)),
  fps(
    ftext(
      paste0(
        "The types of spinal injuries that ", Mr_Ms_Lastname(), " was diagnosed with (primarily symptomatic disk derangements and associated sequelae) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. ", Men_Women, " in their ", nth_decade, ", like ", Mr_Ms_Lastname(), " (who was 12 at the time of the crash) typically have d age-related degenerative changes of the disks of the spine, a fact that makes the collision more likely to have \"converted\" at least some asymptomatic disk degeneration to a symptomatic state, rather than being the sole cause of all of the pathology identified in the post-crash imaging."))),
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
        "Based on the preceding discussion there was ample and biomechanically appropriate force exerted on ", Mr_Ms_Lastname(), "’s body in the subject collision to have caused ", his_her(), " medically documented injuries, and associated need for evaluation and treatment, including ", his_her(), " spinal pain management procedures and cervical spine surgery."
      )
    )
  ),
  fps()
)


inj_biomech$meat$caus$near_side$shoulder <- list(
  fps(
    ftext(
      paste0("The initial impact would have resulted in Mr. «plaintiff_last_name»’s body initially being thrown forward and to the left at around a 10:30 vector at around «MDF_deltaV_mph» mph and into his restraining shoulder belt and toward the driver’s side door, as well as the steering wheel. He would have sustained substantial complex loads on his spine in the collision, loads that include compression, rotation, forward and lateral flexion, and shear all occurring at the same time and to varying degrees in less time than it takes to blink an eye (around 250 msecs). Mr. «plaintiff_last_name»’s left shoulder would have sustained a sudden transient load potentially exceeding 500 lbs. as it interacted with the shoulder belt, or possibly the driver’s side door."))),
  fps(),
  fps(
    ftext(
      "Discussion", prop = fp_text_italic)),
  fps(
    ftext(
      paste0(
        "The types of spine and extremity injuries that Mr. «plaintiff_last_name» was diagnosed with are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. Men in their «decade»th decade, like Mr. Walker (who was «plaintiff_age_at_time_of_crash» at the time of the crash) typically have d age-related degenerative changes of the disks of the spine, a fact that makes the post-crash findings in Mr. «plaintiff_last_name»’s imaging more likely due to a combination of the trauma of the crash, and some degree of pre-existing degeneration. The same principles apply to Mr. «plaintiff_last_name»’s left shoulder injury; «plaintiff_age_at_time_of_crash» year old men typically have some degenerative changes in the joints and rotator cuff of the shoulder, but the frank tear and other injuries observed in Mr. «plaintiff_last_name»’s MRI and during the arthroscopic procedure performed on his left shoulder are likely a result of the acute trauma of the subject collision, rather than purely a pre-existing asymptomatic condition that was converted to symptomatic by the crash."))),
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
      paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on Mr. «plaintiff_last_name»’s body in the subject collision to have caused his medically documented injuries, and associated need for evaluation and treatment, including his spinal pain management procedures, etc."
      )
    )
  ),
  fps()
)


inj_biomech$meat$caus$near_side$shoulder <- list(
  fps(
    ftext(
      paste0("The right front impact would have resulted in Mr. SAMPLE-P1-LN’s torso and head to initially be thrown forward and to the right, toward the rearview mirror/ center console at around SAMPLE-MDF-DV mph, until he  was restrained by their seatbelt and likely muscular contraction from holding the steering wheel. The force of the motion would have created high bending loads on the joints and disks of his  neck and spine, likely combined with sudden muscular protective forces which would have produced high levels of compression on the spinal disks in Mr. SAMPLE-P1-LN’s neck and back.  This all would have taken less time than it takes to blink an eye (around 200 msecs)."))),
  fps(),
  fps(
    ftext(
      "Discussion", prop = fp_text_italic)),
  fps(
    ftext(
      paste0(
        "The types of spinal injuries that Mr. SAMPLE-P1-LN was diagnosed with (primarily symptomatic disk derangements overlaying pre-existing degenerative changes) are highly consistent with the injury mechanism of the crash. Traumatic loading of the spine that results in axial (up and down) compression, particularly in combination with the other load types occurring with the subject collision, has the potential to damage the peripheral disk annulus, which surrounds and holds in the disk nucleus. Men in their 2th decade, like Mr. SAMPLE-P1-LN (who was 12 at the time of the crash) typically have d age-related degenerative changes of the disks and joints of the spine. Mr. SAMPLE-P1-LN had an extensive pre-crash history of spinal injury and symptoms, including persisting symptoms after an unsuccessful low back spine surgery, as well as right shoulder symptoms, indicating that his cervical spine was likely far more fragile than the average driver, or even the average 12-year-old male driver. These considerations make the subject collision far more likely to have \"converted\" asymptomatic or minimally symptomatic cervical spine degenerative changes to a symptomatic state, rather than being the sole cause of all or even most of the pathology identified in the post-crash imaging."))),
  fps(
    ftext(
      paste0("The symptoms of spinal disk injury may, in some cases, be instantly recognizable after a traffic crash because of the sudden onset of radiculopathy, but recent research has demonstrated that only about 1 in 17 cervical disk injuries are recognized as such in the ED after a crash.  By far, the majority (94%) of what are later determined to be spinal disk injuries are initially diagnosed as in the ED as spinal strains."))),
  fps(
    ftext(
      paste0("Although the subject crash was no \"bumper tap\" it is well established in biomechanics, medicine, and epidemiology that an excessive level of force is not required to cause symptomatic injury to a spinal disk with any degree of degeneration, and that in most cases, the diagnostic imaging of the disk will not reveal whether related symptoms are of a traumatic origin or not, in the absence of fracture.  Traumatic disk injuries have been described in the peer-reviewed literature as resulting from low to moderate force events, including minimal or no damage traffic crashes, roller coaster rides, and even more mild forces such as sneezing.")),
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
        " It is accurate to state, both from a biomechanical and epidemiological perspective, that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur, and that the load threshold at which individual’s disk may injured is only known after the injury has occurred, and the external load has been estimated. It is impossible to estimate the additional compression due to internal forces, however, and the precise load associated with a temporally proximate spinal disk injury is often impossible to accurately determine after the fact."))),
  fps(
    ftext(
      paste0("Based on the preceding discussion there was ample and biomechanically appropriate force exerted on Mr. SAMPLE-P1-LN’s body in the subject collision to have caused his  medically documented injuries, and associated need for evaluation and treatment, including his  spinal pain management procedures and cervical spine surgery."
      )
    )
  ),
  fps()
)


inj_biomech$meat$rebuttal <- list(
  fps(
    ftext(
      paste0(
        "SAMPLE-BIOMECH-LN’s frankly absurd comparisons to everyday activities and volunteer crash tests in no way addressed whether the subject collision could have caused the injuries and sequelae observed in Mr. SAMPLE-P1-LN, the first element of the causal analysis.  SAMPLE-BIOMECH-LN’s blanket denial that a mechanism existed in the subject collision for any of Mr. SAMPLE-P1-LN’s diagnosed and persisting injuries is an uninformed assertion with no basis in science, medicine, or the facts in this case and does not constitute an assessment of the plausibility of his injuries resulting from the collision."))),
  fps(),
  fps(
    ftext(
      paste0("SAMPLE-BIOMECH-LN has no information on the pre-crash condition of Mr. SAMPLE-P1-LN’s spine, or any other part of his body. He couldn’t pick him out of a lineup and hasn’t the faintest idea of his tolerance to any type of trauma, including the subject crash. ")), ftext("The tolerance of an individual to forceful external loads is only defined once it has been exceeded,", prop = fp_text_bold), ftext(paste0(" not based on comparisons to studies of dissimilar forces applied to bits and pieces of dead bodies (part of the basis for  SAMPLE-BIOMECH-LN’s opinion). A review of all of the evidence in the subject case clearly established the fact that Mr. SAMPLE-P1-LN’s tolerance was exceeded by the forces of the subject crash."))),
  fps(),
  fps(
    ftext(
      paste0("As  SAMPLE-BIOMECH-LN does not (and cannot) dispute any of Mr. SAMPLE-P1-LN’s diagnoses, and he does not provide an alternative explanation for how his diagnosed injuries would have occurred at the same time as the collision, his analysis is incomplete, and fails to account for the undeniable evidence of injury following the crash."))),
  fps(),
  fps(
    ftext(
      paste0("The generally accepted 3-step approach to causation described above dictates that if there are no other contemporaneous competing causes for the injury that are more likely than an investigated plausible cause of the injury, then it is the investigated cause that is the most likely cause.  SAMPLE-BIOMECH-LN simply ignored Mr. SAMPLE-P1-LN’s medical history like it never happened; his approach to \"assessing\" the cause of his injuries was to reject any evidence that he was injured in the first place.  SAMPLE-BIOMECH-LN doesn’t consider, much less mention the fact, that there are no plausible competing causes of Mr. SAMPLE-P1-LN’s injuries occurring at the same time as the crash."))),
  fps(),
  fps(
    ftext(
      paste0("The concept of injury thresholds as a bright line below which no injury can occur is one that has been evaluated and rejected by the biomechanical community that is involved with the evaluation of occupant forces in motor vehicle crashes. Injury thresholds have nothing to do with the evaluation of real-world collisions and can never be used to deny the presence of a real-world injury following a collision. This is made clear in an SAE publication (J885) that summarizes human threshold data for use in government crash testing:")),
    run_footnote(x = footnotes_blocklist[13], prop = fp_text_refnote)
    ),
  fps(),
  fps(
    ftext(
      paste0("\"Such [tolerance] specifications are beyond the state-of-the-art in biomechanics except perhaps for a few academic situations. There are several difficulties which prevent a ready establishment of human tolerance levels. First, there are differences in judgment as to the specific degree of injury severity that should serve as the tolerance level. Second, large differences exist in the tolerances of different individuals. It is not unusual for bone fracture tests on a sample of adult cadavers to show a three-to-one load variation. Presumably, variations of at least this magnitude exist in the living population. Finally, most tolerance levels are sensitive to modest changes in the direction, shape, and stiffness of the loading source. The above considerations indicate that complete and precise definitions of human tolerance levels will require large amounts of data based on controlled statistical samples. Only in this way can the influence of age, size, sex, and weight be comprehensively assessed and only in this way can mean loads and statistical measures of scatter be linked to specific tolerance levels.\""))),
  fps(),
  fps(
    ftext(
      paste0("Crash severity analysis"))),
  fps(
    ftext(
      paste0("RECON CRASH RELATED ACCELERATION DELTA V ANALYSIS PLACEHOLDER"
      )
    )
  )
)