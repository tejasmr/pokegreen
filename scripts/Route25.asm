Route25_Script:
	call Route25ToggleBillsScript
	call EnableAutoTextBoxDrawing
	ld hl, Route25_TrainerHeaders
	ld de, Route25_ScriptPointers
	ld a, [wRoute25CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute25CurScript], a
	ret

Route25ToggleBillsScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	CheckEventHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ret nz
	CheckEventReuseHL EVENT_MET_BILL_2
	jr nz, .met_bill
	ResetEventReuseHL EVENT_BILL_SAID_USE_CELL_SEPARATOR
	ld a, TOGGLE_BILL_POKEMON
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject
.met_bill
	CheckEventAfterBranchReuseHL EVENT_GOT_SS_TICKET, EVENT_MET_BILL_2
	ret z
	SetEventReuseHL EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING
	ld a, TOGGLE_NUGGET_BRIDGE_GUY
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_BILL_1
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, TOGGLE_BILL_2
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject

Route25_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE25_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE25_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE25_END_BATTLE

Route25_TextPointers:
	def_text_pointers
	dw_const Route25Youngster1Text,    TEXT_ROUTE25_YOUNGSTER1
	dw_const Route25Youngster2Text,    TEXT_ROUTE25_YOUNGSTER2
	dw_const Route25CooltrainerMText,  TEXT_ROUTE25_COOLTRAINER_M
	dw_const Route25CooltrainerF1Text, TEXT_ROUTE25_COOLTRAINER_F1
	dw_const Route25Youngster3Text,    TEXT_ROUTE25_YOUNGSTER3
	dw_const Route25CooltrainerF2Text, TEXT_ROUTE25_COOLTRAINER_F2
	dw_const Route25Hiker1Text,        TEXT_ROUTE25_HIKER1
	dw_const Route25Hiker2Text,        TEXT_ROUTE25_HIKER2
	dw_const Route25Hiker3Text,        TEXT_ROUTE25_HIKER3
	dw_const PickUpItemText,           TEXT_ROUTE25_TM_SEISMIC_TOSS
	dw_const Route25BillSignText,      TEXT_ROUTE25_BILL_SIGN

	def_trainers Route25
	trainer EVENT_BEAT_ROUTE_25_TRAINER_0, 2, Youngster1
	trainer EVENT_BEAT_ROUTE_25_TRAINER_1, 3, Youngster2
	trainer EVENT_BEAT_ROUTE_25_TRAINER_2, 3, CooltrainerM
	trainer EVENT_BEAT_ROUTE_25_TRAINER_3, 2, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_25_TRAINER_4, 4, Youngster3
	trainer EVENT_BEAT_ROUTE_25_TRAINER_5, 4, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_25_TRAINER_6, 3, Hiker1
	trainer EVENT_BEAT_ROUTE_25_TRAINER_7, 2, Hiker2
	trainer EVENT_BEAT_ROUTE_25_TRAINER_8, 2, Hiker3
	db -1 ; end

Route25Youngster1Text:
	text_asm
	ld hl, Route25_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route25Youngster1BattleText:
	text "LOCAL <TRAINER>S"
	line "COME TO THESE"
	cont "WOODS TO TRAIN!"
	done

Route25Youngster1EndBattleText:
	text "YOU ARE CAPABLE!"
	prompt

Route25Youngster1AfterBattleText:
	text "RAISING ONLY ONE"
	line "STRONG MON IS NOT"
	cont "ENOUGH! RAISE A"
	cont "BALANCED TEAM!"
	done

Route25Youngster2Text:
	text_asm
	ld hl, Route25_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route25Youngster2BattleText:
	text "WENT WITH DAD TO"
	line "S·S·ANNE PARTY IN"
	cont "KUCHIBA! JEALOUS?"
	done

Route25Youngster2EndBattleText:
	text "NOT JEALOUS! HMPH"
	prompt

Route25Youngster2AfterBattleText:
	text "S·S·ANNE CRUISE"
	line "HAD LOTS OF"
	cont "GLOBAL <TRAINER>S!"
	done

Route25CooltrainerMText:
	text_asm
	ld hl, Route25_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerMBattleText:
	text "I AM A BOY SCOUT"
	line "AND MY GIRLFRIEND"
	cont "IS A MINISKIRT!"
	done

Route25CooltrainerMEndBattleText:
	text "『TOHOHO』<⋯> SIGH!"
	prompt

Route25CooltrainerMAfterBattleText:
	text "OH WELL<⋯> SHE"
	line "WILL CONSOLE ME!"
	done

Route25CooltrainerF1Text:
	text_asm
	ld hl, Route25_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerF1BattleText:
	text "I AM A MINISKIRT"
	line "AND MY BOYFRIEND"
	cont "IS A BOY SCOUT!"
	done

Route25CooltrainerF1EndBattleText:
	text "NOT IN TOP FORM!"
	prompt

Route25CooltrainerF1AfterBattleText:
	text "WISH MY BOYFRIEND"
	line "WAS AS STRONG AS"
	cont "YOU ARE<⋯> SIGH!"
	done

Route25Youngster3Text:
	text_asm
	ld hl, Route25_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route25Youngster3BattleText:
	text "HM<⋯>! HAD A"
	line "『YOKAN』 HUNCH"
	cont "WE WOULD BATTLE!"
	done

Route25Youngster3EndBattleText:
	text "HAD A 『YOKAN』"
	line "I WOULD LOSE TOO!"
	prompt

Route25Youngster3AfterBattleText:
	text "IF CONFUSED OR"
	line "BOUND SWITCH"
	cont "MONS OUT FAST!"
	done

Route25CooltrainerF2Text:
	text_asm
	ld hl, Route25_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route25CooltrainerF2BattleText:
	text "MY FRIEND HAS SO"
	line "MANY CUTE MONS!"
	cont "<⋯>『KUYASHII』!"
	cont "SO FRUSTRATING!"
	done

Route25CooltrainerF2EndBattleText:
	text "NOT JEALOUS! HMPH"
	prompt

Route25CooltrainerF2AfterBattleText:
	text "FROM MT·MOON?"
	line "I WANT A PIPPI"
	cont "CLEFAIRY! GIMME!"
	done

Route25Hiker1Text:
	text_asm
	ld hl, Route25_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker1BattleText:
	text "JUST DESCENDED"
	line "FROM MT·MOON BUT"
	cont "STILL 『GENKI』!"
	done

Route25Hiker1EndBattleText:
	text "YOU WORK HARD!"
	prompt

Route25Hiker1AfterBattleText:
	text "DANG! INSIDE CAVE"
	line "ZUBAT BIT ME"
	cont "HARD ON THE LEG!"
	done

Route25Hiker2Text:
	text_asm
	ld hl, Route25_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker2BattleText:
	text "GOING TO SEE THE"
	line "CAPE # MANIAS"
	cont "RARE COLLECTION!"
	done

Route25Hiker2EndBattleText:
	text "I GOT BEATEN!"
	prompt

Route25Hiker2AfterBattleText:
	text "TRUE TO HIS NAME"
	line "THAT 『MANIA』 HAS"
	cont "RAREST # MONS!"
	done

Route25Hiker3Text:
	text_asm
	ld hl, Route25_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route25Hiker3BattleText:
	text "VISITING MASAKI"
	line "BILLS HOUSE? THEN"
	cont "FIGHT ME FIRST!"
	done

Route25Hiker3EndBattleText:
	text "YOU ARE TOUGH!"
	prompt

Route25Hiker3AfterBattleText:
	text "HEADING BACK TO"
	line "CERULEAN TAKE"
	cont "THE LOWER TRAIL!"
	done

Route25BillSignText:
	text "SEA COTTAGE"
	line "<⋯>MASAKI BILLS"
	done
