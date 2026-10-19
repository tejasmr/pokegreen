VermilionMart_Script:
	jp EnableAutoTextBoxDrawing

VermilionMart_TextPointers:
	def_text_pointers
	dw_const VermilionMartClerkText,        TEXT_VERMILIONMART_CLERK
	dw_const VermilionMartCooltrainerMText, TEXT_VERMILIONMART_COOLTRAINER_M
	dw_const VermilionMartCooltrainerFText, TEXT_VERMILIONMART_COOLTRAINER_F

VermilionMartCooltrainerMText:
	text "SOME PEOPLE PLOT"
	line "EVIL USING #!"

	para "THEY SELL THEM"
	line "DEAR· OR IF NOT"
	cont "USEFUL OR POPULAR"
	cont "THEY EVEN KILL!"

	para "THAT BAD GANG IS"
	line "ROCKET-DAN!"
	cont "『DAN』 MEANS"
	cont "A GANG!"
	done

VermilionMartCooltrainerFText:
	text "I THINK # ARE"
	line "GOOD OR BAD"
	cont "DEPENDING ON"
	cont "THEIR PARTNER!"
	done
