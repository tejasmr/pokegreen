CeruleanTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

CeruleanTradeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTradeHouseGrannyText,  TEXT_CERULEANTRADEHOUSE_GRANNY
	dw_const CeruleanTradeHouseGamblerText, TEXT_CERULEANTRADEHOUSE_GAMBLER

CeruleanTradeHouseGrannyText:
	text "MY OLD MAN IS"
	line "CRAZY FOR #"
	cont "TRADING!"

	para "YOUNG BOY· IF YOU"
	line "COLLECT # BOOK·"

	para "PLEASE TRADE WITH"
	line "HIM AS PARTNER?"
	done

CeruleanTradeHouseGamblerText:
	text_asm
	ld a, TRADE_FOR_LOLA
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
