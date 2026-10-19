SilphCo6F_Script:
	call SilphCo6F_GateCallbackScript
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo6F_TrainerHeaders
	ld de, SilphCo6F_ScriptPointers
	ld a, [wSilphCo6FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSilphCo6FCurScript], a
	ret

SilphCo6F_GateCallbackScript:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, .GateCoordinates
	call SilphCo4F_SetCardKeyDoorYScript
	call SilphCo6F_UnlockedDoorEventScript
	CheckEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret nz
	ld a, $5f
	ld [wNewTileBlockID], a
	lb bc, 6, 2
	predef_jump ReplaceTileBlock

.GateCoordinates:
	dbmapcoord  2,  6
	db -1 ; end

SilphCo6F_UnlockedDoorEventScript:
	ldh a, [hUnlockedSilphCoDoors]
	and a
	ret z
	SetEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret

SilphCo6F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SILPHCO6F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SILPHCO6F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SILPHCO6F_END_BATTLE

SilphCo6F_TextPointers:
	def_text_pointers
	dw_const SilphCo6FSilphWorkerM1Text, TEXT_SILPHCO6F_SILPH_WORKER_M1
	dw_const SilphCo6FSilphWorkerM2Text, TEXT_SILPHCO6F_SILPH_WORKER_M2
	dw_const SilphCo6FSilphWorkerF1Text, TEXT_SILPHCO6F_SILPH_WORKER_F1
	dw_const SilphCo6FSilphWorkerF2Text, TEXT_SILPHCO6F_SILPH_WORKER_F2
	dw_const SilphCo6FSilphWorkerM3Text, TEXT_SILPHCO6F_SILPH_WORKER_M3
	dw_const SilphCo6FRocket1Text,       TEXT_SILPHCO6F_ROCKET1
	dw_const SilphCo6FScientistText,     TEXT_SILPHCO6F_SCIENTIST
	dw_const SilphCo6FRocket2Text,       TEXT_SILPHCO6F_ROCKET2
	dw_const PickUpItemText,             TEXT_SILPHCO6F_HP_UP
	dw_const PickUpItemText,             TEXT_SILPHCO6F_X_ACCURACY

	def_trainers SilphCo6F, 6
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_0, 2, Rocket1
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_1, 3, Scientist
	trainer EVENT_BEAT_SILPH_CO_6F_TRAINER_2, 2, Rocket2
	db -1 ; end

SilphCo6FBeatGiovanniPrintDEOrPrintHLScript:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	jr nz, .beat_giovanni
	jr .print_text
.beat_giovanni
	ld h, d
	ld l, e
.print_text
	jp PrintText

SilphCo6FSilphWorkerM1Text:
	text_asm
	ld hl, .TookOverTheBuildingText
	ld de, .BackToWorkText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.TookOverTheBuildingText:
	text "THOSE RUFFIANS"
	line "BARGED IN AND"
	cont "SEIZED BUILDING!"
	done

.BackToWorkText:
	text "⋯WELL THEN!"
	line "MUST WORK NOW!"
	cont "BACK TO SHIGOTO!"
	done

SilphCo6FSilphWorkerM2Text:
	text_asm
	ld hl, .HelpMePleaseText
	ld de, .WeGotEngagedText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.HelpMePleaseText:
	text "BURU-BURU⋯!"
	line "KAMI-SAMA BUDDHA"
	cont "SAVE MY LIFE!"
	done

.WeGotEngagedText:
	text "WE GOT ENGAGED!"
	line "⋯SO SHY! TERERU!"
	done

SilphCo6FSilphWorkerF1Text:
	text_asm
	ld hl, .SuchACowardText
	ld de, .HaveToMarryHimText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.SuchACowardText:
	text "MAN NEXT TO ME⋯"
	line "HE IS PATHETIC"
	cont "FOR A GROWN MAN!"
	done

.HaveToMarryHimText:
	text "I FELT I MUST"
	line "STAY BESIDE HIM"
	cont "OR HE IS DOOMED!"
	done

SilphCo6FSilphWorkerF2Text:
	text_asm
	ld hl, .TeamRocketConquerWorldText
	ld de, .TeamRocketRanText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.TeamRocketConquerWorldText:
	text "<ROCKET> WANTS TO"
	line "RULE THE WORLD"
	cont "USING PETS!"
	done

.TeamRocketRanText:
	text "<ROCKET> FLED"
	line "THANKS TO YOU!"
	done

SilphCo6FSilphWorkerM3Text:
	text_asm
	ld hl, .TargetedSilphText
	ld de, .WorkForSilphText
	call SilphCo6FBeatGiovanniPrintDEOrPrintHLScript
	jp TextScriptEnd

.TargetedSilphText:
	text "SILPH MAKES MANY"
	line "PET GOODS SO WE"
	cont "WERE TARGETED!"
	done

.WorkForSilphText:
	text "WHEN YOU GROW UP"
	line "COME WORK AT"
	cont "SILPH COMPANY!"
	done

SilphCo6FRocket1Text:
	text_asm
	ld hl, SilphCo6F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6FRocket1BattleText:
	text "I AM ONE OF THE"
	line "<ROCKET> 4 BROTHERS"
	cont "『YON-KYOUDAI』!"
	done

SilphCo6FRocket1EndBattleText:
	text "I LOST!"
	prompt

SilphCo6FRocket1AfterBattleText:
	text "NO MATTER! MY"
	line "LITTLE BROTHER"
	cont "WILL AVENGE ME!"
	done

SilphCo6FScientistText:
	text_asm
	ld hl, SilphCo6F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6FScientistBattleText:
	text "CURSE PRESIDENT!"

	para "HE TRANSFERRED ME"
	line "TO TIKSI BRANCH"
	cont "IN TUNGUSKA!"
	cont "SO I JOIN <ROCKET>!"
	done

SilphCo6FScientistEndBattleText:
	text "GAKKURI! DOWN!"
	prompt

SilphCo6FScientistAfterBattleText:
	text "TUNGUSKA BRANCH?"
	line "AAH⋯ DEEP IN"
	cont "SNOWY SIBERIA!"
	done

SilphCo6FRocket2Text:
	text_asm
	ld hl, SilphCo6F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SilphCo6FRocket2BattleText:
	text "DONT THINK YOU"
	line "CAN BETRAY <ROCKET>"
	cont "FOR FREE!"
	done

SilphCo6FRocket2EndBattleText:
	text "YOU TRAITOR!"
	prompt

SilphCo6FRocket2AfterBattleText:
	text "NOT A TRAITOR?"
	line "IF ALLY OF RIGHT"
	cont "YOU ARE TRAITOR"
	cont "TO OUR CAUSE!"
	done
