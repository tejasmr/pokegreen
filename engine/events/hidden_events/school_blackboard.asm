PrintBlackboardLinkCableText:
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenEventFunctionArgument]
	call PrintPredefTextID
	ret

LinkCableHelp::
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, LinkCableHelpText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a ; not used
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 3
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.linkHelpLoop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	ld b, 8
	ld c, 12
	call TextBoxBorder
	hlcoord 2, 2
	ld de, HowToLinkText
	call PlaceString
	ld hl, LinkCableHelpText2
	call PrintText
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .exit
	ld a, [wCurrentMenuItem]
	cp 3 ; pressed a on "STOP READING"
	jr z, .exit
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld hl, LinkCableInfoTexts
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .linkHelpLoop
.exit
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

LinkCableHelpText1:
	text "<⋯># LESSON！"

	para "HOW TO PLAY WITH"
	line "THE LINK CABLE！"
	prompt

LinkCableHelpText2:
	text "WHICH HEADING DO"
	line "YOU WANT TO READ？"
	done

HowToLinkText:
	db   "LINK CABLE"
	next "COLOSSEUM"
	next "TRADE CTR"
	next "QUIT@"

LinkCableInfoTexts:
	dw LinkCableInfoText1
	dw LinkCableInfoText2
	dw LinkCableInfoText3

LinkCableInfoText1:
	text "CONNECT WITH A"
	line "FRIENDS GAMEBOY"
	cont "USING CABLE·THEN"
	cont "TALK TO COUNTER"
	cont "LADY ON RIGHT IN"
	cont "# CENTER！"
	prompt

LinkCableInfoText2:
	text "COLOSSEUM IS ROOM"
	line "TO ENTER WHEN"
	cont "BATTLING WITH A"
	cont "FRIEND PERSON！"
	prompt

LinkCableInfoText3:
	text "TRADE CENTER IS"
	line "ROOM TO ENTER"
	cont "WHEN TRADING #"
	cont "WITH A FRIEND！"
	prompt

ViridianSchoolBlackboard::
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, ViridianSchoolBlackboardText1
	call PrintText
	xor a
	ld [wMenuItemOffset], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_LEFT | PAD_RIGHT | PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.blackboardLoop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	lb bc, 6, 10
	call TextBoxBorder
	hlcoord 1, 2
	ld de, StatusAilmentText1
	call PlaceString
	hlcoord 6, 2
	ld de, StatusAilmentText2
	call PlaceString
	ld hl, ViridianSchoolBlackboardText2
	call PrintText
	call HandleMenuInput ; pressing up and down is handled in here
	bit B_PAD_B, a ; pressed b
	jr nz, .exitBlackboard
	bit B_PAD_RIGHT, a
	jr z, .didNotPressRight
	; move cursor to right column
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 6
	ld [wTopMenuItemX], a
	ld a, 3 ; in the the right column, use an offset to prevent overlap
	ld [wMenuItemOffset], a
	jr .blackboardLoop
.didNotPressRight
	bit B_PAD_LEFT, a
	jr z, .didNotPressLeftOrRight
	; move cursor to left column
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 2
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	xor a
	ld [wMenuItemOffset], a
	jr .blackboardLoop
.didNotPressLeftOrRight
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wMenuItemOffset]
	add b
	cp 5 ; cursor is pointing to "QUIT"
	jr z, .exitBlackboard
	; we must have pressed a on a status condition
	; so print the text
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld hl, ViridianBlackboardStatusPointers
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jp .blackboardLoop
.exitBlackboard
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call LoadScreenTilesFromBuffer1
	jp TextScriptEnd

ViridianSchoolBlackboardText1:
	text "WRITTEN ON BOARD"
	line "ARE STATUS STATE"
	cont "CHANGES OF #"
	cont "DURING BATTLES！"
	prompt

ViridianSchoolBlackboardText2:
	text "WHICH HEADING DO"
	line "YOU WISH TO SEE？"
	done

StatusAilmentText1:
	db   " SLP"
	next " PSN"
	next " PAR@"

StatusAilmentText2:
	db   " BRN"
	next " FRZ"
	next " QUIT@"

	db "@" ; unused

ViridianBlackboardStatusPointers:
	dw ViridianBlackboardSleepText
	dw ViridianBlackboardPoisonText
	dw ViridianBlackboardPrlzText
	dw ViridianBlackboardBurnText
	dw ViridianBlackboardFrozenText

ViridianBlackboardSleepText:
	text "WHEN ASLEEP·#"
	line "CANNOT ATTACK！"

	para "STAYS ASLEEP"
	line "AFTER BATTLE·"
	cont "USE AWAKENING TO"
	cont "WAKE IT UP！"
	prompt

ViridianBlackboardPoisonText:
	text "WHEN POISONED·HP"
	line "STEADILY DROPS！"

	para "POISON REMAINS"
	line "AFTER BATTLE·"
	cont "USE ANTIDOTE TO"
	cont "CURE THE POISON！"
	prompt

ViridianBlackboardPrlzText:
	text "PARALYSIS MAY"
	line "CAUSE MOVES TO"
	cont "FAIL AND MISS！"

	para "STAYS PARALYZED"
	line "AFTER BATTLE·"
	cont "CURE WITH"
	cont "PARALYZ HEAL！"
	prompt

ViridianBlackboardBurnText:
	text "BURN REDUCES HP·"
	line "AND ALSO LOWERS"
	cont "ATTACK POWER！"

	para "BURN REMAINS"
	line "AFTER BATTLE·"
	cont "USE BURN HEAL TO"
	cont "CURE IT WELL！"
	prompt

ViridianBlackboardFrozenText:
	text "WHEN FROZEN·#"
	line "BECOMES TOTALLY"
	cont "IMMOBILIZED！"

	para "STAYS FROZEN"
	line "AFTER BATTLE·"
	cont "THAW WITH ICE"
	cont "HEAL TO RESCUE！"
	prompt
