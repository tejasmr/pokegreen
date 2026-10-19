Route3_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route3_TrainerHeaders
	ld de, Route3_ScriptPointers
	ld a, [wRoute3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute3CurScript], a
	ret

Route3_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE3_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE3_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE3_END_BATTLE

Route3_TextPointers:
	def_text_pointers
	dw_const Route3SuperNerdText,     TEXT_ROUTE3_SUPER_NERD
	dw_const Route3Youngster1Text,    TEXT_ROUTE3_YOUNGSTER1
	dw_const Route3Youngster2Text,    TEXT_ROUTE3_YOUNGSTER2
	dw_const Route3CooltrainerF1Text, TEXT_ROUTE3_COOLTRAINER_F1
	dw_const Route3Youngster3Text,    TEXT_ROUTE3_YOUNGSTER3
	dw_const Route3CooltrainerF2Text, TEXT_ROUTE3_COOLTRAINER_F2
	dw_const Route3Youngster4Text,    TEXT_ROUTE3_YOUNGSTER4
	dw_const Route3Youngster5Text,    TEXT_ROUTE3_YOUNGSTER5
	dw_const Route3CooltrainerF3Text, TEXT_ROUTE3_COOLTRAINER_F3
	dw_const Route3SignText,          TEXT_ROUTE3_SIGN

	def_trainers Route3, 2
	trainer EVENT_BEAT_ROUTE_3_TRAINER_0, 2, Youngster1
	trainer EVENT_BEAT_ROUTE_3_TRAINER_1, 3, Youngster2
	trainer EVENT_BEAT_ROUTE_3_TRAINER_2, 2, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_3_TRAINER_3, 1, Youngster3
	trainer EVENT_BEAT_ROUTE_3_TRAINER_4, 4, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_3_TRAINER_5, 3, Youngster4
	trainer EVENT_BEAT_ROUTE_3_TRAINER_6, 3, Youngster5
	trainer EVENT_BEAT_ROUTE_3_TRAINER_7, 2, CooltrainerF3
	db -1 ; end

Route3SuperNerdText:
	text "WHEW<⋯> TAKE"
	line "『HITOYASUMI』!"
	cont "TAKE A REST!"

	para "FROM HANADA CITY"
	line "THROUGH CAVE<⋯>"
	cont "SO 『TSUKARETA』!"
	cont "I AM TIRED OUT!"
	done

Route3Youngster1Text:
	text_asm
	ld hl, Route3_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster1BattleText:
	text "YOU! WE MET IN"
	line "TOKIWA FOREST!"
	done

Route3Youngster1EndBattleText:
	text "『KUYASHII』!"
	line "SO FRUSTRATING!"
	cont "I LOST!"
	prompt

Route3Youngster1AfterBattleText:
	text "ROUND HERE CAUGHT"
	line "MONS DIFFERENT"
	cont "FROM THE FOREST!"
	done

Route3Youngster2Text:
	text_asm
	ld hl, Route3_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster2BattleText:
	text "『TANPAN』 SHORTS!"
	line "EASY TO MOVE IN!"
	cont "WHY DONT YOU"
	cont "WEAR THEM TOO?"
	done

Route3Youngster2EndBattleText:
	text "THOUGHT I COULD"
	line "WIN WITH SHORTS!"
	prompt

Route3Youngster2AfterBattleText:
	text "DO YOU USE <PC>?"
	line "ONE BOX HOLDS"
	cont "UP TO 30 MONS!"
	done

Route3CooltrainerF1Text:
	text_asm
	ld hl, Route3_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF1BattleText:
	text "HEY YOU! YOU WERE"
	line "LOOKING AT ME"
	cont "JUST NOW RIGHT?"
	done

Route3CooltrainerF1EndBattleText:
	text "SO 『IYA』!"
	line "NO WAY·NO MORE!"
	prompt

Route3CooltrainerF1AfterBattleText:
	text "LOOKING AT ME"
	line "『JIRO-JIRO』!"
	cont "THAT STARING"
	cont "STARTS BATTLES!"
	done

Route3Youngster3Text:
	text_asm
	ld hl, Route3_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster3BattleText:
	text "YOU # <TRAINER>?"
	line "THEN RIGHT AWAY"
	cont "LETS BATTLE!"
	done

Route3Youngster3EndBattleText:
	text "IF I BROUGHT"
	line "NEW # I WOULD"
	cont "HAVE WON!"
	prompt

Route3Youngster3AfterBattleText:
	text "IF <PC> BOX GETS"
	line "FULL JUST SWITCH"
	cont "TO ANOTHER BOX!"
	done

Route3CooltrainerF2Text:
	text_asm
	ld hl, Route3_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF2BattleText:
	text "YOUR 『SHISEN』!"
	line "THAT GAZE<⋯> IT"
	cont "BOTHERS ME!"
	done

Route3CooltrainerF2EndBattleText:
	text "CANT YOU BE NICE"
	line "TO A GIRL?"
	prompt

Route3CooltrainerF2AfterBattleText:
	text "IF YOU DONT WANT"
	line "FIGHTS DONT MAKE"
	cont "EYE CONTACT!"
	done

Route3Youngster4Text:
	text_asm
	ld hl, Route3_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster4BattleText:
	text "WHAT! YOU ARE NOT"
	line "WEARING 『TANPAN』"
	cont "SHORTS AT ALL!"
	done

Route3Youngster4EndBattleText:
	text "LOST LOST!"
	line "I GOT BEATEN!"
	prompt

Route3Youngster4AfterBattleText:
	text "SUMMER OR WINTER"
	line "I ONLY WEAR"
	cont "『TANPAN』 SHORTS!"
	cont "MY SOLE POLICY!"
	done

Route3Youngster5Text:
	text_asm
	ld hl, Route3_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route3Youngster5BattleText:
	text "JUST CAUGHT A"
	line "FRESH # MON!"
	cont "LETS TEST HIM!"
	done

Route3Youngster5EndBattleText:
	text "TOTALLY CRUSHED!"
	prompt

Route3Youngster5AfterBattleText:
	text "TRAINED # ARE"
	line "MUCH STRONGER"
	cont "AFTER ALL<⋯>"
	done

Route3CooltrainerF3Text:
	text_asm
	ld hl, Route3_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route3CooltrainerF3BattleText:
	text "KYA!<⋯> DID YOU"
	line "JUST TOUCH ME?"
	done

Route3CooltrainerF3EndBattleText:
	text "IS IT OVER"
	line "ALREADY?"
	prompt

Route3CooltrainerF3AfterBattleText:
	text "AT FOOT OF"
	line "MT·MOON LIES"
	cont "ROUTE 4 AHEAD!"
	done

Route3SignText:
	text "ROUTE 3"
	line "AHEAD: MT·MOON"
	done
