ViridianGym_Script:
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	call EnableAutoTextBoxDrawing
	ld hl, ViridianGym_TrainerHeaders
	ld de, ViridianGym_ScriptPointers
	ld a, [wViridianGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianGymCurScript], a
	ret

.CityName:
	db "TOKIWA@"

.LeaderName:
	db "SAKAKI@"

ViridianGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wViridianGymCurScript], a
	ld [wCurMapScript], a
	ret

ViridianGym_ScriptPointers:
	def_script_pointers
	dw_const ViridianGymDefaultScript,              SCRIPT_VIRIDIANGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANGYM_END_BATTLE
	dw_const ViridianGymGiovanniPostBattle,         SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE
	dw_const ViridianGymPlayerSpinningScript,       SCRIPT_VIRIDIANGYM_PLAYER_SPINNING

ViridianGymDefaultScript:
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	ld hl, ViridianGymArrowTilePlayerMovement
	call DecodeArrowMovementRLE
	cp $ff
	jp z, CheckFightingMapTrainers
	call StartSimulatingJoypadStates
	ld hl, wMovementFlags
	set BIT_SPINNING, [hl]
	ld a, SFX_ARROW_TILES
	call PlaySound
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, SCRIPT_VIRIDIANGYM_PLAYER_SPINNING
	ld [wCurMapScript], a
	ret

ViridianGymArrowTilePlayerMovement:
	map_coord_movement 19, 11, ViridianGymArrowMovement1
	map_coord_movement 19,  1, ViridianGymArrowMovement2
	map_coord_movement 18,  2, ViridianGymArrowMovement3
	map_coord_movement 11,  2, ViridianGymArrowMovement4
	map_coord_movement 16, 10, ViridianGymArrowMovement5
	map_coord_movement  4,  6, ViridianGymArrowMovement6
	map_coord_movement  5, 13, ViridianGymArrowMovement7
	map_coord_movement  4, 14, ViridianGymArrowMovement8
	map_coord_movement  0, 15, ViridianGymArrowMovement9
	map_coord_movement  1, 15, ViridianGymArrowMovement10
	map_coord_movement 13, 16, ViridianGymArrowMovement11
	map_coord_movement 13, 17, ViridianGymArrowMovement12
	db -1 ; end

ViridianGymArrowMovement1:
	db PAD_UP, 9
	db -1 ; end

ViridianGymArrowMovement2:
	db PAD_LEFT, 8
	db -1 ; end

ViridianGymArrowMovement3:
	db PAD_DOWN, 9
	db -1 ; end

ViridianGymArrowMovement4:
	db PAD_RIGHT, 6
	db -1 ; end

ViridianGymArrowMovement5:
	db PAD_DOWN, 2
	db -1 ; end

ViridianGymArrowMovement6:
	db PAD_DOWN, 7
	db -1 ; end

ViridianGymArrowMovement7:
	db PAD_RIGHT, 8
	db -1 ; end

ViridianGymArrowMovement8:
	db PAD_RIGHT, 9
	db -1 ; end

ViridianGymArrowMovement9:
	db PAD_UP, 8
	db -1 ; end

ViridianGymArrowMovement10:
	db PAD_UP, 6
	db -1 ; end

ViridianGymArrowMovement11:
	db PAD_LEFT, 6
	db -1 ; end

ViridianGymArrowMovement12:
	db PAD_LEFT, 12
	db -1 ; end

ViridianGymPlayerSpinningScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	jr nz, .ViridianGymLoadSpinnerArrow
	xor a
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	res BIT_SPINNING, [hl]
	ld a, SCRIPT_VIRIDIANGYM_DEFAULT
	ld [wCurMapScript], a
	ret
.ViridianGymLoadSpinnerArrow
	farjp LoadSpinnerArrowTiles

ViridianGymGiovanniPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ViridianGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
; fallthrough
ViridianGymReceiveTM27:
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	lb bc, TM_FISSURE, 1
	call GiveItem
	jr nc, .bag_full
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM27
	jr .gym_victory
.bag_full
	ld a, TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gym_victory
	ld hl, wObtainedBadges
	set BIT_EARTHBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_EARTHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7

	ld a, TOGGLE_ROUTE_22_RIVAL_2
	ld [wToggleableObjectIndex], a
	predef ShowObject
	SetEvents EVENT_2ND_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE
	jp ViridianGymResetScripts

ViridianGym_TextPointers:
	def_text_pointers
	dw_const ViridianGymGiovanniText,               TEXT_VIRIDIANGYM_GIOVANNI
	dw_const ViridianGymCooltrainerM1Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M1
	dw_const ViridianGymHiker1Text,                 TEXT_VIRIDIANGYM_HIKER1
	dw_const ViridianGymRocker1Text,                TEXT_VIRIDIANGYM_ROCKER1
	dw_const ViridianGymHiker2Text,                 TEXT_VIRIDIANGYM_HIKER2
	dw_const ViridianGymCooltrainerM2Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M2
	dw_const ViridianGymHiker3Text,                 TEXT_VIRIDIANGYM_HIKER3
	dw_const ViridianGymRocker2Text,                TEXT_VIRIDIANGYM_ROCKER2
	dw_const ViridianGymCooltrainerM3Text,          TEXT_VIRIDIANGYM_COOLTRAINER_M3
	dw_const ViridianGymGymGuideText,               TEXT_VIRIDIANGYM_GYM_GUIDE
	dw_const PickUpItemText,                        TEXT_VIRIDIANGYM_REVIVE
	dw_const ViridianGymGiovanniEarthBadgeInfoText, TEXT_VIRIDIANGYM_GIOVANNI_EARTH_BADGE_INFO
	dw_const ViridianGymGiovanniReceivedTM27Text,   TEXT_VIRIDIANGYM_GIOVANNI_RECEIVED_TM27
	dw_const ViridianGymGiovanniTM27NoRoomText,     TEXT_VIRIDIANGYM_GIOVANNI_TM27_NO_ROOM

	def_trainers ViridianGym, 2
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_0, 4, CooltrainerM1
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_1, 4, Hiker1
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_2, 4, Rocker1
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_3, 2, Hiker2
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_4, 3, CooltrainerM2
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_5, 4, Hiker3
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_6, 3, Rocker2
	trainer EVENT_BEAT_VIRIDIAN_GYM_TRAINER_7, 4, CooltrainerM3
	db -1 ; end

ViridianGymGiovanniText:
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM27
	jr nz, .afterBeat
	call z, ViridianGymReceiveTM27
	call DisableWaitingAfterTextDisplay
	jr .text_script_end
.afterBeat
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .PostBattleAdviceText
	call PrintText
	call GBFadeOutToBlack
	ld a, TOGGLE_VIRIDIAN_GYM_GIOVANNI
	ld [wToggleableObjectIndex], a
	predef HideObject
	call UpdateSprites
	call Delay3
	call GBFadeInFromBlack
	jr .text_script_end
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedEarthBadgeText
	ld de, .ReceivedEarthBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $8
	ld [wGymLeaderNo], a
	ld a, SCRIPT_VIRIDIANGYM_GIOVANNI_POST_BATTLE
	ld [wViridianGymCurScript], a
.text_script_end
	jp TextScriptEnd

.PreBattleText:
	text "FUAHAHAHA-T!"
	line "THIS IS MY"
	cont "SECRET HIDEOUT!"

	para "UNTIL REVIVAL"
	line "OF TEAM ROCKET·"
	cont "I REBUILD FORCES"
	cont "IN THIS GYM!"

	para "HOWEVER⋯ FOUND"
	line "OUT BY YOU NOW"
	cont "CANNOT BE HELPED!"
	cont "NO MERCY TODAY!"
	cont "NOW THEN⋯"

	para "ONCE AGAIN!"
	line "BEHOLD SAKAKI·"
	cont "THE STRONGEST"
	cont "<TRAINER> IN POWER!"
	done

.ReceivedEarthBadgeText:
	text "HA⋯ HA-T!"
	line "A FIERCE BATTLE!"
	cont "YOU WON!"
	cont "AS PROOF⋯ TAKE"
	cont "GREEN BADGE!@"
	sound_level_up ; probably supposed to play SFX_GET_ITEM_1 but the wrong music bank is loaded
	text_end

.PostBattleAdviceText:
	text "LOSING LIKE THIS·"
	line "CANNOT SHOW FACE"
	cont "TO MY MEN!"
	cont "TEAM ROCKET⋯"
	cont "DISBAND AS OF"
	cont "THIS VERY DAY!"

	para "AS FOR MYSELF·"
	line "TRAINING # FROM"
	cont "SQUARE ONE AGAIN!"

	para "SOMEDAY⋯"
	line "LET US MEET!"
	cont "⋯FAREWELL!@"
	text_waitbutton
	text_end

ViridianGymGiovanniEarthBadgeInfoText:
	text "WITH GREEN BADGE·"
	line "ANY HIGH <LV> #"
	cont "OBEYS ALL ORDERS!"

	para "PROOF YOU BECAME"
	line "A FULL-FLEDGED"
	cont "<TRAINER> AT LAST!"

	para "NOW YOU CAN GO"
	line "CHALLENGE THE"
	cont "# LEAGUE!"

	para "THIS <TM> IS⋯!"
	line "A PARTING GIFT"
	cont "FOR YOUR QUEST"
	cont "TO # LEAGUE!"
	done

ViridianGymGiovanniReceivedTM27Text:
	text "<PLAYER> GOT"
	line "<TM>27 SAKAKI GAVE!@"
	sound_get_item_1
	text_start

	para "<TM>27 IS JIGOKU"
	line "FISSURE! FOES"
	cont "FALLING INSIDE"
	cont "GO DOWN IN 1 HIT!"
	cont "STRONGEST MOVE!"

	para "LONG AGO⋯ WHEN"
	line "I RAN THIS GYM·"
	cont "I INVENTED IT⋯"
	done

ViridianGymGiovanniTM27NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done

ViridianGymCooltrainerM1Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymCooltrainerM1BattleText:
	text "⋯WELL NOW!"
	line "ARE YOU GETTING"
	cont "TIRED OUT YET?"
	done

ViridianGymCooltrainerM1EndBattleText:
	text "⋯POWER OUT!"
	prompt

ViridianGymCooltrainerM1AfterBattleText:
	text "WITHOUT STAMINA·"
	line "NO CHANCE AGAINST"
	cont "OUR GYM LEADER!"
	done

ViridianGymHiker1Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymHiker1BattleText:
	text "UOO-T!"
	line "MY WRATH HAS"
	cont "REACHED PEAK-T!"
	done

ViridianGymHiker1EndBattleText:
	text "NUOO-T!"
	prompt

ViridianGymHiker1AfterBattleText:
	text "UOO-SSU!"
	line "STILL NOT ENOUGH"
	cont "PRACTICE-SSU!"
	done

ViridianGymRocker1Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymRocker1BattleText:
	text "ME AND MY #"
	line "COMBINATION IS"
	cont "PREEMINENT!"
	done

ViridianGymRocker1EndBattleText:
	text "⋯YOU AND YOUR"
	line "# ARE IN SYNC!"
	prompt

ViridianGymRocker1AfterBattleText:
	text "DO YOU EVEN KNOW"
	line "WHO OUR LEADER"
	cont "REALLY IS⋯?"
	done

ViridianGymHiker2Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymHiker2BattleText:
	text "KARATE IS INDEED"
	line "WORLDS STRONGEST"
	cont "FIGHTING ART!"
	done

ViridianGymHiker2EndBattleText:
	text "CHEEESTO-!"
	prompt

ViridianGymHiker2AfterBattleText:
	text "WIIOSSU!"
	line "IF ONLY # COULD"
	cont "DO KARATE LIKE"
	cont "ME⋯"
	done

ViridianGymCooltrainerM2Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymCooltrainerM2BattleText:
	text "TRULY STRONG"
	line "<TRAINER> WINS"
	cont "BEAUTIFULLY!"
	done

ViridianGymCooltrainerM2EndBattleText:
	text "MY HAND SLIPPED⋯!"
	prompt

ViridianGymCooltrainerM2AfterBattleText:
	text "LOSING LIKE THIS⋯"
	line "LEADER WILL BE"
	cont "ENRAGED AT ME!"
	done

ViridianGymHiker3Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymHiker3BattleText:
	text "KING OF KARATE!"
	line "NO PASSING PAST"
	cont "THIS POINT!"
	done

ViridianGymHiker3EndBattleText:
	text "DOSSEE-T!"
	prompt

ViridianGymHiker3AfterBattleText:
	text "WIISU!"
	line "AIMING FOR THE"
	cont "# LEAGUE?"
	cont "PRECOCIOUS KID!"
	done

ViridianGymRocker2Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymRocker2BattleText:
	text "CRACK! SNAP!"
	line "COME ON! DONT"
	cont "COWER IN FEAR!"
	done

ViridianGymRocker2EndBattleText:
	text "⋯OUCH OUCH OUCH!"
	prompt

ViridianGymRocker2AfterBattleText:
	text "HOLD ON! I JUST"
	line "LET MY GUARD"
	cont "DOWN A MOMENT!"
	done

ViridianGymCooltrainerM3Text:
	text_asm
	ld hl, ViridianGym_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

ViridianGymCooltrainerM3BattleText:
	text "TOKIWA GYM WAS"
	line "CLOSED LONG TIME·"
	cont "BUT LEADER IS"
	cont "BACK TODAY!"
	done

ViridianGymCooltrainerM3EndBattleText:
	text "⋯SPLENDID!"
	prompt

ViridianGymCooltrainerM3AfterBattleText:
	text "IF YOU CAN BEAT"
	line "TOKIWA LEADER·"
	cont "YOU ADVANCE TO"
	cont "# LEAGUE!"
	done

ViridianGymGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .afterBeat
	ld hl, ViridianGymGuidePreBattleText
	call PrintText
	jr .done
.afterBeat
	ld hl, ViridianGymGuidePostBattleText
	call PrintText
.done
	jp TextScriptEnd

ViridianGymGuidePreBattleText:
	text "YO! FUTURE"
	line "CHAMPION!"

	para "EVEN I DO NOT"
	line "KNOW IDENTITY OF"
	cont "TOKIWA LEADER!"

	para "FOR CERTAIN· HE"
	line "IS STRONGER THAN"
	cont "ANY LEADER YET!"

	para "AND ALSO⋯"
	line "SEEMS USERS OF"
	cont "GROUND TYPE #"
	cont "GATHER IN GYM!"
	done

ViridianGymGuidePostBattleText:
	text "BLOWN AWAY!"
	line "TOKIWA LEADER WAS"
	cont "SAKAKI HIMSELF!"
	done
