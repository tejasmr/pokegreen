CeladonDiner_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonDiner_TextPointers:
	def_text_pointers
	dw_const CeladonDinerCookText,            TEXT_CELADONDINER_COOK
	dw_const CeladonDinerMiddleAgedWomanText, TEXT_CELADONDINER_MIDDLE_AGED_WOMAN
	dw_const CeladonDinerMiddleAgedManText,   TEXT_CELADONDINER_MIDDLE_AGED_MAN
	dw_const CeladonDinerFisherText,          TEXT_CELADONDINER_FISHER
	dw_const CeladonDinerGymGuideText,        TEXT_CELADONDINER_GYM_GUIDE

CeladonDinerCookText:
	text "WELCOME!"

	para "SORRY· IT IS ALL"
	line "REGULARS HERE!"
	done

CeladonDinerMiddleAgedWomanText:
	text "MY PET #⋯"
	line "LACKS STAMINA· SO"
	cont "I ALWAYS BUY"
	cont "MEDICINE AT DEPT"
	cont "STORE FOR IT!"
	done

CeladonDinerMiddleAgedManText:
	text "WHISPER⋯ MUNCH⋯"
	line "HEARD UNDER GAME"
	cont "CORNER THERE IS"
	cont "A BASEMENT⋯"
	done

CeladonDinerFisherText:
	text "CHEW CHEW⋯!"

	para "THAT OLD GUY OVER"
	line "AT THAT TABLE·"
	cont "LOST ALL HIS CASH"
	cont "ON THE SLOTS!"
	done

CeladonDinerGymGuideText:
	text_asm
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .got_item
	ld hl, .ImFlatOutBustedText
	call PrintText
	lb bc, COIN_CASE, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, .ReceivedCoinCaseText
	call PrintText
	jr .done
.bag_full
	ld hl, .CoinCaseNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .WinItBackText
	call PrintText
.done
	jp TextScriptEnd

.ImFlatOutBustedText:
	text "UOH⋯ LAUGH AT ME!"

	para "LOST EVERYTHING"
	line "AT GAME CORNER!"
	cont "NOW FLAT BROKE!"

	para "NO MORE SLOTS"
	line "FOR ME! I WILL"
	cont "WORK AN HONEST"
	cont "JOB FROM NOW!"

	para "⋯SO THEREFORE"
	line "TAKE THIS HERE!"
	prompt

.ReceivedCoinCaseText:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_key_item
	text_end

.CoinCaseNoRoomText:
	text "YOUR PACK IS"
	line "OUT OF ROOM!"
	done

.WinItBackText:
	text "AAH! I THOUGHT"
	line "I WOULD WIN IT"
	cont "ALL BACK SOMEDAY·"
	cont "LOOK AT ME NOW⋯!"
	done
