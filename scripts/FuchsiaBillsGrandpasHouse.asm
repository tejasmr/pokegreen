FuchsiaBillsGrandpasHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaBillsGrandpasHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaBillsGrandpasHouseMiddleAgedWomanText, TEXT_FUCHSIABILLSGRANDPASHOUSE_MIDDLE_AGED_WOMAN
	dw_const FuchsiaBillsGrandpasHouseBillsGrandpaText,    TEXT_FUCHSIABILLSGRANDPASHOUSE_BILLS_GRANDPA
	dw_const FuchsiaBillsGrandpasHouseYoungsterText,       TEXT_FUCHSIABILLSGRANDPASHOUSE_YOUNGSTER

FuchsiaBillsGrandpasHouseMiddleAgedWomanText:
	text "SAFARI WARDEN IS"
	line "OLD BUT ENERGETIC"

	para "THOUGH HIS TEETH"
	line "ARE ALL DENTURES!"
	done

FuchsiaBillsGrandpasHouseBillsGrandpaText:
	text "OH? DO YOU KNOW"
	line "ABOUT MASAKI?"

	para "MASAKI IS MY"
	line "GRANDSON! MAGO!"

	para "SINCE CHILDHOOD"
	line "HE LOVED TO"
	cont "COLLECT THINGS!"
	done

FuchsiaBillsGrandpasHouseYoungsterText:
	text "BIG BRO MASAKI"
	line "STORES MONS HE"
	cont "CAUGHT AS DATA"
	cont "IN THE <PC>!"

	para "DID HE SHOW YOU?"
	done

