CeladonMart1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart1F_TextPointers:
	def_text_pointers
	dw_const CeladonMart1FReceptionistText,     TEXT_CELADONMART1F_RECEPTIONIST
	dw_const CeladonMart1FDirectorySignText,    TEXT_CELADONMART1F_DIRECTORY_SIGN
	dw_const CeladonMart1FCurrentFloorSignText, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN

CeladonMart1FReceptionistText:
	text "WELCOME! TO"
	line "TAMAMUSHI DEPT"
	cont "STORE!"

	para "PLEASE CHECK"
	line "DIRECTORY BOARD"
	cont "ON THE RIGHT!"
	done

CeladonMart1FDirectorySignText:
	text "1F: SERVICE DESK"

	para "2F: <TRAINER> SHOP"

	para "3F: TV GAME SHOP"

	para "4F: WISEMAN GIFT"

	para "5F: DRUG STORE"

	para "ROOF: VENDORS"
	done

CeladonMart1FCurrentFloorSignText:
	text "1F: SERVICE DESK"
	done
