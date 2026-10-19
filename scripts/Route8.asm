Route8_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route8_TrainerHeaders
	ld de, Route8_ScriptPointers
	ld a, [wRoute8CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute8CurScript], a
	ret

Route8_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE8_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE8_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE8_END_BATTLE

Route8_TextPointers:
	def_text_pointers
	dw_const Route8SuperNerd1Text,      TEXT_ROUTE8_SUPER_NERD1
	dw_const Route8Gambler1Text,        TEXT_ROUTE8_GAMBLER1
	dw_const Route8SuperNerd2Text,      TEXT_ROUTE8_SUPER_NERD2
	dw_const Route8CooltrainerF1Text,   TEXT_ROUTE8_COOLTRAINER_F1
	dw_const Route8SuperNerd3Text,      TEXT_ROUTE8_SUPER_NERD3
	dw_const Route8CooltrainerF2Text,   TEXT_ROUTE8_COOLTRAINER_F2
	dw_const Route8CooltrainerF3Text,   TEXT_ROUTE8_COOLTRAINER_F3
	dw_const Route8Gambler2Text,        TEXT_ROUTE8_GAMBLER2
	dw_const Route8CooltrainerF4Text,   TEXT_ROUTE8_COOLTRAINER_F4
	dw_const Route8UndergroundSignText, TEXT_ROUTE8_UNDERGROUND_SIGN

	def_trainers Route8
	trainer EVENT_BEAT_ROUTE_8_TRAINER_0, 4, SuperNerd1
	trainer EVENT_BEAT_ROUTE_8_TRAINER_1, 4, Gambler1
	trainer EVENT_BEAT_ROUTE_8_TRAINER_2, 4, SuperNerd2
	trainer EVENT_BEAT_ROUTE_8_TRAINER_3, 2, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_8_TRAINER_4, 3, SuperNerd3
	trainer EVENT_BEAT_ROUTE_8_TRAINER_5, 3, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_8_TRAINER_6, 2, CooltrainerF3
	trainer EVENT_BEAT_ROUTE_8_TRAINER_7, 2, Gambler2
	trainer EVENT_BEAT_ROUTE_8_TRAINER_8, 4, CooltrainerF4
	db -1 ; end

Route8SuperNerd1Text:
	text_asm
	ld hl, Route8_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd1BattleText:
	text "YOUR # LOOKS"
	line "STRONG·BUT ARE"
	cont "YOU GOOD AT"
	cont "SCIENCE TOO?"
	done

Route8SuperNerd1EndBattleText:
	text "GAAN! COLLAPSED!"
	prompt

Route8SuperNerd1AfterBattleText:
	text "STUDY SUITS ME"
	line "BETTER AFTER ALL!"
	done


Route8Gambler1Text:
	text_asm
	ld hl, Route8_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route8Gambler1BattleText:
	text "YOSSHA! LETS TEST"
	line "LUCK IN BATTLE!"
	done

Route8Gambler1EndBattleText:
	text "<⋯> BAD GAMBLE"
	line "LUCK TODAY!"
	prompt

Route8Gambler1AfterBattleText:
	text "NOT MY DAY TODAY·"
	line "BETTER STAY STILL"
	cont "AND LIE LOW!"
	done


Route8SuperNerd2Text:
	text_asm
	ld hl, Route8_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd2BattleText:
	text "YOU SEE·STRATEGY"
	line "IS ESSENTIAL"
	cont "FOR BATTLE!"
	done

Route8SuperNerd2EndBattleText:
	text "I DONT"
	line "UNDERSTAND IT!"
	prompt

Route8SuperNerd2AfterBattleText:
	text "SEND BETBETER<⋯>"
	line "NO·USE OTHERS<⋯>"
	cont "<⋯>HMM·MUTTER<⋯>"
	done

Route8CooltrainerF1Text:
	text_asm
	ld hl, Route8_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF1BattleText:
	text "I LOVE NIDORAN·"
	line "SO I COLLECT"
	cont "MANY OF THEM!"
	done

Route8CooltrainerF1EndBattleText:
	text "WHY! WHY OH WHY!"
	prompt

Route8CooltrainerF1AfterBattleText:
	text "WHEN # GROW UP"
	line "THEY LOSE CUTE!"
	cont "NO EVOLUTION IS"
	cont "MUCH CUTER!"
	done


Route8SuperNerd3Text:
	text_asm
	ld hl, Route8_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route8SuperNerd3BattleText:
	text "STUDY IS NICE<⋯>"
	line "BUT # ARE ALSO"
	cont "VERY GOOD!"
	done

Route8SuperNerd3EndBattleText:
	text "<⋯>I SEE·I ONLY"
	line "HAVE STUDY LEFT!"
	prompt

Route8SuperNerd3AfterBattleText:
	text "I WANTED FRESH"
	line "AIR OUTSIDE·"

	para "BUT YAMABUKI GATE"
	line "STRANDED US ALL!"
	done

Route8CooltrainerF2Text:
	text_asm
	ld hl, Route8_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF2BattleText:
	text "NYARTH IS SUPER"
	line "CUTE! CHOU KAWAII"
	cont "NYA·NYA·NYA!"
	done

Route8CooltrainerF2EndBattleText:
	text "SONNYA-!"
	prompt

Route8CooltrainerF2AfterBattleText:
	text "YAAN! POPPO AND"
	line "KORATTA ARE CUTE"
	cont "TOO! CANT DECIDE!"
	done

Route8CooltrainerF3Text:
	text_asm
	ld hl, Route8_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF3BattleText:
	text "LINED UP LIKE"
	line "THIS·FEELS LIKE"
	cont "HANA-ICHI-MONME!"
	done

Route8CooltrainerF3EndBattleText:
	text "SO MEAN! THEY ARE"
	line "ALL CUTE #!"
	prompt

Route8CooltrainerF3AfterBattleText:
	text "YAMABUKI GUARD"
	line "WONT LET US PASS"
	cont "THE GATE!"

	para "SERIOUS·BUT"
	line "MEAN TO US<⋯>"
	done


Route8Gambler2Text:
	text_asm
	ld hl, Route8_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route8Gambler2BattleText:
	text "I AM A MODERN"
	line "WANDERING"
	cont "GAMBLER! SASURAI!"
	done

Route8Gambler2EndBattleText:
	text "<⋯>! MISSED THE"
	line "BIG MOMENT!"
	prompt

Route8Gambler2AfterBattleText:
	text "GAMBLING OR #·"
	line "BOTH ARE MATCHES!"
	cont "CANT QUIT ONCE"
	cont "YOU START!"
	done

Route8CooltrainerF4Text:
	text_asm
	ld hl, Route8_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route8CooltrainerF4BattleText:
	text "ROUND AND FLUFFY·"
	line "LIKE A PLUSH MON!"
	cont "<⋯>WHAT IS IT?"
	done

Route8CooltrainerF4EndBattleText:
	text "STOP IT! DONT BE"
	line "ROUGH WITH MY"
	cont "PIPPI!"
	prompt

Route8CooltrainerF4AfterBattleText:
	text "MOON STONE MAKES"
	line "PIPPI EVOLVE INTO"
	cont "SOMETHING!"

	para "I READ IT IN"
	line "# JOURNAL<⋯>"
	cont "COULD IT BE TRUE?"
	done

Route8UndergroundSignText:
	text "UNDERGROUND PATH"
	line "TAMAMUSHI <⋯>"
	cont "SHION"
	done

