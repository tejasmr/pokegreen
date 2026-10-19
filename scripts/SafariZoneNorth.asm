SafariZoneNorth_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneNorth_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                   TEXT_SAFARIZONENORTH_PROTEIN
	dw_const PickUpItemText,                   TEXT_SAFARIZONENORTH_TM_SKULL_BASH
	dw_const SafariZoneNorthRestHouseSignText, TEXT_SAFARIZONENORTH_REST_HOUSE_SIGN
	dw_const SafariZoneNorthTrainerTips1Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_1
	dw_const SafariZoneNorthSignText,          TEXT_SAFARIZONENORTH_SIGN
	dw_const SafariZoneNorthTrainerTips2Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_2
	dw_const SafariZoneNorthTrainerTips3Text,  TEXT_SAFARIZONENORTH_TRAINER_TIPS_3

SafariZoneNorthRestHouseSignText:
	text "REST HOUSE <⋯>"
	line "IKOI RELAXATION"
	done

SafariZoneNorthTrainerTips1Text:
	text "<⋯>TRAINER TIPS!"

	para "TREASURE HOUSE"
	line "STILL AHEAD!"
	cont "KEEP GOING!"
	done

SafariZoneNorthSignText:
	text "AREA 2 NORTH"
	done

SafariZoneNorthTrainerTips2Text:
	text "<⋯>TRAINER TIPS!"

	para "# LOVE TO"
	line "HIDE IN TALL"
	cont "GRASS KUSAMURA!"

	para "WALK ZIGZAG IF"
	line "HARD TO FIND!"
	done

SafariZoneNorthTrainerTips3Text:
	text "<⋯>TRAINER TIPS!"

	para "FIND THE SECRET"
	line "TREASURE HOUSE TO"
	cont "GET A SECRET HM!"
	done

