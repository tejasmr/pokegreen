CeruleanBadgeHouse_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanBadgeHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanBadgeHouseMiddleAgedManText, TEXT_CERULEANBADGEHOUSE_MIDDLE_AGED_MAN

CeruleanBadgeHouseMiddleAgedManText:
	text_asm
	ld hl, .Text
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, .WhichBadgeText
	call PrintText
	ld hl, .BadgeItemList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .done
	ld hl, CeruleanBadgeHouseBadgeTextPointers
	ld a, [wCurItem]
	sub BOULDERBADGE
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .loop
.done
	xor a
	ld [wListScrollOffset], a
	ld hl, .VisitAnyTimeText
	call PrintText
	jp TextScriptEnd

.BadgeItemList:
	db NUM_BADGES ; #
	table_width 1
	db BOULDERBADGE
	db CASCADEBADGE
	db THUNDERBADGE
	db RAINBOWBADGE
	db SOULBADGE
	db MARSHBADGE
	db VOLCANOBADGE
	db EARTHBADGE
	assert_table_length NUM_BADGES
	db -1 ; end

.Text:
	text "# BADGES ARE"
	line "AWARDED ONLY TO"
	cont "SKILLED <TRAINER>!"

	para "YOU ALSO POSSESS"
	line "A FEW OF THEM·"

	para "THOSE BADGES"
	line "HOLD AN AMAZING"
	cont "SECRET INSIDE!"
	prompt

.WhichBadgeText:
	text "NOW THEN⋯"

	para "WHICH OF 8 #"
	line "BADGE SECRETS"
	cont "SHALL I RELATE?"
	done

.VisitAnyTimeText:
	text "COME AGAIN WHEN"
	line "YOU WISH TO HEAR"
	cont "MORE TALES!"
	done

CeruleanBadgeHouseBadgeTextPointers:
	table_width 2
	dw CeruleanBadgeHouseBoulderBadgeText
	dw CeruleanBadgeHouseCascadeBadgeText
	dw CeruleanBadgeHouseThunderBadgeText
	dw CeruleanBadgeHouseRainbowBadgeText
	dw CeruleanBadgeHouseSoulBadgeText
	dw CeruleanBadgeHouseMarshBadgeText
	dw CeruleanBadgeHouseVolcanoBadgeText
	dw CeruleanBadgeHouseEarthBadgeText
	assert_table_length NUM_BADGES

CeruleanBadgeHouseBoulderBadgeText:
	text "THE ATTACK POWER"
	line "OF ALL # RISES"
	cont "A LITTLE HIGHER!"

	para "ALSO· THE MOVE"
	line "FLASH CAN BE"
	cont "USED OUTSIDE OF"
	cont "BATTLE ANYTIME!"
	prompt

CeruleanBadgeHouseCascadeBadgeText:
	text "# UP TO <LV>30"
	line "WILL OBEY ORDERS"
	cont "PEACEFULLY!"

	para "ANY HIGHER <LV>·"
	line "THEY WILL NOT"
	cont "LISTEN TO YOU!"

	para "ALSO· THE MOVE"
	line "CUT CAN BE USED"
	cont "OUTSIDE BATTLE!"
	prompt

CeruleanBadgeHouseThunderBadgeText:
	text "THE SPEED STAT"
	line "OF ALL # RISES"
	cont "A LITTLE HIGHER!"

	para "ALSO· THE MOVE"
	line "FLY CAN BE USED"
	cont "OUTSIDE BATTLE!"
	prompt

CeruleanBadgeHouseRainbowBadgeText:
	text "# UP TO <LV>50"
	line "WILL OBEY ORDERS"
	cont "PEACEFULLY!"

	para "ANY HIGHER <LV>·"
	line "THEY WILL NOT"
	cont "LISTEN TO YOU!"

	para "ALSO· THE MOVE"
	line "STRENGTH CAN BE"
	cont "USED OUT BATTLE!"
	prompt

CeruleanBadgeHouseSoulBadgeText:
	text "THE DEFENSE STAT"
	line "OF ALL # RISES"
	cont "A LITTLE HIGHER!"

	para "ALSO· THE MOVE"
	line "SURF CAN BE USED"
	cont "OUTSIDE BATTLE!"
	prompt

CeruleanBadgeHouseMarshBadgeText:
	text "# UP TO <LV>70"
	line "WILL OBEY ORDERS"
	cont "PEACEFULLY!"

	para "ANY HIGHER <LV>·"
	line "THEY WILL NOT"
	cont "LISTEN TO YOU!"
	prompt

CeruleanBadgeHouseVolcanoBadgeText:
	text "THE SPECIAL STAT"
	line "OF ALL # RISES"
	cont "A LITTLE HIGHER!"
	prompt

CeruleanBadgeHouseEarthBadgeText:
	text "ALL # WILL"
	line "OBEY YOUR ORDERS"
	cont "PEACEFULLY!"
	prompt
