CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	def_text_pointers
	dw_const CinnabarMartClerkText,        TEXT_CINNABARMART_CLERK
	dw_const CinnabarMartSilphWorkerFText, TEXT_CINNABARMART_SILPH_WORKER_F
	dw_const CinnabarMartScientistText,    TEXT_CINNABARMART_SCIENTIST

CinnabarMartSilphWorkerFText:
	text "NO PLUS POWER?"
	line "IT BOOSTS ATTACK"
	cont "POWER OF #!"
	done

CinnabarMartScientistText:
	text "ALWAYS BUY EXTRA"
	line "ITEMS IN CASE OF"
	cont "EMERGENCY!"
	done

