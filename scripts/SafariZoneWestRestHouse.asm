SafariZoneWestRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneWestRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneWestRestHouseScientistText,    TEXT_SAFARIZONEWESTRESTHOUSE_SCIENTIST
	dw_const SafariZoneWestRestHouseCooltrainerMText, TEXT_SAFARIZONEWESTRESTHOUSE_COOLTRAINER_M
	dw_const SafariZoneWestRestHouseSilphWorkerFText, TEXT_SAFARIZONEWESTRESTHOUSE_SILPH_WORKER_F

SafariZoneWestRestHouseScientistText:
	text "THROWING A ROCK"
	line "MAY SCARE IT OFF·"
	cont "BUT MAKES IT"
	cont "EASIER TO CATCH!"
	done

SafariZoneWestRestHouseCooltrainerMText:
	text "TOSSING BAIT ESA"
	line "MAKES # BUSY"
	cont "EATING SO IT"
	cont "WONT FLEE EASILY!"
	done

SafariZoneWestRestHouseSilphWorkerFText:
	text "WALKED A LOT·BUT"
	line "THE # I WANT"
	cont "WONT POP OUT!"
	done

