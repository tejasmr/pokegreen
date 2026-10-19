SaffronCity_Script:
	jp EnableAutoTextBoxDrawing

SaffronCity_TextPointers:
	def_text_pointers
	dw_const SaffronCityRocket1Text,                  TEXT_SAFFRONCITY_ROCKET1
	dw_const SaffronCityRocket2Text,                  TEXT_SAFFRONCITY_ROCKET2
	dw_const SaffronCityRocket3Text,                  TEXT_SAFFRONCITY_ROCKET3
	dw_const SaffronCityRocket4Text,                  TEXT_SAFFRONCITY_ROCKET4
	dw_const SaffronCityRocket5Text,                  TEXT_SAFFRONCITY_ROCKET5
	dw_const SaffronCityRocket6Text,                  TEXT_SAFFRONCITY_ROCKET6
	dw_const SaffronCityRocket7Text,                  TEXT_SAFFRONCITY_ROCKET7
	dw_const SaffronCityScientistText,                TEXT_SAFFRONCITY_SCIENTIST
	dw_const SaffronCitySilphWorkerMText,             TEXT_SAFFRONCITY_SILPH_WORKER_M
	dw_const SaffronCitySilphWorkerFText,             TEXT_SAFFRONCITY_SILPH_WORKER_F
	dw_const SaffronCityGentlemanText,                TEXT_SAFFRONCITY_GENTLEMAN
	dw_const SaffronCityPidgeotText,                  TEXT_SAFFRONCITY_PIDGEOT
	dw_const SaffronCityRockerText,                   TEXT_SAFFRONCITY_ROCKER
	dw_const SaffronCityRocket8Text,                  TEXT_SAFFRONCITY_ROCKET8
	dw_const SaffronCityRocket9Text,                  TEXT_SAFFRONCITY_ROCKET9
	dw_const SaffronCitySignText,                     TEXT_SAFFRONCITY_SIGN
	dw_const SaffronCityFightingDojoSignText,         TEXT_SAFFRONCITY_FIGHTING_DOJO_SIGN
	dw_const SaffronCityGymSignText,                  TEXT_SAFFRONCITY_GYM_SIGN
	dw_const MartSignText,                            TEXT_SAFFRONCITY_MART_SIGN
	dw_const SaffronCityTrainerTips1Text,             TEXT_SAFFRONCITY_TRAINER_TIPS1
	dw_const SaffronCityTrainerTips2Text,             TEXT_SAFFRONCITY_TRAINER_TIPS2
	dw_const SaffronCitySilphCoSignText,              TEXT_SAFFRONCITY_SILPH_CO_SIGN
	dw_const PokeCenterSignText,                      TEXT_SAFFRONCITY_POKECENTER_SIGN
	dw_const SaffronCityMrPsychicsHouseSignText,      TEXT_SAFFRONCITY_MR_PSYCHICS_HOUSE_SIGN
	dw_const SaffronCitySilphCoLatestProductSignText, TEXT_SAFFRONCITY_SILPH_CO_LATEST_PRODUCT_SIGN

SaffronCityRocket1Text:
	text "WHAT THE HECK?!"
	line "KID! GET LOST!"
	done

SaffronCityRocket2Text:
	text "BOSS WILL MAKE"
	line "THIS ENTIRE TOWN"
	cont "BELONG TO <ROCKET>!"
	done

SaffronCityRocket3Text:
	text "HEY! OPPOSE US"
	line "AND TASTE PAIN!"
	done

SaffronCityRocket4Text:
	text "WHOLE YAMABUKI"
	line "CITY IS TAKEN"
	cont "OVER BY <ROCKET>!"
	done

SaffronCityRocket5Text:
	text "DOING BAD THINGS"
	line "FEELS SO NICE"
	cont "AND REFRESHING!"
	done

SaffronCityRocket6Text:
	text "OUCH! YOU FOOL!"
	line "WATCH WHERE YOU"
	cont "ARE WALKING!"
	done

SaffronCityRocket7Text:
	text "TAKE OVER SILPH"
	line "THEN SELL PETS"
	cont "WORLDWIDE FOR"
	cont "HUGE PROFIT!"
	done

SaffronCityScientistText:
	text "ONLY ONE PERSON"
	line "SMASHED <ROCKET>⋯"
	cont "THAT IS SUGOI!"
	done

SaffronCitySilphWorkerMText:
	text "BANZAI! HURRAH!"
	line "<ROCKET> IS GONE!"
	cont "NOW WE CAN WALK"
	cont "WITHOUT FEAR!"
	done

SaffronCitySilphWorkerFText:
	text "PEOPLE FLED BUT"
	line "YAMABUKI WILL BE"
	cont "LIVELY ONCE MORE!"
	done

SaffronCityGentlemanText:
	text "HEARD <ROCKET> HIT"
	line "SILPH! FLEW HERE"
	cont "ON PIDGEOT!"

	para "SOLVED ALREADY⋯?"
	line "SORRY! I AM JUST"
	cont "A CURIOUS CROWD"
	cont "『YAJIUMA』 GAWKER!"
	done

SaffronCityPidgeotText:
	text "PIDGEOT: 『BII!@"
	sound_cry_pidgeot
	text_end

SaffronCityRockerText:
	text "I SAW IT! BOSS OF"
	line "<ROCKET> RAN FROM"
	cont "SILPH BUILDING!"
	done

SaffronCityRocket8Text:
	text "I AM SECURITY"
	line "GUARD! SUSPICIOUS"
	cont "KIDS GET BLOCKED!"
	done

SaffronCityRocket9Text:
	text "⋯⋯⋯"
	line "⋯NOD⋯ NOD⋯"

	para "HEHEHE! HE IS"
	line "FAST ASLEEP!"
	done

SaffronCitySignText:
	text "YAMABUKI CITY"
	line "GOLDEN SHINING"
	cont "GLOW OF SAFFRON"
	done

SaffronCityFightingDojoSignText:
	text "FIGHTING DOJO!"
	done

SaffronCityGymSignText:
	text "YAMABUKI CITY"
	line "PET GYM LEADER:"
	cont "NATSUME SABRINA!"
	cont "PSYCHIC GIRL!"
	done

SaffronCityTrainerTips1Text:
	text "⋯TRAINER TIPS!"

	para "FULL HEAL CURES"
	line "SLEEP· POISON·"
	cont "BURN· FREEZE⋯"
	cont "ANY AILMENT!"

	para "PRICEY BUT EASIER"
	line "THAN BUYING"
	cont "EACH SEPARATE!"
	done

SaffronCityTrainerTips2Text:
	text "⋯TRAINER TIPS!"

	para "NEW GREAT BALL"
	line "CATCHES PETS"
	cont "MORE SURELY THAN"
	cont "POKE BALL!"

	para "TRY THIS ON PETS"
	line "HARD TO CATCH!"
	done

SaffronCitySilphCoSignText:
	text "SILPH COMPANY"
	line "HEAD OFFICE"
	done

SaffronCityMrPsychicsHouseSignText:
	text "MR. PSYCHIC"
	line "ESP HOUSE"
	done

SaffronCitySilphCoLatestProductSignText:
	text "SILPH HOT RUMORED"
	line "NEW PRODUCT!"
	cont "⋯RELEASE DATE"
	cont "UNDECIDED"
	done
