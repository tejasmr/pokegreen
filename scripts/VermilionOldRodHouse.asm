VermilionOldRodHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionOldRodHouse_TextPointers:
	def_text_pointers
	dw_const VermilionOldRodHouseFishingGuruText, TEXT_VERMILIONOLDRODHOUSE_FISHING_GURU

VermilionOldRodHouseFishingGuruText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_OLD_ROD, a
	jr nz, .got_old_rod
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, OLD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_OLD_ROD, [hl]
	ld hl, .TakeThisText
	jr .print_text
.bag_full
	ld hl, .NoRoomText
	jr .print_text
.refused
	ld hl, .ThatsSoDisappointingText
	jr .print_text
.got_old_rod
	ld hl, .HowAreTheFishBitingText
.print_text
	call PrintText
	jp TextScriptEnd

.DoYouLikeToFishText:
	text "I AM"
	line "『TSURI OYAJI』!"
	cont "FISHING OLD MAN!"

	para "I LOVE FISHING"
	line "TO DEATH· YES!"

	para "DO YOU LIKE"
	line "FISHING TOO?"
	done

.TakeThisText:
	text "GOOD! YOU AND I"
	line "GET ALONG WELL!"

	para "TAKE THIS AND"
	line "FISH TO LIMITS!"

	para "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!"
	sound_get_item_1
	text_start

	para "FISHING IS A"
	line "MAN 『ROMAN』!"
	cont "MAN ROMANCE!"

	para "AT SEA OR RIVER!"

	para "USE FISHING ROD"
	line "WITHOUT HESITATE!"
	done

.ThatsSoDisappointingText:
	text "WHAT<⋯> SUCH A"
	line "DISAPPOINTMENT!"
	done

.HowAreTheFishBitingText:
	text "HELLO <PLAYER>!"

	para "ARE YOU FISHING"
	line "UP A STORM?"
	done

.NoRoomText:
	text "OH NO! YOUR"
	line "PACK IS FULL!"
	done
