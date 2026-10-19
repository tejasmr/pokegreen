Route21_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route21_TrainerHeaders
	ld de, Route21_ScriptPointers
	ld a, [wRoute21CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute21CurScript], a
	ret

Route21_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE21_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE21_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE21_END_BATTLE

Route21_TextPointers:
	def_text_pointers
	dw_const Route21Fisher1Text,  TEXT_ROUTE21_FISHER1
	dw_const Route21Fisher2Text,  TEXT_ROUTE21_FISHER2
	dw_const Route21Swimmer1Text, TEXT_ROUTE21_SWIMMER1
	dw_const Route21Swimmer2Text, TEXT_ROUTE21_SWIMMER2
	dw_const Route21Swimmer3Text, TEXT_ROUTE21_SWIMMER3
	dw_const Route21Swimmer4Text, TEXT_ROUTE21_SWIMMER4
	dw_const Route21Swimmer5Text, TEXT_ROUTE21_SWIMMER5
	dw_const Route21Fisher3Text,  TEXT_ROUTE21_FISHER3
	dw_const Route21Fisher4Text,  TEXT_ROUTE21_FISHER4

	def_trainers Route21
	trainer EVENT_BEAT_ROUTE_21_TRAINER_0, 0, Fisher1
	trainer EVENT_BEAT_ROUTE_21_TRAINER_1, 0, Fisher2
	trainer EVENT_BEAT_ROUTE_21_TRAINER_2, 4, Swimmer1
	trainer EVENT_BEAT_ROUTE_21_TRAINER_3, 4, Swimmer2
	trainer EVENT_BEAT_ROUTE_21_TRAINER_4, 4, Swimmer3
	trainer EVENT_BEAT_ROUTE_21_TRAINER_5, 4, Swimmer4
	trainer EVENT_BEAT_ROUTE_21_TRAINER_6, 3, Swimmer5
	trainer EVENT_BEAT_ROUTE_21_TRAINER_7, 0, Fisher3
	trainer EVENT_BEAT_ROUTE_21_TRAINER_8, 0, Fisher4
	db -1 ; end

Route21Fisher1Text:
	text_asm
	ld hl, Route21_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher1BattleText:
	text "『ANY BITES?』OR"
	line "SO·DONT YOU WANT"
	cont "TO ASK ME THAT?"
	done

Route21Fisher1EndBattleText:
	text "AAH GOT DEFEATED!"
	prompt

Route21Fisher1AfterBattleText:
	text "NO GOOD # BITE"
	line "HERE! NOT AT ALL!"
	done

Route21Fisher2Text:
	text_asm
	ld hl, Route21_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher2BattleText:
	text "BIG HAUL BIG HAUL"
	line "WANT TO FIGHT MY"
	cont "# CATCH?"
	done

Route21Fisher2EndBattleText:
	text "KOIKING IS NO"
	line "GOOD AFTER ALL!"
	prompt

Route21Fisher2AfterBattleText:
	text "FOR SOME REASON"
	line "ONLY KOIKING BITE"
	cont "MY HOOK!"
	done

Route21Swimmer1Text:
	text_asm
	ld hl, Route21_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer1BattleText:
	text "THE SEA IS THE"
	line "ROMANCE OF MEN!"
	done

Route21Swimmer1EndBattleText:
	text "DAAA-T!"
	prompt

Route21Swimmer1AfterBattleText:
	text "SEA IS NICE BUT"
	line "TRUTH IS I ALSO"
	cont "LOVE MOUNTAINS!"
	done

Route21Swimmer2Text:
	text_asm
	ld hl, Route21_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer2BattleText:
	text "EVEN I COME TO"
	line "SWIM ON OCCASION!"
	done

Route21Swimmer2EndBattleText:
	text "GWAWA!"
	prompt

Route21Swimmer2AfterBattleText:
	text "LOOKS EASY TO"
	line "FLOAT? SHUT UP!"
	cont "MIND YOUR OWN"
	cont "BUSINESS-T!"
	done

Route21Swimmer3Text:
	text_asm
	ld hl, Route21_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer3BattleText:
	text "MY FAMILY #S"
	line "WERE CAUGHT IN"
	cont "THIS OCEAN!"
	done

Route21Swimmer3EndBattleText:
	text "U-MI-T! OCEAN!"
	prompt

Route21Swimmer3AfterBattleText:
	text "WHERE DID YOU"
	line "CATCH YOUR #?"
	done

Route21Swimmer4Text:
	text_asm
	ld hl, Route21_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer4BattleText:
	text "RIGHT NOW I AM IN"
	line "THE MIDDLE OF A"
	cont "TRIATHLON MATCH!"
	done

Route21Swimmer4EndBattleText:
	text "HA<⋯>HAA-T!"
	prompt

Route21Swimmer4AfterBattleText:
	text "EXHAUSTED<⋯>!"
	line "STILL HAVE BIKE"
	cont "AND MARATHON<⋯>!"
	done

Route21Swimmer5Text:
	text_asm
	ld hl, Route21_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route21Swimmer5BattleText:
	text "AAH! SUNSHINE"
	line "FEELS SO KIMOCHI!"
	done

Route21Swimmer5EndBattleText:
	text "MY DEFEAT!"
	prompt

Route21Swimmer5AfterBattleText:
	text "BURNED BURNED!"
	line "PITCH BLACK TAN!"
	done

Route21Fisher3Text:
	text_asm
	ld hl, Route21_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher3BattleText:
	text "TROUBLESOME LAD!"
	line "DONT ROUGH UP"
	cont "MY FISHING SEA!"
	done

Route21Fisher3EndBattleText:
	text "SORRY! NO BITES"
	line "MADE ME EDGY!"
	prompt

Route21Fisher3AfterBattleText:
	text "NO BITES! COULD"
	line "THIS BE JUST A"
	cont "GIANT POOL?!"
	done

Route21Fisher4Text:
	text_asm
	ld hl, Route21_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route21Fisher4BattleText:
	text "TILL A BITE HITS"
	line "I SHALL ENTERTAIN"
	cont "YOU IN BATTLE!"
	done

Route21Fisher4EndBattleText:
	text "KILLED SOME TIME"
	prompt

Route21Fisher4AfterBattleText:
	text "<⋯>WAIT! A BITE!"
	line "AH<⋯>! PULLING!"
	cont "REELING IN NOW!"
	done
