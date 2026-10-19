Route11_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route11_TrainerHeaders
	ld de, Route11_ScriptPointers
	ld a, [wRoute11CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute11CurScript], a
	ret

Route11_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE11_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE11_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE11_END_BATTLE

Route11_TextPointers:
	def_text_pointers
	dw_const Route11Gambler1Text,         TEXT_ROUTE11_GAMBLER1
	dw_const Route11Gambler2Text,         TEXT_ROUTE11_GAMBLER2
	dw_const Route11Youngster1Text,       TEXT_ROUTE11_YOUNGSTER1
	dw_const Route11SuperNerd1Text,       TEXT_ROUTE11_SUPER_NERD1
	dw_const Route11Youngster2Text,       TEXT_ROUTE11_YOUNGSTER2
	dw_const Route11Gambler3Text,         TEXT_ROUTE11_GAMBLER3
	dw_const Route11Gambler4Text,         TEXT_ROUTE11_GAMBLER4
	dw_const Route11Youngster3Text,       TEXT_ROUTE11_YOUNGSTER3
	dw_const Route11SuperNerd2Text,       TEXT_ROUTE11_SUPER_NERD2
	dw_const Route11Youngster4Text,       TEXT_ROUTE11_YOUNGSTER4
	dw_const Route11DiglettsCaveSignText, TEXT_ROUTE11_DIGLETTSCAVE_SIGN

	def_trainers Route11
	trainer EVENT_BEAT_ROUTE_11_TRAINER_0, 3, Gambler1
	trainer EVENT_BEAT_ROUTE_11_TRAINER_1, 2, Gambler2
	trainer EVENT_BEAT_ROUTE_11_TRAINER_2, 3, Youngster1
	trainer EVENT_BEAT_ROUTE_11_TRAINER_3, 3, SuperNerd1
	trainer EVENT_BEAT_ROUTE_11_TRAINER_4, 4, Youngster2
	trainer EVENT_BEAT_ROUTE_11_TRAINER_5, 3, Gambler3
	trainer EVENT_BEAT_ROUTE_11_TRAINER_6, 3, Gambler4
	trainer EVENT_BEAT_ROUTE_11_TRAINER_7, 4, Youngster3
	trainer EVENT_BEAT_ROUTE_11_TRAINER_8, 3, SuperNerd2
	trainer EVENT_BEAT_ROUTE_11_TRAINER_9, 4, Youngster4
	db -1 ; end

Route11Gambler1Text:
	text_asm
	ld hl, Route11_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler1BattleText:
	text "WIN OR LOSE·"
	line "LET US GAMBLE!"
	done

Route11Gambler1EndBattleText:
	text "TCH! NOT LUCKY"
	line "TODAY AT ALL!"
	prompt

Route11Gambler1AfterBattleText:
	text "# IS LIFE!"
	line "AND LIFE IS"
	cont "A GAMBLE!"
	done

Route11Gambler2Text:
	text_asm
	ld hl, Route11_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler2BattleText:
	text "I LOVE BETTING!"
	line "I DONT PICK MY"
	cont "OPPONENTS!"
	done

Route11Gambler2EndBattleText:
	text "DAMN! I THOUGHT"
	line "I COULD WIN!"
	prompt

Route11Gambler2AfterBattleText:
	text "IF AFRAID OF"
	line "LOSING· YOU CANT"
	cont "PLAY #!"
	done

Route11Youngster1Text:
	text_asm
	ld hl, Route11_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster1BattleText:
	text "NO CHEATING IN"
	line "# BATTLES!"
	cont "FIGHT FAIR AND"
	cont "SQUARE! 『SEISEI"
	cont "DOUDOU』!"
	done

Route11Youngster1EndBattleText:
	text "HUH? SHOULD NOT"
	line "BE LIKE THIS<⋯>"
	prompt

Route11Youngster1AfterBattleText:
	text "I FOUGHT FAIR"
	line "AND SQUARE! NO"
	cont "REGRETS FOR ME!"
	done

Route11SuperNerd1Text:
	text_asm
	ld hl, Route11_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route11SuperNerd1BattleText:
	text "HELLO! IS YOUR"
	line "ELECTRICITY"
	cont "SAFE AT HOME?"
	done

Route11SuperNerd1EndBattleText:
	text "BEATING AN OLD"
	line "MAN· AMAZING!"
	prompt

Route11SuperNerd1AfterBattleText:
	text "I FORGOT TO SAY:"
	line "USE ELECTRICITY"
	cont "CAREFULLY!"
	done

Route11Youngster2Text:
	text_asm
	ld hl, Route11_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster2BattleText:
	text "I JUST BECAME"
	line "A # <TRAINER>!"
	cont "HAVE CONFIDENCE"
	cont "TO WIN!"
	done

Route11Youngster2EndBattleText:
	text "TO LOSE<⋯> ARE MY"
	line "# NOT RAISED"
	cont "ENOUGH YET?"
	prompt

Route11Youngster2AfterBattleText:
	text "WHAT THE HECK!"
	line "GO AWAY FROM ME!"
	done

Route11Gambler3Text:
	text_asm
	ld hl, Route11_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler3BattleText:
	text "HAHAHA! I HAVE"
	line "NEVER LOST A"
	cont "MATCH UNTIL NOW!"
	done

Route11Gambler3EndBattleText:
	text "HAH! MY FIRST"
	line "LOSS EVER!"
	prompt

Route11Gambler3AfterBattleText:
	text "LUCK OF DRAW IN"
	line "BATTLE! MUST"
	cont "THINK SO OR GET"
	cont "DEPRESSED!"
	done

Route11Gambler4Text:
	text_asm
	ld hl, Route11_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route11Gambler4BattleText:
	text "I HAVE NEVER"
	line "WON A MATCH IN"
	cont "MY LIFE<⋯>"
	done

Route11Gambler4EndBattleText:
	text "<⋯>GACK! AS I"
	line "EXPECTED· LOST!"
	prompt

Route11Gambler4AfterBattleText:
	text "LUCK OF DRAW IN"
	line "BATTLE<⋯> MUST"
	cont "THINK SO OR GET"
	cont "DEPRESSED!"
	done

Route11Youngster3Text:
	text_asm
	ld hl, Route11_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster3BattleText:
	text "I AM STRONGEST"
	line "IN MY CLASS!"
	cont "TRAIN EVERY MORN!"
	done

Route11Youngster3EndBattleText:
	text "ACHA<⋯>! NEED A"
	line "STRONGER #!"
	prompt

Route11Youngster3AfterBattleText:
	text "THAT FAT # COMING"
	line "DOWN FROM THE"
	cont "MOUNTAIN<⋯>"

	para "IF I CAUGHT IT·"
	line "WOULD IT BE VERY"
	cont "STRONG?"
	done

Route11SuperNerd2Text:
	text_asm
	ld hl, Route11_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route11SuperNerd2BattleText:
	text "YO! DID YOU"
	line "FORGET TO TURN"
	cont "OFF THE LIGHTS?"
	done

Route11SuperNerd2EndBattleText:
	text "I GIVE UP! KIDS"
	line "TODAY ARE TOUGH!"
	prompt

Route11SuperNerd2AfterBattleText:
	text "WELL THEN<⋯> OFF"
	line "TO DO ELECTRIC"
	cont "REPAIR WORK!"
	done

Route11Youngster4Text:
	text_asm
	ld hl, Route11_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route11Youngster4BattleText:
	text "# RAISED WITH"
	line "CARE! TIME TO"
	cont "TEST IN BATTLE!"
	done

Route11Youngster4EndBattleText:
	text "BYE BYE<⋯>! THANK"
	line "YOU AND GOODBYE!"
	prompt

Route11Youngster4AfterBattleText:
	text "TCH<⋯>! I WILL GO"
	line "FIND A STRONGER"
	cont "ONE TO RAISE!"
	done

Route11DiglettsCaveSignText:
	text "DIGDA CAVE"
	line "『DIGDA NO ANA』"
	done
