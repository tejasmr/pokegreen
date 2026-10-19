VermilionGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	push hl
	call nz, .LoadNames
	pop hl
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, VermilionGymSetDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, VermilionGym_TrainerHeaders
	ld de, VermilionGym_ScriptPointers
	ld a, [wVermilionGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVermilionGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "KUCHIBA@"

.LeaderName:
	db "MATIS@"

VermilionGymSetDoorTile:
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr nz, .doorsOpen
	ld a, $24 ; double door tile ID
	jr .replaceTile
.doorsOpen
	ld a, SFX_GO_INSIDE
	call PlaySound
	ld a, $5 ; clear floor tile ID
.replaceTile
	ld [wNewTileBlockID], a
	lb bc, 2, 2
	predef_jump ReplaceTileBlock

VermilionGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
	ret

VermilionGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_VERMILIONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VERMILIONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VERMILIONGYM_END_BATTLE
	dw_const VermilionGymLTSurgeAfterBattleScript,  SCRIPT_VERMILIONGYM_LT_SURGE_AFTER_BATTLE

VermilionGymLTSurgeAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff ; did we lose?
	jp z, VermilionGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

VermilionGymLTSurgeReceiveTM24Script:
	ld a, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_LT_SURGE
	lb bc, TM_THUNDERBOLT, 1
	call GiveItem
	jr nc, .bag_full
	ld a, TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM24
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM24
	jr .gym_victory
.bag_full
	ld a, TEXT_VERMILIONGYM_LT_SURGE_TM24_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gym_victory
	ld hl, wObtainedBadges
	set BIT_THUNDERBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_THUNDERBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_VERMILION_GYM_TRAINER_0, EVENT_BEAT_VERMILION_GYM_TRAINER_2

	jp VermilionGymResetScripts

VermilionGym_TextPointers:
	def_text_pointers
	dw_const VermilionGymLTSurgeText,                 TEXT_VERMILIONGYM_LT_SURGE
	dw_const VermilionGymGentlemanText,               TEXT_VERMILIONGYM_GENTLEMAN
	dw_const VermilionGymSuperNerdText,               TEXT_VERMILIONGYM_SUPER_NERD
	dw_const VermilionGymSailorText,                  TEXT_VERMILIONGYM_SAILOR
	dw_const VermilionGymGymGuideText,                TEXT_VERMILIONGYM_GYM_GUIDE
	dw_const VermilionGymLTSurgeThunderBadgeInfoText, TEXT_VERMILIONGYM_LT_SURGE_THUNDER_BADGE_INFO
	dw_const VermilionGymLTSurgeReceivedTM24Text,     TEXT_VERMILIONGYM_LT_SURGE_RECEIVED_TM24
	dw_const VermilionGymLTSurgeTM24NoRoomText,       TEXT_VERMILIONGYM_LT_SURGE_TM24_NO_ROOM

	def_trainers VermilionGym, 2
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_0, 3, Gentleman
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_1, 2, SuperNerd
	trainer EVENT_BEAT_VERMILION_GYM_TRAINER_2, 3, Sailor
	db -1 ; end

VermilionGymLTSurgeText:
	text_asm
	CheckEvent EVENT_BEAT_LT_SURGE
	jr z, .before_beat
	CheckEventReuseA EVENT_GOT_TM24
	jr nz, .got_tm24_already
	call z, VermilionGymLTSurgeReceiveTM24Script
	call DisableWaitingAfterTextDisplay
	jr .text_script_end
.got_tm24_already
	ld hl, .PostBattleAdviceText
	call PrintText
	jr .text_script_end
.before_beat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, VermilionGymLTSurgeReceivedThunderBadgeText
	ld de, VermilionGymLTSurgeReceivedThunderBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $3
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_VERMILIONGYM_LT_SURGE_AFTER_BATTLE
	ld [wVermilionGymCurScript], a
	ld [wCurMapScript], a
.text_script_end
	jp TextScriptEnd

.PreBattleText:
	text "HEY! YOU POOR"
	line "LITTLE BOY!"

	para "WITH HALF-BAKED"
	line "POWER· YOU CANT"
	cont "SURVIVE ON"
	cont "『SENJOU』!"

	para "THAT IS"
	line "BATTLEFIELD!"

	para "ME USED ELECTRIC"
	line "# IN WAR TO"
	cont "SURVIVE· YES!"

	para "EVERYONE GOT"
	line "『BIRIBIRI』!"
	cont "NUMBED BY SHOCK·"
	cont "CANT MOVE AT ALL!"

	para "YOU WILL GO DOWN"
	line "SAME ROAD FOR"
	cont "SURE NO DOUBT!"
	done

.PostBattleAdviceText:
	text "HEY! ADVICE"
	line "FOR YOU!"

	para "ELECTRIC POWER"
	line "IS 『BIRIBIRI』·"
	cont "SHOCKING STRONG!"

	para "BUT GROUND TYPE"
	line "SUCKS POWER UP!"
	cont "DOES NOT WORK"
	cont "AT ALL!"
	done

VermilionGymLTSurgeThunderBadgeInfoText:
	text "JUST HOLDING"
	line "ORANGE BADGE"
	cont "BOOSTS YOUR"
	cont "# SPEED!"

	para "AND! FLY MOVE"
	line "CAN BE USED OUT"
	cont "OF FIGHT TOO!"

	para "YOU ARE SPECIAL!"
	line "THIS IS FROM"
	cont "ME HEART!"
	done

VermilionGymLTSurgeReceivedTM24Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!"
	sound_get_key_item
	text_start

	para "<TM>24 TEACHES"
	line "『10MAN BORUTO』!"
	cont "100000 VOLTS!"

	para "TEACH IT TO"
	line "ELECTRIC #·"
	cont "PLEASE DO!"
	done

VermilionGymLTSurgeTM24NoRoomText:
	text "FULL OF YOUR"
	line "PACK! YOU CANT"
	cont "HOLD ANY MORE!"
	done

VermilionGymLTSurgeReceivedThunderBadgeText:
	text "OH NO!"

	para "YOUR POWER IS"
	line "『HONMONO』!"
	cont "THE REAL DEAL!"

	para "OK! TAKE THIS"
	line "ORANGE BADGE!"
	prompt

VermilionGymGentlemanText:
	text_asm
	ld hl, VermilionGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymGentlemanBattleText:
	text "WHEN IN ARMY·"
	line "LT.SURGE TRAINED"
	cont "US 『BISHIBISHI』!"
	cont "HARSH AND HARD!"
	done

VermilionGymGentlemanEndBattleText:
	text "UM! QUITE"
	line "A FINE SKILL!"
	prompt

VermilionGymGentlemanAfterBattleText:
	text "DOOR WONT OPEN?"

	para "LT.SURGE CAUTION"
	line "WAS FAMOUS"
	cont "IN THE ARMY!"
	done

VermilionGymSuperNerdText:
	text_asm
	ld hl, VermilionGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymSuperNerdBattleText:
	text "I HAVE LOW"
	line "STAMINA BUT GOT"
	cont "HIRED FOR"
	cont "ELECTRIC SKILL!"
	done

VermilionGymSuperNerdEndBattleText:
	text "WHEW! NUMBING!"
	prompt

VermilionGymSuperNerdAfterBattleText:
	text "OK I WILL TALK!"

	para "SURGE SAID HE"
	line "HID DOOR SWITCH"
	cont "AT BOTTOM OF"
	cont "SOMETHING<⋯>"
	done

VermilionGymSailorText:
	text_asm
	ld hl, VermilionGym_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VermilionGymSailorBattleText:
	text "EVEN IF GOOD AT"
	line "#· THIS IS NO"
	cont "PLACE FOR KIDS!"
	done

VermilionGymSailorEndBattleText:
	text "WHOA! SURPRISE!"
	prompt

VermilionGymSailorAfterBattleText:
	text "LT.SURGE HAS"
	line "DOUBLE LOCK DOOR"
	cont "<⋯>HERE IS HINT!"

	para "IF OPEN 1ST LOCK"
	line "2ND LOCK IS"
	cont "RIGHT NEXT TO IT"
	cont "SIDE BY SIDE!"
	done

VermilionGymGymGuideText:
	text_asm
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .got_thunderbadge
	ld hl, .ChampInMakingText
	call PrintText
	jr .text_script_end
.got_thunderbadge
	ld hl, .BeatLTSurgeText
	call PrintText
.text_script_end
	jp TextScriptEnd

.ChampInMakingText:
	text "YO! FUTURE"
	line "CHAMPION!"

	para "LT.SURGE HAS"
	line "A NICKNAME:"
	cont "LIGHTNING"
	cont "AMERICAN!"

	para "WITH ELECTRIC #"
	line "THEY SAY HE IS"
	cont "NO.1 IN AMERICA!"

	para "FLYING AND WATER"
	line "HAVE BAD MATCH!"

	para "BE CAREFUL NOT"
	line "TO GET PARALYZED"

	para "ALSO SURGE IS"
	line "『YOUJINBUKAI』!"
	cont "VERY CAUTIOUS!"

	para "HIS ROOM IS"
	line "LOCKED TIGHT·"
	cont "CANT ENTER EASY!"
	done

.BeatLTSurgeText:
	text "WHEW! THAT"
	line "INTERNATIONAL"
	cont "MATCH MADE ME"
	cont "SO TENSE!"
	done
