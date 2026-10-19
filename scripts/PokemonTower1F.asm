PokemonTower1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTower1F_TextPointers:
	def_text_pointers
	dw_const PokemonTower1FReceptionistText,    TEXT_POKEMONTOWER1F_RECEPTIONIST
	dw_const PokemonTower1FMiddleAgedWomanText, TEXT_POKEMONTOWER1F_MIDDLE_AGED_WOMAN
	dw_const PokemonTower1FBaldingGuyText,      TEXT_POKEMONTOWER1F_BALDING_GUY
	dw_const PokemonTower1FGirlText,            TEXT_POKEMONTOWER1F_GIRL
	dw_const PokemonTower1FChannelerText,       TEXT_POKEMONTOWER1F_CHANNELER

PokemonTower1FReceptionistText:
	text "# TOWER IS"
	line "TOWER ERECTED TO"
	cont "COMFORT DEAD #！"
	done

PokemonTower1FMiddleAgedWomanText:
	text "DID YOU ALSO COME"
	line "TO VISIT GRAVES?"
	cont "BOY WHO CARES"
	cont "FOR # NE！"
	done

PokemonTower1FBaldingGuyText:
	text "MY DEAD PIPPI<⋯>"
	line "CANNOT FORGET IT！"

	para "<⋯>IKAN！ BAD NEWS！"
	line "TEARS ARE SPILL"
	cont "OUT NOW<⋯>！"
	done

PokemonTower1FGirlText:
	text "AAH· MY GARDIE<⋯>"
	line "WHY HAVE YOU"
	cont "PERISHED AWAY<⋯>"
	done

PokemonTower1FChannelerText:
	text "I AM KITOUSHI·"
	line "SPIRIT MEDIUM！"
	cont "UPPER FLOORS"
	cont "HAVE LOST SOULS！"
	done
