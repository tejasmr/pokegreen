Route14_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route14_TrainerHeaders
	ld de, Route14_ScriptPointers
	ld a, [wRoute14CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute14CurScript], a
	ret

Route14_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE14_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE14_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE14_END_BATTLE

Route14_TextPointers:
	def_text_pointers
	dw_const Route14CooltrainerM1Text, TEXT_ROUTE14_COOLTRAINER_M1
	dw_const Route14CooltrainerM2Text, TEXT_ROUTE14_COOLTRAINER_M2
	dw_const Route14CooltrainerM3Text, TEXT_ROUTE14_COOLTRAINER_M3
	dw_const Route14CooltrainerM4Text, TEXT_ROUTE14_COOLTRAINER_M4
	dw_const Route14CooltrainerM5Text, TEXT_ROUTE14_COOLTRAINER_M5
	dw_const Route14CooltrainerM6Text, TEXT_ROUTE14_COOLTRAINER_M6
	dw_const Route14Biker1Text,        TEXT_ROUTE14_BIKER1
	dw_const Route14Biker2Text,        TEXT_ROUTE14_BIKER2
	dw_const Route14Biker3Text,        TEXT_ROUTE14_BIKER3
	dw_const Route14Biker4Text,        TEXT_ROUTE14_BIKER4
	dw_const Route14SignText,          TEXT_ROUTE14_SIGN

	def_trainers Route14
	trainer EVENT_BEAT_ROUTE_14_TRAINER_0, 2, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_14_TRAINER_1, 2, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_14_TRAINER_2, 4, CooltrainerM3
	trainer EVENT_BEAT_ROUTE_14_TRAINER_3, 3, CooltrainerM4
	trainer EVENT_BEAT_ROUTE_14_TRAINER_4, 3, CooltrainerM5
	trainer EVENT_BEAT_ROUTE_14_TRAINER_5, 4, CooltrainerM6
	trainer EVENT_BEAT_ROUTE_14_TRAINER_6, 4, Biker1
	trainer EVENT_BEAT_ROUTE_14_TRAINER_7, 4, Biker2
	trainer EVENT_BEAT_ROUTE_14_TRAINER_8, 3, Biker3
	trainer EVENT_BEAT_ROUTE_14_TRAINER_9, 4, Biker4
	db -1 ; end

Route14CooltrainerM1Text:
	text_asm
	ld hl, Route14_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM1BattleText:
	text "TO MAKE STRONG #"
	line "MUST TEACH NICE"
	cont "MOVES WITH <TM>!"
	done

Route14CooltrainerM1EndBattleText:
	text "STILL NOT ENOUGH!"
	prompt

Route14CooltrainerM1AfterBattleText:
	text "YOU HAVE HM TOO!"
	line "A # NEVER"
	cont "FORGETS HM MOVES!"
	done

Route14CooltrainerM2Text:
	text_asm
	ld hl, Route14_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM2BattleText:
	text "MY BIRD #·"
	line "ABOUT TIME<⋯>"
	cont "LET US BATTLE!"
	done

Route14CooltrainerM2EndBattleText:
	text "STILL TOO EARLY!"
	prompt

Route14CooltrainerM2AfterBattleText:
	text "TEACH STRONGER"
	line "MOVES FIRST·THEN"
	cont "BATTLE AGAIN!"
	done

Route14CooltrainerM3Text:
	text_asm
	ld hl, Route14_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM3BattleText:
	text "<TM> CAN BE BOUGHT"
	line "AT CELADON DEPT!"
	cont "FEW PEOPLE CARRY"
	cont "HM MACHINES!"
	done

Route14CooltrainerM3EndBattleText:
	text "SO TOTALLY UNCOOL"
	prompt

Route14CooltrainerM3AfterBattleText:
	text "TEACH SAME TYPE"
	line "MOVE AS #·"
	cont "MOVE POWER GROWS"
	cont "BIGGER SO I HEAR!"
	done

Route14CooltrainerM4Text:
	text_asm
	ld hl, Route14_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM4BattleText:
	text "DID YOUR BIRD #"
	line "LEARN TO CARRY"
	cont "YOU FLYING HIGH?"
	done

Route14CooltrainerM4EndBattleText:
	text "BOROMAKE! LOSS!"
	prompt

Route14CooltrainerM4AfterBattleText:
	text "WE LOVE BIRD #S"
	line "SO MUCH<⋯>DONT"
	cont "CARE TO RAISE"
	cont "ANYTHING ELSE!"
	done

Route14CooltrainerM5Text:
	text_asm
	ld hl, Route14_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM5BattleText:
	text "DID YOU EVER HEAR"
	line "TALES OF LEGEND"
	cont "#?"
	done

Route14CooltrainerM5EndBattleText:
	text "WHY DID I LOSE?"
	prompt

Route14CooltrainerM5AfterBattleText:
	text "LEGENDARY # ARE"
	line "THREE SORTS·AND"
	cont "ALL ARE BIRD #!"
	done

Route14CooltrainerM6Text:
	text_asm
	ld hl, Route14_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route14CooltrainerM6BattleText:
	text "NOT IN MOOD<⋯>BUT"
	line "SHOU GA NAI!"
	cont "LETS DO THIS!"
	done

Route14CooltrainerM6EndBattleText:
	text "AH<⋯>AS EXPECTED!"
	prompt

Route14CooltrainerM6AfterBattleText:
	text "COMPARED TO WIDE"
	line "SKY·WIN OR LOSE"
	cont "MATTERS LITTLE!"
	done

Route14Biker1Text:
	text_asm
	ld hl, Route14_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker1BattleText:
	text "I AM IMPATIENT!"
	line "FASTER FASTER"
	cont "HURRY UP!"
	done

Route14Biker1EndBattleText:
	text "LOST LOST! OVER!"
	line "JAA NA! BYE!"
	prompt

Route14Biker1AfterBattleText:
	text "WHAT WHAT WHAT?!"
	line "YOU STILL HAVE"
	cont "BUSINESS HERE?!"
	done

Route14Biker2Text:
	text_asm
	ld hl, Route14_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker2BattleText:
	text "JUST RIGHT! STOP"
	line "CHABBING AND BE"
	cont "MY OPPONENT!"
	done

Route14Biker2EndBattleText:
	text "NANDA KORAA!"
	prompt

Route14Biker2AfterBattleText:
	text "I AM NOT GOOD AT"
	line "TEDIOUS RAISING!"
	done

Route14Biker3Text:
	text_asm
	ld hl, Route14_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker3BattleText:
	text "FEW BUILDINGS"
	line "AROUND HERE·SO I"
	cont "COME RIDE OFTEN!"
	done

Route14Biker3EndBattleText:
	text "WHOOPS CRASHED!"
	prompt

Route14Biker3AfterBattleText:
	text "RAISED THEM SO"
	line "FAR! ANYWAY<⋯>"

	para "BEING STRONG IS"
	line "REALLY SOMETHING!"
	done

Route14Biker4Text:
	text_asm
	ld hl, Route14_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route14Biker4BattleText:
	text "# SHOWDOWN?!"
	line "FUN! I WILL PLAY"
	cont "ALONG WITH YOU!"
	done

Route14Biker4EndBattleText:
	text "CANT ACCEPT THIS!"
	prompt

Route14Biker4AfterBattleText:
	text "IF IT WERE DIRECT"
	line "FIST SHOWDOWN·"
	cont "I WOULD WIN!"
	done

Route14SignText:
	text "ROUTE 14"
	line "WEST: FUCHSIA"
	cont "CITY"
	done
