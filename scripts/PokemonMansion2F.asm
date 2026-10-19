PokemonMansion2F_Script:
	call Mansion2CheckReplaceSwitchDoorBlocks
	call EnableAutoTextBoxDrawing
	ld hl, PokemonMansion2F_TrainerHeaders
	ld de, PokemonMansion2F_ScriptPointers
	ld a, [wPokemonMansion2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonMansion2FCurScript], a
	ret

Mansion2CheckReplaceSwitchDoorBlocks:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .switchTurnedOn
	ld a, $e
	lb bc, 2, 4
	call Mansion2ReplaceBlock
	ld a, $54
	lb bc, 4, 9
	call Mansion2ReplaceBlock
	ld a, $5f
	lb bc, 11, 3
	call Mansion2ReplaceBlock
	ret
.switchTurnedOn
	ld a, $5f
	lb bc, 2, 4
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 4, 9
	call Mansion2ReplaceBlock
	ld a, $e
	lb bc, 11, 3
	call Mansion2ReplaceBlock
	ret

Mansion2ReplaceBlock:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

Mansion2Script_Switches::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_POKEMONMANSION2F_SWITCH
	ldh [hTextID], a
	jp DisplayTextID

PokemonMansion2F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_POKEMONMANSION2F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_POKEMONMANSION2F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_POKEMONMANSION2F_END_BATTLE

PokemonMansion2F_TextPointers:
	def_text_pointers
	dw_const PokemonMansion2FSuperNerdText, TEXT_POKEMONMANSION2F_SUPER_NERD
	dw_const PickUpItemText,                TEXT_POKEMONMANSION2F_CALCIUM
	dw_const PokemonMansion2FDiary1Text,    TEXT_POKEMONMANSION2F_DIARY1
	dw_const PokemonMansion2FDiary2Text,    TEXT_POKEMONMANSION2F_DIARY2
	dw_const PokemonMansion2FSwitchText,    TEXT_POKEMONMANSION2F_SWITCH

	def_trainers PokemonMansion2F
	trainer EVENT_BEAT_MANSION_2_TRAINER_0, 0, SuperNerd
	db -1 ; end

PokemonMansion2FSuperNerdText:
	text_asm
	ld hl, PokemonMansion2F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonMansion2FSuperNerdBattleText:
	text "THIS MANSION IS"
	line "FULL OF TRICKS!"
	cont "HARD TO PROCEED!"
	done

PokemonMansion2FSuperNerdEndBattleText:
	text "WAH! MY LOOT"
	line "IN THE BUNDLE!"
	prompt

PokemonMansion2FSuperNerdAfterBattleText:
	text "FLIPPING SECRET"
	line "SWITCH OPENS"
	cont "DIFFERENT DOORS"
	cont "ALTERNATELY!"
	done

PokemonMansion2FDiary1Text:
	text "DIARY: JULY 5"
	line "GUYANA·SOUTH"
	cont "AMERICA JUNGLE!"

	para "DISCOVERED A"
	line "BRAND NEW SPECIES"
	cont "OF # IN DEEP"
	cont "RAINFOREST!"
	done

PokemonMansion2FDiary2Text:
	text "DIARY: JULY 10"
	line "I HAVE NAMED THE"
	cont "NEWLY DISCOVERED"
	cont "#: MEW!"
	done

PokemonMansion2FSwitchText:
	text_asm
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .not_pressed
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	ld hl, .PressedText
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .done
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .done
.not_pressed
	ld hl, .NotPressed
	call PrintText
.done
	jp TextScriptEnd

.Text:
	text "A SECRET SWITCH!"

	para "PRESS IT?"
	done

.PressedText:
	text "WHO WOULD NOT"
	line "PRESS IT? POCHI!"
	prompt

.NotPressed:
	text "DECIDED NOT TO"
	line "PRESS IT!"
	done

