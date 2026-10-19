Route2_Script:
	jp EnableAutoTextBoxDrawing

Route2_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,             TEXT_ROUTE2_MOON_STONE
	dw_const PickUpItemText,             TEXT_ROUTE2_HP_UP
	dw_const Route2SignText,             TEXT_ROUTE2_SIGN
	dw_const Route2DiglettsCaveSignText, TEXT_ROUTE2_DIGLETTS_CAVE_SIGN

Route2SignText:
	text "ROUTE 2· DOURO"
	line "TOKIWA CITY<⋯>"
	cont "NIBI CITY"
	done

Route2DiglettsCaveSignText:
	text "DIGDA NO ANA"
	line "DIGLETT CAVE！"
	done
