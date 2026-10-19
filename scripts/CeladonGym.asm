CeladonGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeladonGym_TrainerHeaders
	ld de, CeladonGym_ScriptPointers
	ld a, [wCeladonGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "TAMAMUSHI@"

.LeaderName:
	db "ERIKA@"

CeladonGymResetScripts:
	xor a ; SCRIPT_CELADONGYM_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
	ret

CeladonGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_CELADONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_CELADONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_CELADONGYM_END_BATTLE
	dw_const CeladonGymErikaPostBattleScript,       SCRIPT_CELADONGYM_ERIKA_POST_BATTLE

CeladonGymErikaPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeladonGymResetScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a

CeladonGymReceiveTM21:
	ld a, TEXT_CELADONGYM_RAINBOWBADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_ERIKA
	lb bc, TM_MEGA_DRAIN, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_CELADONGYM_RECEIVED_TM21
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM21
	jr .gymVictory
.BagFull
	ld a, TEXT_CELADONGYM_TM21_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_RAINBOWBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_RAINBOWBADGE, [hl]

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_CELADON_GYM_TRAINER_0, EVENT_BEAT_CELADON_GYM_TRAINER_6

	jp CeladonGymResetScripts

CeladonGym_TextPointers:
	def_text_pointers
	dw_const CeladonGymErikaText,            TEXT_CELADONGYM_ERIKA
	dw_const CeladonGymCooltrainerF1Text,    TEXT_CELADONGYM_COOLTRAINER_F1
	dw_const CeladonGymBeauty1Text,          TEXT_CELADONGYM_BEAUTY1
	dw_const CeladonGymCooltrainerF2Text,    TEXT_CELADONGYM_COOLTRAINER_F2
	dw_const CeladonGymBeauty2Text,          TEXT_CELADONGYM_BEAUTY2
	dw_const CeladonGymCooltrainerF3Text,    TEXT_CELADONGYM_COOLTRAINER_F3
	dw_const CeladonGymBeauty3Text,          TEXT_CELADONGYM_BEAUTY3
	dw_const CeladonGymCooltrainerF4Text,    TEXT_CELADONGYM_COOLTRAINER_F4
	dw_const CeladonGymRainbowBadgeInfoText, TEXT_CELADONGYM_RAINBOWBADGE_INFO
	dw_const CeladonGymReceivedTM21Text,     TEXT_CELADONGYM_RECEIVED_TM21
	dw_const CeladonGymTM21NoRoomText,       TEXT_CELADONGYM_TM21_NO_ROOM

	def_trainers CeladonGym, 2
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_0, 2, CooltrainerF1
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_1, 2, Beauty1
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_2, 4, CooltrainerF2
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_3, 4, Beauty2
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_4, 2, CooltrainerF3
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_5, 2, Beauty3
	trainer EVENT_BEAT_CELADON_GYM_TRAINER_6, 3, CooltrainerF4
	db -1 ; end

CeladonGymErikaText:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM21
	jr nz, .afterBeat
	call z, CeladonGymReceiveTM21
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .PostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, .PreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedRainbowBadgeText
	ld de, .ReceivedRainbowBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [wGymLeaderNo], a
	ld a, SCRIPT_CELADONGYM_ERIKA_POST_BATTLE
	ld [wCeladonGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd

.PreBattleText:
	text "HELLO⋯ LOVELY"
	line "WEATHER TODAY!"
	cont "FEELS SO NICE⋯"

	para "⋯ZZZ⋯ ZZZ⋯"
	line "⋯OH MY PARDON!"
	cont "I DOZED OFF⋯"
	cont "WELCOME HERE!"

	para "I AM ERIKA·"
	line "LEADER OF"
	cont "TAMAMUSHI GYM!"

	para "FLOWER ARRANGING"
	line "IS MY HOBBY·"
	cont "MY # ARE ALL"
	cont "GRASS TYPE!"

	para "⋯OH DEAR ME·"
	line "A CHALLENGE FOR"
	cont "A MATCH?"

	para "HOWEVER⋯ I WILL"
	line "NOT LOSE EASILY!"
	done

.ReceivedRainbowBadgeText:
	text "⋯! I CONCEDE"
	line "DEFEAT!"

	para "AS EXPECTED·"
	line "YOU ARE INDEED"
	cont "VERY STRONG!"

	para "I MUST BESTOW"
	line "THIS RAINBOW"
	cont "BADGE TO YOU!"
	prompt

.PostBattleAdviceText:
	text "OH MY GOODNESS⋯"
	line "COMPILING A #"
	cont "BOOK ARE YOU?"
	cont "MOST ADMIRABLE!"

	para "AS FOR MYSELF·"
	line "I ONLY WANT"
	cont "PRETTY # IN"
	cont "MY COLLECTION!"
	done

CeladonGymRainbowBadgeInfoText:
	text "RAINBOW BADGE"
	line "LETS # UP TO"
	cont "<LV>50 OBEY YOU!"

	para "AND ALSO⋯ THE"
	line "MOVE STRENGTH CAN"
	cont "BE USED ANYTIME!"

	para "PLEASE TAKE THIS"
	line "MOVE AS WELL!"
	done

CeladonGymReceivedTM21Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text " FROM ERIKA!@"
	sound_get_item_1
	text_start

	para "<TM>21 CONTAINS"
	line "MEGA DRAIN!"

	para "HALF OF DAMAGE"
	line "DEALT RESTORES"
	cont "# HP! WHAT A"
	cont "SPLENDID MOVE!"
	done

CeladonGymTM21NoRoomText:
	text "YOUR PACK IS"
	line "OUT OF ROOM!"
	done

CeladonGymCooltrainerF1Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymCooltrainerF1BattleText:
	text "AH! A BOY!"

	para "ONLY GIRLS ARE"
	line "ALLOWED INSIDE"
	cont "THIS GYM HERE!"
	done

CeladonGymCooltrainerF1EndBattleText:
	text "HOW ROUGH!"
	prompt

CeladonGymCooltrainerF1AfterBattleText:
	text "BLEHHH!"
	line "MISS ERIKA WILL"
	cont "BEAT YOU DOWN!"
	done

CeladonGymBeauty1Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBeauty1BattleText:
	text "MY! I WAS TIRED"
	line "OF ONLY GIRLS"
	cont "BEING AROUND!"
	done

CeladonGymBeauty1EndBattleText:
	text "OH DISGUSTING!"
	prompt

CeladonGymBeauty1AfterBattleText:
	text "NOT ONLY WATER"
	line "TYPES ARE WEAK"
	cont "TO GRASS!"

	para "GROUND AND ROCK"
	line "ARE ALSO EASY"
	cont "PREY FOR US!"
	done

CeladonGymCooltrainerF2Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymCooltrainerF2BattleText:
	text "HEY! ARE YOU NOT"
	line "THE BOY PEEKING"
	cont "IN JUST NOW?!"
	done

CeladonGymCooltrainerF2EndBattleText:
	text "EYES BLINKING!"
	prompt

CeladonGymCooltrainerF2AfterBattleText:
	text "ARE YOU TRULY"
	line "NOT A PEEPER?"
	cont "WE GET SO MANY"
	cont "OF THEM LATELY!"
	done

CeladonGymBeauty2Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBeauty2BattleText:
	text "HEY LOOK⋯!"
	line "BEHOLD MY #!"

	para "GRASS TYPES ARE"
	line "SO EASY TO RAISE·"
	cont "I LOVE THAT!"
	done

CeladonGymBeauty2EndBattleText:
	text "NOOO WAY!"
	prompt

CeladonGymBeauty2AfterBattleText:
	text "IN OUR GYM· ALL"
	line "USED # ARE"
	cont "GRASS TYPES!"

	para "BECAUSE WE TEACH"
	line "FLOWER ARRANGING"
	cont "HERE AS WELL!"
	done

CeladonGymCooltrainerF3Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymCooltrainerF3BattleText:
	text "HEY! I HATE BUG"
	line "AND FIRE #!"
	cont "DONT BRING THEM"
	cont "INTO OUR GYM!"
	done

CeladonGymCooltrainerF3EndBattleText:
	text "AH! HOW DARE YOU!"
	prompt

CeladonGymCooltrainerF3AfterBattleText:
	text "LISTEN KID!"
	line "MISS ERIKA IS"
	cont "GENTLE· BUT SHE"
	cont "IS A RENOWNED"
	cont "<TRAINER> HERE!"
	done

CeladonGymBeauty3Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymBeauty3BattleText:
	text "YOUR HOBBY IS⋯?"
	line "⋯YES! A SPOT"
	cont "OF # DUELING!"
	done

CeladonGymBeauty3EndBattleText:
	text "FINE TECHNIQUE!"
	prompt

CeladonGymBeauty3AfterBattleText:
	text "I HAVE A MATCH-"
	line "MAKING MEET NEXT"
	cont "WEEK! I MUST"
	cont "NOT FIGHT ROUGH"
	cont "IF INVITED TO #"
	cont "BATTLES!"
	done

CeladonGymCooltrainerF4Text:
	text_asm
	ld hl, CeladonGym_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

CeladonGymCooltrainerF4BattleText:
	text "WELCOME TO THE"
	line "TAMAMUSHI GYM!"

	para "DO NOT DROP YOUR"
	line "GUARD JUST"
	cont "BECAUSE WE ARE"
	cont "GIRLS!"
	done

CeladonGymCooltrainerF4EndBattleText:
	text "NOT HALF BAD!"
	prompt

CeladonGymCooltrainerF4AfterBattleText:
	text "I DID NOT BRING"
	line "MY STRONGEST #"
	cont "TODAY⋯"

	para "I WILL NOT LOSE"
	line "NEXT TIME AT ALL!"
	done
