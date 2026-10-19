SaffronGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	jr nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGym_TrainerHeaders
	ld de, SaffronGym_ScriptPointers
	ld a, [wSaffronGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSaffronGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "YAMABUKI@"

.LeaderName:
	db "NATSUME@"

SaffronGymResetScripts:
	xor a ; SCRIPT_SAFFRONGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wSaffronGymCurScript], a
	ld [wCurMapScript], a
	ret

SaffronGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SAFFRONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SAFFRONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SAFFRONGYM_END_BATTLE
	dw_const SaffronGymSabrinaPostBattle,           SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE

SaffronGymSabrinaPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, SaffronGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

SaffronGymSabrinaReceiveTM46Script:
	ld a, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA
	lb bc, TM_PSYWAVE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM46
	jr .gymVictory
.BagFull
	ld a, TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_MARSHBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_MARSHBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_SAFFRON_GYM_TRAINER_0, EVENT_BEAT_SAFFRON_GYM_TRAINER_6

	jp SaffronGymResetScripts

SaffronGym_TextPointers:
	def_text_pointers
	dw_const SaffronGymSabrinaText,               TEXT_SAFFRONGYM_SABRINA
	dw_const SaffronGymChanneler1Text,            TEXT_SAFFRONGYM_CHANNELER1
	dw_const SaffronGymYoungster1Text,            TEXT_SAFFRONGYM_YOUNGSTER1
	dw_const SaffronGymChanneler2Text,            TEXT_SAFFRONGYM_CHANNELER2
	dw_const SaffronGymYoungster2Text,            TEXT_SAFFRONGYM_YOUNGSTER2
	dw_const SaffronGymChanneler3Text,            TEXT_SAFFRONGYM_CHANNELER3
	dw_const SaffronGymYoungster3Text,            TEXT_SAFFRONGYM_YOUNGSTER3
	dw_const SaffronGymYoungster4Text,            TEXT_SAFFRONGYM_YOUNGSTER4
	dw_const SaffronGymGymGuideText,              TEXT_SAFFRONGYM_GYM_GUIDE
	dw_const SaffronGymSabrinaMarshBadgeInfoText, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	dw_const SaffronGymSabrinaReceivedTM46Text,   TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
	dw_const SaffronGymSabrinaTM46NoRoomText,     TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM

	def_trainers SaffronGym, 2
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_0, 3, Channeler1
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_1, 3, Youngster1
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_2, 3, Channeler2
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_3, 3, Youngster2
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_4, 3, Channeler3
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_5, 3, Youngster3
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 3, Youngster4
	db -1 ; end

SaffronGymSabrinaText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM46
	jr nz, .afterBeat
	call z, SaffronGymSabrinaReceiveTM46Script
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .PostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, .Text
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedMarshBadgeText
	ld de, .ReceivedMarshBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	ld a, SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE
	ld [wSaffronGymCurScript], a
.done
	jp TextScriptEnd

.Text:
	text "⋯JUST AS I KNEW!"
	line "I HAD PREMONITION"
	cont "YOU WOULD COME!"

	para "SINCE CASUAL BENT"
	line "SPOON IN YOUTH⋯"
	cont "I AM ESP GIRL!"

	para "I DO NOT ENJOY"
	line "BATTLE BUT IF YOU"
	cont "WISH⋯ I SHOW YOU"
	cont "MY PSYCHIC MIGHT!"
	done

.ReceivedMarshBadgeText:
	text "TO LOSE⋯! WHAT"
	line "A SHOCK! BUT A"
	cont "LOSS IS A LOSS⋯!"

	para "I FAIRLY ADMIT"
	line "MY SHORTCOMING!"

	para "AS PROOF OF WIN"
	line "TAKE GOLD BADGE!@"
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

.PostBattleAdviceText:
	text "PSYCHIC POWER"
	line "IS NOT LIMITED"
	cont "TO A CHOSEN FEW!"

	para "ALL MEN HAVE IT!"
	line "THEY MERELY DO"
	cont "NOT NOTICE IT!"
	done

SaffronGymSabrinaMarshBadgeInfoText:
	text "WITH GOLD BADGE"
	line "PETS UP TO LV 70"
	cont "WILL OBEY YOU!"

	para "STRONGER PETS"
	line "SULK AND SLEEP"
	cont "AND DO NOT HEED!"

	para "ALSO TAKE THIS"
	line "<TM> WITH YOU!"
	done

SaffronGymSabrinaReceivedTM46Text:
	text "<PLAYER> RECEIVED"
	line "<TM>46!@"
	sound_get_item_1
	text_start

	para "<TM>46 IS PSYWAVE!"
	line "POWERFUL BRAIN"
	cont "WAVES INFLICT"
	cont "MIGHTY DAMAGE!"
	done

SaffronGymSabrinaTM46NoRoomText:
	text "AH· YOUR PACK"
	line "IS FULL TO BRIM!"
	done

SaffronGymChanneler1Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymChanneler1BattleText:
	text "NATSUME IS FAR"
	line "YOUNGER THAN ME!"
	cont "YET I RESPECT"
	cont "HER DEEPLY!"
	done

SaffronGymChanneler1EndBattleText:
	text "I FELL SHORT!"
	prompt

SaffronGymChanneler1AfterBattleText:
	text "IN CLOSE MATCH"
	line "STRONGER WILL"
	cont "CLAIMS VICTORY!"

	para "TO BEAT NATSUME"
	line "PRAY HARD WITH"
	cont "DESIRE TO WIN!"
	done

SaffronGymYoungster1Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymYoungster1BattleText:
	text "DO YOU FEAR"
	line "PSYCHIC USERS OF"
	cont "UNSEEN POWER?!"
	done

SaffronGymYoungster1EndBattleText:
	text "THIS TOO CAN"
	line "HAPPEN⋯"
	prompt

SaffronGymYoungster1AfterBattleText:
	text "WHAT BEATS ESP?"
	line "⋯HAHAHA! ONLY"
	cont "GHOSTS AND BUGS!"
	done

SaffronGymChanneler2Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymChanneler2BattleText:
	text "PETS RESEMBLE"
	line "THEIR MASTER!"

	para "WHICH MEANS⋯"
	line "IS YOUR PET"
	cont "REALLY STRONG?"
	done

SaffronGymChanneler2EndBattleText:
	text "I UNDERSTAND!"
	prompt

SaffronGymChanneler2AfterBattleText:
	text "I AM NOT READY⋯"
	line "MUST MASTER"
	cont "PSYCHOKINESIS"
	cont "TO TEACH PETS!"
	done

SaffronGymYoungster2Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymYoungster2BattleText:
	text "YOU KNOW THIS!"
	line "BRUTE POWER ALONE"
	cont "CANNOT WIN!"
	done

SaffronGymYoungster2EndBattleText:
	text "⋯ME LOSE?!"
	line "HOW RIDICULOUS!"
	prompt

SaffronGymYoungster2AfterBattleText:
	text "NEXT DOOR KARATE"
	line "KING WAS CRUSHED"
	cont "TO BITS BY OUR"
	cont "LADY NATSUME!"
	done

SaffronGymChanneler3Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymChanneler3BattleText:
	text "YOU WILL FIGHT"
	line "PETS WITH ME⋯!"
	done

SaffronGymChanneler3EndBattleText:
	text "KUH⋯! JUST AS"
	line "FORESEEN I LOST!"
	prompt

SaffronGymChanneler3AfterBattleText:
	text "I KNEW RESULT⋯"
	line "⋯YES! THIS IS"
	cont "PRECOGNITION"
	cont "『YOCHI』 POWER!"
	done

SaffronGymYoungster3Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymYoungster3BattleText:
	text "NATSUME LEADS"
	line "THIS PET GYM"
	cont "AT YOUNG AGE!"

	para "YOU SHALL NOT"
	line "MEET HER EASILY!"
	done

SaffronGymYoungster3EndBattleText:
	text "I HAVE LOST!"
	prompt

SaffronGymYoungster3AfterBattleText:
	text "I TELL YOU⋯"
	line "ONCE YAMABUKI"
	cont "HAD TWO GYMS!"

	para "NEXT DOOR DOJO"
	line "LOST UNIFIED"
	cont "MATCH AND TITLE!"
	done

SaffronGymYoungster4Text:
	text_asm
	ld hl, SaffronGym_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

SaffronGymYoungster4BattleText:
	text "YAMABUKI GYM!"
	line "ALSO KNOWN AS"
	cont "ESP SCHOOL!"

	para "YOU SEEK TO MEET"
	line "NATSUME! I READ"
	cont "YOUR MIND!"
	done

SaffronGymYoungster4EndBattleText:
	text "GWAHHH⋯!"
	prompt

SaffronGymYoungster4AfterBattleText:
	text "⋯YES! READING"
	line "MIND OF MEN IS"
	cont "CALLED TELEPATHY!"
	done

SaffronGymGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .afterBeat
	ld hl, .ChampInMakingText
	call PrintText
	jr .done
.afterBeat
	ld hl, .BeatSabrinaText
	call PrintText
.done
	jp TextScriptEnd

.ChampInMakingText:
	text "YO! FUTURE CHAMP!"

	para "NATSUME PETS USE"
	line "PSYCHIC POWER TO"
	cont "CONFUSE YOURS!"

	para "FIGHTING PETS"
	line "HAVE BAD MATCHUP"
	cont "AGAINST PSYCHIC!"

	para "THEY BECOME PREY"
	line "BEFORE DISPLAYING"
	cont "THEIR POWER!"
	done

.BeatSabrinaText:
	text "PSYCHIC POWER⋯!"

	para "IF I HAD SUCH"
	line "POWER· I WOULD"
	cont "HIT SLOTS JACKPOT"
	cont "ALL DAY LONG!"
	done
