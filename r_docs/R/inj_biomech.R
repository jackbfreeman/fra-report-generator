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
        Dr_Mr_Ms_Expert_Lastname, "’s frankly absurd comparisons to everyday activities and volunteer crash tests in no way addressed whether the subject collision could have caused the injuries and sequelae observed in Mr. SAMPLE-P1-LN, the first element of the causal analysis. ", Dr_Mr_Ms_Expert_Lastname, "’s blanket denial that a mechanism existed in the subject collision for any of Mr. SAMPLE-P1-LN’s diagnosed and persisting injuries is an uninformed assertion with no basis in science, medicine, or the facts in this case and does not constitute an assessment of the plausibility of his injuries resulting from the collision."))),
  fps(),
  fps(
    ftext(
      paste0("SAMPLE-BIOMECH-LN has no information on the pre-crash condition of Mr. SAMPLE-P1-LN’s spine, or any other part of his body. He couldn’t pick him out of a lineup and hasn’t the faintest idea of his tolerance to any type of trauma, including the subject crash. ")), ftext("The tolerance of an individual to forceful external loads is only defined once it has been exceeded,", prop = fp_text_bold), ftext(paste0(" not based on comparisons to studies of dissimilar forces applied to bits and pieces of dead bodies (part of the basis for ", Dr_Mr_Ms_Expert_Lastname, "’s opinion). A review of all of the evidence in the subject case clearly established the fact that Mr. SAMPLE-P1-LN’s tolerance was exceeded by the forces of the subject crash."))),
  fps(),
  fps(
    ftext(
      paste0("As ", Dr_Mr_Ms_Expert_Lastname, " does not (and cannot) dispute any of Mr. SAMPLE-P1-LN’s diagnoses, and he does not provide an alternative explanation for how his diagnosed injuries would have occurred at the same time as the collision, his analysis is incomplete, and fails to account for the undeniable evidence of injury following the crash."))),
  fps(),
  fps(
    ftext(
      paste0("The generally accepted 3-step approach to causation described above dictates that if there are no other contemporaneous competing causes for the injury that are more likely than an investigated plausible cause of the injury, then it is the investigated cause that is the most likely cause. ", Dr_Mr_Ms_Expert_Lastname, " simply ignored Mr. SAMPLE-P1-LN’s medical history like it never happened; his approach to \"assessing\" the cause of his injuries was to reject any evidence that he was injured in the first place. ", Dr_Mr_Ms_Expert_Lastname, " doesn’t consider, much less mention the fact, that there are no plausible competing causes of Mr. SAMPLE-P1-LN’s injuries occurring at the same time as the crash."))),
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
  fps(),
  fps(
    ftext(
      paste0("RECON CRASH RELATED ACCELERATION DELTA V ANALYSIS PLACEHOLDER"
      )
    )
  )
)




three_steps <- list()
three_steps$causation$disk <- list(
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
      paste0(" the causal relationship between the trauma and onset of the symptoms indicative of the injury is usually close enough in time that it is easy to recognize when the injury was incurred. There are some injuries that exhibit a delayed onset of symptoms, including injuries to intervertebral disks, which can first manifest with identical symptoms to a simple spinal strain. Other injuries are always immediately apparent, such as bony fractures. Some injuries are considered \"distracting\" from others because the pain they generate distracts attention from other, less painful injuries. There are still other injuries that can \"mask\" pain from nearby parts of the body through complicated pain accommodation mechanisms that are mediated at the spinal cord and in the brain. The assessment of the timing of the onset of symptoms reasonably attributed to an injury can sometimes be nuanced and complicated, and sometimes requires expert assessment."))),
  fps(),
  fps(
    ftext(
      paste0(
        Mr_Ms_Lastname(number = 1), " experienced the onset of symptoms indicative of acute spinal injury immediately after the crash, and he was diagnosed with neck and back injuries directly by 3 days following the crash, including the presentation of lower extremity radicular symptoms, an ominous early sign of injury to the intervertebral disks in the spine. The symptoms and diagnoses progressively evolved and worsened over the weeks and months following the crash and demonstrate a well-documented contiguous chain of causation linking the subject crash and their low back and cervical spinal injuries, and associated need for treatment."))),
  fps(),
  fps(
    ftext(
      paste0(
        "Based on this history, there was a strong temporal relationship between the subject collision and ", Mr_Ms_Lastname(), "’s first development of symptoms indicative of spinal injury."))),
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
      paste0("This part of the analysis is accomplished in 2 ways; first and most obviously, any competing contemporaneous traumatic cause of injury must be ruled out. There is, however, no such history for ", Mr_Ms_Lastname(conjunction = "or"), ", and the only source of trauma apparent in my review of materials that is temporally proximate to their post-crash injuries is the ", crash$date, " ", crash$pdof, " impact crash."))),
  fps(),
  fps(
    ftext(
      paste0(
        "The second part of the analysis requires an assessment of the probability that ", Mr_Ms_Lastname(conjunction = "or"), " would have developed the symptoms and diagnoses of spine injury at the same point in time had they not been initially injured in the ", crash$date, " ", crash$pdof, " impact crash. As a generally healthy 12-year-old man, Mr. SAMPLE-P1-LN was at a negligible annual risk of spontaneously developing chronically painful and potentially surgical cervical or lumbar spinal disk derangements; less than 1 in 2,000 is indicated by epidemiologic study and national hospital data.")),
    run_footnote(x = footnotes_blocklist[32], prop = fp_text_refnote),
    ftext(
      paste0(
        " The chance that they were going to develop the onset of chronic neck or low back pain attributable to symptomatic disk derangements on the same day as the crash by pure coincidence is obviously much smaller; less than 1 in 730,000 (the annual risk divided by 365 days). In comparison the risk of acute spine injury in the subject crash was more than 50%, and the risk of a spinal disk injury was likely no less than 1 in 25 in the general population.  Based on this comparison of risk during the timeframe of interest, the crash is the most likely cause of Mr. SAMPLE-P1-LN and Mr. SAMPLE-P2-LN’s chronic spinal injuries by >99%."))),
  fps(),
  fps(
    ftext(
      paste0("A relatively common medicolegal question is whether persisting symptoms of back or neck pain after a traffic crash are truly related to the crash, or more probably due to other factors incidental to an acute crash-related injury to the spine. Most typically, the \"other factors\" that are raised in a medicolegal setting are the presence of pre-existing degenerative changes in the spine, or pre-crash history of low level or sporadic symptoms."))),
  fps(),
  fps(
    ftext(
      paste0("The answer to this question is now decided science. Along with my research colleagues, I have recently published 2 analyses and systematic reviews of nearly 10,000 articles regarding the long-term effects of traffic crash-related injury to the neck and low back and associated chronic pain. ,  Systematic reviews are considered the most reliable and strongest form of scientific evidence (i.e. Level I evidence), as they consist of a comprehensive synthesis of world literature on a topic.  The result of the analyses indicate that when men like Mr. SAMPLE-P1-LN  and men like Mr. SAMPLE-P2-LN have persisting neck or back pain after an acute crash-related injury, ")), ftext("more often than not", prop = fp_text_italic), ftext(" (>50% of the time) the symptoms are due to the crash, versus all other causes, regardless of pre-crash medical history."
      )))


three_steps$rebuttal$all_experts <- list(
  fps(),
  fps(
    ftext(
      "Can the injury potential of the subject collision be determined from crash testing of volunteers?", prop = fp_text_italic_underline)),
  fps(
    ftext(
      paste0(
        "SAMPLE-BIOMECH-LN cited to human volunteer crash testing for his opinion that Mr. SAMPLE-P1-LN could not have sustained any significant injury in the subject crash. The comparison between a real-world crash and the results of volunteer crash tests as a means of assessing injury causation is a practice that has been rejected by the relevant scientific and automotive engineering community as improper and unreliable. I have written and had published a number of peer-reviewed papers as well as a book on human volunteer crash testing and can state as a certainty that it is well established in the scientific literature that human volunteer testing (mostly crash testing) is not a valid basis for any determination of injury risk, probability, or cause in real world crashes. ")), ftext(paste0("There are no crash tests that have ever been structured like the subject crash ("), prop = fp_text_italic), ftext(paste0("", crash$pdof, " impact of SAMPLE-MDF-DV mph delta V"), prop = fp_text_bold_italic), ftext("), as it would be irresponsible to perform such a test.", prop = fp_text_italic)),
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
      paste0("Despite the warning that \"true tolerance levels cannot be determined with volunteers\" from ")), ftext("the", prop = fp_text_bold), ftext(paste0(" authoritative publication on automotive testing and human tolerance, ", Dr_Mr_Ms_Expert_Lastname, " described and referred to studies primarily consisting of single ", crash$pdof, " impact collisions of less than 5 mph (with no secondary frontal crash) on healthy male volunteers, and from these papers drew the conclusion that it was essentially impossible for Mr. SAMPLE-P1-LN to have been injured in the subject collision."))),
  fps(),
  fps(
    ftext(
      paste0("Human volunteer crash testing is designed to ")), ftext("not produce injury", prop = fp_text_italic), ftext(paste0(", and the utmost care is taken to ensure that injury is unlikely. The people who volunteer to participate in experimental crash tests are not comparable to those who are injured in similar crashes in many respects, and this includes the plaintiff. For any published crash test, the authors ")), ftext("typically", prop = fp_text_italic), ftext(paste0(" must secure Institutional Review Board (IRB) approval in order to assure the safety of the volunteers (this is in accordance with the Declaration of Helsinki, an international treaty on human subject experimentation)."))),
  fps(),
  fps(
    ftext(
      paste0("As mentioned earlier, the peer-reviewed authoritative automotive engineering and biomechanical literature specifically states that crash tests are not an appropriate basis for any determination of real-world injury thresholds. In 1999 I published a peer-reviewed paper in the premier journal in the world on Spine surgery at that time (")), ftext("Spine", prop = fp_text_italic), ftext(paste0("), which specifically criticized some of the volunteer crash test publications cited by ", Dr_Mr_Ms_Expert_Lastname, " in his report for erroneously claiming an injury threshold from such testing.")),
    run_footnote(x = footnotes_blocklist[35], prop = fp_text_refnote),
    ftext(
      paste0(
        " SAMPLE-BIOMECH-LN presents no evidence to demonstrate that the basic scientific principles described in this 23-year old publication should be violated for his assertions regarding the cause of Mr. SAMPLE-P1-LN’s post-collision diagnoses and need for treatment."))),
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
      paste0("It should be patently obvious how ridiculous and frankly dishonest the comparison is between any collision and ")), ftext("any", prop = fp_text_italic), ftext(paste0(" everyday activity; there is no biomechanical similarity between a crash and an ADL. The direction, duration, and rapidity of acceleration that results in the kind of violent movement that occurs even in a low-speed crash is noncomparable in all respects to the self-generated, slow onset and long duration accelerations of daily activities."))),
  fps(),
  fps(
    ftext(
      paste0("The actual risk of injury from a lower speed crash is not determined by a comparison to an activity that never causes injury, of course. Such determinations are made by examining epidemiologic data regarding real world crashes and the types of injuries that result from them. This is precisely what my colleagues and I did in a recent peer-reviewed research publication, in which we noted the following:")),
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
      " \"There is no other example in the biomedical literature in which the established injury risk of any traumatic event is overlooked in favor of a comparison between the acceleration of the event and a non-injurious activity.", prop = fp_text_bold), ftext(" Although there may be multiple shared attributes of traffic crashes and some ADLs, just as there are multiple shared attributes of stepping down from a stair and falling down a stair (i.e., the travel distances are the same, gravity is 9.81 m/s2 in both scenarios), alluding to the absence of injury while ordinarily walking down stairs sheds no light on the frequency of injury from falling down stairs. "), ftext("The comparison is inapt and should not be made.\"", prop = fp_text_bold), style = "Quote"),
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
      paste0("The fact that ", Dr_Mr_Ms_Expert_Lastname, " compared an event (a less than 10 mph ", crash$pdof, " impact collision) that is irrefutably established by US national crash data to cause injury at least 1 out 4 times to ADLs which virtually ")), ftext("never cause injury", prop = fp_text_bold), ftext(" is a perfect illustration of how misleading and frankly dishonest the comparison is.")),
  fps(),
  fps(
    ext_img(src = file.path(imgpath, "three_steps_alt_explan", "rebuttal2.png"), width = 6.3), style = "Subtitle"),
  fps(),
  fps(
    ftext(
      paste0(
        "Can a biomechanical analysis demonstrate that Mr. SAMPLE-P1-LN was not injured in the subject crash?"), prop = fp_text_italic_underline)),
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
      " It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur. ", Dr_Mr_Ms_Expert_Lastname, "’s claims to the contrary are contrived and easily disproven, not to mention at odds with the specific facts in Mr. SAMPLE-P1-LN’s case."))),
  fps(),
  fps(
    ftext(
      paste0(
        "SAMPLE-BIOMECH-LN’s offhand claim that a spinal disk could not be \"exacerbated\" by the subject crash (i.e., either symptomatically activated, or worsened) is a fantasy, with no theoretical, much less factual or scientific basis. In making this entirely speculative and meaningless claim, ", Dr_Mr_Ms_Expert_Lastname, " engages in magical thinking, which collapses under the slightest bit of scrutiny."))),
  fps(),
  fps(
    ftext(
      paste0(
        "In his report, ", Dr_Mr_Ms_Expert_Lastname, " twice cited to publications on spinal disk biomechanics by a leading authority on the topic, Prof. Michael Adams. This very same author (Michael Adams PhD), in a 2012 textbook called \"The Biomechanics of Back Pain,\"")),
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
      paste0("It is clear that ", Dr_Mr_Ms_Expert_Lastname, "’s approach to providing his opinions regarding Mr. SAMPLE-P1-LN’s injuries is characterized by experts that he deems to be authorities in the field of spinal biomechanics as a \"serious mistake.\""))))



conclusions <- list()
conclusions$causation <- list(
  fps(),
  fps(),
  fps(
    ftext(
      "Conclusions", prop = fp_text_bold)),
  fps(),
  fps(
    ftext(
      paste0(
        "Given the contiguous chain of causation from the day of the crash through Mr. SAMPLE-P1-LN's and Mr. SAMPLE-P2-LN’s most recent medical records, the lack of any significant pre-crash history of persisting spine pain and need for treatment in the years prior to the crash, as well as the relative risk of significant and persisting spine injury from the subject frontal impact crash, I conclude that the most probable cause of the post-crash acute and chronic neck and low back injuries described in Mr. SAMPLE-P1-LN's and Mr. SAMPLE-P2-LN’s medical records and summarized in this report, including their symptomatic cervical and lumbar disk derangements, is the subject 1/1/2002 frontal impact crash."))),
  fps(),
  fps(
    ftext(
      paste0(
        "I have examined neither Mr. SAMPLE-P1-LN nor Mr. SAMPLE-P2-LN and I therefore have no opinions about their diagnoses, treatment, or prognoses outside of what is reflected in the medical record. This is not to say that I am not qualified, licensed, and extensively experienced in performing such evaluations, but that I have not done so in this case."
      ))))

conclusions$rebuttal <- list(
  fps(),
  fps(),
  fps(
    ftext(
      "Conclusions", prop = fp_text_bold)),
  fps(),
  fps(
    ftext(
      paste0(
        "Given the contiguous chain of causation from the day of the crash through Mr. SAMPLE-P1-LN's and Mr. SAMPLE-P2-LN’s most recent medical records, the lack of any significant pre-crash history of persisting spine pain and need for treatment in the years prior to the crash, as well as the relative risk of significant and persisting spine injury from the subject frontal impact crash, I conclude that the most probable cause of the post-crash acute and chronic neck and low back injuries described in Mr. SAMPLE-P1-LN's and Mr. SAMPLE-P2-LN’s medical records and summarized in this report, including their symptomatic cervical and lumbar disk derangements, is the subject 1/1/2002 frontal impact crash."))),
  fps(),
  fps(
    ftext(
      paste0(
        "I have examined neither Mr. SAMPLE-P1-LN nor Mr. SAMPLE-P2-LN and I therefore have no opinions about their diagnoses, treatment, or prognoses outside of what is reflected in the medical record. This is not to say that I am not qualified, licensed, and extensively experienced in performing such evaluations, but that I have not done so in this case."
      ))))