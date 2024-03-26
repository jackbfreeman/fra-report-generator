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


three_steps$rebuttal <- list(
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
    ftext(
      paste0("Despite the warning that \"true tolerance levels cannot be determined with volunteers\" from the authoritative publication on automotive testing and human tolerance,  SAMPLE-BIOMECH-LN described and referred to studies primarily consisting of single ", crash$pdof, " impact collisions of less than 5 mph (with no secondary frontal crash) on healthy male volunteers, and from these papers drew the conclusion that it was essentially impossible for Mr. SAMPLE-P1-LN to have been injured in the subject collision."))),
  fps(),
  fps(
    ftext(
      paste0("Human volunteer crash testing is designed to not produce injury, and the utmost care is taken to ensure that injury is unlikely. The people who volunteer to participate in experimental crash tests are not comparable to those who are injured in similar crashes in many respects, and this includes the plaintiff. For any published crash test, the authors typically must secure Institutional Review Board (IRB) approval in order to assure the safety of the volunteers (this is in accordance with the Declaration of Helsinki, an international treaty on human subject experimentation)."))),
  fps(),
  fps(
    ftext(
      paste0("As mentioned earlier, the peer-reviewed authoritative automotive engineering and biomechanical literature specifically states that crash tests are not an appropriate basis for any determination of real-world injury thresholds. In 1999 I published a peer-reviewed paper in the premier journal in the world on Spine surgery at that time (Spine), which specifically criticized some of the volunteer crash test publications cited by  SAMPLE-BIOMECH-LN in his report for erroneously claiming an injury threshold from such testing.   SAMPLE-BIOMECH-LN presents no evidence to demonstrate that the basic scientific principles described in this 23-year old publication should be violated for his assertions regarding the cause of Mr. SAMPLE-P1-LN’s post-collision diagnoses and need for treatment."))),
  fps(),
  fps(
    ftext(
      paste0("Is any collision comparable to activities of daily living?"))),
  fps(
    ftext(
      paste0("As noted above,  SAMPLE-BIOMECH-LN claimed that the subject collision produced forces no greater than the loads observed in studies of \"activities of daily living.\" Such comparisons are misleading and deceptive, and based on the junk science premise that if the occupant acceleration value of a crash can be said to be similar to that of some trivial sounding event, then this means that the injury potential of the crash and the trivial event is the same. This antiscientific myth has no application or use outside of the defense of injury litigation."))),
  fps(),
  fps(
    ftext(
      paste0("It should be patently obvious how ridiculous and frankly dishonest the comparison is between any collision and any everyday activity; there is no biomechanical similarity between a crash and an ADL. The direction, duration, and rapidity of acceleration that results in the kind of violent movement that occurs even in a low-speed crash is noncomparable in all respects to the self-generated, slow onset and long duration accelerations of daily activities."))),
  fps(),
  fps(
    ftext(
      paste0("The actual risk of injury from a lower speed crash is not determined by a comparison to an activity that never causes injury, of course. Such determinations are made by examining epidemiologic data regarding real world crashes and the types of injuries that result from them. This is precisely what my colleagues and I did in a recent peer-reviewed research publication, in which we noted the following:"))),
  fps(),
  fps(
    ftext(
      paste0("\"…the theory that serves as the operating principle for the methodology, that acceleration is a proxy for injury risk in low speed or minimal damage crashes, which is the rationale for the comparison between a crash and non-injurious ADLs, is demonstrably false. Even at the lowest levels of impact severity in a ", crash$pdof, " impact crash, the results of both crash testing and epidemiologic data from real-world crashes indicate a substantial (i.e., >20%) risk of at least some degree of injury. In contrast, everyday activities are benign events with virtually no injury risk whatsoever."))),
  fps(),
  fps(
    ftext(
      paste0("If the magnitude of the accelerations resulting from crashes and ADLs can be said to be even roughly comparable, this fact only serves as concrete evidence that occupant acceleration is not a proxy for injury risk. \""))),
  fps(),
  fps(
    ftext(
      paste0("Regarding the novel nature of such comparisons as a basis for evaluating injury risk, we wrote:"))),
  fps(
    ftext(
      paste0(" \"There is no other example in the biomedical literature in which the established injury risk of any traumatic event is overlooked in favor of a comparison between the acceleration of the event and a non-injurious activity. Although there may be multiple shared attributes of traffic crashes and some ADLs, just as there are multiple shared attributes of stepping down from a stair and falling down a stair (i.e., the travel distances are the same, gravity is 9.81 m/s2 in both scenarios), alluding to the absence of injury while ordinarily walking down stairs sheds no light on the frequency of injury from falling down stairs. The comparison is inapt and should not be made.\""))),
  fps(),
  fps(
    ftext(
      paste0("If we use the real world 11 km/h [6.8 mph] delta V ", crash$pdof, " impact injury risk from the present study (54%) and compare it to the highest estimated ADL-related risk (<<1 in 3,650 [0.027%] for sitting), then even using the most conservative estimates, the crash presents a risk of injury that is at least 2,000 times greater than the \"high risk\" ADL of sitting. This ratio likely underestimates the actual injury risk disparity between frontal-side impacts and ADLs by a factor of at least 10 times."))),
  fps(),
  fps(
    ftext(
      paste0("The National Highway Traffic Safety Administration (NHTSA) has recently published injury risk curves for ", crash$pdof, " impact crashes, demonstrating a rate of \"MAIS 1+\" (Maximum Abbreviated Injury Scale injury severity grade of 1 or more) injuries of 27% to 36% for 5 to 10 mph delta V ", crash$pdof, " impact collisions (see the red bracket in the chart below).  Approximately 94% of spinal disk injuries would be included in this category of injuries, as this is the rate at which disk injuries are initially diagnosed as strains in the emergency department in the first day or 2 after a crash, which is the source of the NHTSA data."))),
  fps(),
  fps(
    ftext(
      paste0("The fact that  SAMPLE-BIOMECH-LN compared an event (a less than 10 mph ", crash$pdof, " impact collision) that is irrefutably established by US national crash data to cause injury at least 1 out 4 times to ADLs which virtually never cause injury is a perfect illustration of how misleading and frankly dishonest the comparison is."))),
  fps(),
  fps(
    ftext(
      paste0("Can a biomechanical analysis demonstrate that Mr. SAMPLE-P1-LN was not injured in the subject crash?"))),
  fps(
    ftext(
      paste0("Traumatic spinal disk injuries have been described in the peer-reviewed literature as occurring in low to moderate force events, such as minimal damage traffic crashes and roller coaster rides, but also with even more mild forces, including therapeutic manipulation of the spine, and even sneezing. -     It is accurate to state that there is no established or generally accepted lower force threshold at which it can be said that an acute intervertebral disk injury in any part of the spine cannot occur.  SAMPLE-BIOMECH-LN’s claims to the contrary are contrived and easily disproven, not to mention at odds with the specific facts in Mr. SAMPLE-P1-LN’s case."))),
  fps(),
  fps(
    ftext(
      paste0("SAMPLE-BIOMECH-LN’s offhand claim that a spinal disk could not be \"exacerbated\" by the subject crash (i.e., either symptomatically activated, or worsened) is a fantasy, with no theoretical, much less factual or scientific basis. In making this entirely speculative and meaningless claim,  SAMPLE-BIOMECH-LN engages in magical thinking, which collapses under the slightest bit of scrutiny."))),
  fps(),
  fps(
    ftext(
      paste0("In his report,  SAMPLE-BIOMECH-LN twice cited to publications on spinal disk biomechanics by a leading authority on the topic, Prof. Michael Adams. This very same author (Michael Adams PhD), in a 2012 textbook called \"The Biomechanics of Back Pain,\"  wrote that"))),
  fps(),
  fps(
    ftext(
      paste0("\"The magnitude of forces required to cause an individual disc to prolapse cannot reliably be predicted on the basis of gender, age, and spinal level.\" [page 263],"))),
  fps(),
  fps(
    ftext(
      paste0("and that"))),
  fps(),
  fps(
    ftext(
      paste0("\"Most spinal compressive loading comes from back muscles, and forces are likely to rise to high levels during sudden and alarming incidents. These forces are difficult to quantify in retrospective analysis.\" [page 264]"))),
  fps(),
  fps(
    ftext(
      paste0("and"))),
  fps(),
  fps(
    ftext(
      paste0("\"Clearly, to assume that the forces acting on the spine during whiplash are small just because the vehicle impacts are usually of low velocity would be a serious mistake. Muscle forces can be magnified in alarming situations, and if the muscles do not have time to react, then the underlying cervical spine is extremely vulnerable to bending.\" [pages 170-1]"))),
  fps(),
  fps(
    ftext(
      paste0("It is clear that  SAMPLE-BIOMECH-LN’s approach to providing his opinions regarding Mr. SAMPLE-P1-LN’s injuries is characterized by experts that he deems to be authorities in the field of spinal biomechanics as a \"serious mistake.\""))))