SafariZoneWest_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneWest_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_POTION
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_TM_DOUBLE_TEAM
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_MAX_REVIVE
	dw_const PickUpItemText,                         TEXT_SAFARIZONEWEST_GOLD_TEETH
	dw_const SafariZoneWestRestHouseSignText,        TEXT_SAFARIZONEWEST_REST_HOUSE_SIGN
	dw_const SafariZoneWestFindWardensTeethSignText, TEXT_SAFARIZONEWEST_FIND_WARDENS_TEETH_SIGN
	dw_const SafariZoneWestTrainerTipsText,          TEXT_SAFARIZONEWEST_TRAINER_TIPS
	dw_const SafariZoneWestSignText,                 TEXT_SAFARIZONEWEST_SIGN

SafariZoneWestRestHouseSignText:
	text "REST HOUSE <⋯>"
	line "IKOI RELAXATION"
	done

SafariZoneWestFindWardensTeethSignText:
	text "<⋯>NOTICE BOARD!"

	para "SAFARI WARDEN"
	line "LOST HIS DENTURES"
	cont "NEAR HERE!"

	para "REWARD FOR FINDER"
	line "SAFARI ZONE MAIN"
	cont "OFFICE"
	done

SafariZoneWestTrainerTipsText:
	text "<⋯>TRAINER TIPS!"

	para "EXPLORATION RACE!"
	line "FIND THE SECRET"
	cont "TREASURE HOUSE!"
	done

SafariZoneWestSignText:
	text "AREA 3 WEST"
	line "EAST <⋯> CENTER"
	done

