SafariZoneSecretHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneSecretHouseFishingGuruText, TEXT_SAFARIZONESECRETHOUSE_FISHING_GURU

SafariZoneSecretHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_HM03
	jr nz, .got_item
	ld hl, .YouHaveWonText
	call PrintText
	lb bc, HM_SURF, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedHM03Text
	call PrintText
	SetEvent EVENT_GOT_HM03
	jr .done
.bag_full
	ld hl, .HM03NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .HM03ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.YouHaveWonText:
	text "OH! YOU MADE IT!"

	para "THIS IS DEEPEST"
	line "TREASURE HOUSE!"

	para "WE RAN CAMPAIGN"
	line "BUT NO ONE CAME·"
	cont "I WAS WORRIED!"

	para "CONGRATULATIONS!"
	line "YOU WIN PRIZE!"
	prompt

.ReceivedHM03Text:
	text "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_end

.HM03ExplanationText:
	text "HM03 IS NAMINORI!"
	line "SURFING ON WATER!"

	para "RIDE A # AND"
	line "CROSS THE WAVES!"

	para "PLUS THIS MACHINE"
	line "NEVER BREAKS!"

	para "YOU ARE VERY"
	line "LUCKY TO WIN"
	cont "SUCH A PRIZE!"
	done

.HM03NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done

