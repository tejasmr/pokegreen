FuchsiaMart_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaMart_TextPointers:
	def_text_pointers
	dw_const FuchsiaMartClerkText,         TEXT_FUCHSIAMART_CLERK
	dw_const FuchsiaMartMiddleAgedManText, TEXT_FUCHSIAMART_MIDDLE_AGED_MAN
	dw_const FuchsiaMartCooltrainerFText,  TEXT_FUCHSIAMART_COOLTRAINER_F

FuchsiaMartMiddleAgedManText:
	text "DONT YOU HAVE A"
	line "SAFARI PENNANT?"

	para "HOW ABOUT A"
	line "LANTERN OR"
	cont "CALENDAR? NONE?!"
	done

FuchsiaMartCooltrainerFText:
	text "DID YOU TRY"
	line "SPEEDER X-SPEED?"

	para "IT BOOSTS SPEED"
	line "OF MON IN BATTLE!"
	done

