Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10_TrainerHeaders
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE10_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE10_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE10_END_BATTLE

Route10_TextPointers:
	def_text_pointers
	dw_const Route10SuperNerd1Text,     TEXT_ROUTE10_SUPER_NERD1
	dw_const Route10Hiker1Text,         TEXT_ROUTE10_HIKER1
	dw_const Route10SuperNerd2Text,     TEXT_ROUTE10_SUPER_NERD2
	dw_const Route10CooltrainerF1Text,  TEXT_ROUTE10_COOLTRAINER_F1
	dw_const Route10Hiker2Text,         TEXT_ROUTE10_HIKER2
	dw_const Route10CooltrainerF2Text,  TEXT_ROUTE10_COOLTRAINER_F2
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_NORTH_SIGN
	dw_const PokeCenterSignText,        TEXT_ROUTE10_POKECENTER_SIGN
	dw_const Route10RockTunnelSignText, TEXT_ROUTE10_ROCKTUNNEL_SOUTH_SIGN
	dw_const Route10PowerPlantSignText, TEXT_ROUTE10_POWERPLANT_SIGN

	def_trainers Route10
	trainer EVENT_BEAT_ROUTE_10_TRAINER_0, 4, SuperNerd1
	trainer EVENT_BEAT_ROUTE_10_TRAINER_1, 3, Hiker1
	trainer EVENT_BEAT_ROUTE_10_TRAINER_2, 4, SuperNerd2
	trainer EVENT_BEAT_ROUTE_10_TRAINER_3, 3, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_10_TRAINER_4, 2, Hiker2
	trainer EVENT_BEAT_ROUTE_10_TRAINER_5, 2, CooltrainerF2
	db -1 ; end

Route10SuperNerd1Text:
	text_asm
	ld hl, Route10_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd1BattleText:
	text "COMING WAY OUT"
	line "HERE· YOU A"
	cont "『MANIA』 TOO?"
	cont "WANT TO SEE MY"
	cont "COLLECTION?"
	done

Route10SuperNerd1EndBattleText:
	text "HMPH<⋯>! I AM NOT"
	line "SAD AT ALL!"
	prompt

Route10SuperNerd1AfterBattleText:
	text "AT HOME I HAVE"
	line "EVEN RARER #!"
	done

Route10Hiker1Text:
	text_asm
	ld hl, Route10_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker1BattleText:
	text "HA-HA-HA-HA!"
	done

Route10Hiker1EndBattleText:
	text "HAH! HA-HA-HA<⋯>!"
	line "TRUTH IS<⋯> I ATE"
	cont "『WARAI KINOKO』!"
	cont "LAUGH MUSHROOM!"
	prompt

Route10Hiker1AfterBattleText:
	text "HAHA! HA-HA-HA!"
	line "<⋯>PANT PANT<⋯>"
	cont "CANT STOP!"
	done

Route10SuperNerd2Text:
	text_asm
	ld hl, Route10_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10SuperNerd2BattleText:
	text "HEY HEY! MISTER·"
	line "WANT TO SEE MY"
	cont "CUTE #?"
	done

Route10SuperNerd2EndBattleText:
	text "AHH! MY PRECIOUS"
	line "# BABIES!"
	prompt

Route10SuperNerd2AfterBattleText:
	text "<⋯>I HATE ANYONE"
	line "STRONGER THAN ME"
	done

Route10CooltrainerF1Text:
	text_asm
	ld hl, Route10_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF1BattleText:
	text "I GO TO # GYM"
	line "SOMETIMES TOO!"
	cont "<⋯>LOSE EVERY"
	cont "TIME THOUGH!"
	done

Route10CooltrainerF1EndBattleText:
	text "MOO<⋯>! AND I"
	line "DID SPECIAL"
	cont "TRAINING TOO!"
	prompt

Route10CooltrainerF1AfterBattleText:
	text "HEY<⋯>! ON THIS"
	line "MOUNTAIN ROAD·"
	cont "MANIACS LURK!"
	cont "DID YOU SEE?"
	done

Route10Hiker2Text:
	text_asm
	ld hl, Route10_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10Hiker2BattleText:
	text "SUU-HAA SUU-HAA!"
	line "DEEP BREATHS!"
	cont "MOUNTAIN AIR IS"
	cont "SO DELICIOUS!"
	done

Route10Hiker2EndBattleText:
	text "SUU-HAA! AHH"
	line "I LOST BADLY!"
	prompt

Route10Hiker2AfterBattleText:
	text "BREATHED TOO MUCH"
	line "MOUNTAIN AIR· MY"
	cont "BELLY IS FULL!"
	done

Route10CooltrainerF2Text:
	text_asm
	ld hl, Route10_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10CooltrainerF2BattleText:
	text "HAH<⋯>! WALKING"
	line "MOUNTAIN PATH·"
	cont "I FEEL ANEMIC!"
	done

Route10CooltrainerF2EndBattleText:
	text "<⋯>POOR HEALTH·"
	line "CANT BE HELPED!"
	prompt

Route10CooltrainerF2AfterBattleText:
	text "MOUNTAIN # ARE"
	line "ALL SO RUGGED<⋯>"

	para "I WISH THERE WAS"
	line "A PINK # WITH"
	cont "A FLORAL PATTERN"
	done

Route10RockTunnelSignText:
	text "ROCK MOUNTAIN"
	line "TUNNEL"
	done

Route10PowerPlantSignText:
	text "ABANDONED POWER"
	line "PLANT: 『MUJIN"
	cont "HATSUDENSHO』"
	done
