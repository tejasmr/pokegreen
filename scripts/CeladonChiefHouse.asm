CeladonChiefHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonChiefHouse_TextPointers:
	def_text_pointers
	dw_const CeladonChiefHouseChiefText,  TEXT_CELADONCHIEFHOUSE_CHIEF
	dw_const CeladonChiefHouseRocketText, TEXT_CELADONCHIEFHOUSE_ROCKET
	dw_const CeladonChiefHouseSailorText, TEXT_CELADONCHIEFHOUSE_SAILOR

CeladonChiefHouseChiefText:
	text "KEHEHE⋯!"
	line "SLOTS ARE BOOMING"
	cont "WITH BUSINESS!"

	para "MAKING TONS OF"
	line "MONEY NONSTOP!"
	done

CeladonChiefHouseRocketText:
	text "CHIEF!"

	para "WITH TODAYS SLOT"
	line "PROFITS· WE JUST"
	cont "SHIPPED OUT 2000"
	cont "CAUGHT # BOSS!"
	done

CeladonChiefHouseSailorText:
	text "DONT TOUCH POSTER"
	line "IN GAME CORNER!"

	para "NOT LIKE THERE IS"
	line "A SECRET SWITCH"
	cont "BEHIND IT AT ALL!"
	done
