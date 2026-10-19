Museum2F_Script:
	jp EnableAutoTextBoxDrawing

Museum2F_TextPointers:
	def_text_pointers
	dw_const Museum2FYoungsterText,        TEXT_MUSEUM2F_YOUNGSTER
	dw_const Museum2FGrampsText,           TEXT_MUSEUM2F_GRAMPS
	dw_const Museum2FScientistText,        TEXT_MUSEUM2F_SCIENTIST
	dw_const Museum2FBrunetteGirlText,     TEXT_MUSEUM2F_BRUNETTE_GIRL
	dw_const Museum2FHikerText,            TEXT_MUSEUM2F_HIKER
	dw_const Museum2FSpaceShuttleSignText, TEXT_MUSEUM2F_SPACE_SHUTTLE_SIGN
	dw_const Museum2FMoonStoneSignText,    TEXT_MUSEUM2F_MOON_STONE_SIGN

Museum2FYoungsterText:
	text "MOON STONE NE<⋯>"

	para "HOW IS IT"
	line "DIFFERENT FROM"
	cont "ROADSIDE PEBBLE？"
	done

Museum2FGrampsText:
	text "JULY 20· 1969！"

	para "MANKIND FIRST"
	line "STANDS ON MOON！"

	para "I BOUGHT COLOR"
	line "TV TO WATCH"
	cont "THAT VERY NEWS！"
	done

Museum2FScientistText:
	text "THIS MONTH WE"
	line "HOLD SPACE"
	cont "EXHIBITION NE！"
	done

Museum2FBrunetteGirlText:
	text "I WANT PIKACHU！"
	line "SO KAWAII· CUTE！"

	para "I BEGGED DADDY"
	line "TO CATCH ME ONE！"
	done

Museum2FHikerText:
	text "YES YES！"
	line "PIKACHU NE！"
	cont "NEXT TIME JA！"
	done

Museum2FSpaceShuttleSignText:
	text "SPACE SHUTTLE"
	line "COLUMBIA SHIP"
	done

Museum2FMoonStoneSignText:
	text "FALLEN OBJECT"
	line "ON OTSUKIMI MT·"
	cont "MAYBE MOON STONE"
	done
