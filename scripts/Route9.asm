Route9_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route9_TrainerHeaders
	ld de, Route9_ScriptPointers
	ld a, [wRoute9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute9CurScript], a
	ret

Route9_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE9_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE9_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE9_END_BATTLE

Route9_TextPointers:
	def_text_pointers
	dw_const Route9CooltrainerF1Text, TEXT_ROUTE9_COOLTRAINER_F1
	dw_const Route9CooltrainerM1Text, TEXT_ROUTE9_COOLTRAINER_M1
	dw_const Route9CooltrainerM2Text, TEXT_ROUTE9_COOLTRAINER_M2
	dw_const Route9CooltrainerF2Text, TEXT_ROUTE9_COOLTRAINER_F2
	dw_const Route9Hiker1Text,        TEXT_ROUTE9_HIKER1
	dw_const Route9Hiker2Text,        TEXT_ROUTE9_HIKER2
	dw_const Route9Youngster1Text,    TEXT_ROUTE9_YOUNGSTER1
	dw_const Route9Hiker3Text,        TEXT_ROUTE9_HIKER3
	dw_const Route9Youngster2Text,    TEXT_ROUTE9_YOUNGSTER2
	dw_const PickUpItemText,          TEXT_ROUTE9_TM_TELEPORT
	dw_const Route9SignText,          TEXT_ROUTE9_SIGN

	def_trainers Route9
	trainer EVENT_BEAT_ROUTE_9_TRAINER_0, 3, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_9_TRAINER_1, 2, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_9_TRAINER_2, 4, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_9_TRAINER_3, 2, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_9_TRAINER_4, 2, Hiker1
	trainer EVENT_BEAT_ROUTE_9_TRAINER_5, 3, Hiker2
	trainer EVENT_BEAT_ROUTE_9_TRAINER_6, 4, Youngster1
	trainer EVENT_BEAT_ROUTE_9_TRAINER_7, 2, Hiker3
	trainer EVENT_BEAT_ROUTE_9_TRAINER_8, 2, Youngster2
	db -1 ; end

Route9CooltrainerF1Text:
	text_asm
	ld hl, Route9_TrainerHeader0
	jr Route9TalkToTrainer

Route9CooltrainerM1Text:
	text_asm
	ld hl, Route9_TrainerHeader1
	jr Route9TalkToTrainer

Route9CooltrainerM2Text:
	text_asm
	ld hl, Route9_TrainerHeader2
	jr Route9TalkToTrainer

Route9CooltrainerF2Text:
	text_asm
	ld hl, Route9_TrainerHeader3
	jr Route9TalkToTrainer

Route9Hiker1Text:
	text_asm
	ld hl, Route9_TrainerHeader4
	jr Route9TalkToTrainer

Route9Hiker2Text:
	text_asm
	ld hl, Route9_TrainerHeader5
	jr Route9TalkToTrainer

Route9Youngster1Text:
	text_asm
	ld hl, Route9_TrainerHeader6
	jr Route9TalkToTrainer

Route9Hiker3Text:
	text_asm
	ld hl, Route9_TrainerHeader7
	jr Route9TalkToTrainer

Route9Youngster2Text:
	text_asm
	ld hl, Route9_TrainerHeader8
Route9TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route9CooltrainerF1BattleText:
	text "OH· YOU HAVE #"
	line "<⋯>EASY TARGET"
	cont "『KAMO』 SITTING"
	cont "DUCK!"
	done

Route9CooltrainerF1EndBattleText:
	text "OH? YOU ARE"
	line "QUITE STRONG!"
	prompt

Route9CooltrainerF1AfterBattleText:
	text "TUNNEL AHEAD IS"
	line "PITCH DARK· CANT"
	cont "ADVANCE WITHOUT"
	cont "A LIGHT!"
	done

Route9CooltrainerM1BattleText:
	text "WHO IS YOU?"
	line "WANDERING WITH"
	cont "GOOD-LOOKING #?"
	done

Route9CooltrainerM1EndBattleText:
	text "I LOST BADLY!"
	prompt

Route9CooltrainerM1AfterBattleText:
	text "SO BITTER EVEN"
	line "NO TEARS COME!"
	done

Route9CooltrainerM2BattleText:
	text "I WAS HEADING"
	line "TO SHION TOWN"
	cont "THROUGH ROCK"
	cont "TUNNEL BUT<⋯>"
	done

Route9CooltrainerM2EndBattleText:
	text "NO GOOD FOR ME!"
	prompt

Route9CooltrainerM2AfterBattleText:
	text "WHAT? ARE YOU"
	line "GOING TO ROCK"
	cont "TUNNEL TOO?"
	done

Route9CooltrainerF2BattleText:
	text "DONT GO EASY ON"
	line "ME JUST CAUSE"
	cont "I AM A GIRL!"
	done

Route9CooltrainerF2EndBattleText:
	text "NO! CANT MATCH"
	line "YOUR POWER!"
	prompt

Route9CooltrainerF2AfterBattleText:
	text "YOU SURELY HAVE"
	line "# 『SAINOU』"
	cont "TALENT! DO YOUR"
	cont "BEST!"
	done

Route9Hiker1BattleText:
	text "GAHAHA! PERFECT!"
	line "I WAS SO BORED!"
	done

Route9Hiker1EndBattleText:
	text "NOT YET<⋯> WAIT!"
	line "OUT OF #!"
	prompt

Route9Hiker1AfterBattleText:
	text "NOT SCARED OF A"
	line "MOUNTAIN MAN"
	cont "『YAMA OTOKO』!"
	cont "IMPRESSIVE!"
	done

Route9Hiker2BattleText:
	text "HA-HATTA! WHAT A"
	line "LIVELY BOY! TIME"
	cont "FOR A CLASH!"
	done

Route9Hiker2EndBattleText:
	text "WHOA-TTO-TTO!"
	prompt

Route9Hiker2AfterBattleText:
	text "HA-HATTA! LIVELY"
	line "IS VERY GOOD!"
	done

Route9Youngster1BattleText:
	text "WOKE UP EARLY"
	line "EVERY MORN TO"
	cont "RAISE CHRYSALIS!"

	para "IT FINALLY"
	line "EMERGED!"
	done

Route9Youngster1EndBattleText:
	text "WHAT! WHAT WAS"
	line "ALL MY EARLY"
	cont "RISING FOR?!"
	prompt

Route9Youngster1AfterBattleText:
	text "TO GET STRONGER·"
	line "MUST FIND OTHER"
	cont "THAN BUG #!"
	done

Route9Hiker3BattleText:
	text "HA-HAHA! BRING"
	line "IT ON!"
	done

Route9Hiker3EndBattleText:
	text "HA-HAHA! LOOKS"
	line "LIKE I LOST!"
	prompt

Route9Hiker3AfterBattleText:
	text "HA-HAHA! HIKERS"
	line "HAVE BIG HEARTS!"
	cont "WE LAUGH EVEN"
	cont "IN DEFEAT!"
	done

Route9Youngster2BattleText:
	text "MY CUTE BUG POKE!"
	line "GO GET EM!"
	done

Route9Youngster2EndBattleText:
	text "MY BUGS<⋯>"
	prompt

Route9Youngster2AfterBattleText:
	text "THOSE WHO DONT"
	line "GET BUG # CHARM·"
	cont "I WILL 『MUSHI』"
	cont "IGNORE THEM!"
	done

Route9SignText:
	text "ROUTE 9"
	line "HANADA <⋯> ROCK"
	cont "MOUNTAIN TUNNEL"
	done
