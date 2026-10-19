GameCornerPrizeRoom_Script:
	jp EnableAutoTextBoxDrawing

GameCornerPrizeRoom_TextPointers:
	def_text_pointers
	dw_const GameCornerPrizeRoomBaldingGuyText,  TEXT_GAMECORNERPRIZEROOM_BALDING_GUY
	dw_const GameCornerPrizeRoomGamblerText,     TEXT_GAMECORNERPRIZEROOM_GAMBLER
	dw_const GameCornerPRizeRoomPrizeVendorText, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_1
	dw_const GameCornerPRizeRoomPrizeVendorText, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_2
	dw_const GameCornerPRizeRoomPrizeVendorText, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_3
	EXPORT TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_1 ; used by engine/events/prize_menu.asm

GameCornerPrizeRoomBaldingGuyText:
	text "HMM⋯! SOMEHOW"
	line "I REALLY WANT"
	cont "THAT PORYGON!"

	para "BUT WINNING AT"
	line "SLOT GAMES IS"
	cont "SO DIFFICULT!"
	done

GameCornerPrizeRoomGamblerText:
	text "GAHAHA! I WON"
	line "SO MUCH CASH⋯!"

	para "WISH EVERY DAY"
	line "WERE LIKE THIS!"
	done

GameCornerPRizeRoomPrizeVendorText:
	script_prize_vendor
