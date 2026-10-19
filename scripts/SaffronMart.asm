SaffronMart_Script:
	jp EnableAutoTextBoxDrawing

SaffronMart_TextPointers:
	def_text_pointers
	dw_const SaffronMartClerkText,        TEXT_SAFFRONMART_CLERK
	dw_const SaffronMartSuperNerdText,    TEXT_SAFFRONMART_SUPER_NERD
	dw_const SaffronMartCooltrainerFText, TEXT_SAFFRONMART_COOLTRAINER_F

SaffronMartSuperNerdText:
	text "MAX REPEL KEEPS"
	line "WEAK PETS AWAY!"
	cont "LASTS LONGER"
	cont "THAN SUPER ONE!"
	done

SaffronMartCooltrainerFText:
	text "REVIVE IS PRICEY"
	line "『TAKAI』! BUT PET"
	cont "RECOVERS FAINT!"
	cont "SUGOI! SO GREAT!"
	done
