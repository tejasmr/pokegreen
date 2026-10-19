UndergroundPathRoute7_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute7_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute7MiddleAgedManText, TEXT_UNDERGROUNDPATHROUTE7_MIDDLE_AGED_MAN

UndergroundPathRoute7MiddleAgedManText:
	text "LATELY A SLEEPY"
	line "# APPEARS NEAR"
	cont "TAMAMUSHI CITY!"
	done

