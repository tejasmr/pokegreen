MrPsychicsHouse_Script:
	jp EnableAutoTextBoxDrawing

MrPsychicsHouse_TextPointers:
	def_text_pointers
	dw_const MrPsychicsHouseMrPsychicText, TEXT_MRPSYCHICSHOUSE_MR_PSYCHIC

MrPsychicsHouseMrPsychicText:
	text_asm
	CheckEvent EVENT_GOT_TM29
	jr nz, .got_item
	ld hl, .YouWantedThisText
	call PrintText
	lb bc, TM_PSYCHIC_M, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM29Text
	call PrintText
	SetEvent EVENT_GOT_TM29
	jr .done
.bag_full
	ld hl, .TM29NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM29ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.YouWantedThisText:
	text "⋯⋯ I SEE!"

	para "YOU CRAVED THIS"
	line "POWER VERY MUCH!"
	prompt

.ReceivedTM29Text:
	text "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_end

.TM29ExplanationText:
	text "⋯YOU KNOW IT?"
	line "<TM>29 IS PSYCHIC"
	cont "『PSYCHOKINESIS』!"

	para "⋯IF LUCKY IT"
	line "MAY LOWER ENEMY"
	cont "SPECIAL STATS!"
	done

.TM29NoRoomText:
	text "BAG IS FULL!"
	line "NO ROOM TO PACK!"
	done
