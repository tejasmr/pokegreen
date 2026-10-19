Route12Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route12Gate2F_TextPointers:
	def_text_pointers
	dw_const Route12Gate2FBrunetteGirlText,    TEXT_ROUTE12GATE2F_BRUNETTE_GIRL
	dw_const Route12Gate2FLeftBinocularsText,  TEXT_ROUTE12GATE2F_LEFT_BINOCULARS
	dw_const Route12Gate2FRightBinocularsText, TEXT_ROUTE12GATE2F_RIGHT_BINOCULARS

Route12Gate2FBrunetteGirlText:
	text_asm
	CheckEvent EVENT_GOT_TM39, 1
	jr c, .got_item
	ld hl, .YouCanHaveThisText
	call PrintText
	lb bc, TM_SWIFT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM39Text
	call PrintText
	SetEvent EVENT_GOT_TM39
	jr .done
.bag_full
	ld hl, .TM39NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM39ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.YouCanHaveThisText:
	text "MY BELOVED #"
	line "IS ASLEEP AT"
	cont "# TOWER NOW<⋯>"

	para "HERE·HAVE MY <TM>"
	line "KIND LAD<⋯> I DONT"
	cont "NEED IT ANYMORE"
	prompt

.ReceivedTM39Text:
	text "<PLAYER> RECEIVED"
	line "<TM>39 FROM GIRL!@"
	sound_get_item_1
	text_end

.TM39ExplanationText:
	text "<TM>39 TEACHES"
	line "SPEEDSTAR SWIFT!"

	para "IT HAS SUPER"
	line "HIGH ACCURACY·"
	cont "NEVER MISSES!"
	done

.TM39NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done

Route12Gate2FLeftBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text "LOOKED INTO"
	line "BINOCULARS!"

	para "A GUY IS FISHING!"
	done

Route12Gate2FRightBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text "LOOKED INTO"
	line "BINOCULARS!"

	para "# TOWER IS"
	line "VISIBLE FAR OFF!"
	done


GateUpstairsScript_PrintIfFacingUp:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .up
	ld a, TRUE
	jr .done
.up
	call PrintText
	xor a
.done
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd
