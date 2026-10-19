Route18_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route18_TrainerHeaders
	ld de, Route18_ScriptPointers
	ld a, [wRoute18CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute18CurScript], a
	ret

Route18_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE18_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE18_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE18_END_BATTLE

Route18_TextPointers:
	def_text_pointers
	dw_const Route18CooltrainerM1Text,   TEXT_ROUTE18_COOLTRAINER_M1
	dw_const Route18CooltrainerM2Text,   TEXT_ROUTE18_COOLTRAINER_M2
	dw_const Route18CooltrainerM3Text,   TEXT_ROUTE18_COOLTRAINER_M3
	dw_const Route18SignText,            TEXT_ROUTE18_SIGN
	dw_const Route18CyclingRoadSignText, TEXT_ROUTE18_CYCLING_ROAD_SIGN

	def_trainers Route18
	trainer EVENT_BEAT_ROUTE_18_TRAINER_0, 3, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_18_TRAINER_1, 3, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_18_TRAINER_2, 4, CooltrainerM3
	db -1 ; end

Route18CooltrainerM1Text:
	text_asm
	ld hl, Route18_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM1BattleText:
	text "IN SUCH GRASS"
	line "I SEARCH FOR NEW"
	cont "# PETS!"
	done

Route18CooltrainerM1EndBattleText:
	text "AUU<⋯>!"
	prompt

Route18CooltrainerM1AfterBattleText:
	text "IF I HAD A BIKE"
	line "I WOULD CYCLE TOO"
	done

Route18CooltrainerM2Text:
	text_asm
	ld hl, Route18_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM2BattleText:
	text "KURUKKU<⋯>-T!"
	line "HOW IS MY FINGER"
	cont "WHISTLE TUNE?!"
	done

Route18CooltrainerM2EndBattleText:
	text "THE PHEASANT WHO"
	line "CALLS GETS SHOT·"
	cont "LESSON LEARNED!"
	prompt

Route18CooltrainerM2AfterBattleText:
	text "SEA IS CLOSE·SO"
	line "ON WEEKENDS I GO"
	cont "CATCH SEA BIRD"
	cont "# PETS!"
	done

Route18CooltrainerM3Text:
	text_asm
	ld hl, Route18_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18CooltrainerM3BattleText:
	text "THIS AREA IS OUR"
	line "TERRITORY!"
	cont "STAY AWAY PLEASE!"
	done

Route18CooltrainerM3EndBattleText:
	text "<⋯>PHEW!"
	prompt

Route18CooltrainerM3AfterBattleText:
	text "EVERYONE HAS A"
	line "FAVORITE SPOT TO"
	cont "HUNT THEIR #!"
	done

Route18SignText:
	text "ROUTE 18"
	line "CELADON<⋯>FUCHSIA"
	done

Route18CyclingRoadSignText:
	text "CYCLING ROAD"
	line "NO PEDESTRIANS"
	cont "ALLOWED!"
	done
