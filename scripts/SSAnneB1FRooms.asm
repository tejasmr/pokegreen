SSAnneB1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnneB1FRooms_TrainerHeaders
	ld de, SSAnneB1FRooms_ScriptPointers
	ld a, [wSSAnneB1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnneB1FRoomsCurScript], a
	ret

SSAnneB1FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNEB1FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNEB1FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNEB1FROOMS_END_BATTLE

SSAnneB1FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnneB1FRoomsSailor1Text,   TEXT_SSANNEB1FROOMS_SAILOR1
	dw_const SSAnneB1FRoomsSailor2Text,   TEXT_SSANNEB1FROOMS_SAILOR2
	dw_const SSAnneB1FRoomsSailor3Text,   TEXT_SSANNEB1FROOMS_SAILOR3
	dw_const SSAnneB1FRoomsSailor4Text,   TEXT_SSANNEB1FROOMS_SAILOR4
	dw_const SSAnneB1FRoomsSailor5Text,   TEXT_SSANNEB1FROOMS_SAILOR5
	dw_const SSAnneB1FRoomsFisherText,    TEXT_SSANNEB1FROOMS_FISHER
	dw_const SSAnneB1FRoomsSuperNerdText, TEXT_SSANNEB1FROOMS_SUPER_NERD
	dw_const SSAnneB1FRoomsMachokeText,   TEXT_SSANNEB1FROOMS_MACHOKE
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_ETHER
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_TM_REST
	dw_const PickUpItemText,              TEXT_SSANNEB1FROOMS_MAX_POTION

	def_trainers SSAnneB1FRooms
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_0, 2, Sailor1
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_1, 3, Sailor2
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_2, 2, Sailor3
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_3, 2, Sailor4
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_4, 2, Sailor5
	trainer EVENT_BEAT_SS_ANNE_10_TRAINER_5, 3, Fisher
	db -1 ; end

SSAnneB1FRoomsSailor1Text:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsSailor1BattleText:
	text "SAILORS AND"
	line "FIGHTS GO"
	cont "TOGETHER! COME ON"
	done

SSAnneB1FRoomsSailor1EndBattleText:
	text "OOSH! THAT WAS A"
	line "GOOD BATTLE!"
	prompt

SSAnneB1FRoomsSailor1AfterBattleText:
	text "HAHAHA! WANT TO"
	line "BE A SAILOR TOO?"
	done

SSAnneB1FRoomsSailor2Text:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsSailor2BattleText:
	text "HERE I COME! ON"
	line "MY SAILOR SOUL·"
	cont "I SHALL WIN!"
	done

SSAnneB1FRoomsSailor2EndBattleText:
	text "MY SAILOR SOUL"
	line "LOST TO YOU!"
	prompt

SSAnneB1FRoomsSailor2AfterBattleText:
	text "SPEAKING OF PORT"
	line "KUCHIBA· IS THAT"
	cont "『TSURI OYAJI』"
	cont "GURU FISHING WELL"
	done

SSAnneB1FRoomsSailor3Text:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsSailor3BattleText:
	text "EVEN SAILORS"
	line "HAVE AT LEAST"
	cont "SOME #!"
	done

SSAnneB1FRoomsSailor3EndBattleText:
	text "YOU ARE QUITE"
	line "GOOD AINT YA!"
	prompt

SSAnneB1FRoomsSailor3AfterBattleText:
	text "ALL OUR # WERE"
	line "CAUGHT BY US OUT"
	cont "AT WILD SEA!"
	done

SSAnneB1FRoomsSailor4Text:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsSailor4BattleText:
	text "LIVELY KIDS LIKE"
	line "YOU· I LIKE EM!@"
	text_end

SSAnneB1FRoomsSailor4EndBattleText:
	text "ARRGH! I LOST!"
	prompt

SSAnneB1FRoomsSailor4AfterBattleText:
	text "SEA # LIVE WAY"
	line "DOWN DEEP· SO WE"
	cont "USE FISHING ROD"
	cont "TO PULL THEM UP!"
	done

SSAnneB1FRoomsSailor5Text:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsSailor5BattleText:
	text "YEAAH! IF YOU"
	line "LOSE· OVERBOARD"
	cont "INTO SEA YOU GO!"
	done

SSAnneB1FRoomsSailor5EndBattleText:
	text "KUH! BEATEN BAD!"
	prompt

SSAnneB1FRoomsSailor5AfterBattleText:
	text "OUT AT SEA· ONCE"
	line "IN A WHILE A"
	cont "JELLYFISH # WILL"
	cont "FLOAT ON BY!"
	done

SSAnneB1FRoomsFisherText:
	text_asm
	ld hl, SSAnneB1FRooms_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SSAnneB1FRoomsFisherBattleText:
	text "ROOKIE OF UNKNOWN"
	line "ORIGIN! NEITHER"
	cont "FISH NOR FOWL!"

	para "EVERYTHING I GOT"
	line "IS FROM THE SEA!"
	done

SSAnneB1FRoomsFisherEndBattleText:
	text "TCH! THE BIG ONE"
	line "GOT AWAY!"
	prompt

SSAnneB1FRoomsFisherAfterBattleText:
	text "IF I WON· I WAS"
	line "GOING TO MAKE"
	cont "YOU MY FISHING"
	cont "ASSISTANT!"
	done

SSAnneB1FRoomsSuperNerdText:
	text "MY PARTNER GORIKY"
	line "HAS HEFTY POWER!"

	para "EVEN SUPER HEAVY"
	line "BOULDERS CAN BE"
	cont "MOVED WITH"
	cont "『KAIRIKI』!"
	cont "SUPER STRENGTH!"
	done

SSAnneB1FRoomsMachokeText:
	text "GORIKY: 『GOOO"
	line "GOGOGO』!@"
	text_asm
	ld a, MACHOKE
	call PlayCry
	jp TextScriptEnd
