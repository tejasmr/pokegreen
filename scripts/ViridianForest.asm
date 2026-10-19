ViridianForest_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForest_TrainerHeaders
	ld de, ViridianForest_ScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForest_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_VIRIDIANFOREST_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANFOREST_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANFOREST_END_BATTLE

ViridianForest_TextPointers:
	def_text_pointers
	dw_const ViridianForestYoungster1Text,      TEXT_VIRIDIANFOREST_YOUNGSTER1
	dw_const ViridianForestYoungster2Text,      TEXT_VIRIDIANFOREST_YOUNGSTER2
	dw_const ViridianForestYoungster3Text,      TEXT_VIRIDIANFOREST_YOUNGSTER3
	dw_const ViridianForestYoungster4Text,      TEXT_VIRIDIANFOREST_YOUNGSTER4
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_ANTIDOTE
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_POTION
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_POKE_BALL
	dw_const ViridianForestYoungster5Text,      TEXT_VIRIDIANFOREST_YOUNGSTER5
	dw_const ViridianForestTrainerTips1Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS1
	dw_const ViridianForestUseAntidoteSignText, TEXT_VIRIDIANFOREST_USE_ANTIDOTE_SIGN
	dw_const ViridianForestTrainerTips2Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS2
	dw_const ViridianForestTrainerTips3Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS3
	dw_const ViridianForestTrainerTips4Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS4
	dw_const ViridianForestLeavingSignText,     TEXT_VIRIDIANFOREST_LEAVING_SIGN

	def_trainers ViridianForest, 2
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0, 4, Youngster2
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1, 4, Youngster3
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2, 1, Youngster4
	db -1 ; end

ViridianForestYoungster1Text:
	text "WITH TOMODACHI·"
	line "I CAME TO CATCH"
	cont "BUG #！"

	para "EVERYONE WANTS A"
	line "# MATCH！"
	cont "UZU-UZU ITCHING！"
	done

ViridianForestYoungster2Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestYoungster2BattleText:
	text "YOSHI-！ YOU HAVE"
	line "# NE？ LETS HAVE"
	cont "A SHOUBU MATCH！"
	done

ViridianForestYoungster2EndBattleText:
	text "MAKETA-！ LOST！"
	line "CATERPIE IS NO"
	cont "GOOD DAME KA<⋯>"
	prompt

ViridianForestYoungster2AfterBattleText:
	text "SHH<⋯>！ BUGS WILL"
	line "FLEE AWAY！"
	cont "MATA NA· SEE YA！"
	done

ViridianForestYoungster3Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestYoungster3BattleText:
	text "OI-！ IF YOU ARE"
	line "# <TRAINER>·"
	cont "CANT REFUSE A"
	cont "SHOUBU MATCH！"
	done

ViridianForestYoungster3EndBattleText:
	text "ARE？ ALREADY"
	line "OUT OF #！"
	prompt

ViridianForestYoungster3AfterBattleText:
	text "KUYASHII NA-！ SO"
	line "FRUSTRATING！"

	para "I GO CATCH MORE"
	line "TSUYOI STRONG #！"
	done

ViridianForestYoungster4Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestYoungster4BattleText:
	text "CHOTTO MATTA-！"
	line "WAIT A BIT！"

	para "WHERE ARE YOU"
	line "RUSHING OISOGI？"
	done

ViridianForestYoungster4EndBattleText:
	text "MAITTA！ I YIELD！"
	line "YOU ARE TSUYOI！"
	prompt

ViridianForestYoungster4AfterBattleText:
	text "HIDDEN THINGS ARE"
	line "DROPPED EVEN IF"
	cont "MIENAI· UNSEEN！"

	para "I DROPPED ITEM·"
	line "PLEASE LOOK TOO！"
	done

ViridianForestYoungster5Text:
	text "THREW BALLS TO"
	line "CATCH #· SOON"
	cont "RAN OUT FAST！"

	para "BETTER BUY PLENTY"
	line "MONSTER BALLS！"
	done

ViridianForestTrainerTips1Text:
	text "<⋯>USEFUL TIPS！"

	para "WHEN # WEAKEN"
	line "AND CANT FIGHT·"

	para "AVOID TALL GRASS"
	line "ON WAY HOME！"
	done

ViridianForestUseAntidoteSignText:
	text "HIT BY POISON？"
	line "USE DOKUKESHI·"
	cont "ANTIDOTE SHOP！"
	done

ViridianForestTrainerTips2Text:
	text "<⋯>USEFUL TIPS！"

	para "DR. OOKIDO CAN"
	line "RATING YOUR #DEX"
	cont "VIA <PC> MAIL！"
	done

ViridianForestTrainerTips3Text:
	text "<⋯>USEFUL TIPS！"

	para "OTHER PERSONS #"
	line "IS THEIR OWN！"

	para "ONLY THROW BALLS"
	line "AT WILD #！"
	done

ViridianForestTrainerTips4Text:
	text "<⋯>USEFUL TIPS！"

	para "WEAKEN WILD #"
	line "BEFORE CATCHING！"

	para "IF IT IS GENKI·"
	line "IT MIGHT FLEE！"
	done

ViridianForestLeavingSignText:
	text "TOKIWA FOREST<⋯>"
	line "EXIT DEGUCHI！"

	para "AHEAD IS NIBI"
	line "PEWTER CITY！"
	done
