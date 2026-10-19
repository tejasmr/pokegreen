Route24_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route24_TrainerHeaders
	ld de, Route24_ScriptPointers
	ld a, [wRoute24CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute24CurScript], a
	ret

Route24SetDefaultScript:
	xor a ; SCRIPT_ROUTE24_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_ScriptPointers:
	def_script_pointers
	dw_const Route24DefaultScript,                  SCRIPT_ROUTE24_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE24_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE24_END_BATTLE
	dw_const Route24AfterRocketBattleScript,        SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	dw_const Route24PlayerMovingScript,             SCRIPT_ROUTE24_PLAYER_MOVING

Route24DefaultScript:
	CheckEvent EVENT_GOT_NUGGET
	jp nz, CheckFightingMapTrainers
	ld hl, .PlayerCoordsArray
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyHeld], a
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	CheckAndResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	ret z
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_ROUTE24_PLAYER_MOVING
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

.PlayerCoordsArray:
	dbmapcoord 10, 15
	db -1 ; end

Route24PlayerMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24AfterRocketBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route24SetDefaultScript
	call UpdateSprites
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE24_ROCKET
	ld a, TEXT_ROUTE24_COOLTRAINER_M1
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_ROUTE24_DEFAULT
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	ret

Route24_TextPointers:
	def_text_pointers
	dw_const Route24CooltrainerM1Text, TEXT_ROUTE24_COOLTRAINER_M1
	dw_const Route24CooltrainerM2Text, TEXT_ROUTE24_COOLTRAINER_M2
	dw_const Route24CooltrainerM3Text, TEXT_ROUTE24_COOLTRAINER_M3
	dw_const Route24CooltrainerF1Text, TEXT_ROUTE24_COOLTRAINER_F1
	dw_const Route24Youngster1Text,    TEXT_ROUTE24_YOUNGSTER1
	dw_const Route24CooltrainerF2Text, TEXT_ROUTE24_COOLTRAINER_F2
	dw_const Route24Youngster2Text,    TEXT_ROUTE24_YOUNGSTER2
	dw_const PickUpItemText,           TEXT_ROUTE24_TM_THUNDER_WAVE

	def_trainers Route24, 2
	trainer EVENT_BEAT_ROUTE_24_TRAINER_0, 4, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_24_TRAINER_1, 1, CooltrainerM3
	trainer EVENT_BEAT_ROUTE_24_TRAINER_2, 1, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_24_TRAINER_3, 1, Youngster1
	trainer EVENT_BEAT_ROUTE_24_TRAINER_4, 1, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_24_TRAINER_5, 1, Youngster2
	db -1 ; end

Route24CooltrainerM1Text:
	text_asm
	ResetEvent EVENT_NUGGET_REWARD_AVAILABLE
	CheckEvent EVENT_GOT_NUGGET
	jr nz, .got_item
	ld hl, .YouBeatOurContestText
	call PrintText
	lb bc, NUGGET, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_NUGGET
	ld hl, .ReceivedNuggetText
	call PrintText
	ld hl, .JoinTeamRocketText
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
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_ROUTE24_AFTER_ROCKET_BATTLE
	ld [wRoute24CurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd
.got_item
	ld hl, .YouCouldBecomeATopLeaderText
	call PrintText
	jp TextScriptEnd
.bag_full
	ld hl, .NoRoomText
	call PrintText
	SetEvent EVENT_NUGGET_REWARD_AVAILABLE
	jp TextScriptEnd

.YouBeatOurContestText:
	text "SPLENDID! BRAVO!"
	line "BEAT 5 TRAINERS!"
	cont "CONGRATULATIONS!@"
	sound_get_item_1
	text_start

	para "AS A PRIZE TAKE"
	line "THIS PRESENT!"
	prompt

.ReceivedNuggetText:
	text "<PLAYER> RECEIVED"
	line "A @"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_promptbutton
	text_end

.NoRoomText:
	text "BAG IS FULL!"
	done

.JoinTeamRocketText:
	text "BY THE WAY<⋯>"
	line "SECRET TALK:"
	cont "JOIN TEAM ROCKET?"

	para "WE ARE A GANG"
	line "THAT USES MONS"
	cont "FOR EVIL CRIMES!"

	para "『HAIRU』! JOIN UP!"

	para "WONT YOU JOIN?"

	para "PLEASE JOIN US!"

	para "JUST JOIN NOW!"

	para "<⋯>REFUSAL ON"
	line "YOUR YOUNG FACE!"

	para "THEN BY FORCE I"
	line "WILL MAKE YOU!"
	cont "『URYAA』! HIYAA!"
	done

.DefeatedText:
	text "KID<⋯> YOU ARE"
	line "REALLY STRONG!"
	prompt

.YouCouldBecomeATopLeaderText:
	text "WITH SUCH SKILL"
	line "YOU COULD BECOME"
	cont "A ROCKET LEADER!"
	cont "WHAT A WASTE!"
	done

Route24CooltrainerM2Text:
	text_asm
	ld hl, Route24_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM2BattleText:
	text "HEH-HEH<⋯> FROM"
	line "THE GRASS I SAW"
	cont "YOUR FEATS!"
	done

Route24CooltrainerM2EndBattleText:
	text "<⋯>NO GOOD AT ALL"
	prompt

Route24CooltrainerM2AfterBattleText:
	text "<⋯>AFRAID TO CROSS"
	line "BRIDGE SO I HID"
	cont "IN GRASS ALL DAY!"
	done

Route24CooltrainerM3Text:
	text_asm
	ld hl, Route24_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerM3BattleText:
	text "KIEEYAH! NO·5!"
	line "I AM YOUR FINAL"
	cont "OPPONENT HERE!"
	done

Route24CooltrainerM3EndBattleText:
	text "YOU ARE GREAT!"
	prompt

Route24CooltrainerM3AfterBattleText:
	text "DID MY BEST SO"
	line "『KUI WA NAI』!"
	cont "NO REGRETS LEFT!"
	done

Route24CooltrainerF1Text:
	text_asm
	ld hl, Route24_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF1BattleText:
	text "NUMBER 4 IS ME!"
	line "ARE YOU GETTING"
	cont "TIRED OUT YET?"
	done

Route24CooltrainerF1EndBattleText:
	text "I LOST TOO HUH"
	prompt

Route24CooltrainerF1AfterBattleText:
	text "I GAVE MY BEST!"
	line "『KUI WA NAI』!"
	cont "NO REGRETS LEFT!"
	done

Route24Youngster1Text:
	text_asm
	ld hl, Route24_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster1BattleText:
	text "NUMBER 3 ENTERS!"
	line "IT WONT BE SO"
	cont "EASY FOR YOU!"
	done

Route24Youngster1EndBattleText:
	text "ALL WOBBLY! DONE!"
	prompt

Route24Youngster1AfterBattleText:
	text "DID MY BEST SO"
	line "『KUI WA NAI』!"
	cont "NO REGRETS LEFT!"
	done

Route24CooltrainerF2Text:
	text_asm
	ld hl, Route24_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route24CooltrainerF2BattleText:
	text "NUMBER 2 IS ME!"
	line "NOW THE REAL"
	cont "TEST BEGINS!"
	done

Route24CooltrainerF2EndBattleText:
	text "UNBELIEVABLE!"
	prompt

Route24CooltrainerF2AfterBattleText:
	text "I GAVE MY BEST!"
	line "『KUI WA NAI』!"
	cont "NO REGRETS LEFT!"
	done

Route24Youngster2Text:
	text_asm
	ld hl, Route24_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route24Youngster2BattleText:
	text "PEOPLE CALL THIS"
	line "GOLDEN BALL"
	cont "NUGGET BRIDGE!"

	para "BEAT 5 TRAINERS"
	line "TO WIN A BIG"
	cont "FABULOUS PRIZE!"

	para "NOW! CAN YOU"
	line "PASS THROUGH?"
	done

Route24Youngster2EndBattleText:
	text "PRETTY GOOD JOB!"
	prompt

Route24Youngster2AfterBattleText:
	text "DID MY BEST SO"
	line "『KUI WA NAI』!"
	cont "NO REGRETS LEFT!"
	done
