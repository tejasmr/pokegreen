CinnabarGym_Script:
	call CinnabarGymSetMapAndTiles
	call EnableAutoTextBoxDrawing
	ld hl, CinnabarGym_ScriptPointers
	ld a, [wCinnabarGymCurScript]
	jp CallFunctionInTable

CinnabarGymSetMapAndTiles:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, UpdateCinnabarGymGateTileBlocks
	ResetEvent EVENT_2A7
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "GUREN@"

.LeaderName:
	db "KATSURA@"


CinnabarGymResetScripts:
	xor a ; SCRIPT_CINNABARGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarGymSetTrainerHeader:
	ldh a, [hTextID]
	ld [wTrainerHeaderFlagBit], a
	ret

CinnabarGym_ScriptPointers:
	def_script_pointers
	dw_const CinnabarGymDefaultScript,          SCRIPT_CINNABARGYM_DEFAULT
	dw_const CinnabarGymGetOpponentTextScript,  SCRIPT_CINNABARGYM_GET_OPPONENT_TEXT
	dw_const CinnabarGymOpenGateScript,         SCRIPT_CINNABARGYM_OPEN_GATE
	dw_const CinnabarGymBlainePostBattleScript, SCRIPT_CINNABARGYM_BLAINE_POST_BATTLE

CinnabarGymDefaultScript:
	ld a, [wOpponentAfterWrongAnswer]
	and a
	ret z
	ldh [hSpriteIndex], a
	cp CINNABARGYM_SUPER_NERD3
	jr nz, .not_super_nerd3
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	ld de, MovementNpcToLeftAndUp
	jr .MoveSprite
.not_super_nerd3
	ld de, MovementNpcToLeft
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
.MoveSprite
	call MoveSprite
	ld a, SCRIPT_CINNABARGYM_GET_OPPONENT_TEXT
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

MovementNpcToLeftAndUp:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_UP
	db -1 ; end

MovementNpcToLeft:
	db NPC_MOVEMENT_LEFT
	db -1 ; end

CinnabarGymGetOpponentTextScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, [wOpponentAfterWrongAnswer]
	ld [wTrainerHeaderFlagBit], a
	ldh [hTextID], a
	jp DisplayTextID

CinnabarGymFlagAction:
	predef_jump FlagActionPredef

CinnabarGymOpenGateScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymResetScripts
	ld a, [wTrainerHeaderFlagBit]
	ldh [hGymGateIndex], a
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_TEST
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	call CinnabarGymFlagAction
	ld a, c
	and a
	jr nz, .no_sound
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
.no_sound
	ld a, [wTrainerHeaderFlagBit]
	ldh [hGymGateIndex], a
	AdjustEventBit EVENT_BEAT_CINNABAR_GYM_TRAINER_0, 2
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	call CinnabarGymFlagAction
	ld a, [wTrainerHeaderFlagBit]
	sub $2
	AdjustEventBit EVENT_CINNABAR_GYM_GATE0_UNLOCKED, 0
	ld c, a
	ld b, FLAG_SET
	EventFlagAddress hl, EVENT_CINNABAR_GYM_GATE0_UNLOCKED
	call CinnabarGymFlagAction
	call UpdateCinnabarGymGateTileBlocks
	xor a
	ld [wJoyIgnore], a
	ld [wOpponentAfterWrongAnswer], a
	ld a, SCRIPT_CINNABARGYM_DEFAULT
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	ret

CinnabarGymBlainePostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CinnabarGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
; fallthrough
CinnabarGymReceiveTM38:
	ld a, TEXT_CINNABARGYM_BLAINE_VOLCANO_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BLAINE
	lb bc, TM_FIRE_BLAST, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_CINNABARGYM_BLAINE_RECEIVED_TM38
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM38
	jr .gymVictory
.BagFull
	ld a, TEXT_CINNABARGYM_BLAINE_TM38_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_VOLCANOBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_VOLCANOBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CINNABAR_GYM_TRAINER_0, EVENT_BEAT_CINNABAR_GYM_TRAINER_6

	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]

	jp CinnabarGymResetScripts

CinnabarGym_TextPointers:
	def_text_pointers
	dw_const CinnabarGymBlaineText,                 TEXT_CINNABARGYM_BLAINE
	dw_const CinnabarGymSuperNerd1,                 TEXT_CINNABARGYM_SUPER_NERD1
	dw_const CinnabarGymSuperNerd2,                 TEXT_CINNABARGYM_SUPER_NERD2
	dw_const CinnabarGymSuperNerd3,                 TEXT_CINNABARGYM_SUPER_NERD3
	dw_const CinnabarGymSuperNerd4,                 TEXT_CINNABARGYM_SUPER_NERD4
	dw_const CinnabarGymSuperNerd5,                 TEXT_CINNABARGYM_SUPER_NERD5
	dw_const CinnabarGymSuperNerd6,                 TEXT_CINNABARGYM_SUPER_NERD6
	dw_const CinnabarGymSuperNerd7,                 TEXT_CINNABARGYM_SUPER_NERD7
	dw_const CinnabarGymGymGuideText,               TEXT_CINNABARGYM_GYM_GUIDE
	dw_const CinnabarGymBlaineVolcanoBadgeInfoText, TEXT_CINNABARGYM_BLAINE_VOLCANO_BADGE_INFO
	dw_const CinnabarGymBlaineReceivedTM38Text,     TEXT_CINNABARGYM_BLAINE_RECEIVED_TM38
	dw_const CinnabarGymBlaineTM38NoRoomText,       TEXT_CINNABARGYM_BLAINE_TM38_NO_ROOM

CinnabarGymStartBattleScript:
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld a, [wSpriteIndex]
	cp CINNABARGYM_BLAINE
	jr z, .blaine
	ld a, SCRIPT_CINNABARGYM_OPEN_GATE
	jr .not_blaine
.blaine
	ld a, SCRIPT_CINNABARGYM_BLAINE_POST_BATTLE
.not_blaine
	ld [wCinnabarGymCurScript], a
	ld [wCurMapScript], a
	jp TextScriptEnd

CinnabarGymBlaineText:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM38
	jr nz, .afterBeat
	call z, CinnabarGymReceiveTM38
	call DisableWaitingAfterTextDisplay
	jp TextScriptEnd
.afterBeat
	ld hl, .PostBattleAdviceText
	call PrintText
	jp TextScriptEnd
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, .ReceivedVolcanoBadgeText
	ld de, .ReceivedVolcanoBadgeText
	call SaveEndBattleTextPointers
	ld a, $7
	ld [wGymLeaderNo], a
	jp CinnabarGymStartBattleScript

.PreBattleText:
	text "UOO-SU! FIRE!"

	para "I AM BURNING MAN·"
	line "KATSURA BLAINE OF"
	cont "GUREN ISLAND GYM!"

	para "MY # ARE TOUGH"
	line "WARRIORS THAT"
	cont "SCORCH AND BURN"
	cont "ALL TO CINDERS!"

	para "UOO-SU! ARE YOUR"
	line "BURN HEALS READY?"
	done

.ReceivedVolcanoBadgeText:
	text "BURNT TO ASHES!"

	para "CRIMSON BADGE IS"
	line "TRULY YOURS!@"
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_waitbutton
	text_end

.PostBattleAdviceText:
	text "PEOPLE CALL THIS"
	line "DAIMONJI-YAKI·"
	cont "BUT THAT IS WRONG"

	para "IN KYOTO·IT IS"
	line "DAIMONJI OR"
	cont "OKURIBI BONFIRE!"
	done

CinnabarGymBlaineVolcanoBadgeInfoText:
	text "UOOSU!"

	para "CRIMSON BADGE"
	line "BOOSTS THE"
	cont "SPECIAL STAT OF"
	cont "YOUR #!"

	para "TAKE THIS <TM>!"
	done

CinnabarGymBlaineReceivedTM38Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text " FROM"
	cont "KATSURA!@"
	sound_get_item_1
	text_start

	para "<TM>38 IS BURNING"
	line "ULTIMATE MOVE:"
	cont "DAIMONJI FIRE!"

	para "TEACH IT TO A"
	line "FIRE MON LIKE"
	cont "ROKON OR LIZARD!"
	done

CinnabarGymBlaineTM38NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done


CinnabarGymSuperNerd1:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_0
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "DO YOU KNOW HOW"
	line "HOT A #S"
	cont "FIRE BREATH IS?"
	done

.EndBattleText:
	text "<⋯>OUCH! BURNT!"
	prompt

.AfterBattleText:
	text "BURNING MEANS"
	line "OXYGEN IN AIR<⋯>"

	para "MUNYA-MUNYA<⋯>"
	line "MUTTER MUTTER<⋯>"
	done

CinnabarGymSuperNerd2:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_1
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "I AM A BURGLAR"
	line "DOROBOU·BUT I"
	cont "WASHED MY HANDS"
	cont "FOR # TRAINING!"
	done

.EndBattleText:
	text "I SURRENDER!"
	prompt

.AfterBattleText:
	text "WHEN I SEE OTHERS"
	line "#·I JUST WANT"
	cont "TO STEAL THEM!"
	done

CinnabarGymSuperNerd3:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_2
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "CAN YOU BEAT ME?"
	line "I RESEARCHED #"
	cont "INSIDE AND OUT!"
	done

.EndBattleText:
	text "<⋯>! MUST STUDY"
	line "EVEN HARDER!"
	prompt

.AfterBattleText:
	text "COMPLICATED TALK"
	line "IS BEYOND YOUR"
	cont "UNDERSTANDING!"
	done

CinnabarGymSuperNerd4:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_3
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "I JUST USE FIRE"
	line "# BECAUSE I"
	cont "FEEL LIKE IT!"
	done

.EndBattleText:
	text "<⋯>BURNT OUT!"
	prompt

.AfterBattleText:
	text "MY DREAM<⋯>?"

	para "IF A THIEF MON"
	line "EXISTED·I WOULD"
	cont "LOVE TO USE IT!"
	done


CinnabarGymSuperNerd5:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_4
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "I KNOW WHY BLAINE"
	line "KATSURA STARTED"
	cont "RAISING #!"
	done

.EndBattleText:
	text "OH DEAR ME!"
	prompt

.AfterBattleText:
	text "LEADER KATSURA"
	line "WAS STRANDED ON"
	cont "A COLD MOUNTAIN!"

	para "A FIRE BIRD #"
	line "LIT THE DARK PATH"
	cont "AND GUIDED HIM!"

	para "THANKS TO THAT·"
	line "KATSURA ESCAPED"
	cont "SAFELY DOWN!"
	done

CinnabarGymSuperNerd6:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_5
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "I WENT TO MANY"
	line "GYMS·BUT THIS"
	cont "ONE SUITS ME!"
	done

.EndBattleText:
	text "AH·TOO HOT!"
	prompt

.AfterBattleText:
	text "PONYTA·GALLOP"
	line "AND KYUUKON ARE"
	cont "POPULAR FIRE #!"
	done

CinnabarGymSuperNerd7:
	text_asm
	call CinnabarGymSetTrainerHeader
	CheckEvent EVENT_BEAT_CINNABAR_GYM_TRAINER_6
	jr nz, .defeated
	ld hl, .BattleText
	call PrintText
	ld hl, .EndBattleText
	ld de, .EndBattleText
	call SaveEndBattleTextPointers
	jp CinnabarGymStartBattleScript
.defeated
	ld hl, .AfterBattleText
	call PrintText
	jp TextScriptEnd

.BattleText:
	text "WEAKNESS OF FIRE"
	line "IS SAID TO BE"
	cont "H-2-O WATER!"
	done

.EndBattleText:
	text "EXHAUSTED<⋯>"
	prompt

.AfterBattleText:
	text "FIRE IS WEAK TO"
	line "WATER·BUT STRONG"
	cont "AGAINST ICE AS IT"
	cont "MELTS IT DOWN!"
	done

CinnabarGymGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .afterBeat
	ld hl, .ChampInMakingText
	jr .done
.afterBeat
	ld hl, .BeatBlaineText
.done
	call PrintText
	jp TextScriptEnd

.ChampInMakingText:
	text "YO! FUTURE"
	line "CHAMPION!"

	para "HOT KATSURA IS"
	line "A PROFESSIONAL"
	cont "FIRE MASTER!"

	para "SO STAY COOL AND"
	line "CRUSH WITH WATER!"

	para "BETTER BRING"
	line "BURN HEALS TOO!"
	done

.BeatBlaineText:
	text "<PLAYER>! YOU"
	line "WON! THAT OLD MAN"
	cont "WAS SWELTERING"
	cont "HOT!"
	done

