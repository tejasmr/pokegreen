Route6_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route6_TrainerHeaders
	ld de, Route6_ScriptPointers
	ld a, [wRoute6CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute6CurScript], a
	ret

Route6_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE6_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE6_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE6_END_BATTLE

Route6_TextPointers:
	def_text_pointers
	dw_const Route6CooltrainerM1Text,       TEXT_ROUTE6_COOLTRAINER_M1
	dw_const Route6CooltrainerF1Text,       TEXT_ROUTE6_COOLTRAINER_F1
	dw_const Route6Youngster1Text,          TEXT_ROUTE6_YOUNGSTER1
	dw_const Route6CooltrainerM2Text,       TEXT_ROUTE6_COOLTRAINER_M2
	dw_const Route6CooltrainerF2Text,       TEXT_ROUTE6_COOLTRAINER_F2
	dw_const Route6Youngster2Text,          TEXT_ROUTE6_YOUNGSTER2
	dw_const Route6UndergroundPathSignText, TEXT_ROUTE6_UNDERGROUND_PATH_SIGN

	def_trainers Route6
	trainer EVENT_BEAT_ROUTE_6_TRAINER_0, 0, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_6_TRAINER_1, 0, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_6_TRAINER_2, 4, Youngster1
	trainer EVENT_BEAT_ROUTE_6_TRAINER_3, 3, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_6_TRAINER_4, 3, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_6_TRAINER_5, 3, Youngster2
	db -1 ; end

Route6CooltrainerM1Text:
	text_asm
	ld hl, Route6_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route6CooltrainerM1BattleText:
	text "WHO IS THAT!"
	line "EAVESDROPPING ON"
	cont "OUR SECRET TALK"
	cont "『HISOHISO』?!"
	done

Route6CooltrainerM1EndBattleText:
	text "FOR SOME REASON"
	line "I CANT WIN!"
	prompt

Route6CooltrainerM1AfterBattleText: ; used by both COOLTRAINER_M1 and COOLTRAINER_F1
Route6CooltrainerF1AfterBattleText:
	text "<⋯> <⋯>WHISPER"
	line "『HISOHISO』<⋯>"
	done

Route6CooltrainerF1Text:
	text_asm
	ld hl, Route6_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route6CooltrainerF1BattleText:
	text "HEY YOU OVER"
	line "THERE! DONT SPY"
	cont "ON PEOPLES TALK!"
	done

Route6CooltrainerF1EndBattleText:
	text "EEK! TO LOSE IS"
	line "SO PATHETIC!"
	prompt

Route6Youngster1Text:
	text_asm
	ld hl, Route6_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route6Youngster1BattleText:
	text "COMING THIS FAR·"
	line "THERE AINT MANY"
	cont "BUGS AROUND!"
	done

Route6Youngster1EndBattleText:
	text "NO WAY! HOW"
	line "RIDICULOUS!"
	prompt

Route6Youngster1AfterBattleText:
	text "I LOVE BUG #·"
	line "MAYBE I RETURN"
	cont "TO TOKIWA FOREST"
	done

Route6CooltrainerM2Text:
	text_asm
	ld hl, Route6_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route6CooltrainerM2BattleText:
	text "WHAT? DO YOU"
	line "HAVE BUSINESS"
	cont "WITH ME?"
	done

Route6CooltrainerM2EndBattleText:
	text "SO SHAMEFUL!"
	line "I LOST A FIGHT"
	cont "I WAS SOLD!"
	prompt

Route6CooltrainerM2AfterBattleText:
	text "WALKING WITH"
	line "MORE # WOULD"
	cont "BE SAFER FOR ME!"
	done

Route6CooltrainerF2Text:
	text_asm
	ld hl, Route6_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route6CooltrainerF2BattleText:
	text "ME? <⋯> <⋯> <⋯>"
	line "WELL· I GUESS"
	cont "I CAN ENTERTAIN"
	cont "A MATCH WITH YOU"
	done

Route6CooltrainerF2EndBattleText:
	text "<⋯>THINGS DONT"
	line "GO WELL FOR ME!"
	prompt

Route6CooltrainerF2AfterBattleText:
	text "I WANT TO GET"
	line "STRONGER TOO!"
	cont "WONT YOU TEACH"
	cont "ME THE SECRET?"
	done

Route6Youngster2Text:
	text_asm
	ld hl, Route6_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route6Youngster2BattleText:
	text "OH? AN UNSEEN"
	line "FACE AROUND!"
	cont "ARE YOU STRONG?"
	done

Route6Youngster2EndBattleText:
	text "COME ON NOW!"
	line "THATS TOO MUCH!"
	prompt

Route6Youngster2AfterBattleText:
	text "IS MY # WEAK·"
	line "OR IS MY SKILL"
	cont "LACKING<⋯>?"
	cont "WHAT DO YOU"
	cont "THINK?"
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"
	line "HANADA CITY <⋯>"
	cont "KUCHIBA CITY"
	done
