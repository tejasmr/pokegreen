Route12SuperRodHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12SuperRodHouse_TextPointers:
	def_text_pointers
	dw_const Route12SuperRodHouseFishingGuruText, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12SuperRodHouseFishingGuruText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_SUPER_ROD, a
	jr nz, .got_item
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, SUPER_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_SUPER_ROD, [hl]
	ld hl, .ReceivedSuperRodText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.refused
	ld hl, .ThatsDisappointingText
	jr .done
.got_item
	ld hl, .TryFishingText
.done
	call PrintText
	jp TextScriptEnd

.DoYouLikeToFishText:
	text "I AM FISHING"
	line "GURU YOUNGER BRO!"

	para "I LOVE FISHING"
	line "BEYOND WORDS!"

	para "DO YOU LIKE"
	line "FISHING TOO?"
	done

.ReceivedSuperRodText:
	text "SUGOI! I KNEW"
	line "WE WOULD AGREE!"

	para "TAKE THIS ROD"
	line "AND FISH A LOT!"

	para "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_start

	para "FISHING IS"
	line "A MANS ROMANCE!"

	para "IN SEA OR RIVER!"

	para "DONT HESITATE TO"
	line "DROP YOUR HOOK!"
	done

.ThatsDisappointingText:
	text "WHAT<⋯> HOW VERY"
	line "DISAPPOINTING!"
	done

.TryFishingText:
	text "HELLO <PLAYER>!"

	para "SUPER ROD CATCHES"
	line "DIFFERENT # IN"
	cont "DIFFERENT WATERS!"

	para "GO FISH ALL OVER"
	line "THE WORLD!"
	done

.NoRoomText:
	text "OH NO! WANTED TO"
	line "GIVE GOOD ITEM·"
	cont "BUT PACK FULL!"
	done

