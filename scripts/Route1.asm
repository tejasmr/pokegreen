Route1_Script:
	jp EnableAutoTextBoxDrawing

Route1_TextPointers:
	def_text_pointers
	dw_const Route1Youngster1Text, TEXT_ROUTE1_YOUNGSTER1
	dw_const Route1Youngster2Text, TEXT_ROUTE1_YOUNGSTER2
	dw_const Route1SignText,       TEXT_ROUTE1_SIGN

Route1Youngster1Text:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, .MartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .GotPotionText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.got_item
	ld hl, .AlsoGotPokeballsText
.done
	call PrintText
	jp TextScriptEnd

.MartSampleText:
	text "WATASHI WA· I AM"
	line "SHOP CLERK FROM"
	cont "FRIENDLY SHOP！"

	para "CONVENIENT ITEM"
	line "DOUGU SHOP· SO"
	cont "VISIT TOKIWA CITY"

	para "SOU DA！ THATS IT！"
	line "HAVE A SAMPLE·"
	cont "<⋯>DOUZO！ HERE！"
	prompt

.GotPotionText:
	text "<PLAYER> GOT"
	line "「@"
	text_ram wStringBuffer
	text "」！@"
	sound_get_item_1
	text_end

.AlsoGotPokeballsText:
	text "WHEN YOU BUY"
	line "MONSTER BALLS"
	cont "TO CATCH #·"

	para "PLEASE VISIT"
	line "OUR SHOP AGAIN！"
	done

.NoRoomText:
	text "BAG IS FULL！"
	line "NIMOTSU IPPAI！"
	done

Route1Youngster2Text:
	text "SEE LEDGES ON"
	line "THE ROAD？ DANSA！"

	para "JUMP DOWN IS A"
	line "BIT SCARY<⋯> BUT"

	para "GOING BACK TO"
	line "MASARA TOWN IS"
	cont "HAYAI· SO FAST！"
	done

Route1SignText:
	text "ROUTE 1· DOURO"
	line "MASARA TOWN<⋯>"
	cont "TOKIWA CITY"
	done
