LoreleisRoom_Script:
	call LoreleiShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, LoreleisRoom_TrainerHeaders
	ld de, LoreleisRoom_ScriptPointers
	ld a, [wLoreleisRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wLoreleisRoomCurScript], a
	ret

LoreleiShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, wElite4Flags
	set BIT_STARTED_ELITE_4, [hl]
	CheckEvent EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $5
	jr .setExitBlock
.blockExitToNextRoom
	ld a, $24
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetLoreleiScript:
	xor a ; SCRIPT_LORELEISROOM_DEFAULT
	ld [wLoreleisRoomCurScript], a
	ret

LoreleisRoom_ScriptPointers:
	def_script_pointers
	dw_const LoreleisRoomDefaultScript,             SCRIPT_LORELEISROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_LORELEISROOM_LORELEI_START_BATTLE
	dw_const LoreleisRoomLoreleiEndBattleScript,    SCRIPT_LORELEISROOM_LORELEI_END_BATTLE
	dw_const LoreleisRoomPlayerIsMovingScript,      SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	dw_const LoreleisRoomNoopScript,                SCRIPT_LORELEISROOM_NOOP

LoreleisRoomNoopScript:
	ret

LoreleiScriptWalkIntoRoom:
; Walk six steps upward.
	ld hl, wSimulatedJoypadStatesEnd
	ld a, PAD_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleisRoomDefaultScript:
	ld hl, LoreleiEntranceCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing one tile above the exit?
	jr c, .stopPlayerFromLeaving
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_LORELEIS_ROOM
	jr z, LoreleiScriptWalkIntoRoom
.stopPlayerFromLeaving
	ld a, TEXT_LORELEISROOM_DONT_RUN_AWAY
	ldh [hTextID], a
	call DisplayTextID  ; "Don't run away!"
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleiEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

LoreleisRoomPlayerIsMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleisRoomLoreleiEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetLoreleiScript
	ld a, TEXT_LORELEISROOM_LORELEI
	ldh [hTextID], a
	jp DisplayTextID

LoreleisRoom_TextPointers:
	def_text_pointers
	dw_const LoreleisRoomLoreleiText,            TEXT_LORELEISROOM_LORELEI
	dw_const LoreleisRoomLoreleiDontRunAwayText, TEXT_LORELEISROOM_DONT_RUN_AWAY

	def_trainers LoreleisRoom
	trainer EVENT_BEAT_LORELEIS_ROOM_TRAINER_0, 0, Lorelei
	db -1 ; end

LoreleisRoomLoreleiText:
	text_asm
	ld hl, LoreleisRoom_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LoreleisRoomLoreleiBattleText:
	text "WELCOME TO"
	line "# LEAGUE！"

	para "I AM『KANNA』OF"
	line "THE『SHITENNO』！"

	para "NO ONE CAN MATCH"
	line "MY『KOORI』#！"

	para "FREEZING FOE IS"
	line "TERRIFICALLY"
	cont "POWERFUL！"

	para "BECAUSE FROZEN"
	line "MEANS YOUR #"
	cont "CANNOT MOVE AT"
	cont "ALL！"

	para "<⋯>AHAHAッ！"
	line "ARE YOU READY！"
	done

LoreleisRoomLoreleiEndBattleText:
	text "<⋯>WHAT A GUY！"
	prompt

LoreleisRoomLoreleiAfterBattleText:
	text "SEEMS YOU CAN DO"
	line "A LITTLE BIT！"

	para "UNDERSTOOD<⋯>！"
	line "GO FORTH TO THE"
	cont "NEXT ROOM NOW！"

	para "TRUE POWER OF"
	line "# LEAGUE IS"
	cont "NOT JUST THIS！"
	cont "FAR FROM IT<⋯>！"
	done

LoreleisRoomLoreleiDontRunAwayText:
	text "SOMEONES VOICE IS"
	line "HEARD<⋯>"
	cont "「DO NOT FLEE！」"
	done
