RockTunnelB1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnelB1F_TrainerHeaders
	ld de, RockTunnelB1F_ScriptPointers
	ld a, [wRockTunnelB1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnelB1FCurScript], a
	ret

RockTunnelB1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKTUNNELB1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKTUNNELB1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKTUNNELB1F_END_BATTLE

RockTunnelB1F_TextPointers:
	def_text_pointers
	dw_const RockTunnelB1FCooltrainerF1Text, TEXT_ROCKTUNNELB1F_COOLTRAINER_F1
	dw_const RockTunnelB1FHiker1Text,        TEXT_ROCKTUNNELB1F_HIKER1
	dw_const RockTunnelB1FSuperNerd1Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD1
	dw_const RockTunnelB1FSuperNerd2Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD2
	dw_const RockTunnelB1FHiker2Text,        TEXT_ROCKTUNNELB1F_HIKER2
	dw_const RockTunnelB1FCooltrainerF2Text, TEXT_ROCKTUNNELB1F_COOLTRAINER_F2
	dw_const RockTunnelB1FHiker3Text,        TEXT_ROCKTUNNELB1F_HIKER3
	dw_const RockTunnelB1FSuperNerd3Text,    TEXT_ROCKTUNNELB1F_SUPER_NERD3

	def_trainers RockTunnelB1F
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_0, 4, CooltrainerF1
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_1, 3, Hiker1
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_2, 3, SuperNerd1
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_3, 4, SuperNerd2
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_4, 3, Hiker2
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_5, 4, CooltrainerF2
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_6, 3, Hiker3
	trainer EVENT_BEAT_ROCK_TUNNEL_2_TRAINER_7, 3, SuperNerd3
	db -1 ; end

RockTunnelB1FCooltrainerF1Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FCooltrainerF1BattleText:
	text "GIRL SCOUTS WALK"
	line "DROPPING TWIGS"
	cont "NOT TO GET LOST"
	cont "IN MOUNTAINS!"
	done

RockTunnelB1FCooltrainerF1EndBattleText:
	text "YAAAN<⋯>! AND I"
	line "TRIED SO HARD!"
	prompt

RockTunnelB1FCooltrainerF1AfterBattleText:
	text "I LOST SO I"
	line "SHALL GO HOME"
	cont "FOR TODAY!"
	done

RockTunnelB1FHiker1Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FHiker1BattleText:
	text "HAHAHA! CAN YOU"
	line "BEAT MY POWER?!"
	done

RockTunnelB1FHiker1EndBattleText:
	text "WHOA-TTO-TTO!"
	line "OUT-POWERED!"
	prompt

RockTunnelB1FHiker1AfterBattleText:
	text "I OBSESS ON"
	line "POWER CAUSE I"
	cont "CANT THINK WHILE"
	cont "FIGHTING!"
	done

RockTunnelB1FSuperNerd1Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FSuperNerd1BattleText:
	text "MAKING A #"
	line "『ZUKAN』 DEX?!"
	cont "DAMN! I WANT TO"
	cont "MAKE ONE TOO!"
	done

RockTunnelB1FSuperNerd1EndBattleText:
	text "AHH GEEZ! SO"
	line "FRUSTRATING!"
	prompt

RockTunnelB1FSuperNerd1AfterBattleText:
	text "<⋯>SO LISTEN· WHEN"
	line "DEX IS FINISHED"
	cont "WONT YOU GIVE"
	cont "IT TO ME?"
	done

RockTunnelB1FSuperNerd2Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FSuperNerd2BattleText:
	text "UM<⋯> DO YOU KNOW"
	line "# 『COSPLAY』?"
	done

RockTunnelB1FSuperNerd2EndBattleText:
	text "CANT BE HELPED"
	line "I GUESS!"
	prompt

RockTunnelB1FSuperNerd2AfterBattleText:
	text "『COSPLAY』 MEANS"
	line "MAKING A PIPPI"
	cont "COSTUME SUIT TO"
	cont "BECOME THE #!"
	done

RockTunnelB1FHiker2Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FHiker2BattleText:
	text "MY # TECHNIQUE"
	line "WILL MAKE YOU"
	cont "CRY FOR MERCY!"
	done

RockTunnelB1FHiker2EndBattleText:
	text "I GIVE UP! YOU"
	line "ARE REAL PRO"
	cont "TECHNICIAN!"
	prompt

RockTunnelB1FHiker2AfterBattleText:
	text "YES INDEED<⋯> IN"
	line "MOUNTAINS· ROCK"
	cont "TYPES ARE MANY!"
	done

RockTunnelB1FCooltrainerF2Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FCooltrainerF2BattleText:
	text "I CAN BATTLE· BUT"
	line "<⋯>I RARELY COME"
	cont "AROUND HERE!"
	done

RockTunnelB1FCooltrainerF2EndBattleText:
	text "I WENT AND LOST!"
	prompt

RockTunnelB1FCooltrainerF2AfterBattleText:
	text "I LIKE TINY #"
	line "BIG ONES ARE"
	cont "SCARY AND MEAN!"
	done

RockTunnelB1FHiker3Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FHiker3BattleText:
	text "IF YOU ARE A MAN"
	line "HIT ME WITH"
	cont "A BOOM 『DOON』!"
	done

RockTunnelB1FHiker3EndBattleText:
	text "BOOM! 『DOON』!"
	line "I GOT CLOBBERED!"
	prompt

RockTunnelB1FHiker3AfterBattleText:
	text "I WILL RAISE #"
	line "NOT TO LOSE TO"
	cont "YOU NEXT TIME!"
	done

RockTunnelB1FSuperNerd3Text:
	text_asm
	ld hl, RockTunnelB1F_TrainerHeader7
	call TalkToTrainer
	jp TextScriptEnd

RockTunnelB1FSuperNerd3BattleText:
	text "WHEN AT HOME· I"
	line "DRAW # ART AND"
	cont "ILLUSTRATIONS!"
	done

RockTunnelB1FSuperNerd3EndBattleText:
	text "AHH<⋯> I AM"
	line "SO EXHAUSTED!"
	prompt

RockTunnelB1FSuperNerd3AfterBattleText:
	text "I AM NOT CUT"
	line "OUT FOR BATTLE·"
	cont "I WILL GO HOME"
	cont "AND DRAW ART!"
	done
