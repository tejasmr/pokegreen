FuchsiaGoodRodHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaGoodRodHouseFishingGuruText, TEXT_FUCHSIAGOODRODHOUSE_FISHING_GURU

FuchsiaGoodRodHouseFishingGuruText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_GOOD_ROD, a
	jr nz, .got_item
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, GOOD_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_GOOD_ROD, [hl]
	ld hl, .ReceivedGoodRodText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.refused
	ld hl, .ThatsSoDisappointingText
	jr .done
.got_item
	ld hl, .HowAreTheFishText
.done
	call PrintText
	jp TextScriptEnd

.Text:
	text "I AM FISHING"
	line "GURU BROTHER!"

	para "I LOVE FISHING"
	line "TO DEATH!"

	para "DO YOU LOVE"
	line "FISHING TOO?"
	done

.ReceivedGoodRodText:
	text "I SEE! WE WILL"
	line "GET ALONG WELL!"

	para "TAKE THIS ROD"
	line "AND FISH A LOT!"

	para "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_end

.UnusedText:
	para "FISHING IS"
	line "A MANS ROMANCE!"

	para "OLD ROD ONLY"
	line "CATCHES KOIKING·"
	cont "BUT GOOD ROD"
	cont "CATCHES BETTER!"
	done

.ThatsSoDisappointingText:
	text "WHAT<⋯> HOW"
	line "DISAPPOINTING!"
	done

.HowAreTheFishText:
	text "HELLO <PLAYER>!"

	para "ARE YOU FISHING"
	line "A WHOLE LOT?"
	done

.NoRoomText:
	text "OH NO! WANTED TO"
	line "GIVE GOOD ITEM·"
	cont "BUT PACK FULL!"
	done

