CeruleanGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanGym_TrainerHeaders
	ld de, CeruleanGym_ScriptPointers
	ld a, [wCeruleanGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "HANADA@"

.LeaderName:
	db "KASUMI@"

CeruleanGymResetScripts:
	xor a ; SCRIPT_CERULEANGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanGymCurScript], a
	ld [wCurMapScript], a
	ret

CeruleanGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CERULEANGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CERULEANGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CERULEANGYM_END_BATTLE
	dw_const CeruleanGymMistyPostBattleScript,      SCRIPT_CERULEANGYM_MISTY_POST_BATTLE

CeruleanGymMistyPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

CeruleanGymReceiveTM11:
	ld a, TEXT_CERULEANGYM_MISTY_CASCADE_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_MISTY
	lb bc, TM_BUBBLEBEAM, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_CERULEANGYM_MISTY_RECEIVED_TM11
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM11
	jr .gymVictory
.BagFull
	ld a, TEXT_CERULEANGYM_MISTY_TM11_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_CASCADEBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_CASCADEBADGE, [hl]

	; deactivate gym trainers
	SetEvents EVENT_BEAT_CERULEAN_GYM_TRAINER_0, EVENT_BEAT_CERULEAN_GYM_TRAINER_1

	jp CeruleanGymResetScripts

CeruleanGym_TextPointers:
	def_text_pointers
	dw_const CeruleanGymMistyText,                 TEXT_CERULEANGYM_MISTY
	dw_const CeruleanGymCooltrainerFText,          TEXT_CERULEANGYM_COOLTRAINER_F
	dw_const CeruleanGymSwimmerText,               TEXT_CERULEANGYM_SWIMMER
	dw_const CeruleanGymGymGuideText,              TEXT_CERULEANGYM_GYM_GUIDE
	dw_const CeruleanGymMistyCascadeBadgeInfoText, TEXT_CERULEANGYM_MISTY_CASCADE_BADGE_INFO
	dw_const CeruleanGymMistyReceivedTM11Text,     TEXT_CERULEANGYM_MISTY_RECEIVED_TM11
	dw_const CeruleanGymMistyTM11NoRoomText,       TEXT_CERULEANGYM_MISTY_TM11_NO_ROOM

	def_trainers CeruleanGym, 2
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_0, 3, CooltrainerF
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_1, 3, Swimmer
	db -1 ; end

CeruleanGymMistyText:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM11
	jr nz, .afterBeat
	call z, CeruleanGymReceiveTM11
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .TM11ExplanationText
	call PrintText
	jr .done
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, CeruleanGymMistyReceivedCascadeBadgeText
	ld de, CeruleanGymMistyReceivedCascadeBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $2
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	ld a, SCRIPT_CERULEANGYM_MISTY_POST_BATTLE
	ld [wCeruleanGymCurScript], a
.done
	jp TextScriptEnd

.PreBattleText:
	text "LISTEN TO ME!"

	para "ONLY THOSE WITH"
	line "A 『POLICY』 CAN"
	cont "BECOME PROS!"

	para "WHAT DO YOU THINK"
	line "ABOUT WHEN YOU"
	cont "TRAIN YOUR MONS?"

	para "MY 『POLICY』 IS<⋯>"

	para "WITH 『MIZU』 WATER"
	line "TYPE MONS TO"
	cont "ATTACK ATTACK AND"
	cont "KEEP ATTACKING!"
	done

.TM11ExplanationText:
	text "TM11 TEACHES"
	line "BUBBLEBEAM!"

	para "USE IT ON A MON"
	line "THAT LIVES IN"
	cont "WATER 『MIZU』!"
	done

CeruleanGymMistyCascadeBadgeInfoText:
	text "WITH BLUE BADGE"
	line "MONS UP TO LV30"
	cont "WILL OBEY QUIET!"

	para "EVEN TRADED ONES"
	line "FROM OTHERS TOO!"

	para "YOU CAN ALSO USE"
	line "『IAIGIRI』 CUT"
	cont "OUTSIDE BATTLES!"

	para "CUT DOWN SLENDER"
	line "TREES TO PASS!"

	para "<⋯>AND TAKE MY"
	line "FAVORITE <TM>!"
	done

CeruleanGymMistyReceivedTM11Text:
	text "<PLAYER> RECEIVED"
	line "TM11 FROM KASUMI@"
	sound_get_item_1
	text_end

CeruleanGymMistyTM11NoRoomText:
	text "BAG IS FULL!"
	done

CeruleanGymMistyReceivedCascadeBadgeText:
	text "UNN<⋯>! MY LOSS!"

	para "『SHOUGANAI』!"
	line "CANT BE HELPED!"

	para "TAKE BLUE BADGE"
	line "FOR BEATING ME!@"
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

CeruleanGymCooltrainerFText:
	text_asm
	ld hl, CeruleanGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymCooltrainerFBattleText:
	text "FOR THE LIKES OF"
	line "YOU I AM ENOUGH!"

	para "NO NEED TO CALL"
	line "LEADER KASUMI!"
	done

CeruleanGymCooltrainerFEndBattleText:
	text "I SURRENDER!"
	prompt

CeruleanGymCooltrainerFAfterBattleText:
	text "MUST BATTLE MANY"
	line "# <TRAINER>S TO"
	cont "KNOW YOUR POWER!"
	done

CeruleanGymSwimmerText:
	text_asm
	ld hl, CeruleanGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymSwimmerBattleText:
	text "SPLASH! OWAPPU!"

	para "I AM YOUR FIRST"
	line "OPPONENT! BRING"
	cont "IT ON RIGHT NOW!"
	done

CeruleanGymSwimmerEndBattleText:
	text "CANT BE TRUE!"
	prompt

CeruleanGymSwimmerAfterBattleText:
	text "KASUMI WILL KEEP"
	line "GETTING STRONGER!"

	para "SHE WONT LOSE TO"
	line "SOMEONE LIKE YOU!"
	done

CeruleanGymGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterBeat
	ld hl, .ChampInMakingText
	call PrintText
	jr .done
.afterBeat
	ld hl, .BeatMistyText
	call PrintText
.done
	jp TextScriptEnd

.ChampInMakingText:
	text "『OSU』! FUTURE"
	line "CHAMPION!"

	para "LEADER KASUMI IS"
	line "A PROFESSIONAL"
	cont "OF WATER MONS!"

	para "USE 『SHOKUBUTSU』"
	line "PLANT TYPES TO"
	cont "ABSORB WATER!"

	para "<⋯>OR USE 『DENKI』"
	line "ELECTRIC TYPES"
	cont "TO SHOCK THEM!"
	done

.BeatMistyText:
	text "YOU BEAT KASUMI!"
	line "JUST AS I SAID!"

	para "YOU ARE GREAT"
	line "BUT SO AM I!"
	done
