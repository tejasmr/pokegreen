VermilionPidgeyHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

VermilionPidgeyHouse_TextPointers:
	def_text_pointers
	dw_const VermilionPidgeyHouseYoungsterText, TEXT_VERMILIONPIDGEYHOUSE_YOUNGSTER
	dw_const VermilionPidgeyHousePidgeyText,    TEXT_VERMILIONPIDGEYHOUSE_PIDGEY
	dw_const VermilionPidgeyHouseLetterText,    TEXT_VERMILIONPIDGEYHOUSE_LETTER

VermilionPidgeyHouseYoungsterText:
	text "I GET POPPO TO"
	line "DELIVER A LETTER"
	cont "TO YAMABUKI"
	cont "CITY IN NORTH!"
	done

VermilionPidgeyHousePidgeyText:
	text "POPPO: 『KURUKKU』@"
	text_asm
	ld a, PIDGEY
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionPidgeyHouseLetterText:
	text "<⋯>DEAR PIPI·"
	line "I WANT TO VISIT"
	cont "AND PLAY SOON"

	para "I HEAR YAMABUKI"
	line "CITY HAS MANY"
	cont "<ROCKET> INCIDENTS"

	para "KUCHIBA IS NOT"
	line "LIKE THAT<⋯>"
	done
