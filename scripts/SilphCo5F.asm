SilphCo5F_Script:
	call SilphCo5FGateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo5F_TrainerHeaders
	ld de, SilphCo5F_ScriptPointers
	ld a, [wSilphCo5FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo5FCurScript], a
	ret

SilphCo5FGateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo4F_SetCardKeyDoorYScript
	call SilphCo5F_SetUnlockedSilphCoDoorsScript
	CheckEvent EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .unlock_door1
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 2, 3
	predef ReplaceTileBlock
	pop af
.unlock_door1
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	jr nz, .unlock_door2
	push af
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 3
	predef ReplaceTileBlock
	pop af
.unlock_door2
	CheckEventAfterBranchReuseA EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR2
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 5, 7
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  3,  2
	dbmapcoord  3,  6
	dbmapcoord  7,  5
	db -1 ; end

SilphCo5F_SetUnlockedSilphCoDoorsScript:
	EventFlagAddress hl, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	cp $1
	jr nz, .unlock_door1
	SetEventReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.unlock_door1
	cp $2
	jr nz, .unlock_door2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR2, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret
.unlock_door2
	SetEventAfterBranchReuseHL EVENT_SILPH_CO_5_UNLOCKED_DOOR3, EVENT_SILPH_CO_5_UNLOCKED_DOOR1
	ret

SilphCo5F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO5F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO5F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO5F_END_BATTLE

SilphCo5F_TextPointers:
	def_text_pointers
	dw_const SilphCo5FSilphWorkerMText,   TEXT_SILPHCO5F_SILPH_WORKER_M
	dw_const SilphCo5FRocket1Text,        TEXT_SILPHCO5F_ROCKET1
	dw_const SilphCo5FScientistText,      TEXT_SILPHCO5F_SCIENTIST
	dw_const SilphCo5FRockerText,         TEXT_SILPHCO5F_ROCKER
	dw_const SilphCo5FRocket2Text,        TEXT_SILPHCO5F_ROCKET2
	dw_const PickUpItemText,              TEXT_SILPHCO5F_TM_TAKE_DOWN
	dw_const PickUpItemText,              TEXT_SILPHCO5F_PROTEIN
	dw_const PickUpItemText,              TEXT_SILPHCO5F_CARD_KEY
	dw_const SilphCo5FPokemonReport1Text, TEXT_SILPHCO5F_POKEMON_REPORT1
	dw_const SilphCo5FPokemonReport2Text, TEXT_SILPHCO5F_POKEMON_REPORT2
	dw_const SilphCo5FPokemonReport3Text, TEXT_SILPHCO5F_POKEMON_REPORT3

	def_trainers SilphCo5F, 2
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_0, 1, Rocket1
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_1, 2, Scientist
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_2, 4, Rocker
	trainer EVENT_BEAT_SILPH_CO_5F_TRAINER_3, 3, Rocket2
	db -1 ; end

SilphCo5FSilphWorkerMText:
	text_asm
	ld hl, .ThatsYouRightText
	ld de, .YoureOurHeroText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.ThatsYouRightText:
	text "<ROCKET> MAKES"
	line "A COMMOTION ABOUT"
	cont "INTRUDER⋯"

	para "THAT SEEMS TO"
	line "BE YOU RIGHT?"
	done

.YoureOurHeroText:
	text "<ROCKET> FLED!"
	line "DID YOU DRIVE"
	cont "THEM OUT?!"

	para "⋯ARIGATOU! THANK"
	line "YOU VERY MUCH!"
	done

SilphCo5FRocket1Text:
	text_asm
	ld hl, SilphCo5F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5FRocket1BattleText:
	text "GOT WORD EARLIER"
	line "A BRAT WAS"
	cont "SNEAKING AROUND!"
	done

SilphCo5FRocket1EndBattleText:
	text "FELL FLAT⋯!"
	prompt

SilphCo5FRocket1AfterBattleText:
	text "BETTER NOT DEFY"
	line "<ROCKET> FOR SAKE"
	cont "OF YOUR HEALTH!"
	done

SilphCo5FScientistText:
	text_asm
	ld hl, SilphCo5F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5FScientistBattleText:
	text "THIS FLOOR IS"
	line "POKE BALL R AND D"
	cont "SECTION!"
	done

SilphCo5FScientistEndBattleText:
	text "DAMMIT ALL!"
	prompt

SilphCo5FScientistAfterBattleText:
	text "WE WERE STUDYING"
	line "ULTIMATE BALL TO"
	cont "CATCH EVEN"
	cont "LEGENDARY PETS!"
	done

SilphCo5FRockerText:
	text_asm
	ld hl, SilphCo5F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5FRockerBattleText:
	text "HOW STRANGE?!"
	line "NO WAY A CHILD"
	cont "COULD SNEAK IN!"
	done

SilphCo5FRockerEndBattleText:
	text "THIS IS BAD!"
	prompt

SilphCo5FRockerAfterBattleText:
	text "THIS IS ONLY 5F⋯"
	line "STILL FAR FROM"
	cont "REACHING BOSS!"
	done

SilphCo5FRocket2Text:
	text_asm
	ld hl, SilphCo5F_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SilphCo5FRocket2BattleText:
	text "YOU DARE LOOK"
	line "DOWN ON <ROCKET>!"
	done

SilphCo5FRocket2EndBattleText:
	text "HM! PURE FLUKE"
	line "COINCIDENCE!"
	prompt

SilphCo5FRocket2AfterBattleText:
	text "COINCIDENCE⋯"
	line "EGG REMINDS ME!"

	para "TAMATAMA EGGS"
	line "EVOLVE INTO"
	cont "NASSY TREE MON!"
	done

SilphCo5FPokemonReport1Text:
	text "⋯A PET REPORT!"

	para "LAB SUCCEEDED"
	line "IN CREATING FIRST"
	cont "ARTIFICIAL PET"
	cont "POLYGON⋯⋯"
	done

SilphCo5FPokemonReport2Text:
	text "⋯A PET REPORT!"

	para "PET TECHNIQUES"
	line "CURRENTLY KNOWN"
	cont "EXCEED OVER 160"
	cont "DIFFERENT KINDS!"
	done

SilphCo5FPokemonReport3Text:
	text "⋯A PET REPORT!"

	para "4 KINDS OF PETS"
	line "ARE CONFIRMED TO"
	cont "EVOLVE THROUGH"
	cont "LINK TRADE CABLE!"
	done
