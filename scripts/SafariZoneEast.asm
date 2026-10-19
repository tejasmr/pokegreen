SafariZoneEast_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneEast_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_FULL_RESTORE
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_MAX_RESTORE
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_CARBOS
	dw_const PickUpItemText,                  TEXT_SAFARIZONEEAST_TM_EGG_BOMB
	dw_const SafariZoneEastRestHouseSignText, TEXT_SAFARIZONEEAST_REST_HOUSE_SIGN
	dw_const SafariZoneEastTrainerTipsText,   TEXT_SAFARIZONEEAST_TRAINER_TIPS
	dw_const SafariZoneEastSignText,          TEXT_SAFARIZONEEAST_SIGN

SafariZoneEastRestHouseSignText:
	text "REST HOUSE <⋯>"
	line "IKOI RELAXATION"
	done

SafariZoneEastTrainerTipsText:
	text "<⋯>TRAINER TIPS!"

	para "REMAINING TIME"
	line "DECREASES WITH"
	cont "EVERY STEP TAKEN!"
	done

SafariZoneEastSignText:
	text "CENTER AREA"
	line "NORTH <⋯> AREA 2"
	done

