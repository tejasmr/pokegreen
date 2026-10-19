SafariZoneNorthRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneNorthRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneNorthRestHouseScientistText,        TEXT_SAFARIZONENORTHRESTHOUSE_SCIENTIST
	dw_const SafariZoneNorthRestHouseSafariZoneWorkerText, TEXT_SAFARIZONENORTHRESTHOUSE_SAFARI_ZONE_WORKER
	dw_const SafariZoneNorthRestHouseGentlemanText,        TEXT_SAFARIZONENORTHRESTHOUSE_GENTLEMAN

SafariZoneNorthRestHouseScientistText:
	text "ANY ITEMS LYING"
	line "IN SAFARI ZONE"
	cont "ARE FREE TO TAKE!"

	para "BUT IF YOU PICK"
	line "ALL·YOU RUN OUT"
	cont "OF TIME!"
	done

SafariZoneNorthRestHouseSafariZoneWorkerText:
	text "OUR CAMPAIGN IS"
	line "ON! SHUTTER HUT"
	cont "IN DEEPEST ZONE"
	cont "GIVES A PRIZE!"
	done

SafariZoneNorthRestHouseGentlemanText:
	text "MY EIEEVUI"
	line "EVOLVED INTO"
	cont "BOOSTER FLAREON!"

	para "FRIENDS TURNED"
	line "INTO SHOWERS"
	cont "VAPOREON! WHY?"
	done

