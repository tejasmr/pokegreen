Route12_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route12_TrainerHeaders
	ld de, Route12_ScriptPointers
	ld a, [wRoute12CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute12CurScript], a
	ret

Route12ResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_ScriptPointers:
	def_script_pointers
	dw_const Route12DefaultScript,                  SCRIPT_ROUTE12_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE12_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE12_END_BATTLE
	dw_const Route12SnorlaxPostBattleScript,        SCRIPT_ROUTE12_SNORLAX_POST_BATTLE

Route12DefaultScript:
	CheckEventHL EVENT_BEAT_ROUTE12_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, TEXT_ROUTE12_SNORLAX_WOKE_UP
	ldh [hTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLevel], a
	ld a, TOGGLE_ROUTE_12_SNORLAX
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, SCRIPT_ROUTE12_SNORLAX_POST_BATTLE
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12SnorlaxPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, Route12ResetScripts
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .caught_snorlax
	ld a, TEXT_ROUTE12_SNORLAX_CALMED_DOWN
	ldh [hTextID], a
	call DisplayTextID
.caught_snorlax
	SetEvent EVENT_BEAT_ROUTE12_SNORLAX
	call Delay3
	ld a, SCRIPT_ROUTE12_DEFAULT
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_TextPointers:
	def_text_pointers
	dw_const Route12SnorlaxText,           TEXT_ROUTE12_SNORLAX
	dw_const Route12Fisher1Text,           TEXT_ROUTE12_FISHER1
	dw_const Route12Fisher2Text,           TEXT_ROUTE12_FISHER2
	dw_const Route12CooltrainerMText,      TEXT_ROUTE12_COOLTRAINER_M
	dw_const Route12SuperNerdText,         TEXT_ROUTE12_SUPER_NERD
	dw_const Route12Fisher3Text,           TEXT_ROUTE12_FISHER3
	dw_const Route12Fisher4Text,           TEXT_ROUTE12_FISHER4
	dw_const Route12Fisher5Text,           TEXT_ROUTE12_FISHER5
	dw_const PickUpItemText,               TEXT_ROUTE12_TM_PAY_DAY
	dw_const PickUpItemText,               TEXT_ROUTE12_IRON
	dw_const Route12SignText,              TEXT_ROUTE12_SIGN
	dw_const Route12SportFishingSignText,  TEXT_ROUTE12_SPORT_FISHING_SIGN
	dw_const Route12SnorlaxWokeUpText,     TEXT_ROUTE12_SNORLAX_WOKE_UP
	dw_const Route12SnorlaxCalmedDownText, TEXT_ROUTE12_SNORLAX_CALMED_DOWN

	def_trainers Route12, 2
	trainer EVENT_BEAT_ROUTE_12_TRAINER_0, 4, Fisher1
	trainer EVENT_BEAT_ROUTE_12_TRAINER_1, 4, Fisher2
	trainer EVENT_BEAT_ROUTE_12_TRAINER_2, 4, CooltrainerM
	trainer EVENT_BEAT_ROUTE_12_TRAINER_3, 4, SuperNerd
	trainer EVENT_BEAT_ROUTE_12_TRAINER_4, 4, Fisher3
	trainer EVENT_BEAT_ROUTE_12_TRAINER_5, 4, Fisher4
	trainer EVENT_BEAT_ROUTE_12_TRAINER_6, 1, Fisher5
	db -1 ; end

Route12SnorlaxText:
	text "A # SLEEPS"
	line "SO KIMOCHI II!"
	done

Route12SnorlaxWokeUpText:
	text "KABIGON WOKE UP!"

	para "KABIGON ATTACKS"
	line "HALF-ASLEEP!"
	done

Route12SnorlaxCalmedDownText:
	text "KABIGON BECAME"
	line "CALM AND QUIET!"
	cont "A HUGE YAWN<⋯>"
	cont "LEFT FOR MOUNTAIN"
	done

Route12Fisher1Text:
	text_asm
	ld hl, Route12_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher1BattleText:
	text "OH! OHHH!"
	line "PULLING! BITE!"
	done

Route12Fisher1EndBattleText:
	text "TCH! JUST A"
	line "TRASH CATCH!"
	prompt

Route12Fisher1AfterBattleText:
	text "MATTE KURE!"
	line "FISHING LINE GOT"
	cont "ALL TANGLED UP!"
	done

Route12Fisher2Text:
	text_asm
	ld hl, Route12_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher2BattleText:
	text "<⋯>DO NOT HURRY!"
	line "WAITING IS ALSO"
	cont "FISHING JOY!"
	done

Route12Fisher2EndBattleText:
	text "WHOOPS<⋯>!"
	line "WAIT CHOTTO!"
	prompt

Route12Fisher2AfterBattleText:
	text "WITH GOOD ROD"
	line "FINE # BITE"
	cont "<⋯>PERHAPS?"
	done

Route12CooltrainerMText:
	text_asm
	ld hl, Route12_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12CooltrainerMBattleText:
	text "LOOKING FOR"
	line "MOON STONE·"
	cont "DO YOU HAVE ONE?"
	done

Route12CooltrainerMEndBattleText:
	text "ARYARYA<⋯>!"
	prompt

Route12CooltrainerMAfterBattleText:
	text "WITH MOON STONE"
	line "MY # EVOLVES"
	cont "I MIGHT HAVE WON!"
	done

Route12SuperNerdText:
	text_asm
	ld hl, Route12_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12SuperNerdBattleText:
	text "MY SPECIALTY IS"
	line "ELECTRICITY!"
	cont "NOT SEA #S!"
	done

Route12SuperNerdEndBattleText:
	text "FUNYAFUNYA<⋯>!"
	prompt

Route12SuperNerdAfterBattleText:
	text "WATER CONDUCTS"
	line "ELECTRICITY WELL·"
	cont "MOVES SHOULD"
	cont "WORK GOOD<⋯>"
	done

Route12Fisher3Text:
	text_asm
	ld hl, Route12_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher3BattleText:
	text "OOH! FISHING FOOL"
	line "MEETS # FOOL!"
	done

Route12Fisher3EndBattleText:
	text "SASUGA! STRONG!"
	prompt

Route12Fisher3AfterBattleText:
	text "LOVE OF THING"
	line "MAKES EXPERT<⋯>!"
	cont "I WONT LOSE IN"
	cont "FISHING EITHER!"
	done

Route12Fisher4Text:
	text_asm
	ld hl, Route12_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher4BattleText:
	text "NOT JUST FISHING·"
	line "IF I COULD WORK"
	cont "MORE·WOULD BE"
	cont "SAIKOU<⋯>"
	done

Route12Fisher4EndBattleText:
	text "HARD<⋯>!"
	line "NOT GOING WELL!"
	prompt

Route12Fisher4AfterBattleText:
	text "HAHAHA<⋯>DAIJOUBU!"
	line "I DONT GET MAD"
	cont "JUST LOSING!"
	done

Route12Fisher5Text:
	text_asm
	ld hl, Route12_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12Fisher5BattleText:
	text "<⋯>WHAT WE CATCH?"
	line "CANT KNOW TILL"
	cont "YOU TRY CATCHING!"
	done

Route12Fisher5EndBattleText:
	text "BLUNDERED IT!"
	prompt

Route12Fisher5AfterBattleText:
	text "AH·KOIKING<⋯>"
	line "BITES OFTEN BUT"
	cont "TOO WEAK INDEED<⋯>"
	done

Route12SignText:
	text "ROUTE 12"
	line "NORTH: SHION TOWN"
	done

Route12SportFishingSignText:
	text "SPORT FISHING"
	line "FAMOUS SPOT!"
	done
