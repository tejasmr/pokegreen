PokemonTower3F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3F_TrainerHeaders
	ld de, PokemonTower3F_ScriptPointers
	ld a, [wPokemonTower3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower3FCurScript], a
	ret

PokemonTower3F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONTOWER3F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONTOWER3F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONTOWER3F_END_BATTLE

PokemonTower3F_TextPointers:
	def_text_pointers
	dw_const PokemonTower3FChanneler1Text, TEXT_POKEMONTOWER3F_CHANNELER1
	dw_const PokemonTower3FChanneler2Text, TEXT_POKEMONTOWER3F_CHANNELER2
	dw_const PokemonTower3FChanneler3Text, TEXT_POKEMONTOWER3F_CHANNELER3
	dw_const PickUpItemText,               TEXT_POKEMONTOWER3F_ESCAPE_ROPE

	def_trainers PokemonTower3F
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_0, 2, Channeler1
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_1, 3, Channeler2
	trainer EVENT_BEAT_POKEMONTOWER_3_TRAINER_2, 2, Channeler3
	db -1 ; end

PokemonTower3FChanneler1Text:
	text_asm
	ld hl, PokemonTower3F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3FChanneler1BattleText:
	text "<⋯><⋯>GI<⋯>"
	line "<⋯>GRRR<⋯>！"
	done

PokemonTower3FChanneler1EndBattleText:
	text "MUU<⋯>！"
	line "I AM SAVED！"
	prompt

PokemonTower3FChanneler1AfterBattleText:
	text "MACHINE CALLED"
	line "SILPH SCOPE"
	cont "CAN UNMASK GHOST"
	cont "# IDENTITY<⋯>"
	done

PokemonTower3FChanneler2Text:
	text_asm
	ld hl, PokemonTower3F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3FChanneler2BattleText:
	text "<⋯><⋯><⋯>"
	line "<⋯>KEKEE-T！"
	done

PokemonTower3FChanneler2EndBattleText:
	text "<⋯>ARE？ HUH？"
	line "WHAT WAS I DOING"
	cont "JUST NOW NE？"
	prompt

PokemonTower3FChanneler2AfterBattleText:
	text "SUMANU！ PARDON！"
	line "EVIL SPIRIT"
	cont "POSSESSED ME"
	cont "AND WENT WILD！"
	done

PokemonTower3FChanneler3Text:
	text_asm
	ld hl, PokemonTower3F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3FChanneler3BattleText:
	text "CURSE YOU FIEND！"
	line "<⋯>UWA！ HEGE<⋯>"
	cont "KE-KE-TSU！"
	done

PokemonTower3FChanneler3EndBattleText:
	text "PHEW<⋯>！"
	line "DID EVIL SPIRIT"
	cont "FLEE AWAY？"
	prompt

PokemonTower3FChanneler3AfterBattleText:
	text "KUH！ MY FRIENDS"
	line "ON UPPER FLOORS"
	cont "ALSO ATTACKED BY"
	cont "EVIL SPIRITS！"
	done
