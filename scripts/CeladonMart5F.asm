CeladonMart5F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart5F_TextPointers:
	def_text_pointers
	dw_const CeladonMart5FGentlemanText,        TEXT_CELADONMART5F_GENTLEMAN
	dw_const CeladonMart5FSailorText,           TEXT_CELADONMART5F_SAILOR
	dw_const CeladonMart5FClerk1Text,           TEXT_CELADONMART5F_CLERK1
	dw_const CeladonMart5FClerk2Text,           TEXT_CELADONMART5F_CLERK2
	dw_const CeladonMart5FCurrentFloorSignText, TEXT_CELADONMART5F_CURRENT_FLOOR_SIGN

CeladonMart5FGentlemanText:
	text "ITEMS ENHANCING"
	line "# STATS CAN"
	cont "ONLY BE BOUGHT"
	cont "HERE ON 5F!"

	para "CALCIUM BOOSTS"
	line "SPECIAL STAT!"

	para "CARBOS BOOSTS"
	line "SPEED STAT UP!"
	done

CeladonMart5FSailorText:
	text "I CAME TO BUY"
	line "ITEMS THAT BOOST"
	cont "# STATS!"

	para "PROTEIN RAISES"
	line "ATTACK POWER!"

	para "IRON RAISES"
	line "DEFENSE POWER!"
	done

CeladonMart5FCurrentFloorSignText:
	text "5F: DRUG STORE"
	done
