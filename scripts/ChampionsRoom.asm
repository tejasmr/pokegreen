ChampionsRoom_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ChampionsRoom_ScriptPointers
	ld a, [wChampionsRoomCurScript]
	jp CallFunctionInTable

ResetRivalScript:
	xor a ; SCRIPT_CHAMPIONSROOM_DEFAULT
	ld [wJoyIgnore], a
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoom_ScriptPointers:
	def_script_pointers
	dw_const ChampionsRoomDefaultScript,                  SCRIPT_CHAMPIONSROOM_DEFAULT
	dw_const ChampionsRoomPlayerEntersScript,             SCRIPT_CHAMPIONSROOM_PLAYER_ENTERS
	dw_const ChampionsRoomRivalReadyToBattleScript,       SCRIPT_CHAMPIONSROOM_RIVAL_READY_TO_BATTLE
	dw_const ChampionsRoomRivalDefeatedScript,            SCRIPT_CHAMPIONSROOM_RIVAL_DEFEATED
	dw_const ChampionsRoomOakArrivesScript,               SCRIPT_CHAMPIONSROOM_OAK_ARRIVES
	dw_const ChampionsRoomOakCongratulatesPlayerScript,   SCRIPT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	dw_const ChampionsRoomOakDisappointedWithRivalScript, SCRIPT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	dw_const ChampionsRoomOakComeWithMeScript,            SCRIPT_CHAMPIONSROOM_OAK_COME_WITH_ME
	dw_const ChampionsRoomOakExitsScript,                 SCRIPT_CHAMPIONSROOM_OAK_EXITS
	dw_const ChampionsRoomPlayerFollowsOakScript,         SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_OAK
	dw_const ChampionsRoomCleanupScript,                  SCRIPT_CHAMPIONSROOM_CLEANUP_SCRIPT

ChampionsRoomDefaultScript:
	ret

ChampionsRoomPlayerEntersScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RivalEntrance_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_READY_TO_BATTLE
	ld [wChampionsRoomCurScript], a
	ret

RivalEntrance_RLEMovement:
	db PAD_UP, 1
	db PAD_RIGHT, 1
	db PAD_UP, 3
	db -1 ; end

ChampionsRoomRivalReadyToBattleScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld hl, wOptions
	res BIT_BATTLE_ANIMATION, [hl]
	ld a, TEXT_CHAMPIONSROOM_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, RivalDefeatedText
	ld de, RivalVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL3
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotStarter2
	ld a, $1
	jr .saveTrainerId
.NotStarter2
	cp STARTER3
	jr nz, .NotStarter3
	ld a, $2
	jr .saveTrainerId
.NotStarter3
	ld a, $3
.saveTrainerId
	ld [wTrainerNo], a

	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_CHAMPIONSROOM_RIVAL_DEFEATED
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomRivalDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetRivalScript
	call UpdateSprites
	SetEvent EVENT_BEAT_CHAMPION_RIVAL
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_CHAMPIONSROOM_RIVAL
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, SCRIPT_CHAMPIONSROOM_OAK_ARRIVES
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakArrivesScript:
	farcall Music_Cities1AlternateTempo
	ld a, TEXT_CHAMPIONSROOM_OAK
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, OakEntranceAfterVictoryMovement
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, TOGGLE_CHAMPIONS_ROOM_OAK
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld a, SCRIPT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	ld [wChampionsRoomCurScript], a
	ret

OakEntranceAfterVictoryMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

ChampionsRoomOakCongratulatesPlayerScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, PLAYER_DIR_LEFT
	ld [wPlayerMovingDirection], a
	ld a, CHAMPIONSROOM_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, SCRIPT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakDisappointedWithRivalScript:
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld a, SCRIPT_CHAMPIONSROOM_OAK_COME_WITH_ME
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomOakComeWithMeScript:
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_CHAMPIONSROOM_OAK_COME_WITH_ME
	ldh [hTextID], a
	call ChampionsRoom_DisplayTextID_AllowABSelectStart
	ld de, OakExitChampionsRoomMovement
	ld a, CHAMPIONSROOM_OAK
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CHAMPIONSROOM_OAK_EXITS
	ld [wChampionsRoomCurScript], a
	ret

OakExitChampionsRoomMovement:
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

ChampionsRoomOakExitsScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, TOGGLE_CHAMPIONS_ROOM_OAK
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_CHAMPIONSROOM_PLAYER_FOLLOWS_OAK
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoomPlayerFollowsOakScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, WalkToHallOfFame_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_CHAMPIONSROOM_CLEANUP_SCRIPT
	ld [wChampionsRoomCurScript], a
	ret

WalkToHallOfFame_RLEMovement:
	db PAD_UP, 4
	db PAD_LEFT, 1
	db -1 ; end

ChampionsRoomCleanupScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, SCRIPT_CHAMPIONSROOM_DEFAULT
	ld [wChampionsRoomCurScript], a
	ret

ChampionsRoom_DisplayTextID_AllowABSelectStart:
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	call DisplayTextID
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ret

ChampionsRoom_TextPointers:
	def_text_pointers
	dw_const ChampionsRoomRivalText,                    TEXT_CHAMPIONSROOM_RIVAL
	dw_const ChampionsRoomOakText,                      TEXT_CHAMPIONSROOM_OAK
	dw_const ChampionsRoomOakCongratulatesPlayerText,   TEXT_CHAMPIONSROOM_OAK_CONGRATULATES_PLAYER
	dw_const ChampionsRoomOakDisappointedWithRivalText, TEXT_CHAMPIONSROOM_OAK_DISAPPOINTED_WITH_RIVAL
	dw_const ChampionsRoomOakComeWithMeText,            TEXT_CHAMPIONSROOM_OAK_COME_WITH_ME

ChampionsRoomRivalText:
	text_asm
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	ld hl, .IntroText
	jr z, .printText
	ld hl, ChampionsRoomRivalAfterBattleText
.printText
	call PrintText
	jp TextScriptEnd

.IntroText:
	text "<RIVAL>『YO-ッ！"
	line "YOU CAME TOO·"
	cont "<PLAYER>！"
	cont "<⋯>HA-HA·GLAD！"

	para "IF MY RIVAL IS"
	line "WEAK·NO RIVALRY"
	cont "THRILL AT ALL！"

	para "WHILE GATHERING"
	line "『# ZUKAN』·I"
	cont "SOUGHT PERFECT"
	cont "# TEAMMATES！"

	para "I SOUGHT COMBOS"
	line "THAT OVERWHELM"
	cont "ANY TYPE OF #！"

	para "<⋯>AND RIGHT NOW！"

	para "I STAND AT THE"
	line "PEAK APEX OF"
	cont "# LEAGUE！"

	para "<PLAYER>！"
	line "DO YOU KNOW WHAT"
	cont "THIS MEANS？"

	para "<⋯><⋯><⋯>"
	line "<⋯>FINE！ I WILL"
	cont "TEACH IT TO YOU！"

	para "IT MEANS THIS"
	line "GREAT ME IS THE"
	cont "STRONGEST IN THE"
	cont "WHOLE WORLD！"
	done

RivalDefeatedText:
	text "<⋯>IMPOSSIBLE！"
	line "IS IT REALLY"
	cont "OVER NOW？！"
	cont "I PUT ALL MY"
	cont "MIGHT YET LOST！"

	para "I FINALLY REACHED"
	line "THE APEX OF THE"
	cont "# LEAGUE！"

	para "ALREADY<⋯>！"
	line "MY REIGN UNDER"
	cont "HEAVEN IS OVER？！"
	cont "<⋯>NO WAY MAN！"
	prompt

RivalVictoryText:
	text "HAA-HAッ！"
	line "I WON！ WON！ WON！"

	para "<PLAYER> CAN NEVER"
	line "DEFEAT GREAT ME！"

	para "WELL！ AGAINST"
	line "GENIUS <RIVAL>·"
	cont "YOU FOUGHT WELL"
	cont "TO REACH HERE！"

	para "I PRAISE THEE！"
	line "HAAッ！ HA-HA-HAッ！"
	prompt

ChampionsRoomRivalAfterBattleText:
	text "WHY<⋯>"
	line "WHY DID I LOSE<⋯>"

	para "MY METHOD OF"
	line "RAISING #<⋯>"
	cont "WAS NOT WRONG<⋯>"

	para "CANT BE HELPED<⋯>"
	line "YOU ARE NEW #"
	cont "LEAGUE CHAMP<⋯>！"

	para "<⋯><⋯><⋯>"
	line "<⋯>HATE TO ADMIT"
	cont "IT THOUGH<⋯>"
	done

ChampionsRoomOakText:
	text "OOKIDO『<PLAYER>！"
	done

ChampionsRoomOakCongratulatesPlayerText:
	text_asm
	ld a, [wPlayerStarter]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "OOKIDO『YOU WON"
	line "AT LONG LAST！"

	para "# LEAGUE WIN！"
	line "CONGRATULATIONS"
	cont "FROM MY HEART！"

	para "SINCE RECEIVING"
	line "@"
	text_ram wNameBuffer
	text ""

	para "AND DEPARTING FOR"
	line "『# ZUKAN』·YOU"
	cont "GREW SO ROBUST！"

	para "<⋯>NO·TRULY！"
	line "<PLAYER> HAS GROWN"
	cont "INTO AN ADULT！"
	done

ChampionsRoomOakDisappointedWithRivalText:
	text "OOKIDO『<RIVAL><⋯>！"
	line "<⋯>DISAPPOINTING！"

	para "HEARING YOU WON"
	line "OVER『SHITENNO』·"
	cont "I FLEW OVER HERE！"

	para "YET ARRIVING AT"
	line "# LEAGUE·YOU"
	cont "WERE DEFEATED！"

	para "<RIVAL><⋯>！"
	line "DO YOU KNOW WHY"
	cont "YOU LOST THIS？"

	para "<⋯><⋯><⋯>"

	para "BECAUSE YOU HAVE"
	line "FORGOTTEN TRUST"
	cont "AND AFFECTION"
	cont "TOWARD YOUR #！"

	para "LIKE THAT·NO"
	line "MATTER HOW HARD"
	cont "YOU TRY·YOU CANT"
	cont "STAND AT TOP！"
	done

ChampionsRoomOakComeWithMeText:
	text "OOKIDO『<PLAYER>！"

	para "CONQUERING THE"
	line "# LEAGUE WAS"
	cont "NOT POWER OF ONE"
	cont "PERSON ALONE<⋯>"

	para "YOU UNDERSTAND"
	line "THIS WELL！"

	para "<PLAYER> AND #"
	line "SUPERB COMBOS！"
	cont "MAGNIFICENT WORK！"

	para "NOW THEN<⋯>"
	line "<PLAYER>！"

	para "COME FOLLOW ME！"
	done
