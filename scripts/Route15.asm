Route15_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route15_TrainerHeaders
	ld de, Route15_ScriptPointers
	ld a, [wRoute15CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute15CurScript], a
	ret

Route15_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE15_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE15_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE15_END_BATTLE

Route15_TextPointers:
	def_text_pointers
	dw_const Route15CooltrainerF1Text, TEXT_ROUTE15_COOLTRAINER_F1
	dw_const Route15CooltrainerF2Text, TEXT_ROUTE15_COOLTRAINER_F2
	dw_const Route15CooltrainerM1Text, TEXT_ROUTE15_COOLTRAINER_M1
	dw_const Route15CooltrainerM2Text, TEXT_ROUTE15_COOLTRAINER_M2
	dw_const Route15Beauty1Text,       TEXT_ROUTE15_BEAUTY1
	dw_const Route15Beauty2Text,       TEXT_ROUTE15_BEAUTY2
	dw_const Route15Biker1Text,        TEXT_ROUTE15_BIKER1
	dw_const Route15Biker2Text,        TEXT_ROUTE15_BIKER2
	dw_const Route15CooltrainerF3Text, TEXT_ROUTE15_COOLTRAINER_F3
	dw_const Route15CooltrainerF4Text, TEXT_ROUTE15_COOLTRAINER_F4
	dw_const PickUpItemText,           TEXT_ROUTE15_TM_RAGE
	dw_const Route15SignText,          TEXT_ROUTE15_SIGN

	def_trainers Route15
	trainer EVENT_BEAT_ROUTE_15_TRAINER_0, 2, CooltrainerF1
	trainer EVENT_BEAT_ROUTE_15_TRAINER_1, 3, CooltrainerF2
	trainer EVENT_BEAT_ROUTE_15_TRAINER_2, 3, CooltrainerM1
	trainer EVENT_BEAT_ROUTE_15_TRAINER_3, 3, CooltrainerM2
	trainer EVENT_BEAT_ROUTE_15_TRAINER_4, 2, Beauty1
	trainer EVENT_BEAT_ROUTE_15_TRAINER_5, 3, Beauty2
	trainer EVENT_BEAT_ROUTE_15_TRAINER_6, 3, Biker1
	trainer EVENT_BEAT_ROUTE_15_TRAINER_7, 3, Biker2
	trainer EVENT_BEAT_ROUTE_15_TRAINER_8, 3, CooltrainerF3
	trainer EVENT_BEAT_ROUTE_15_TRAINER_9, 3, CooltrainerF4
	db -1 ; end

Route15CooltrainerF1Text:
	text_asm
	ld hl, Route15_TrainerHeader0
	jr Route15TalkToTrainer

Route15CooltrainerF2Text:
	text_asm
	ld hl, Route15_TrainerHeader1
	jr Route15TalkToTrainer

Route15CooltrainerM1Text:
	text_asm
	ld hl, Route15_TrainerHeader2
	jr Route15TalkToTrainer

Route15CooltrainerM2Text:
	text_asm
	ld hl, Route15_TrainerHeader3
	jr Route15TalkToTrainer

Route15Beauty1Text:
	text_asm
	ld hl, Route15_TrainerHeader4
	jr Route15TalkToTrainer

Route15Beauty2Text:
	text_asm
	ld hl, Route15_TrainerHeader5
	jr Route15TalkToTrainer

Route15Biker1Text:
	text_asm
	ld hl, Route15_TrainerHeader6
	jr Route15TalkToTrainer

Route15Biker2Text:
	text_asm
	ld hl, Route15_TrainerHeader7
	jr Route15TalkToTrainer

Route15CooltrainerF3Text:
	text_asm
	ld hl, Route15_TrainerHeader8
	jr Route15TalkToTrainer

Route15CooltrainerF4Text:
	text_asm
	ld hl, Route15_TrainerHeader9
Route15TalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

Route15CooltrainerF1BattleText:
	text "WITH MY FAVORITE"
	line "TRADED WITH A"
	cont "PAL·LETS MATCH!"
	done

Route15CooltrainerF1EndBattleText:
	text "DAME DAWA! NO!"
	prompt

Route15CooltrainerF1AfterBattleText:
	text "A TRADED #S"
	line "NICKNAME CANNOT"
	cont "BE CHANGED BY"
	cont "ANYONE EXCEPT"
	cont "ORIGINAL OWNER!"
	done

Route15CooltrainerF2BattleText:
	text "YOU LOOK GENTLE·"
	line "I FEEL NO LOSS!"
	cont "LETS HAVE A BOUT!"
	done

Route15CooltrainerF2EndBattleText:
	text "ARE? I LOST?!"
	prompt

Route15CooltrainerF2AfterBattleText:
	text "BIKERS GANG<⋯>"
	line "SEEN OFTEN BUT"
	cont "LOOK SO SCARY!"
	done

Route15CooltrainerM1BattleText:
	text "WHEN I WHISTLE"
	line "BIRD # COME"
	cont "FLYING TO ME!"
	done

Route15CooltrainerM1EndBattleText:
	text "SO SAD INDEED!"
	prompt

Route15CooltrainerM1AfterBattleText:
	text "PERHAPS MY TYPE"
	line "IS NOT SUITED FOR"
	cont "MATCHES<⋯>"
	done

Route15CooltrainerM2BattleText:
	text "OYA<⋯>? BIRDS"
	line "ARE TREMBLING!"
	cont "ARE YOU<⋯>STRONG?"
	done

Route15CooltrainerM2EndBattleText:
	text "JUST AS I KNEW!"
	prompt

Route15CooltrainerM2AfterBattleText:
	text "OBVIOUS THING<⋯>"
	line "BIRD # LAUGHS"
	cont "AT EARTHQUAKES"
	cont "AND FISSURES!"
	done

Route15Beauty1BattleText:
	text "ARA-N! SUCH A"
	line "CUTE BOY JUST"
	cont "LIKE A #!"
	done

Route15Beauty1EndBattleText:
	text "I LET DOWN GUARD!"
	prompt

Route15Beauty1AfterBattleText:
	text "MORTIFYING BUT"
	line "ONEESAN IS ADULT·"
	cont "I FORGIVE YOU!"
	done

Route15Beauty2BattleText:
	text "LISTEN<⋯>! I LIVE"
	line "ALONE·SO I KEEP"
	cont "# PETS!"
	done

Route15Beauty2EndBattleText:
	text "<⋯># IS NOT JUST"
	line "WINNING OR LOSS!"
	prompt

Route15Beauty2AfterBattleText:
	text "YES<⋯>RETURNING"
	line "HOME TO A #"
	cont "BRINGS DEEP"
	cont "PEACE OF MIND!"
	done

Route15Biker1BattleText:
	text "HEY KID! MATCH!"
	line "I EXTORTED THESE"
	cont "FROM SOME DUDE!"
	done

Route15Biker1EndBattleText:
	text "NO WAY DUDES!"
	prompt

Route15Biker1AfterBattleText:
	text "SHORT LIFE<⋯>!"
	line "BEING A BAD GUY"
	cont "IS MUCH COOLER!"
	cont "JUST LIKE <ROCKET>!"
	done

Route15Biker2BattleText:
	text "OOH! IF YOU LOSE"
	line "LEAVE ALL YOUR"
	cont "COINS BEHIND!"
	done

Route15Biker2EndBattleText:
	text "NO FAIR MAN!"
	prompt

Route15Biker2AfterBattleText:
	text "LEAVING CASH WAS"
	line "JUST A JOKE MAN!"
	cont "LIGHT JOKE ONLY!"
	done

Route15CooltrainerF3BattleText:
	text "WHATS POPULAR<⋯>?"
	line "WELL<⋯>TRADING"
	cont "# OF COURSE!"
	done

Route15CooltrainerF3EndBattleText:
	text "MOU<⋯>! TRADING"
	line "NOT FIGHTING!"
	prompt

Route15CooltrainerF3AfterBattleText:
	text "I OFTEN TRADE #"
	line "WITH MY FRIENDS!"
	done

Route15CooltrainerF4BattleText:
	text "LETS DO IT LETS!"
	line "LETS PLAY #!"
	done

Route15CooltrainerF4EndBattleText:
	text "RUSHED THE MATCH"
	line "TOO HARD!"
	prompt

Route15CooltrainerF4AfterBattleText:
	text "I WILL GO TRAIN"
	line "WITH WEAKER FOE!@"
	text_end

Route15SignText:
	text "ROUTE 15"
	line "WEST: FUCHSIA"
	cont "CITY"
	done
