SaffronPidgeyHouse_Script:
	jp EnableAutoTextBoxDrawing

SaffronPidgeyHouse_TextPointers:
	def_text_pointers
	dw_const SaffronPidgeyHouseBrunetteGirlText, TEXT_SAFFRONPIDGEYHOUSE_BRUNETTE_GIRL
	dw_const SaffronPidgeyHousePidgeyText,       TEXT_SAFFRONPIDGEYHOUSE_PIDGEY
	dw_const SaffronPidgeyHouseYoungsterText,    TEXT_SAFFRONPIDGEYHOUSE_YOUNGSTER
	dw_const SaffronPidgeyHousePaperText,        TEXT_SAFFRONPIDGEYHOUSE_PAPER

SaffronPidgeyHouseBrunetteGirlText:
	text "⋯THANKS FOR"
	line "YOUR LETTER!"
	cont "I WANT TO MEET"
	cont "YOU SOON⋯"

	para "IYAAN! DONT PEEK"
	line "WHILE I WRITE"
	cont "SECRET LETTER!"
	done

SaffronPidgeyHousePidgeyText:
	text "POPPO: 『KURUKKU!@"
	text_asm
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronPidgeyHouseYoungsterText:
	text "COPYCAT GIRL IS"
	line "SO KAWAII! CUTE!"

	para "I WILL PRESENT"
	line "A PIPPI DOLL"
	cont "TO HER!"
	done

SaffronPidgeyHousePaperText:
	text "⋯THE OTHER DAY"
	line "I GOT PP UP!"

	para "VERY STRONG MOVE"
	line "HAS LOW PP BUT"
	cont "THIS BOOSTS IT"
	cont "RIGHT⋯?"
	done
