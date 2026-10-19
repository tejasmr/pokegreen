RocketHideoutB1F_Script:
	call RocketHideoutB1FDoorCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, RocketHideoutB1F_TrainerHeaders
	ld de, RocketHideoutB1F_ScriptPointers
	ld a, [wRocketHideoutB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRocketHideoutB1FCurScript], a
	ret

RocketHideoutB1FDoorCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_ENTERED_ROCKET_HIDEOUT
	jr nz, .door_open
	CheckEventReuseA EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	jr nz, .play_sound_door_open
	ld a, $54 ; Door Block
	jr .set_door_block
.play_sound_door_open
	ld a, SFX_GO_INSIDE
	call PlaySound
	; BUG: should be SetEvent to avoid the SFX playing every time you enter the map
	CheckEventHL EVENT_ENTERED_ROCKET_HIDEOUT
.door_open
	ld a, $e ; Floor Block
.set_door_block
	ld [wNewTileBlockID], a
	lb bc, 8, 12
	predef_jump ReplaceTileBlock

RocketHideoutB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKETHIDEOUTB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKETHIDEOUTB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKETHIDEOUTB1F_END_BATTLE

RocketHideoutB1F_TextPointers:
	def_text_pointers
	dw_const RocketHideoutB1FRocket1Text, TEXT_ROCKETHIDEOUTB1F_ROCKET1
	dw_const RocketHideoutB1FRocket2Text, TEXT_ROCKETHIDEOUTB1F_ROCKET2
	dw_const RocketHideoutB1FRocket3Text, TEXT_ROCKETHIDEOUTB1F_ROCKET3
	dw_const RocketHideoutB1FRocket4Text, TEXT_ROCKETHIDEOUTB1F_ROCKET4
	dw_const RocketHideoutB1FRocket5Text, TEXT_ROCKETHIDEOUTB1F_ROCKET5
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_ESCAPE_ROPE
	dw_const PickUpItemText,              TEXT_ROCKETHIDEOUTB1F_HYPER_POTION

	def_trainers RocketHideoutB1F
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_0, 3, Rocket1
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_1, 2, Rocket2
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_2, 2, Rocket3
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_3, 3, Rocket4
	trainer EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4, 3, Rocket5
	db -1 ; end

RocketHideoutB1FRocket1Text:
	text_asm
	ld hl, RocketHideoutB1F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB1FRocket1BattleText:
	text "⋯WHO ARE YOU?!"
	line "HOW DID YOU GET"
	cont "INTO HERE?!"
	done

RocketHideoutB1FRocket1EndBattleText:
	text "OUCH! BEATEN!"
	prompt

RocketHideoutB1FRocket1AfterBattleText:
	text "DAMN IT⋯! YOU"
	line "LOOK DOWN UPON"
	cont "<ROCKET> POWER!"
	done

RocketHideoutB1FRocket2Text:
	text_asm
	ld hl, RocketHideoutB1F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB1FRocket2BattleText:
	text "SNEAKING INTO"
	line "<ROCKET> BASE?!"
	cont "WHAT NERVE!"
	done

RocketHideoutB1FRocket2EndBattleText:
	text "FLOORED⋯!"
	prompt

RocketHideoutB1FRocket2AfterBattleText:
	text "CURSES! DONT"
	line "THINK YOU CAN GET"
	cont "THROUGH EASILY!"
	done

RocketHideoutB1FRocket3Text:
	text_asm
	ld hl, RocketHideoutB1F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB1FRocket3BattleText:
	text "INTRUDER ALERT!"
	line "SPOTTED YOU!"
	done

RocketHideoutB1FRocket3EndBattleText:
	text "AAH! NO GOOD!"
	prompt

RocketHideoutB1FRocket3AfterBattleText:
	text "HMPH⋯!"
	line "SEARCHING FOR"
	cont "SILPH SCOPE?"
	cont "⋯I KNOW NOTHING!"
	done

RocketHideoutB1FRocket4Text:
	text_asm
	ld hl, RocketHideoutB1F_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB1FRocket4BattleText:
	text "WHY DID YOU COME"
	line "HERE? TELL ME!"
	done

RocketHideoutB1FRocket4EndBattleText:
	text "THIS IS BAD!"
	prompt

RocketHideoutB1FRocket4AfterBattleText:
	text "OKAY I TALK⋯"
	line "IF YOU WANT TO"
	cont "SEE THE BOSS·"
	cont "TAKE ELEVATOR!"
	done

RocketHideoutB1FRocket5Text:
	text_asm
	ld hl, RocketHideoutB1F_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RocketHideoutB1FRocket5BattleText:
	text "ARE YOU A LOST"
	line "LITTLE BOY⋯?"
	done

RocketHideoutB1FRocket5EndBattleText:
	text "WHY ME?!@"
	text_asm
	SetEvent EVENT_BEAT_ROCKET_HIDEOUT_1_TRAINER_4
	ld hl, .prompt_end
	ret

.prompt_end:
	text_promptbutton
	text_end

RocketHideoutB1FRocket5AfterBattleText:
	text "HUH? FROM THE"
	line "COMMOTION JUST"
	cont "NOW· THE DOOR"
	cont "OPENED UP!"
	done
