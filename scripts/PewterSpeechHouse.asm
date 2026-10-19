PewterSpeechHouse_Script:
	jp EnableAutoTextBoxDrawing

PewterSpeechHouse_TextPointers:
	def_text_pointers
	dw_const PewterSpeechHouseGamblerText,   TEXT_PEWTERSPEECHHOUSE_GAMBLER
	dw_const PewterSpeechHouseYoungsterText, TEXT_PEWTERSPEECHHOUSE_YOUNGSTER

PewterSpeechHouseGamblerText:
	text "AS YOU RAISE #"
	line "THEY LEARN MOVES！"

	para "BUT SOME MOVES"
	line "MUST BE TAUGHT"
	cont "BY A PERSON NE！"
	done

PewterSpeechHouseYoungsterText:
	text "SLEEP· POISON"
	line "BURN· PARALYSIS<⋯>"
	cont "WEAKENED STATUS"
	cont "EASIER TO CATCH！"

	para "BUT NOT GUARANTEE"
	line "EVERY TIME NE<⋯>"
	done
