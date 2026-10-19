UndergroundPathRoute7Copy_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	ret

UndergroundPathRoute7Copy_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute7CopyUnusedGirlText,          TEXT_UNDERGROUNDPATHROUTE7COPY_UNUSED_GIRL
	dw_const UndergroundPathRoute7CopyUnusedMiddleAgedManText, TEXT_UNDERGROUNDPATHROUTE7COPY_UNUSED_MIDDLE_AGED_MAN

UndergroundPathRoute7CopyUnusedGirlText:
	text "I WANT TO SHOP"
	line "AT TAMAMUSHI DEPT"
	cont "STORE·BUT<⋯>"

	para "ROUGH CHARACTERS"
	line "HANG AROUND THERE"
	cont "IT IS SO SCARY!"
	done

UndergroundPathRoute7CopyUnusedTeamRocketHadAHideoutText:
	text "I HEAR <ROCKET> HAD"
	line "A SECRET HIDEOUT"
	cont "IN TAMAMUSHI?!"
	done

UndergroundPathRoute7CopyUnusedMiddleAgedManText:
	text "YOU CAME TO SHOP"
	line "IN TAMAMUSHI TOO?"

	para "JUST GO OUT THE"
	line "DOOR TO THE WEST!"
	done

UndergroundPathRoute7CopyUnusedGoesUnderSaffronText:
	text "THE PATH BELOW"
	line "GOES UNDER"
	cont "YAMABUKI TO"
	cont "SHION TOWN!"

	para "IF YOU WANT"
	line "HANADA CITY·GO TO"
	cont "BUILDING ACROSS!"
	done


