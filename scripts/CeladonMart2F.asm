CeladonMart2F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart2F_TextPointers:
	def_text_pointers
	dw_const CeladonMart2FClerk1Text,           TEXT_CELADONMART2F_CLERK1
	dw_const CeladonMart2FClerk2Text,           TEXT_CELADONMART2F_CLERK2
	dw_const CeladonMart2FMiddleAgedManText,    TEXT_CELADONMART2F_MIDDLE_AGED_MAN
	dw_const CeladonMart2FGirlText,             TEXT_CELADONMART2F_GIRL
	dw_const CeladonMart2FCurrentFloorSignText, TEXT_CELADONMART2F_CURRENT_FLOOR_SIGN

CeladonMart2FMiddleAgedManText:
	text "SUPER REPEL"
	line "KEEPS WEAK #"
	cont "FROM APPEARING!"

	para "HO! A STRONGER"
	line "VERSION OF REPEL"
	cont "SPRAY INDEED!"
	done

CeladonMart2FGirlText:
	text "FOR A LONG TRIP·"
	line "YOU HAD BETTER"
	cont "BUY REVIVES!"
	done

CeladonMart2FCurrentFloorSignText:
	text "LOTS OF <TRAINER>"
	line "ITEMS AND GEAR!"

	para "2F: <TRAINER> SHOP"
	done
