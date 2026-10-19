ViridianSchoolHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouse_TextPointers:
	def_text_pointers
	dw_const ViridianSchoolHouseBrunetteGirlText, TEXT_VIRIDIANSCHOOLHOUSE_BRUNETTE_GIRL
	dw_const ViridianSchoolHouseCooltrainerFText, TEXT_VIRIDIANSCHOOLHOUSE_COOLTRAINER_F

ViridianSchoolHouseBrunetteGirlText:
	text "WHEW⋯"
	line "EVERYTHING IN"
	cont "NOTEBOOK· I MUST"
	cont "MEMORIZE ALL!"
	done

ViridianSchoolHouseCooltrainerFText:
	text "YES! ATTENTION!"

	para "LOOK CAREFULLY"
	line "AT BLACKBOARD!"
	done
