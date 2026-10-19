PewterNidoranHouse_Script:
	jp EnableAutoTextBoxDrawing

PewterNidoranHouse_TextPointers:
	def_text_pointers
	dw_const PewterNidoranHouseNidoranText,       TEXT_PEWTERNIDORANHOUSE_NIDORAN
	dw_const PewterNidoranHouseLittleBoyText,     TEXT_PEWTERNIDORANHOUSE_LITTLE_BOY
	dw_const PewterNidoranHouseMiddleAgedManText, TEXT_PEWTERNIDORANHOUSE_MIDDLE_AGED_MAN

PewterNidoranHouseNidoranText:
	text "NIDORAN『BAUBAU！@"
	text_asm
IF DEF(_RED)
	ld a, NIDORAN_M
ENDC
IF DEF(_GREEN)
	ld a, NIDORAN_F
ENDC
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

PewterNidoranHouseLittleBoyText:
	text "NIDORAN· SIT！"
	done

PewterNidoranHouseMiddleAgedManText:
	text "OUR # IS AN"
	line "OUTSIDER MON·"
	cont "VERY TEMPER NE！"

	para "OUTSIDER MEANS"
	line "TRADED FROM"
	cont "ANOTHER PERSON！"

	para "GROWS VERY FAST"
	line "WILL NOT OBEY"
	cont "WEAK <TRAINER>！"

	para "IF ONLY WE HAD"
	line "A BADGE<⋯>"
	done
