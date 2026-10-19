FightingDojo_Script:
	call EnableAutoTextBoxDrawing
	ld hl, FightingDojo_TrainerHeaders
	ld de, FightingDojo_ScriptPointers
	ld a, [wFightingDojoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFightingDojoCurScript], a
	ret

FightingDojoResetScripts:
	xor a ; SCRIPT_FIGHTINGDOJO_DEFAULT
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ret

FightingDojo_ScriptPointers:
	def_script_pointers
	dw_const FightingDojoDefaultScript,                SCRIPT_FIGHTINGDOJO_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,    SCRIPT_FIGHTINGDOJO_START_BATTLE
	dw_const EndTrainerBattle,                         SCRIPT_FIGHTINGDOJO_END_BATTLE
	dw_const FightingDojoKarateMasterPostBattleScript, SCRIPT_FIGHTINGDOJO_KARATE_MASTER_POST_BATTLE

FightingDojoDefaultScript:
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	ret nz
	call CheckFightingMapTrainers
	ld a, [wTrainerHeaderFlagBit]
	and a
	ret nz
	CheckEvent EVENT_BEAT_KARATE_MASTER
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld [wSavedCoordIndex], a
	ld a, [wYCoord]
	cp 3
	ret nz
	ld a, [wXCoord]
	cp 4
	ret nz
	ld a, 1
	ld [wSavedCoordIndex], a
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, FIGHTINGDOJO_KARATE_MASTER
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_FIGHTINGDOJO_KARATE_MASTER
	ldh [hTextID], a
	call DisplayTextID
	ret

FightingDojoKarateMasterPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FightingDojoResetScripts
	ld a, [wSavedCoordIndex]
	and a ; nz if the player was at (4, 3), left of the Karate Master
	jr z, .already_facing
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, FIGHTINGDOJO_KARATE_MASTER
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
.already_facing
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEventRange EVENT_BEAT_KARATE_MASTER, EVENT_BEAT_FIGHTING_DOJO_TRAINER_3
	ld a, TEXT_FIGHTINGDOJO_KARATE_MASTER_GIVE_POKEMON
	ldh [hTextID], a
	call DisplayTextID
	xor a ; SCRIPT_FIGHTINGDOJO_DEFAULT
	ld [wJoyIgnore], a
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	ret

FightingDojo_TextPointers:
	def_text_pointers
	dw_const FightingDojoKarateMasterText,            TEXT_FIGHTINGDOJO_KARATE_MASTER
	dw_const FightingDojoBlackbelt1Text,              TEXT_FIGHTINGDOJO_BLACKBELT1
	dw_const FightingDojoBlackbelt2Text,              TEXT_FIGHTINGDOJO_BLACKBELT2
	dw_const FightingDojoBlackbelt3Text,              TEXT_FIGHTINGDOJO_BLACKBELT3
	dw_const FightingDojoBlackbelt4Text,              TEXT_FIGHTINGDOJO_BLACKBELT4
	dw_const FightingDojoHitmonleePokeBallText,       TEXT_FIGHTINGDOJO_HITMONLEE_POKE_BALL
	dw_const FightingDojoHitmonchanPokeBallText,      TEXT_FIGHTINGDOJO_HITMONCHAN_POKE_BALL
	dw_const FightingDojoKarateMasterGivePokemonText, TEXT_FIGHTINGDOJO_KARATE_MASTER_GIVE_POKEMON

	def_trainers FightingDojo, 2
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_0, 4, Blackbelt1
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_1, 4, Blackbelt2
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_2, 3, Blackbelt3
	trainer EVENT_BEAT_FIGHTING_DOJO_TRAINER_3, 3, Blackbelt4
	db -1 ; end

FightingDojoKarateMasterText:
	text_asm
	CheckEvent EVENT_DEFEATED_FIGHTING_DOJO
	jp nz, .defeated_dojo
	CheckEventReuseA EVENT_BEAT_KARATE_MASTER
	jp nz, .defeated_master
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .DefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_FIGHTINGDOJO_KARATE_MASTER_POST_BATTLE
	ld [wFightingDojoCurScript], a
	ld [wCurMapScript], a
	jr .end
.defeated_dojo
	ld hl, FightingDojoKarateMasterTrainWithUsText
	call PrintText
	jr .end
.defeated_master
	ld hl, FightingDojoKarateMasterGivePokemonText
	call PrintText
.end
	jp TextScriptEnd

.PreBattleText:
	text "OSU!"

	para "I AM KARATE KING"
	line "MASTER OF THE"
	cont "FIGHTING DOJO!"

	para "YOU CHALLENGE"
	line "OUR DOJO?!"
	cont "I SHOW NO MERCY!"

	para "TOORYAAAH!"
	done

.DefeatedText:
	text "UORYA!"
	line "DAAH! DEFEATED!"
	prompt

FightingDojoKarateMasterGivePokemonText:
	text "INDEED I LOST!"

	para "BUT DOJO SIGN"
	line "『KANBAN』 BOARD⋯"
	cont "DO NOT TAKE AWAY!"

	para "IN RETURN I GIVE"
	line "MY CHERISHED"
	cont "FIGHTING PET!"

	para "PLEASE CHOOSE"
	line "ONE YOU PREFER!"
	done

FightingDojoKarateMasterTrainWithUsText:
	text "OSU!"

	para "HOW ABOUT IT?"
	line "STAY AND TRAIN"
	cont "KARATE WITH US!"
	done

FightingDojoBlackbelt1Text:
	text_asm
	ld hl, FightingDojo_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBlackbelt1BattleText:
	text "U-OSU! BASTARD!"
	line "DOJO BREAKER?!"
	done

FightingDojoBlackbelt1EndBattleText:
	text "I SURRENDER!"
	prompt

FightingDojoBlackbelt1AfterBattleText:
	text "RELAX ONLY AFTER"
	line "YOU BEAT MASTER!"

	para "BEATING ME IS"
	line "NOTHING SPECIAL!"
	cont "OSU!"
	done

FightingDojoBlackbelt2Text:
	text_asm
	ld hl, FightingDojo_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBlackbelt2BattleText:
	text "OSU! YOU SEEM"
	line "SKILLED! I GO"
	cont "WITHOUT HESITATE!"
	done

FightingDojoBlackbelt2EndBattleText:
	text "U-OSU! WAZA-ARI!"
	line "CLEVER POINT!"
	prompt

FightingDojoBlackbelt2AfterBattleText:
	text "MASTER IS GOD"
	line "OF FIGHTERS!"
	cont "PREPARE RESOLVE"
	cont "IF YOU DARE!"
	done

FightingDojoBlackbelt3Text:
	text_asm
	ld hl, FightingDojo_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBlackbelt3BattleText:
	text "CHESTOOO!"
	line "HARD OBJECTS DO"
	cont "NOT SCARE ME!"

	para "EVERY DAY I"
	line "SMASH BOULDERS"
	cont "WITH MY FISTS!"
	done

FightingDojoBlackbelt3EndBattleText:
	text "ATAA! OSU!"
	prompt

FightingDojoBlackbelt3AfterBattleText:
	text "FIGHTERS ONLY"
	line "FEAR PSYCHIC"
	cont "POWERS! OSU!"
	done

FightingDojoBlackbelt4Text:
	text_asm
	ld hl, FightingDojo_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FightingDojoBlackbelt4BattleText:
	text "OSU!"

	para "YOU KNOW THIS IS"
	line "FIGHTING DOJO YET"
	cont "ACT SO RUDE?!"
	done

FightingDojoBlackbelt4EndBattleText:
	text "GUH! BEATEN!"
	prompt

FightingDojoBlackbelt4AfterBattleText:
	text "FIGHTERS FROM"
	line "WHOLE COUNTRY"
	cont "GATHER HERE! OSU!"
	done

FightingDojoHitmonleePokeBallText:
	text_asm
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, FightingDojoBetterNotGetGreedyText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONLEE
	call DisplayPokedex
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done

	; once Poké Ball is taken, hide sprite
	ld a, TOGGLE_FIGHTING_DOJO_GIFT_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvents EVENT_GOT_HITMONLEE, EVENT_DEFEATED_FIGHTING_DOJO
.done
	jp TextScriptEnd

.Text:
	text "OSU! KICK FIEND!"
	line "TAKE SAWAMULAR"
	cont "HITMONLEE?"
	done

FightingDojoHitmonchanPokeBallText:
	text_asm
	CheckEitherEventSet EVENT_GOT_HITMONLEE, EVENT_GOT_HITMONCHAN
	jr z, .GetMon
	ld hl, FightingDojoBetterNotGetGreedyText
	call PrintText
	jr .done
.GetMon
	ld a, HITMONCHAN
	call DisplayPokedex
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .done
	SetEvents EVENT_GOT_HITMONCHAN, EVENT_DEFEATED_FIGHTING_DOJO

	; once Poké Ball is taken, hide sprite
	ld a, TOGGLE_FIGHTING_DOJO_GIFT_2
	ld [wToggleableObjectIndex], a
	predef HideObject
.done
	jp TextScriptEnd

.Text:
	text "OSU! ROARING FIST"
	line "TAKE EBIWALAR"
	cont "HITMONCHAN?"
	done

FightingDojoBetterNotGetGreedyText:
	text "BETTER NOT GET"
	line "GREEDY⋯"
	done
