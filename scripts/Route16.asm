Route16_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route16_TrainerHeaders
	ld de, Route16_ScriptPointers
	ld a, [wRoute16CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute16CurScript], a
	ret

Route16ResetScripts:
	xor a ; SCRIPT_ROUTE16_DEFAULT
	ld [wJoyIgnore], a
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_ScriptPointers:
	def_script_pointers
	dw_const Route16DefaultScript,                  SCRIPT_ROUTE16_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE16_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE16_END_BATTLE
	dw_const Route16SnorlaxPostBattleScript,        SCRIPT_ROUTE16_SNORLAX_POST_BATTLE

Route16DefaultScript:
	CheckEventHL EVENT_BEAT_ROUTE16_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, TEXT_ROUTE16_SNORLAX_WOKE_UP
	ldh [hTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLevel], a
	ld a, TOGGLE_ROUTE_16_SNORLAX
	ld [wToggleableObjectIndex], a
	predef HideObject
	call UpdateSprites
	ld a, SCRIPT_ROUTE16_SNORLAX_POST_BATTLE
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16SnorlaxPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route16ResetScripts
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .caught
	ld a, TEXT_ROUTE16_SNORLAX_RETURNED_TO_MOUNTAINS
	ldh [hTextID], a
	call DisplayTextID
.caught
	SetEvent EVENT_BEAT_ROUTE16_SNORLAX
	call Delay3
	ld a, SCRIPT_ROUTE16_DEFAULT
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_TextPointers:
	def_text_pointers
	dw_const Route16Biker1Text,                     TEXT_ROUTE16_BIKER1
	dw_const Route16Biker2Text,                     TEXT_ROUTE16_BIKER2
	dw_const Route16Biker3Text,                     TEXT_ROUTE16_BIKER3
	dw_const Route16Biker4Text,                     TEXT_ROUTE16_BIKER4
	dw_const Route16Biker5Text,                     TEXT_ROUTE16_BIKER5
	dw_const Route16Biker6Text,                     TEXT_ROUTE16_BIKER6
	dw_const Route16SnorlaxText,                    TEXT_ROUTE16_SNORLAX
	dw_const Route16CyclingRoadSignText,            TEXT_ROUTE16_CYCLING_ROAD_SIGN
	dw_const Route16SignText,                       TEXT_ROUTE16_SIGN
	dw_const Route16SnorlaxWokeUpText,              TEXT_ROUTE16_SNORLAX_WOKE_UP
	dw_const Route16SnorlaxReturnedToMountainsText, TEXT_ROUTE16_SNORLAX_RETURNED_TO_MOUNTAINS

	def_trainers Route16
	trainer EVENT_BEAT_ROUTE_16_TRAINER_0, 3, Biker1
	trainer EVENT_BEAT_ROUTE_16_TRAINER_1, 2, Biker2
	trainer EVENT_BEAT_ROUTE_16_TRAINER_2, 2, Biker3
	trainer EVENT_BEAT_ROUTE_16_TRAINER_3, 2, Biker4
	trainer EVENT_BEAT_ROUTE_16_TRAINER_4, 2, Biker5
	trainer EVENT_BEAT_ROUTE_16_TRAINER_5, 4, Biker6
	db -1 ; end

Route16Biker1Text:
	text_asm
	ld hl, Route16_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker1BattleText:
	text "WHAT DUDES KORAA!"
	done

Route16Biker1EndBattleText:
	text "DONT FOOL WITH ME"
	prompt

Route16Biker1AfterBattleText:
	text "SHUT UP! CHILLING"
	line "AROUND HERE IS"
	cont "WAY MORE FUN"
	cont "THAN RIDING!"
	done

Route16Biker2Text:
	text_asm
	ld hl, Route16_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker2BattleText:
	text "OOH OOH!"
	line "GIVE ME THAT"
	cont "BICYCLE NOW!"
	done

Route16Biker2EndBattleText:
	text "KNOCK OUT!"
	prompt

Route16Biker2AfterBattleText:
	text "ENOUGH! I DONT"
	line "NEED YOUR BIKE!"
	done

Route16Biker3Text:
	text_asm
	ld hl, Route16_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker3BattleText:
	text "I WILL GIVE YOU"
	line "A NICE LESSON!"
	done

Route16Biker3EndBattleText:
	text "KONO YAROU!"
	prompt

Route16Biker3AfterBattleText:
	text "HOW DARE YOU!"
	line "I REALLY HATE"
	cont "LOSING A MATCH!"
	done

Route16Biker4Text:
	text_asm
	ld hl, Route16_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker4BattleText:
	text "HEY WAIT! DONT"
	line "BUMP INTO ME AND"
	cont "TRY TO RUN!"
	done

Route16Biker4EndBattleText:
	text "BOMBER!"
	prompt

Route16Biker4AfterBattleText:
	text "WE ARE ALWAYS"
	line "HERE! IF SCARED·"
	cont "TAKE VERMILION"
	cont "COAST TO FUCHSIA!"
	done

Route16Biker5Text:
	text_asm
	ld hl, Route16_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker5BattleText:
	text "I AM IN A BAD"
	line "MOOD! WANT TO"
	cont "VENT MY ANGER!"
	done

Route16Biker5EndBattleText:
	text "CHEEKY BRAT!"
	prompt

Route16Biker5AfterBattleText:
	text "IF I RAISE #·"
	line "I WANT FEROCIOUS"
	cont "BEASTS TO CRUSH"
	cont "OPPONENTS!"
	done

Route16Biker6Text:
	text_asm
	ld hl, Route16_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route16Biker6BattleText:
	text "HYOHYOO-T!"
	line "I WILL PLAY A"
	cont "LITTLE WITH YOU!"
	done

Route16Biker6EndBattleText:
	text "DONT ANGER ME!"
	prompt

Route16Biker6AfterBattleText:
	text "YEAH! I LIKE"
	line "SCARING AND"
	cont "BITING FOLKS"
	cont "WITH MY #!"
	done

Route16SnorlaxText:
	text "A # SLEEPS"
	line "SO KIMOCHI II!"
	done

Route16SnorlaxWokeUpText:
	text "KABIGON WOKE UP!"

	para "HALF-ASLEEP"
	line "KABIGON ATTACKS!"
	done

Route16SnorlaxReturnedToMountainsText:
	text "KABIGON YAWNED"
	line "HUGE AND LEFT FOR"
	cont "MOUNTAINS<⋯>"
	done

Route16CyclingRoadSignText:
	text "ENJOY THE SLOPE!"
	line "CYCLING ROAD!"
	done

Route16SignText:
	text "ROUTE 16"
	line "CELADON<⋯>FUCHSIA"
	done
