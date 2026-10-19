Route17_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route17_TrainerHeaders
	ld de, Route17_ScriptPointers
	ld a, [wRoute17CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute17CurScript], a
	ret

Route17_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE17_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE17_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE17_END_BATTLE

Route17_TextPointers:
	def_text_pointers
	dw_const Route17Biker1Text,              TEXT_ROUTE17_BIKER1
	dw_const Route17Biker2Text,              TEXT_ROUTE17_BIKER2
	dw_const Route17Biker3Text,              TEXT_ROUTE17_BIKER3
	dw_const Route17Biker4Text,              TEXT_ROUTE17_BIKER4
	dw_const Route17Biker5Text,              TEXT_ROUTE17_BIKER5
	dw_const Route17Biker6Text,              TEXT_ROUTE17_BIKER6
	dw_const Route17Biker7Text,              TEXT_ROUTE17_BIKER7
	dw_const Route17Biker8Text,              TEXT_ROUTE17_BIKER8
	dw_const Route17Biker9Text,              TEXT_ROUTE17_BIKER9
	dw_const Route17Biker10Text,             TEXT_ROUTE17_BIKER10
	dw_const Route17NoticeSign1Text,         TEXT_ROUTE17_NOTICE_SIGN1
	dw_const Route17TrainerTips1Text,        TEXT_ROUTE17_TRAINER_TIPS1
	dw_const Route17TrainerTips2Text,        TEXT_ROUTE17_TRAINER_TIPS2
	dw_const Route17SignText,                TEXT_ROUTE17_SIGN
	dw_const Route17NoticeSign2Text,         TEXT_ROUTE17_NOTICE_SIGN2
	dw_const Route17CyclingRoadEndsSignText, TEXT_ROUTE17_CYCLING_ROAD_ENDS_SIGN

	def_trainers Route17
	trainer EVENT_BEAT_ROUTE_17_TRAINER_0, 3, Biker1
	trainer EVENT_BEAT_ROUTE_17_TRAINER_1, 4, Biker2
	trainer EVENT_BEAT_ROUTE_17_TRAINER_2, 4, Biker3
	trainer EVENT_BEAT_ROUTE_17_TRAINER_3, 4, Biker4
	trainer EVENT_BEAT_ROUTE_17_TRAINER_4, 3, Biker5
	trainer EVENT_BEAT_ROUTE_17_TRAINER_5, 2, Biker6
	trainer EVENT_BEAT_ROUTE_17_TRAINER_6, 4, Biker7
	trainer EVENT_BEAT_ROUTE_17_TRAINER_7, 2, Biker8
	trainer EVENT_BEAT_ROUTE_17_TRAINER_8, 3, Biker9
	trainer EVENT_BEAT_ROUTE_17_TRAINER_9, 4, Biker10
	db -1 ; end

Route17Biker1Text:
	text_asm
	ld hl, Route17_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker1BattleText:
	text "FIGHTING KIDS"
	line "WONT RACK UP"
	cont "PRIZE MONEY!"
	done

Route17Biker1EndBattleText:
	text "BURNT OUT!"
	prompt

Route17Biker1AfterBattleText:
	text "CYCLING ROAD HAS"
	line "MANY LOST ITEMS!"
	cont "PICK AND SELL FOR"
	cont "BIG PROFIT!"
	done

Route17Biker2Text:
	text_asm
	ld hl, Route17_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker2BattleText:
	text "I HAVE CONFIDENCE"
	line "IN STAMINA<⋯>COME!"
	done

Route17Biker2EndBattleText:
	text "BOYOYO-N!"
	prompt

Route17Biker2AfterBattleText:
	text "WANT TO TOUCH MY"
	line "BELLY WHILE AT"
	cont "IT?"
	done

Route17Biker3Text:
	text_asm
	ld hl, Route17_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker3BattleText:
	text "HEADING FOR"
	line "FUCHSIA CITY?"
	done

Route17Biker3EndBattleText:
	text "AHYOO-T!"
	prompt

Route17Biker3AfterBattleText:
	text "DOWNHILL SLOPE"
	line "AT FULL SPEED IS"
	cont "SO KIMOCHI II!"
	done

Route17Biker4Text:
	text_asm
	ld hl, Route17_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker4BattleText:
	text "WE ARE THE BIKER"
	line "GANG! WE SILENCE"
	cont "CRYING BABIES!"
	done

Route17Biker4EndBattleText:
	text "CANT BEAR THIS!"
	prompt

Route17Biker4AfterBattleText:
	text "YOU GOT SOME"
	line "GUTS<⋯>NOT BAD!"
	done

Route17Biker5Text:
	text_asm
	ld hl, Route17_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker5BattleText:
	text "URYAA! GET NUMB"
	line "BY VOLTORB ZAP!"
	done

Route17Biker5EndBattleText:
	text "GUOO<⋯>!"
	prompt

Route17Biker5AfterBattleText:
	text "CAUGHT VOLTORB"
	line "AT ABANDONED"
	cont "POWER PLANT!"
	done

Route17Biker6Text:
	text_asm
	ld hl, Route17_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker6BattleText:
	text "MY # LEVELED"
	line "UP BUT DOES NOT"
	cont "EVOLVE AT ALL!"
	done

Route17Biker6EndBattleText:
	text "KONO YARO!"
	prompt

Route17Biker6AfterBattleText:
	text "COME TO THINK·"
	line "SOME # EVOLVE"
	cont "WITH A STONE!"
	done

Route17Biker7Text:
	text_asm
	ld hl, Route17_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker7BattleText:
	text "SWEAT A BIT AND"
	line "LOSE SOME WEIGHT!"
	done

Route17Biker7EndBattleText:
	text "DAA! THAT WAS A"
	line "HOT BATTLE!"
	prompt

Route17Biker7AfterBattleText:
	text "SWEATING HARD·"
	line "I FEEL A BIT"
	cont "LIGHTER NOW!"
	done

Route17Biker8Text:
	text_asm
	ld hl, Route17_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker8BattleText:
	text "REBEL SPIRIT IS"
	line "A REAL MANS"
	cont "BADGE OF HONOR!"
	done

Route17Biker8EndBattleText:
	text "GAAA-T!"
	prompt

Route17Biker8AfterBattleText:
	text "IF YOU BE A MAN"
	line "FOLLOW THE PATH"
	cont "YOU BELIEVE IN!"
	done

Route17Biker9Text:
	text_asm
	ld hl, Route17_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker9BattleText:
	text "STYLISH BIKE!"
	line "HOW DOES IT RIDE?"
	done

Route17Biker9EndBattleText:
	text "KUSOU! DANG IT!"
	prompt

Route17Biker9AfterBattleText:
	text "STEERING ON A"
	line "SLOPE IS HARD"
	cont "ISNT IT?!"
	done

Route17Biker10Text:
	text_asm
	ld hl, Route17_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route17Biker10BattleText:
	text "<⋯>TIRED<⋯>SLEEPY"
	line "SUCH A BOTHER<⋯>!"
	done

Route17Biker10EndBattleText:
	text "ALL OVER YET?"
	prompt

Route17Biker10AfterBattleText:
	text "WANT TO DITCH OUT"
	line "AND SLEEP NOW!"
	done

Route17NoticeSign1Text:
	text "A NOTICE POSTED!"

	para "<⋯>DONT THROW"
	line "AWAY ITEMS HERE!"
	done

Route17TrainerTips1Text:
	text "TRAINER TIPS!"

	para "SAME # AND SAME"
	line "LEVEL DIFFER IN"
	cont "STATS<⋯>GROWTH"
	cont "MAKES IT WIDER!"
	done

Route17TrainerTips2Text:
	text "TRAINER TIPS!"

	para "HOLD A BUTTON TO"
	line "BRAKE TIRES ON"
	cont "SLOPE FROM"
	cont "SLIDING DOWN!"
	done

Route17SignText:
	text "ROUTE 17"
	line "CELADON<⋯>FUCHSIA"
	done

Route17NoticeSign2Text:
	text "A NOTICE POSTED!"

	para "DONT THROW THE"
	line "GAME! THROW"
	cont "# BALLS!"
	done

Route17CyclingRoadEndsSignText:
	text "CYCLING ROAD"
	line "SLOPE ENDS HERE!"
	done
