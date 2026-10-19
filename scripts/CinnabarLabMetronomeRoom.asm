CinnabarLabMetronomeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabMetronomeRoom_TextPointers:
	def_text_pointers
	dw_const CinnabarLabMetronomeRoomScientist1Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST1
	dw_const CinnabarLabMetronomeRoomScientist2Text, TEXT_CINNABARLABMETRONOMEROOM_SCIENTIST2
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_KEYBOARD
	dw_const CinnabarLabMetronomeRoomPCText,         TEXT_CINNABARLABMETRONOMEROOM_PC_MONITOR
	dw_const CinnabarLabMetronomeRoomAmberPipeText,  TEXT_CINNABARLABMETRONOMEROOM_AMBER_PIPE

CinnabarLabMetronomeRoomScientist1Text:
	text_asm
	CheckEvent EVENT_GOT_TM35
	jr nz, .got_item
	ld hl, .Text
	call PrintText
	lb bc, TM_METRONOME, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM35Text
	call PrintText
	SetEvent EVENT_GOT_TM35
	jr .done
.bag_full
	ld hl, .TM35NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM35ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.Text:
	text "TICK TICK TICK!"
	line "I MADE A NICE <TM>!"

	para "TEACH IT TO A #"
	line "FOR CRAZY FUN!"
	prompt

.ReceivedTM35Text:
	text "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_end

.TM35ExplanationText:
	text "TICK TICK TICK!"
	line "METRONOME SOUND!"

	para "WAG A FINGER AND"
	line "# BRAIN GETS"
	cont "STIMULATED TO USE"
	cont "ALL SORTS OF"
	cont "UNEXPECTED MOVES!"
	done

.TM35NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done

CinnabarLabMetronomeRoomScientist2Text:
	text "YES! EIEEVUI CAN"
	line "EVOLVE INTO 3"
	cont "KINDS OF #!"
	done

CinnabarLabMetronomeRoomPCText:
	text "E-MAIL RECEIVED"
	line "ON THE <PC>!"

	para "<⋯><⋯><⋯>"

	para "3 LEGENDARY BIRD"
	line "#: FIRE·"
	cont "THUNDER·FREEZER<⋯>"
	cont "WHEREABOUTS STILL"
	cont "UNKNOWN!"

	para "WE WILL EXPLORE"
	line "HANADA CAVE NEXT·"
	cont "<⋯>REPORT FROM"
	cont "# EXPEDITION"

	para "<⋯><⋯><⋯>"
	done

CinnabarLabMetronomeRoomAmberPipeText:
	text "AN AMBER PIPE"
	line "IS HERE!"
	done

