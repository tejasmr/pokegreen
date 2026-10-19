FuchsiaGym_Script:
	call .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, FuchsiaGym_TrainerHeaders
	ld de, FuchsiaGym_ScriptPointers
	ld a, [wFuchsiaGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wFuchsiaGymCurScript], a
	ret

.LoadNames:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	ret

.CityName:
	db "SEKICHIKU@"

.LeaderName:
	db "KYOU@"


FuchsiaGymResetScripts:
	xor a ; SCRIPT_FUCHSIAGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wFuchsiaGymCurScript], a
	ld [wCurMapScript], a
	ret

FuchsiaGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_FUCHSIAGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_FUCHSIAGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_FUCHSIAGYM_END_BATTLE
	dw_const FuchsiaGymKogaPostBattleScript,        SCRIPT_FUCHSIAGYM_KOGA_POST_BATTLE

FuchsiaGymKogaPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, FuchsiaGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
; fallthrough
FuchsiaGymReceiveTM06:
	ld a, TEXT_FUCHSIAGYM_KOGA_SOUL_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_KOGA
	lb bc, TM_TOXIC, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_FUCHSIAGYM_KOGA_RECEIVED_TM06
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM06
	jr .gymVictory
.BagFull
	ld a, TEXT_FUCHSIAGYM_KOGA_TM06_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_SOULBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_SOULBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, EVENT_BEAT_FUCHSIA_GYM_TRAINER_5

	jp FuchsiaGymResetScripts

FuchsiaGym_TextPointers:
	def_text_pointers
	dw_const FuchsiaGymKogaText,              TEXT_FUCHSIAGYM_KOGA
	dw_const FuchsiaGymRocker1Text,           TEXT_FUCHSIAGYM_ROCKER1
	dw_const FuchsiaGymRocker2Text,           TEXT_FUCHSIAGYM_ROCKER2
	dw_const FuchsiaGymRocker3Text,           TEXT_FUCHSIAGYM_ROCKER3
	dw_const FuchsiaGymRocker4Text,           TEXT_FUCHSIAGYM_ROCKER4
	dw_const FuchsiaGymRocker5Text,           TEXT_FUCHSIAGYM_ROCKER5
	dw_const FuchsiaGymRocker6Text,           TEXT_FUCHSIAGYM_ROCKER6
	dw_const FuchsiaGymGymGuideText,          TEXT_FUCHSIAGYM_GYM_GUIDE
	dw_const FuchsiaGymKogaSoulBadgeInfoText, TEXT_FUCHSIAGYM_KOGA_SOUL_BADGE_INFO
	dw_const FuchsiaGymKogaReceivedTM06Text,  TEXT_FUCHSIAGYM_KOGA_RECEIVED_TM06
	dw_const FuchsiaGymKogaTM06NoRoomText,    TEXT_FUCHSIAGYM_KOGA_TM06_NO_ROOM

	def_trainers FuchsiaGym, 2
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_0, 2, Rocker1
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_1, 2, Rocker2
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_2, 4, Rocker3
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_3, 2, Rocker4
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_4, 2, Rocker5
	trainer EVENT_BEAT_FUCHSIA_GYM_TRAINER_5, 2, Rocker6
	db -1 ; end

FuchsiaGymKogaText:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM06
	jr nz, .afterBeat
	call z, FuchsiaGymReceiveTM06
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .PostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, .BeforeBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedSoulBadgeText
	ld de, .ReceivedSoulBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $5
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_FUCHSIAGYM_KOGA_POST_BATTLE
	ld [wFuchsiaGymCurScript], a
.done
	jp TextScriptEnd

.BeforeBattleText:
	text "KYOU『<⋯>FWA HA"
	line "HA HA!"

	para "A BRAT LIKE YOU"
	line "DARES CHALLENGE"
	cont "ME? LAUGHABLE!"

	para "TAKE POISON AND"
	line "FALL TO RUIN!"
	cont "FALL ASLEEP AND"
	cont "BE HELPLESS!"

	para "TASTE SECRET"
	line "NINJA TECHNIQUES!"
	done

.ReceivedSoulBadgeText:
	text "HUMPH<⋯>! YOU"
	line "ARE VERY SKILLED!"

	para "HERE! TAKE THE"
	line "PINK BADGE!"
	prompt

.PostBattleAdviceText:
	text "TOXIC DOKUDOKU"
	line "DOES MORE DAMAGE"
	cont "EACH TURN!"

	para "IT STRIKES TERROR"
	line "INTO FOES!"
	done

FuchsiaGymKogaSoulBadgeInfoText:
	text "PINK BADGE BOOSTS"
	line "YOUR #S DEFENSE"
	cont "IN BATTLE!"

	para "OUT OF BATTLE·"
	line "IT LETS YOU USE"
	cont "SURF NAMINORI!"

	para "TAKE THIS TOO!"
	done

FuchsiaGymKogaReceivedTM06Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text " FROM"
	cont "KYOU!@"
	sound_get_key_item
	text_start

	para "FOR 400 YEARS"
	line "PASSED DOWN IN"
	cont "OUR NINJA CLAN·"

	para "<TM>06 CONTAINS"
	line "SECRET TOXIC!"
	done

FuchsiaGymKogaTM06NoRoomText:
	text "YOUR PACK IS"
	line "FULL OF ITEMS!"
	done


FuchsiaGymRocker1Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker1BattleText:
	text "MERE STRENGTH"
	line "IS NOT ENOUGH!"
	cont "DO YOU GET IT?"

	para "# IS ABOUT"
	line "PURE TECHNIQUE!"

	para "I WILL TEACH YOU"
	line "THE DEEP ART OF"
	cont "# IN THIS GYM!"
	done

FuchsiaGymRocker1EndBattleText:
	text "<⋯>! YOU ARE NO"
	line "ORDINARY KID!"
	prompt

FuchsiaGymRocker1AfterBattleText:
	text "EVEN AS A KID"
	line "TRAINER·YOU HAVE"
	cont "BOTH POWER AND"
	cont "FINE TECHNIQUE!"
	done

FuchsiaGymRocker2Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker2BattleText:
	text "I WAS A MAGICIAN·"
	line "BUT LONGING FOR"
	cont "NINJA SKILLS I"
	cont "JOINED THIS GYM!"
	done

FuchsiaGymRocker2EndBattleText:
	text "<⋯>DEFEATED!"
	prompt

FuchsiaGymRocker2AfterBattleText:
	text "EVEN IF I LOSE·"
	line "I LIVE BY NINJA"
	cont "MASTER KYOUS"
	cont "TEACHINGS!"
	done

FuchsiaGymRocker3Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker3BattleText:
	text "TASTE MY #S"
	line "STRANGE TRICK"
	cont "TECHNIQUES!"
	done

FuchsiaGymRocker3EndBattleText:
	text "<⋯>I SEE! YOU"
	line "USE TRICKS TOO!"
	prompt

FuchsiaGymRocker3AfterBattleText:
	text "AFTER BATTLE·"
	line "POISON AND SLEEP"
	cont "REMAIN! THAT IS"
	cont "WHY I LOVE IT!"
	done


FuchsiaGymRocker4Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker4BattleText:
	text "HOLD IT! WAIT!"

	para "HOW DO YOU LIKE"
	line "OUR GYMS FAMOUS"
	cont "INVISIBLE WALLS?"
	done

FuchsiaGymRocker4EndBattleText:
	text "<⋯>OH! YOU CAN"
	line "REALLY FIGHT!"
	prompt

FuchsiaGymRocker4AfterBattleText:
	text "YOU HAVE GUTS!"
	line "HERE IS A HINT!"

	para "LOOK CLOSELY AT"
	line "INVISIBLE WALLS·"
	cont "GAPS CAN BE SEEN!"
	done

FuchsiaGymRocker5Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker5BattleText:
	text "I AM ALSO A PUPIL"
	line "OF NINJA KYOU!"

	para "NINJA HAVE USED"
	line "ANIMALS SINCE"
	cont "ANCIENT TIMES!"
	done

FuchsiaGymRocker5EndBattleText:
	text "GAOOON<⋯>!"
	prompt

FuchsiaGymRocker5AfterBattleText:
	text "NOT ENOUGH! MY"
	line "TRAINING SHUGYOU"
	cont "IS STILL WEAK!"
	done

FuchsiaGymRocker6Text:
	text_asm
	ld hl, FuchsiaGym_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

FuchsiaGymRocker6BattleText:
	text "OUR LEADER KYOU"
	line "IS DESCENDED FROM"
	cont "IGA NINJA!"

	para "HEY! WHO ARE"
	line "YOU DESCENDED"
	cont "FROM?"
	done

FuchsiaGymRocker6EndBattleText:
	text "YOU ARE VERY"
	line "CAPABLE!"
	prompt

FuchsiaGymRocker6AfterBattleText:
	text "<⋯>WHERE LIGHT"
	line "SHINES·SHADOW"
	cont "FALLS!"

	para "LIGHT AND SHADOW!"
	line "WHICH DO YOU"
	cont "CHOOSE?"
	done

FuchsiaGymGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_KOGA
	ld hl, .BeatKogaText
	jr nz, .afterBeat
	ld hl, .ChampInMakingText
.afterBeat
	call PrintText
	jp TextScriptEnd

.ChampInMakingText:
	text "YO! FUTURE"
	line "CHAMPION!"

	para "SEKICHIKU GYM IS"
	line "A TRICK HOUSE"
	cont "OF INVISIBLE"
	cont "GLASS WALLS!"

	para "KYOU LOOKS CLOSE"
	line "ENOUGH TO TOUCH·"

	para "BUT YOU MUST FIND"
	line "THE GAPS IN THE"
	cont "WALLS TO REACH"
	cont "HIM!"
	done

.BeatKogaText:
	text "YOU SAW THE DREAD"
	line "OF NINJA LIVING"
	cont "IN MODERN TIMES!"
	done

