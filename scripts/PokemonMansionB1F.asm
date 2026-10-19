PokemonMansionB1F_Script:
	call MansionB1FCheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, PokemonMansionB1F_TrainerHeaders
	ld de, PokemonMansionB1F_ScriptPointers
	ld a, [wPokemonMansionB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansionB1FCurScript], a
	ret

MansionB1FCheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	ld a, $e
	lb bc, 8, 13
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 11, 6
	call Mansion2ReplaceBlock
	ld a, $5f
	lb bc, 3, 4
	call Mansion2ReplaceBlock
	ld a, $54
	lb bc, 8, 8
	call Mansion2ReplaceBlock
	ret
.switchTurnedOn
	ld a, $2d
	lb bc, 8, 13
	call Mansion2ReplaceBlock
	ld a, $5f
	lb bc, 11, 6
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 3, 4
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 8, 8
	call Mansion2ReplaceBlock
	ret

Mansion4Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSIONB1F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansionB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSIONB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSIONB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSIONB1F_END_BATTLE

PokemonMansionB1F_TextPointers:
	def_text_pointers
	dw_const PokemonMansionB1FBurglarText,   TEXT_POKEMONMANSIONB1F_BURGLAR
	dw_const PokemonMansionB1FScientistText, TEXT_POKEMONMANSIONB1F_SCIENTIST
	dw_const PickUpItemText,                 TEXT_POKEMONMANSIONB1F_RARE_CANDY
	dw_const PickUpItemText,                 TEXT_POKEMONMANSIONB1F_FULL_RESTORE
	dw_const PickUpItemText,                 TEXT_POKEMONMANSIONB1F_TM_BLIZZARD
	dw_const PickUpItemText,                 TEXT_POKEMONMANSIONB1F_TM_SOLARBEAM
	dw_const PokemonMansionB1FDiaryText,     TEXT_POKEMONMANSIONB1F_DIARY
	dw_const PickUpItemText,                 TEXT_POKEMONMANSIONB1F_SECRET_KEY
	dw_const PokemonMansion2FSwitchText,     TEXT_POKEMONMANSIONB1F_SWITCH ; This switch uses the text script from the 2F.

	def_trainers PokemonMansionB1F
	trainer EVENT_BEAT_MANSION_4_TRAINER_0, 0, Burglar
	trainer EVENT_BEAT_MANSION_4_TRAINER_1, 3, Scientist
	db -1 ; end

PokemonMansionB1FBurglarText:
	text_asm
	ld hl, PokemonMansionB1F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonMansionB1FBurglarBattleText:
	text "<⋯>OH TROUBLE!"
	line "I LOST MY WAY!"
	done

PokemonMansionB1FBurglarEndBattleText:
	text "HYU-DORODORO!"
	prompt

PokemonMansionB1FBurglarAfterBattleText:
	text "ITEMS DROPPED BY"
	line "PAST RESIDENTS"
	cont "ARE ALL OVER!"
	done

PokemonMansionB1FScientistText:
	text_asm
	ld hl, PokemonMansionB1F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonMansionB1FScientistBattleText:
	text "THIS PLACE IS BIG"
	line "AND GREAT FOR MY"
	cont "RESEARCH LAB!"
	done

PokemonMansionB1FScientistEndBattleText:
	text "WHAT ARE YOU"
	line "DOING HERE?"
	prompt

PokemonMansionB1FScientistAfterBattleText:
	text "I LIKE IT HERE!"
	line "MY RESEARCH WILL"
	cont "PROGRES GREATLY<⋯>"
	done

PokemonMansionB1FDiaryText:
	text "DIARY: SEPT. 1"
	line "# MEWTWO IS"
	cont "FAR TOO STRONG!"

	para "NO GOOD<⋯> IT IS"
	line "BEYOND MY POWER"
	cont "TO CONTROL!"
	done

