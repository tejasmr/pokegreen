Route19_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route19_TrainerHeaders
	ld de, Route19_ScriptPointers
	ld a, [wRoute19CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute19CurScript], a
	ret

Route19_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE19_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE19_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE19_END_BATTLE

Route19_TextPointers:
	def_text_pointers
	dw_const Route19CooltrainerM1Text, TEXT_ROUTE19_COOLTRAINER_M1
	dw_const Route19CooltrainerM2Text, TEXT_ROUTE19_COOLTRAINER_M2
	dw_const Route19Swimmer1Text,      TEXT_ROUTE19_SWIMMER1
	dw_const Route19Swimmer2Text,      TEXT_ROUTE19_SWIMMER2
	dw_const Route19Swimmer3Text,      TEXT_ROUTE19_SWIMMER3
	dw_const Route19Swimmer4Text,      TEXT_ROUTE19_SWIMMER4
	dw_const Route19Swimmer5Text,      TEXT_ROUTE19_SWIMMER5
	dw_const Route19Swimmer6Text,      TEXT_ROUTE19_SWIMMER6
	dw_const Route19Swimmer7Text,      TEXT_ROUTE19_SWIMMER7
	dw_const Route19Swimmer8Text,      TEXT_ROUTE19_SWIMMER8
	dw_const Route19SignText,          TEXT_ROUTE19_SIGN

	def_trainers Route19
	trainer EVENT_BEAT_ROUTE_19_TRAINER_0, 4, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_19_TRAINER_1, 3, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_19_TRAINER_2, 3, Swimmer1
	trainer EVENT_BEAT_ROUTE_19_TRAINER_3, 4, Swimmer2
	trainer EVENT_BEAT_ROUTE_19_TRAINER_4, 4, Swimmer3
	trainer EVENT_BEAT_ROUTE_19_TRAINER_5, 4, Swimmer4
	trainer EVENT_BEAT_ROUTE_19_TRAINER_6, 3, Swimmer5
	trainer EVENT_BEAT_ROUTE_19_TRAINER_7, 4, Swimmer6
	trainer EVENT_BEAT_ROUTE_19_TRAINER_8, 4, Swimmer7
	trainer EVENT_BEAT_ROUTE_19_TRAINER_9, 4, Swimmer8
	db -1 ; end

Route19CooltrainerM1Text:
	text_asm
	ld hl, Route19_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route19CooltrainerM1BattleText:
	text "BEFORE WATER DIVE"
	line "MUST WARM UP"
	cont "CALISTHENICS!"
	done

Route19CooltrainerM1EndBattleText:
	text "WARM UP OVER!"
	prompt

Route19CooltrainerM1AfterBattleText:
	text "ALRIGHT! THANKS"
	line "TO THAT·GREAT"
	cont "EXERCISE DONE!"
	done

Route19CooltrainerM2Text:
	text_asm
	ld hl, Route19_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route19CooltrainerM2BattleText:
	text "WAIT! DONT RUSH!"
	line "WHAT IF HEART"
	cont "PARALYSIS STRIKES"
	done

Route19CooltrainerM2EndBattleText:
	text "OOH COLD COLD!"
	prompt

Route19CooltrainerM2AfterBattleText:
	text "DONT GET STUNG"
	line "BY TENTACOOL·"
	cont "SWIM CAREFULLY!"
	done

Route19Swimmer1Text:
	text_asm
	ld hl, Route19_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer1BattleText:
	text "I LOVE SWIMMING!"
	line "<⋯>HOW ABOUT YOU?"
	done

Route19Swimmer1EndBattleText:
	text "SPLASH! DOPPO-N!"
	prompt

Route19Swimmer1AfterBattleText:
	text "IN SWIMMING I"
	line "WONT LOSE TO SEA"
	cont "# PETS!"
	done

Route19Swimmer2Text:
	text_asm
	ld hl, Route19_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer2BattleText:
	text "BEYOND HORIZON<⋯>"
	line "WHAT IS OUT THERE"
	done

Route19Swimmer2EndBattleText:
	text "ARYARYA<⋯>!"
	prompt

Route19Swimmer2AfterBattleText:
	text "<⋯>OVER THERE"
	line "SEVERAL ISLANDS"
	cont "CAN BE SEEN!"
	done

Route19Swimmer3Text:
	text_asm
	ld hl, Route19_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer3BattleText:
	text "DIVING DOWN<⋯>TO"
	line "CATCH SEA #·"
	cont "NO GOOD AT ALL!"
	done

Route19Swimmer3EndBattleText:
	text "GLUB GLUB-T!"
	prompt

Route19Swimmer3AfterBattleText:
	text "FOR SEA #·MUST"
	line "CATCH THEM WITH"
	cont "A FISHING ROD!"
	done

Route19Swimmer4Text:
	text_asm
	ld hl, Route19_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer4BattleText:
	text "GAZING AT BLUE"
	line "SEA MAKES YOU"
	cont "FORGET BAD THING!"
	done

Route19Swimmer4EndBattleText:
	text "UNPLEASANT LOSS!"
	prompt

Route19Swimmer4AfterBattleText:
	text "GAZING AT BLUE"
	line "SEA<⋯>I SHALL"
	cont "FORGET THIS LOSS!"
	done

Route19Swimmer5Text:
	text_asm
	ld hl, Route19_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer5BattleText:
	text "MY! RIDING A NICE"
	line "RIDE! IF I WIN"
	cont "GIVE IT TO ME!"
	done

Route19Swimmer5EndBattleText:
	text "MY LOSS EH?"
	prompt

Route19Swimmer5AfterBattleText:
	text "TWIN ISLANDS ARE"
	line "STILL FAR AWAY<⋯>"
	cont "I WANT TO GO BACK"
	cont "TO FUCHSIA NOW!"
	done

Route19Swimmer6Text:
	text_asm
	ld hl, Route19_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer6BattleText:
	text "I LOVE SWIMMING"
	line "BUT HATE GETTING"
	cont "SUNBURNED!"
	done

Route19Swimmer6EndBattleText:
	text "KURAKURA<⋯>DIZZY!"
	prompt

Route19Swimmer6AfterBattleText:
	text "MY BOYFRIEND SAID"
	line "LETS SWIM TO"
	cont "TWIN ISLANDS!"
	done

Route19Swimmer7Text:
	text_asm
	ld hl, Route19_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer7BattleText:
	text "HEY THERE LAD!"
	line "THIS SEA IS"
	cont "KIKEN! DANGER!"
	done

Route19Swimmer7EndBattleText:
	text "MET DANGER INDEED"
	prompt

Route19Swimmer7AfterBattleText:
	text "MY LEG CRAMPED!"
	line "BUKU<⋯>BUKUBUKU<⋯>"
	done

Route19Swimmer8Text:
	text_asm
	ld hl, Route19_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route19Swimmer8BattleText:
	text "SWAM TOGETHER SO"
	line "FAR BUT<⋯>TIRED!"
	done

Route19Swimmer8EndBattleText:
	text "EXHAUSTED<⋯>"
	prompt

Route19Swimmer8AfterBattleText:
	text "TO RIDE A # IN"
	line "SEA·LAPRAS BEST!"
	cont "HUGE SO WONT GET"
	cont "WET AT ALL!"
	done

Route19SignText:
	text "SEA ROUTE 19"
	line "FUCHSIA<⋯>TWIN"
	cont "ISLANDS"
	done
