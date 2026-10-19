ViridianNicknameHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianNicknameHouse_TextPointers:
	def_text_pointers
	dw_const ViridianNicknameHouseBaldingGuyText, TEXT_VIRIDIANNICKNAMEHOUSE_BALDING_GUY
	dw_const ViridianNicknameHouseLittleGirlText, TEXT_VIRIDIANNICKNAMEHOUSE_LITTLE_GIRL
	dw_const ViridianNicknameHouseSpearowText,    TEXT_VIRIDIANNICKNAMEHOUSE_SPEAROW
	dw_const ViridianNicknameHouseSpearySignText, TEXT_VIRIDIANNICKNAMEHOUSE_SPEARY_SIGN

ViridianNicknameHouseBaldingGuyText:
	text "NICKNAMING PETS"
	line "IS FUN⋯ BUT HARD!"

	para "FANCY NAMES ARE"
	line "GOOD· BUT SIMPLE"
	cont "IS BEST NUMBER 1!"
	done

ViridianNicknameHouseLittleGirlText:
	text "MY PAPA ALSO"
	line "LOVES # SO MUCH!"
	done

ViridianNicknameHouseSpearowText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, SPEAROW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.Text:
	text "ONICHAN:「CHUN"
	line "CHUN!」"
	done

ViridianNicknameHouseSpearySignText:
	text "ONISUZUME"
	line "NAME:「ONICHAN」"
	done
