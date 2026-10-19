CeladonCity_Script:
	call EnableAutoTextBoxDrawing
	ResetEvents EVENT_1B8, EVENT_1BF
	ResetEvent EVENT_67F
	ret

CeladonCity_TextPointers:
	def_text_pointers
	dw_const CeladonCityLittleGirlText,        TEXT_CELADONCITY_LITTLE_GIRL
	dw_const CeladonCityGramps1Text,           TEXT_CELADONCITY_GRAMPS1
	dw_const CeladonCityGirlText,              TEXT_CELADONCITY_GIRL
	dw_const CeladonCityGramps2Text,           TEXT_CELADONCITY_GRAMPS2
	dw_const CeladonCityGramps3Text,           TEXT_CELADONCITY_GRAMPS3
	dw_const CeladonCityFisherText,            TEXT_CELADONCITY_FISHER
	dw_const CeladonCityPoliwrathText,         TEXT_CELADONCITY_POLIWRATH
	dw_const CeladonCityRocket1Text,           TEXT_CELADONCITY_ROCKET1
	dw_const CeladonCityRocket2Text,           TEXT_CELADONCITY_ROCKET2
	dw_const CeladonCityTrainerTips1Text,      TEXT_CELADONCITY_TRAINER_TIPS1
	dw_const CeladonCitySignText,              TEXT_CELADONCITY_SIGN
	dw_const PokeCenterSignText,               TEXT_CELADONCITY_POKECENTER_SIGN
	dw_const CeladonCityGymSignText,           TEXT_CELADONCITY_GYM_SIGN
	dw_const CeladonCityMansionSignText,       TEXT_CELADONCITY_MANSION_SIGN
	dw_const CeladonCityDeptStoreSignText,     TEXT_CELADONCITY_DEPTSTORE_SIGN
	dw_const CeladonCityTrainerTips2Text,      TEXT_CELADONCITY_TRAINER_TIPS2
	dw_const CeladonCityPrizeExchangeSignText, TEXT_CELADONCITY_PRIZEEXCHANGE_SIGN
	dw_const CeladonCityGameCornerSignText,    TEXT_CELADONCITY_GAMECORNER_SIGN

CeladonCityLittleGirlText:
	text "THIS IS MY"
	line "DOGARS! CAUGHT"
	cont "ON GUREN ISLAND!"

	para "SPEWS POISON GAS"
	line "WHEN ANGRY⋯ BUT"
	cont "USUALLY SO GOOD!"
	done

CeladonCityGramps1Text:
	text "HEHEHE! THIS GYM"
	line "IS SPLENDID!"
	cont "ONLY GIRLS ALL"
	cont "AROUND!"
	done

CeladonCityGirlText:
	text "TAMAMUSHI PRIDES"
	line "ITSELF ON CLEAN"
	cont "BEAUTY! BUT THIS"
	cont "GAME CORNER IS"
	cont "SUCH A NUISANCE!"
	done

CeladonCityGramps2Text:
	text "OH WOE⋯! LOST"
	line "AGAIN ON SLOTS!"

	para "I KNEW I SHOULD"
	line "HAVE TRADED MY"
	cont "COINS FOR PRIZES"
	cont "EARLIER⋯!"
	done

CeladonCityGramps3Text:
	text_asm
	CheckEvent EVENT_GOT_TM41
	jr nz, .gotTM41
	ld hl, .Text
	call PrintText
	lb bc, TM_SOFTBOILED, 1
	call GiveItem
	jr c, .Success
	ld hl, .TM41NoRoomText
	call PrintText
	jr .Done
.Success
	ld hl, .ReceivedTM41Text
	call PrintText
	SetEvent EVENT_GOT_TM41
	jr .Done
.gotTM41
	ld hl, .TM41ExplanationText
	call PrintText
.Done
	jp TextScriptEnd

.Text:
	text "HELLO HELLO!"

	para "I ALWAYS WATCHED"
	line "YOU PASS OVER"
	cont "THERE· BUT WE"
	cont "FINALLY MEET!"

	para "TAKE THIS VERY"
	line "SPECIAL GIFT!"
	prompt

.ReceivedTM41Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text " FROM OLD MAN!@"
	sound_get_item_1
	text_end

.TM41ExplanationText:
	text "<TM>41 CONTAINS"
	line "SOFTBOILED MOVE!"

	para "ONLY 1 KIND OF"
	line "# CAN LEARN IT!"

	para "SUCH A # IS"
	line "LUCKY INDEED!"
	done

.TM41NoRoomText:
	text "YOUR PACK IS"
	line "OUT OF ROOM!"
	done

CeladonCityFisherText:
	text "THIS IS MY PAL"
	line "NYOROBON!"

	para "USING WATER STONE"
	line "EVOLVED NYOROZO"
	cont "INTO HIM!"
	done

CeladonCityPoliwrathText:
	text "NYOROBON:「CROAK"
	line "CROAK!」@"
	text_asm
	ld a, POLIWRATH
	call PlayCry
	jp TextScriptEnd

CeladonCityRocket1Text:
	text "WHAT ARE YOU"
	line "STARING AT?!"

	para "CLEAR OUT OR I"
	line "WILL PUNCH YOU!"
	done

CeladonCityRocket2Text:
	text "STOP SNOOPING"
	line "BEFORE MY EYES!"

	para "NEVER MOCK THE"
	line "ROCKET GANG!"
	done

CeladonCityTrainerTips1Text:
	text "⋯TRAINER TIPS!"

	para "X ACCURACY RAISES"
	line "MOVE ACCURACY!"

	para "DIRE HIT RAISES"
	line "CRITICAL RATE!"

	para "BUY ITEMS AT"
	line "TAMAMUSHI DEPT"
	cont "STORE!"
	done

CeladonCitySignText:
	text "TAMAMUSHI CITY"
	line "RAINBOW COLORED"
	cont "CITY OF DREAMS!"
	done

CeladonCityGymSignText:
	text "TAMAMUSHI # GYM"
	line "LEADER: ERIKA"
	cont "THE NATURE-LOVING"
	cont "YOUNG LADY!"
	done

CeladonCityMansionSignText:
	text "TAMAMUSHI MANSION"
	done

CeladonCityDeptStoreSignText:
	text "FIND EVERYTHING"
	line "YOU DESIRE!"
	cont "TAMAMUSHI DEPT"
	cont "STORE"
	done

CeladonCityTrainerTips2Text:
	text "⋯TRAINER TIPS!"

	para "GUARD SPEC."
	line "PROTECTS # FROM"
	cont "SPECIAL ATTACKS"
	cont "LIKE FIRE· WATER"
	cont "AND ELECTRIC!"

	para "BUY ITEMS AT"
	line "TAMAMUSHI DEPT"
	cont "STORE!"
	done

CeladonCityPrizeExchangeSignText:
	text "TRADE COINS FOR"
	line "BIG PRIZES!"
	cont "⋯PRIZE EXCHANGE"
	done

CeladonCityGameCornerSignText:
	text "PLAYGROUND FOR"
	line "ADULTS!"
	cont "⋯ROCKET GAME"
	cont "CORNER"
	done
