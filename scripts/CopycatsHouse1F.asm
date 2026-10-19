CopycatsHouse1F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse1F_TextPointers:
	def_text_pointers
	dw_const CopycatsHouse1FMiddleAgedWomanText, TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_WOMAN
	dw_const CopycatsHouse1FMiddleAgedManText,   TEXT_COPYCATSHOUSE1F_MIDDLE_AGED_MAN
	dw_const CopycatsHouse1FChanseyText,         TEXT_COPYCATSHOUSE1F_CHANSEY

CopycatsHouse1FMiddleAgedWomanText:
	text "OUR DAUGHTER IS"
	line "『WAGAMAMA』"
	cont "SELFISH SPOILED⋯"

	para "SHE HAS SCANT"
	line "FEW COMPANIONS!"
	done

CopycatsHouse1FMiddleAgedManText:
	text "⋯DAUGHTER LOVES"
	line "TO MIMIC OTHERS!"

	para "TEASING FOLKS SO"
	line "NEIGHBORS CALL"
	cont "HER 『MONOMANE"
	cont "MUSUME』 COPYCAT!"
	done

CopycatsHouse1FChanseyText:
	text "LUCKY: 『RAKKI!@"
	text_asm
	ld a, CHANSEY
	call PlayCry
	jp TextScriptEnd
