Route20_Script:
	CheckAndResetEvent EVENT_IN_SEAFOAM_ISLANDS
	call nz, Route20BoulderScript
	call EnableAutoTextBoxDrawing
	ld hl, Route20_TrainerHeaders
	ld de, Route20_ScriptPointers
	ld a, [wRoute20CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute20CurScript], a
	ret

Route20BoulderScript:
	CheckBothEventsSet EVENT_SEAFOAM3_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM3_BOULDER2_DOWN_HOLE
	jr z, .next_boulder_check
	ld a, TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_1
	call Route20ShowObjectScript
	ld a, TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_2
	call Route20ShowObjectScript
	ld hl, .ToggleableObjectIDs
.hide_toggleable_objects
	ld a, [hli]
	cp $ff
	jr z, .next_boulder_check
	push hl
	call Route20HideObjectScript
	pop hl
	jr .hide_toggleable_objects

.ToggleableObjectIDs:
	db TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_1
	db TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_2
	db TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_1
	db TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_2
	db TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3
	db TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4
	db -1 ; end

.next_boulder_check
	CheckBothEventsSet EVENT_SEAFOAM4_BOULDER1_DOWN_HOLE, EVENT_SEAFOAM4_BOULDER2_DOWN_HOLE
	ret z
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_1
	call Route20ShowObjectScript
	ld a, TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_2
	call Route20ShowObjectScript
	ld a, TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1
	call Route20HideObjectScript
	ld a, TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2
	call Route20HideObjectScript
	ret

Route20ShowObjectScript:
	ld [wToggleableObjectIndex], a
	predef_jump ShowObject

Route20HideObjectScript:
	ld [wToggleableObjectIndex], a
	predef_jump HideObject

Route20_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE20_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE20_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE20_END_BATTLE

Route20_TextPointers:
	def_text_pointers
	dw_const Route20Swimmer1Text,           TEXT_ROUTE20_SWIMMER1
	dw_const Route20Swimmer2Text,           TEXT_ROUTE20_SWIMMER2
	dw_const Route20Swimmer3Text,           TEXT_ROUTE20_SWIMMER3
	dw_const Route20Swimmer4Text,           TEXT_ROUTE20_SWIMMER4
	dw_const Route20Swimmer5Text,           TEXT_ROUTE20_SWIMMER5
	dw_const Route20Swimmer6Text,           TEXT_ROUTE20_SWIMMER6
	dw_const Route20CooltrainerMText,       TEXT_ROUTE20_COOLTRAINER_M
	dw_const Route20Swimmer7Text,           TEXT_ROUTE20_SWIMMER7
	dw_const Route20Swimmer8Text,           TEXT_ROUTE20_SWIMMER8
	dw_const Route20Swimmer9Text,           TEXT_ROUTE20_SWIMMER9
	dw_const Route20SeafoamIslandsSignText, TEXT_ROUTE20_SEAFOAM_ISLANDS_WEST_SIGN
	dw_const Route20SeafoamIslandsSignText, TEXT_ROUTE20_SEAFOAM_ISLANDS_EAST_SIGN

	def_trainers Route20
	trainer EVENT_BEAT_ROUTE_20_TRAINER_0, 4, Swimmer1
	trainer EVENT_BEAT_ROUTE_20_TRAINER_1, 4, Swimmer2
	trainer EVENT_BEAT_ROUTE_20_TRAINER_2, 2, Swimmer3
	trainer EVENT_BEAT_ROUTE_20_TRAINER_3, 4, Swimmer4
	trainer EVENT_BEAT_ROUTE_20_TRAINER_4, 3, Swimmer5
	trainer EVENT_BEAT_ROUTE_20_TRAINER_5, 4, Swimmer6
	trainer EVENT_BEAT_ROUTE_20_TRAINER_6, 2, CooltrainerM
	trainer EVENT_BEAT_ROUTE_20_TRAINER_7, 4, Swimmer7
	trainer EVENT_BEAT_ROUTE_20_TRAINER_8, 3, Swimmer8
	trainer EVENT_BEAT_ROUTE_20_TRAINER_9, 4, Swimmer9
	db -1 ; end

Route20Swimmer1Text:
	text_asm
	ld hl, Route20_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer1BattleText:
	text "WATER IS SHALLOW·"
	line "MANY PEOPLE COME"
	cont "SWIMMING HERE!"
	done

Route20Swimmer1EndBattleText:
	text "U-MI-T! THE SEA!"
	prompt

Route20Swimmer1AfterBattleText:
	text "RIDING A # SO"
	line "YOU DONT TIRE·"
	cont "ENVIABLE INDEED!"
	done

Route20Swimmer2Text:
	text_asm
	ld hl, Route20_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer2BattleText:
	text "I CAME TO TWIN"
	line "ISLANDS ON A"
	cont "RESORT VACATION!"
	done

Route20Swimmer2EndBattleText:
	text "CHOTTO STOP IT!"
	prompt

Route20Swimmer2AfterBattleText:
	text "UNDER THE TWIN"
	line "ISLANDS LIES A"
	cont "LIMESTONE CAVE!"
	done

Route20Swimmer3Text:
	text_asm
	ld hl, Route20_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer3BattleText:
	text "FLOATING AMONGST"
	line "WAVES<⋯>I AM FISH"
	done

Route20Swimmer3EndBattleText:
	text "U-MAMBOU!"
	prompt

Route20Swimmer3AfterBattleText:
	text "WONT YOU FLOAT"
	line "TOGETHER<⋯>WITH"
	cont "ME ON WAVES?"
	done

Route20Swimmer4Text:
	text_asm
	ld hl, Route20_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer4BattleText:
	text "DID YOU COME ON"
	line "RESORT VACATION?"
	done

Route20Swimmer4EndBattleText:
	text "NO HOLDING BACK!"
	prompt

Route20Swimmer4AfterBattleText:
	text "TWIN ISLANDS"
	line "WERE ONCE TWO"
	cont "ISLANDS SO I HEAR"
	done

Route20Swimmer5Text:
	text_asm
	ld hl, Route20_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer5BattleText:
	text "BEHOLD! THIS"
	line "TRAINED-UP BODY!"
	done

Route20Swimmer5EndBattleText:
	text "FLABBY MUSCLES!"
	prompt

Route20Swimmer5AfterBattleText:
	text "SHOULD HAVE"
	line "TRAINED MY #·"
	cont "NOT JUST MY BODY!"
	done

Route20Swimmer6Text:
	text_asm
	ld hl, Route20_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer6BattleText:
	text "RIDING A #<⋯>"
	line "PERHAPS YOU CANT"
	cont "SWIM AT ALL?!"
	done

Route20Swimmer6EndBattleText:
	text "GLUB GLUB BUKU!"
	prompt

Route20Swimmer6AfterBattleText:
	text "RIDING A # IN"
	line "WATER LOOKS SO"
	cont "MUCH FUN INDEED!"
	done

Route20CooltrainerMText:
	text_asm
	ld hl, Route20_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route20CooltrainerMBattleText:
	text "CLINGING ONTO A"
	line "BIRD #·I CAME"
	cont "ALL WAY OUT HERE!"
	done

Route20CooltrainerMEndBattleText:
	text "AH! TROUBLE NOW!"
	prompt

Route20CooltrainerMAfterBattleText:
	text "BIRD TIRED OUT"
	line "CANT FLY BACK!"
	cont "<⋯>WHAT TO DO?"
	done

Route20Swimmer7Text:
	text_asm
	ld hl, Route20_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer7BattleText:
	text "FROM MY BOYFRIEND"
	line "I RECEIVED A"
	cont "HUGE BIG PEARL!"
	done

Route20Swimmer7EndBattleText:
	text "YA-N! EVEN WITH"
	line "MY BIG PEARL<⋯>!"
	prompt

Route20Swimmer7AfterBattleText:
	text "IF CLOYSTER GROWS"
	line "BIGGER·WILL PEARL"
	cont "GROW BIGGER TOO?"
	done

Route20Swimmer8Text:
	text_asm
	ld hl, Route20_TrainerHeader8
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer8BattleText:
	text "SWAM FROM"
	line "CINNABAR ISLAND"
	cont "<⋯>REALLY TOUGH!"
	done

Route20Swimmer8EndBattleText:
	text "DISAPPOINTED<⋯>"
	prompt

Route20Swimmer8AfterBattleText:
	text "ON CINNABAR ISLE·"
	line "ABANDONED MANSION"
	cont "BECAME A HOME TO"
	cont "#·NOW CALLED"
	cont "# MANSION!"
	done

Route20Swimmer9Text:
	text_asm
	ld hl, Route20_TrainerHeader9
	call TalkToTrainer
	jp TextScriptEnd

Route20Swimmer9BattleText:
	text "WEST CINNABAR"
	line "ISLAND IS # LAB"
	cont "ISLE! MY PAPA"
	cont "WORKS THERE TOO!"
	done

Route20Swimmer9EndBattleText:
	text "WAIT A SEC MOU!"
	prompt

Route20Swimmer9AfterBattleText:
	text "CINNABAR WAS MADE"
	line "BY VOLCANIC"
	cont "ERUPTION RISING"
	cont "FROM THE OCEAN!"
	done

Route20SeafoamIslandsSignText:
	text "SEAFOAM ISLANDS"
	done
