SafariZoneEastRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneEastRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneEastRestHouseScientistText,    TEXT_SAFARIZONEEASTRESTHOUSE_SCIENTIST
	dw_const SafariZoneEastRestHouseRockerText,       TEXT_SAFARIZONEEASTRESTHOUSE_ROCKER
	dw_const SafariZoneEastRestHouseSilphWorkerMText, TEXT_SAFARIZONEEASTRESTHOUSE_SILPH_WORKER_M

SafariZoneEastRestHouseScientistText:
	text "HOW MANY DID"
	line "YOU CATCH?"

	para "I CAUGHT AND"
	line "CAUGHT·NOW I AM"
	cont "SO TIRED OUT!"
	done

SafariZoneEastRestHouseRockerText:
	text "CAUGHT A LUCKY!"
	line "CHANSEY!"

	para "THAT WAS WELL"
	line "WORTH THE MONEY!"
	done

SafariZoneEastRestHouseSilphWorkerMText:
	text "PHEW<⋯>! EXCITED"
	line "TOO MUCH·TIRED!"
	done

