MtMoon1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon1F_TrainerHeaders
	ld de, MtMoon1F_ScriptPointers
	ld a, [wMtMoon1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoon1FCurScript], a
	ret

MtMoon1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MTMOON1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MTMOON1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MTMOON1F_END_BATTLE

MtMoon1F_TextPointers:
	def_text_pointers
	dw_const MtMoon1FHikerText,         TEXT_MTMOON1F_HIKER
	dw_const MtMoon1FYoungster1Text,    TEXT_MTMOON1F_YOUNGSTER1
	dw_const MtMoon1FCooltrainerF1Text, TEXT_MTMOON1F_COOLTRAINER_F1
	dw_const MtMoon1FSuperNerdText,     TEXT_MTMOON1F_SUPER_NERD
	dw_const MtMoon1FCooltrainerF2Text, TEXT_MTMOON1F_COOLTRAINER_F2
	dw_const MtMoon1FYoungster2Text,    TEXT_MTMOON1F_YOUNGSTER2
	dw_const MtMoon1FYoungster3Text,    TEXT_MTMOON1F_YOUNGSTER3
	dw_const PickUpItemText,            TEXT_MTMOON1F_POTION1
	dw_const PickUpItemText,            TEXT_MTMOON1F_MOON_STONE
	dw_const PickUpItemText,            TEXT_MTMOON1F_RARE_CANDY
	dw_const PickUpItemText,            TEXT_MTMOON1F_ESCAPE_ROPE
	dw_const PickUpItemText,            TEXT_MTMOON1F_POTION2
	dw_const PickUpItemText,            TEXT_MTMOON1F_TM_WATER_GUN
	dw_const MtMoon1FBewareZubatSign,   TEXT_MTMOON1F_BEWARE_ZUBAT_SIGN

	def_trainers MtMoon1F
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_0, 2, Hiker
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_1, 3, Youngster1
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_2, 3, CooltrainerF1
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_3, 3, SuperNerd
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_4, 3, CooltrainerF2
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_5, 3, Youngster2
	trainer EVENT_BEAT_MT_MOON_1_TRAINER_6, 3, Youngster3
	db -1 ; end

MtMoon1FHikerText:
	text_asm
	ld hl, MtMoon1F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FHikerBattleText:
	text "UWAH! WHAT A"
	line "BIG 『BIKKURI』!"
	cont "STARTLED ME SO!"
	cont "<⋯>JUST A KID?"
	done

MtMoon1FHikerEndBattleText:
	text "『ODOROITA』!"
	line "ASTONISHING!"
	prompt

MtMoon1FHikerAfterBattleText:
	text "KIDS SHOULD NOT"
	line "ROAM 『URO-URO』"
	cont "IN DARK CAVES!"
	done

MtMoon1FYoungster1Text:
	text_asm
	ld hl, MtMoon1F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster1BattleText:
	text "YOU TOO CAME FOR"
	line "CAVE 『TANKEN』?"
	cont "CAVE EXPLORING?"
	done

MtMoon1FYoungster1EndBattleText:
	text "<⋯>LOSING IS SO"
	line "『KAKKO-WARUI』!"
	cont "NOT COOL AT ALL!"
	prompt

MtMoon1FYoungster1AfterBattleText:
	text "I CAME THIS FAR"
	line "TO SHOW OFF TO"
	cont "A CUTE GIRL<⋯>"
	done

MtMoon1FCooltrainerF1Text:
	text_asm
	ld hl, MtMoon1F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FCooltrainerF1BattleText:
	text "WOW! INSIDE THE"
	line "CAVE IS SO VERY"
	cont "『HIROI』! WIDE!"
	done

MtMoon1FCooltrainerF1EndBattleText:
	text "AH<⋯> I LOST!"
	prompt

MtMoon1FCooltrainerF1AfterBattleText:
	text "IT IS SO BIG I"
	line "LOST TRACK OF"
	cont "THE EXIT WAY!"
	done

MtMoon1FSuperNerdText:
	text_asm
	ld hl, MtMoon1F_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FSuperNerdBattleText:
	text "UWAH! DONT YELL"
	line "AT ME SO VERY"
	cont "『KYUU NI』 SUDDEN!"
	done

MtMoon1FSuperNerdEndBattleText:
	text "<⋯>THESE # ARE"
	line "『DAME』! NO GOOD!"
	prompt

MtMoon1FSuperNerdAfterBattleText:
	text "WELL<⋯> WONDER"
	line "WHERE STRONGER"
	cont "# MONS ARE<⋯>"
	done

MtMoon1FCooltrainerF2Text:
	text_asm
	ld hl, MtMoon1F_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FCooltrainerF2BattleText:
	text "WHAT! WAITING FOR"
	line "A FRIEND WHO GOT"
	cont "LOST IN CAVE!"
	done

MtMoon1FCooltrainerF2EndBattleText:
	text "DID I LOSE?"
	prompt

MtMoon1FCooltrainerF2AfterBattleText:
	text "HEARD THERE ARE"
	line "GREAT 『KASEKI』"
	cont "FOSSILS INSIDE!"
	done

MtMoon1FYoungster2Text:
	text_asm
	ld hl, MtMoon1F_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster2BattleText:
	text "SUSPICIOUS MAN"
	line "LURKS IN CAVE!"
	cont "WHO ARE YOU<⋯>?"
	done

MtMoon1FYoungster2EndBattleText:
	text "I GOT DONE IN!"
	prompt

MtMoon1FYoungster2AfterBattleText:
	text "THAT GUY I SAW!"
	line "NO MISTAKE!"
	cont "HE IS OF"
	cont "TEAM ROCKET!"
	done

MtMoon1FYoungster3Text:
	text_asm
	ld hl, MtMoon1F_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

MtMoon1FYoungster3BattleText:
	text "TO REACH HANADA"
	line "YOU MUST CROSS"
	cont "THROUGH THE CAVE!"
	done

MtMoon1FYoungster3EndBattleText:
	text "MY TOTAL LOSS!"
	prompt

MtMoon1FYoungster3AfterBattleText:
	text "ZUBAT IS TOUGH!"
	line "BUT CAUGHT ONES"
	cont "ARE RELIABLE #!"
	done

MtMoon1FBewareZubatSign:
	text "BEWARE OF ZUBAT"
	line "『KYUUKETSU』 DRAIN"
	cont "BLOOD ATTACK!"
	done
