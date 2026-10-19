Route13_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route13_TrainerHeaders
	ld de, Route13_ScriptPointers
	ld a, [wRoute13CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute13CurScript], a
	ret

Route13_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE13_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE13_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE13_END_BATTLE

Route13_TextPointers:
	def_text_pointers
	dw_const Route13CooltrainerM1Text, TEXT_ROUTE13_COOLTRAINER_M1
	dw_const Route13CooltrainerF1Text, TEXT_ROUTE13_COOLTRAINER_F1
	dw_const Route13CooltrainerF2Text, TEXT_ROUTE13_COOLTRAINER_F2
	dw_const Route13CooltrainerF3Text, TEXT_ROUTE13_COOLTRAINER_F3
	dw_const Route13CooltrainerF4Text, TEXT_ROUTE13_COOLTRAINER_F4
	dw_const Route13CooltrainerM2Text, TEXT_ROUTE13_COOLTRAINER_M2
	dw_const Route13Beauty1Text,       TEXT_ROUTE13_BEAUTY1
	dw_const Route13Beauty2Text,       TEXT_ROUTE13_BEAUTY2
	dw_const Route13BikerText,         TEXT_ROUTE13_BIKER
	dw_const Route13CooltrainerM3Text, TEXT_ROUTE13_COOLTRAINER_M3
	dw_const Route13TrainerTips1Text,  TEXT_ROUTE13_TRAINER_TIPS1
	dw_const Route13TrainerTips2Text,  TEXT_ROUTE13_TRAINER_TIPS2
	dw_const Route13SignText,          TEXT_ROUTE13_SIGN

	def_trainers Route13
	trainer EVENT_BEAT_ROUTE_13_TRAINER_0, 2, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_13_TRAINER_1, 2, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_13_TRAINER_2, 2, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_13_TRAINER_3, 2, CooltrainerF3
	trainer EVENT_BEAT_ROUTE_13_TRAINER_4, 4, CooltrainerF4
	trainer EVENT_BEAT_ROUTE_13_TRAINER_5, 2, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_13_TRAINER_6, 4, Beauty1
	trainer EVENT_BEAT_ROUTE_13_TRAINER_7, 2, Beauty2
	trainer EVENT_BEAT_ROUTE_13_TRAINER_8, 2, Biker
	trainer EVENT_BEAT_ROUTE_13_TRAINER_9, 4, CooltrainerM3
	db -1 ; end

Route13CooltrainerM1Text:
	text_asm
	ld hl, Route13_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM1BattleText:
	text "MY BIRD # WANTS"
	line "TO FIGHT YOU ALL!"
	done

Route13CooltrainerM1EndBattleText:
	text "PIDGEY·PIDGEOTTO"
	line "COMBO DEFEATED!"
	prompt

Route13CooltrainerM1AfterBattleText:
	text "EVEN IN LOSS MY"
	line "BIRD # SEEMS"
	cont "QUITE CONTENT!"
	done

Route13CooltrainerF1Text:
	text_asm
	ld hl, Route13_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF1BattleText:
	text "I GET PRAISED:"
	line "『GOOD TALENT FOR"
	cont "A GIRL TRAINER!』"
	done

Route13CooltrainerF1EndBattleText:
	text "I LOST IT ALL!"
	prompt

Route13CooltrainerF1AfterBattleText:
	text "SOME DAY A MIGHTY"
	line "<TRAINER> I WILL BE!"
	cont "SPECIAL TRAINING"
	cont "RESUMES TODAY!"
	done

Route13CooltrainerF2Text:
	text_asm
	ld hl, Route13_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF2BattleText:
	text "ARA! YOU CARRY"
	line "COOL-LOOKING"
	cont "GYM BADGES!"
	done

Route13CooltrainerF2EndBattleText:
	text "MADAMADA DAWA!"
	prompt

Route13CooltrainerF2AfterBattleText:
	text "THOSE BADGES<⋯>"
	line "GIVEN BY LEADERS·"
	cont "<⋯>I KNOW THAT!"
	done

Route13CooltrainerF3Text:
	text_asm
	ld hl, Route13_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF3BattleText:
	text "MY CUTE #S"
	line "SHALL GREET YOU!"
	done

Route13CooltrainerF3EndBattleText:
	text "SPLENDID!"
	line "MY TOTAL DEFEAT!"
	prompt

Route13CooltrainerF3AfterBattleText:
	text "LIKE THIS·#"
	line "MUST BATTLE MORE"
	cont "TO GROW STRONG!"
	done

Route13CooltrainerF4Text:
	text_asm
	ld hl, Route13_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerF4BattleText:
	text "IN CAVE EXPLORE"
	line "I PICKED UP"
	cont "INDOMETHACIN!"
	done

Route13CooltrainerF4EndBattleText:
	text "<⋯>ZANNEN!"
	line "NOT IN GOOD FORM!"
	prompt

Route13CooltrainerF4AfterBattleText:
	text "GAVE INDOMETHACIN"
	line "AND MY # SPEED"
	cont "SHOT RIGHT UP!"
	done

Route13CooltrainerM2Text:
	text_asm
	ld hl, Route13_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM2BattleText:
	text "I WONT LOSE!"
	line "THE WIND BLOWS"
	cont "IN MY DIRECTION!"
	done

Route13CooltrainerM2EndBattleText:
	text "<⋯>WIND DIRECTION"
	line "HAS SHIFTED!"
	prompt

Route13CooltrainerM2AfterBattleText:
	text "NO ENERGY LEFT·"
	line "RIDING BIRD GOING"
	cont "BACK HOME NOW!"
	done

Route13Beauty1Text:
	text_asm
	ld hl, Route13_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty1BattleText:
	text "ARA<⋯>LITTLE BOY"
	line "I SHALL BE YOUR"
	cont "OPPONENT!"
	done

Route13Beauty1EndBattleText:
	text "STRONG!"
	line "SO MANLY INDEED!"
	prompt

Route13Beauty1AfterBattleText:
	text "IN # WORLD"
	line "♂ OR ♀·WHO IS"
	cont "STRONGER I WONDER"
	done

Route13Beauty2Text:
	text_asm
	ld hl, Route13_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route13Beauty2BattleText:
	text "DO YOU WANT TO"
	line "PLAY # WITH ME?"
	done

Route13Beauty2EndBattleText:
	text "<⋯>ALREADY OVER?"
	prompt

Route13Beauty2AfterBattleText:
	text "TRUTH IS·I DONT"
	line "KNOW MUCH #!"
	cont "MY # SELECTION"
	cont "IS JUST BY LOOKS!"
	done

Route13BikerText:
	text_asm
	ld hl, Route13_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route13BikerBattleText:
	text "WHAT! SO NOISY!"
	done

Route13BikerEndBattleText:
	text "TCH! DONT MESS"
	line "WITH ME AROUND!"
	prompt

Route13BikerAfterBattleText:
	text "SHUT UP! GO AWAY"
	line "ACROSS THERE!"
	done

Route13CooltrainerM3Text:
	text_asm
	ld hl, Route13_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route13CooltrainerM3BattleText:
	text "I HAVE ALWAYS"
	line "STICKED TO BIRD"
	cont "#S ONLY!"
	done

Route13CooltrainerM3EndBattleText:
	text "POWER DEPLETED<⋯>"
	prompt

Route13CooltrainerM3AfterBattleText:
	text "AH<⋯>I ALSO WISH"
	line "LIKE PIDGEY AND"
	cont "PIDGEOTTO TO FLY"
	cont "INTO THE SKY!"
	done

Route13TrainerTips1Text:
	text "TRAINER TIPS!"

	para "LOOK THERE! LEFT"
	line "SIDE OF THE POST!"
	done

Route13TrainerTips2Text:
	text "TRAINER TIPS!"

	para "IN ITEM WINDOW"
	line "PRESS SELECT"
	cont "BUTTON TO SWAP"
	cont "ITEM POSITIONS!"
	done

Route13SignText:
	text "ROUTE 13"
	line "NORTH: SILENCE"
	cont "BRIDGE"
	done
