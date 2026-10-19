SSAnne2FRooms_Script:
	ld a, 1 << BIT_NO_AUTO_TEXT_BOX
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, SSAnne2FRooms_TrainerHeaders
	ld de, SSAnne2FRooms_ScriptPointers
	ld a, [wSSAnne2FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne2FRoomsCurScript], a
	ret

SSAnne2FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNE2FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNE2FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNE2FROOMS_END_BATTLE

SSAnne2FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnne2FRoomsGentleman1Text,   TEXT_SSANNE2FROOMS_GENTLEMAN1
	dw_const SSAnne2FRoomsFisherText,       TEXT_SSANNE2FROOMS_FISHER
	dw_const SSAnne2FRoomsGentleman2Text,   TEXT_SSANNE2FROOMS_GENTLEMAN2
	dw_const SSAnne2FRoomsCooltrainerFText, TEXT_SSANNE2FROOMS_COOLTRAINER_F
	dw_const SSAnne2FRoomsGentleman3Text,   TEXT_SSANNE2FROOMS_GENTLEMAN3
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_MAX_ETHER
	dw_const SSAnne2FRoomsGentleman4Text,   TEXT_SSANNE2FROOMS_GENTLEMAN4
	dw_const SSAnne2FRoomsGrampsText,       TEXT_SSANNE2FROOMS_GRAMPS
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_RARE_CANDY
	dw_const SSAnne2FRoomsGentleman5Text,   TEXT_SSANNE2FROOMS_GENTLEMAN5
	dw_const SSAnne2FRoomsLittleBoyText,    TEXT_SSANNE2FROOMS_LITTLE_BOY
	dw_const SSAnne2FRoomsBrunetteGirlText, TEXT_SSANNE2FROOMS_BRUNETTE_GIRL
	dw_const SSAnne2FRoomsBeautyText,       TEXT_SSANNE2FROOMS_BEAUTY

	def_trainers SSAnne2FRooms
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_0, 2, Gentleman1
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_1, 3, Fisher
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_2, 3, Gentleman2
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_3, 2, CooltrainerF
	db -1 ; end

SSAnne2FRoomsGentleman1Text:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman1BattleText:
	text "COMPETING WITH"
	line "YOUTH IS LIFE"
	cont "GREATEST JOY!"
	done

SSAnne2FRoomsGentleman1EndBattleText:
	text "GOOD MATCH! I"
	line "FEEL YOUNG AGAIN!"
	prompt

SSAnne2FRoomsGentleman1AfterBattleText:
	text "15 YEARS AGO· I"
	line "WOULD HAVE WON!"
	done

SSAnne2FRoomsFisherText:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsFisherBattleText:
	text "LOOK AT THE FISH"
	line "I CAUGHT WITH"
	cont "GREAT PRIDE!"
	done

SSAnne2FRoomsFisherEndBattleText:
	text "ALL GONE EMPTY!"
	prompt

SSAnne2FRoomsFisherAfterBattleText:
	text "<⋯>PARTY? ON DECK"
	line "PARTY IS ALREADY"
	cont "OVER BY NOW!"
	done

SSAnne2FRoomsGentleman2Text:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman2BattleText:
	text "DO YOU VALUE"
	line "STRONG # OR"
	cont "RARE # MORE?"
	done

SSAnne2FRoomsGentleman2EndBattleText:
	text "NOT BAD AT ALL!"
	prompt

SSAnne2FRoomsGentleman2AfterBattleText:
	text "I WANT A # THAT"
	line "IS BOTH RARE AND"
	cont "VERY STRONG!"
	done

SSAnne2FRoomsCooltrainerFText:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsCooltrainerFBattleText:
	text "OH? I DID NOT"
	line "SEE YOU AT SHIP"
	cont "PARTY<⋯>?"
	done

SSAnne2FRoomsCooltrainerFEndBattleText:
	text "GO EASY ON ME!"
	prompt

SSAnne2FRoomsCooltrainerFAfterBattleText:
	text "HOW NICE· STRONG"
	line "#! I WANT TOO<⋯>"
	cont "I AM SO JEALOUS!"
	done

SSAnne2FRoomsGentleman3Text:
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, .Text
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "TRAVELED ENTIRE"
	line "WORLD BUT SHOCKED"
	cont "WHEN I FOUND THAT"
	cont "SLEEPING GUY!"

	para "YES<⋯>! IT WAS"
	line "THIS VERY #!"
	prompt

SSAnne2FRoomsGentleman4Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "I HAVE SEEN #"
	line "CARRY HUMANS AND"
	cont "SURF ON WATER·"
	cont "YES I DID!"
	done

SSAnne2FRoomsGrampsText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "SLENDER TREE CAN"
	line "BE CUT DOWN BY"
	cont "# 『IAIGIRI』!"
	cont "THAT IS CUT!"
	done

SSAnne2FRoomsGentleman5Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "HAVE YOU BEEN TO"
	line "SAFARI ZONE IN"
	cont "SEKICHIKU CITY?"

	para "SO MANY RARE #"
	line "LIVE OVER THERE!"
	done

SSAnne2FRoomsLittleBoyText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "PAPA AND ME BOTH"
	line "LOVE SAFARI ZONE!"
	cont "I WANT TO GO"
	cont "PLAY AGAIN!"
	done

SSAnne2FRoomsBrunetteGirlText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "I SAW CAPTAIN·"
	line "HE SAID HE WAS"
	cont "SICK WITH A"
	cont "PALE BLUE FACE!"
	done

SSAnne2FRoomsBeautyText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "THEY SAY MANY"
	line "PEOPLE SUFFER"
	cont "FROM SEASICKNESS!"
	done
