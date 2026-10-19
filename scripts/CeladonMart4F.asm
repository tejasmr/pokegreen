CeladonMart4F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart4F_TextPointers:
	def_text_pointers
	dw_const CeladonMart4FClerkText,            TEXT_CELADONMART4F_CLERK
	dw_const CeladonMart4FSuperNerdText,        TEXT_CELADONMART4F_SUPER_NERD
	dw_const CeladonMart4FYoungsterText,        TEXT_CELADONMART4F_YOUNGSTER
	dw_const CeladonMart4FCurrentFloorSignText, TEXT_CELADONMART4F_CURRENT_FLOOR_SIGN

CeladonMart4FSuperNerdText:
	text "BUYING A PRESENT"
	line "FOR MY SWEETIE!"

	para "PIPPI DOLL IS"
	line "THE ONLY CHOICE!"
	cont "SO POPULAR NOW!"
	done

CeladonMart4FYoungsterText:
	text "HEARD A NEAT"
	line "SECRET TRICK!"

	para "WHEN A WILD #"
	line "ATTACKS YOU·"
	cont "THROW A PIPPI"
	cont "DOLL AT IT!"

	para "IT GETS ENGROSSED"
	line "AND YOU CAN FLEE!"
	done

CeladonMart4FCurrentFloorSignText:
	text "4F: WISEMAN GIFT"
	line "SEND HEART-FELT"
	cont "PRESENTS TODAY!"

	para "SPECIAL SALE ON"
	line "# EVOLUTION"
	cont "STONES NOW ON!"
	done
