CeruleanMart_Script:
	jp EnableAutoTextBoxDrawing

CeruleanMart_TextPointers:
	def_text_pointers
	dw_const CeruleanMartClerkText,        TEXT_CERULEANMART_CLERK
	dw_const CeruleanMartCooltrainerMText, TEXT_CERULEANMART_COOLTRAINER_M
	dw_const CeruleanMartCooltrainerFText, TEXT_CERULEANMART_COOLTRAINER_F

CeruleanMartCooltrainerMText:
	text "REPEL SPRAY KEEPS"
	line "AWAY BUGS AND"
	cont "EVEN # AWAY!"

	para "PUT STRONG #"
	line "AT VERY FRONT·"
	cont "EFFECT DOUBLES!"
	done

CeruleanMartCooltrainerFText:
	text "NEVER SEEN IN"
	line "SHOPS BUT KNOW"
	cont "OF RARE CANDY?"

	para "HEARD IT RAISES"
	line "# <LV> IN ONE"
	cont "SINGLE INSTANT!"
	done
