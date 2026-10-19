Museum1F_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, Museum1F_ScriptPointers
	ld a, [wMuseum1FCurScript]
	jp CallFunctionInTable

Museum1F_ScriptPointers:
	def_script_pointers
	dw_const Museum1FDefaultScript, SCRIPT_MUSEUM1F_DEFAULT
	dw_const Museum1FNoopScript,    SCRIPT_MUSEUM1F_NOOP

Museum1FDefaultScript:
	ld a, [wYCoord]
	cp 4
	ret nz
	ld a, [wXCoord]
	cp 9
	jr z, .continue
	ld a, [wXCoord]
	cp 10
	ret nz
.continue
	xor a
	ld [hJoyHeld], a
	ld a, TEXT_MUSEUM1F_SCIENTIST1
	ldh [hTextID], a
	jp DisplayTextID

Museum1FNoopScript:
	ret

Museum1F_TextPointers:
	def_text_pointers
	dw_const Museum1FScientist1Text, TEXT_MUSEUM1F_SCIENTIST1
	dw_const Museum1FGamblerText,    TEXT_MUSEUM1F_GAMBLER
	dw_const Museum1FScientist2Text, TEXT_MUSEUM1F_SCIENTIST2
	dw_const Museum1FScientist3Text, TEXT_MUSEUM1F_SCIENTIST3
	dw_const Museum1FOldAmberText,   TEXT_MUSEUM1F_OLD_AMBER

Museum1FScientist1Text:
	text_asm
	ld a, [wYCoord]
	cp 4
	jr nz, .not_right_of_scientist
	ld a, [wXCoord]
	cp 13
	jp z, .behind_counter
	jr .check_ticket
.not_right_of_scientist
	cp 3
	jr nz, .not_behind_counter
	ld a, [wXCoord]
	cp 12
	jp z, .behind_counter
.not_behind_counter
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .already_bought_ticket
	ld hl, .GoToOtherSideText
	call PrintText
	jp .done
.check_ticket
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr z, .no_ticket
.already_bought_ticket
	ld hl, .TakePlentyOfTimeText
	call PrintText
	jp .done
.no_ticket
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ldh [hJoyHeld], a
	ld hl, .WouldYouLikeToComeInText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .deny_entry
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $50
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .buy_ticket
	ld hl, .DontHaveEnoughMoneyText
	call PrintText
	jp .deny_entry
.buy_ticket
	ld hl, .ThankYouText
	call PrintText
	SetEvent EVENT_BOUGHT_MUSEUM_TICKET
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $50
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jr .allow_entry
.deny_entry
	ld hl, .ComeAgainText
	call PrintText
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	call UpdateSprites
	jr .done
.allow_entry
	ld a, SCRIPT_MUSEUM1F_NOOP
	ld [wMuseum1FCurScript], a
	jr .done

.behind_counter
	ld hl, .DoYouKnowWhatAmberIsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .explain_amber
	ld hl, .TheresALabSomewhereText
	call PrintText
	jr .done
.explain_amber
	ld hl, .AmberIsFossilizedTreeSapText
	call PrintText
.done
	jp TextScriptEnd

.ComeAgainText:
	text "COME AGAIN NE！"
	done

.WouldYouLikeToComeInText:
	text "YES YES！ CHILD"
	line "ADMISSION IS"
	cont "JUST 50 YEN！"

	para "WOULD YOU LIKE"
	line "TO ENTER NE？"
	done

.ThankYouText:
	text "YES INDEED！"
	line "RECEIVED 50 YEN！"
	done

.DontHaveEnoughMoneyText:
	text "<⋯>ARA！"
	line "NOT ENOUGH MONEY！"
	prompt

.DoYouKnowWhatAmberIsText:
	text "SNEAKING IN FROM"
	line "BACK FOR FREE？"
	cont "SLY GUY NE！"

	para "MORE IMPORTANT·"
	line "DO YOU KNOW"
	cont "WHAT AMBER IS？"
	done

.TheresALabSomewhereText:
	text "BRINGING BACK"
	line "ANCIENT LIFE IN"
	cont "AMBER TO LIFE<⋯>"

	para "SOME LAB IS"
	line "DOING THAT BIG"
	cont "EXPERIMENT NOW！"
	done

.AmberIsFossilizedTreeSapText:
	text "TREE SAP FROM"
	line "ANCIENT TIMES"
	cont "HARDENED LIKE A"
	cont "FOSSIL JA！"

	para "THAT IS CALLED"
	line "KOHAKU· AMBER！"
	done

.GoToOtherSideText:
	text "PLEASE GO ROUND"
	line "TO FRONT SIDE！"
	done

.TakePlentyOfTimeText:
	text "TAKE YOUR TIME！"
	done

Museum1FGamblerText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "ARIGATAYA！"
	line "BLESSED SO MUCH！"

	para "TO WORSHIP BONES"
	line "OF DRAGON GOD"
	cont "RYUUJIN-SAMA！"
	done

Museum1FScientist2Text:
	text_asm
	CheckEvent EVENT_GOT_OLD_AMBER
	jr nz, .got_item
	ld hl, .TakeThisToAPokemonLabText
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, TOGGLE_OLD_AMBER
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld hl, .ReceivedOldAmberText
	jr .done
.bag_full
	ld hl, .YouDontHaveSpaceText
	jr .done
.got_item
	ld hl, .GetTheOldAmberCheckText
	done
.done
	call PrintText
	jp TextScriptEnd

.TakeThisToAPokemonLabText:
	text "SHH！ SECRET BUT"
	line "THIS AMBER<⋯>"

	para "HAS GENES OF #"
	line "INSIDE I BET！"

	para "IF BROUGHT BACK"
	line "BIG DISCOVERY！"

	para "BUT COLLEAGUES"
	line "DONT BELIEVE ME！"

	para "<⋯>SO I HAVE"
	line "A FAVOR TO ASK！"

	para "TAKE THIS TO"
	line "A LAB SOMEWHERE"
	cont "TO EXAMINE IT！"
	prompt

.ReceivedOldAmberText:
	text "<PLAYER> GOT"
	line "OLD AMBER！@"
	sound_get_item_1
	text_end

.GetTheOldAmberCheckText:
	text "<⋯>SHH！ PLEASE"
	line "TAKE CARE OF"
	cont "THAT OLD AMBER！"
	done

.YouDontHaveSpaceText:
	text "BAG IS FULL NE！"
	done

Museum1FScientist3Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "HERE WE EXHIBIT"
	line "2 RARE TYPES"
	cont "OF ANCIENT #"
	cont "WORLD FOSSILS！"
	done

Museum1FOldAmberText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "CLEAR GOLDEN"
	line "BEAUTIFUL AMBER"
	cont "RESTS HERE！"
	done
