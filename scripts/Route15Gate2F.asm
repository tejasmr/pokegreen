Route15Gate2F_Script:
	jp DisableAutoTextBoxDrawing

Route15Gate2F_TextPointers:
	def_text_pointers
	dw_const Route15Gate2FOaksAideText,   TEXT_ROUTE15GATE2F_OAKS_AIDE
	dw_const Route15Gate2FBinocularsText, TEXT_ROUTE15GATE2F_BINOCULARS

Route15Gate2FOaksAideText:
	text_asm
	CheckEvent EVENT_GOT_EXP_ALL
	jr nz, .got_item
	ld a, 50
	ldh [hOaksAideRequirement], a
	ld a, EXP_ALL
	ldh [hOaksAideRewardItem], a
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wNameBuffer
	ld de, wOaksAideRewardItemName
	ld bc, ITEM_NAME_LENGTH
	call CopyData
	predef OaksAideScript
	ldh a, [hOaksAideResult]
	cp OAKS_AIDE_GOT_ITEM
	jr nz, .no_item
	SetEvent EVENT_GOT_EXP_ALL
.got_item
	ld hl, .ExpAllText
	call PrintText
.no_item
	jp TextScriptEnd

.ExpAllText:
	text "EXP.ALL GAKUSHUU"
	line "GIVES EXP TO"
	cont "ALL # IN PARTY·"
	cont "EVEN RESTING ONES"

	para "BUT EXP IS SPLIT"
	line "AMONG ALL MONS·"
	cont "DEPOSIT IN <PC> IF"
	cont "YOU DONT WANT IT!"
	done

Route15Gate2FBinocularsText:
	text_asm
	ld hl, .Text
	jp GateUpstairsScript_PrintIfFacingUp

.Text:
	text "LOOKED INTO"
	line "BINOCULARS!"

	para "ACROSS THE SEA<⋯>"
	line "A SMALL ISLAND"
	cont "CAN BE SEEN!"
	done

