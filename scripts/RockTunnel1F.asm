RockTunnel1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, RockTunnel1F_TrainerHeaders
	ld de, RockTunnel1F_ScriptPointers
	ld a, [wRockTunnel1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRockTunnel1FCurScript], a
	ret

RockTunnel1F_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROCKTUNNEL1F_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROCKTUNNEL1F_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROCKTUNNEL1F_END_BATTLE

RockTunnel1F_TextPointers:
	def_text_pointers
	dw_const RockTunnel1FHiker1Text,        TEXT_ROCKTUNNEL1F_HIKER1
	dw_const RockTunnel1FHiker2Text,        TEXT_ROCKTUNNEL1F_HIKER2
	dw_const RockTunnel1FHiker3Text,        TEXT_ROCKTUNNEL1F_HIKER3
	dw_const RockTunnel1FSuperNerdText,     TEXT_ROCKTUNNEL1F_SUPER_NERD
	dw_const RockTunnel1FCooltrainerF1Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F1
	dw_const RockTunnel1FCooltrainerF2Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F2
	dw_const RockTunnel1FCooltrainerF3Text, TEXT_ROCKTUNNEL1F_COOLTRAINER_F3
	dw_const RockTunnel1FSignText,          TEXT_ROCKTUNNEL1F_SIGN

	def_trainers RockTunnel1F
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_0, 4, Hiker1
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_1, 4, Hiker2
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_2, 3, Hiker3
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_3, 3, SuperNerd
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_4, 4, CooltrainerF1
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_5, 4, CooltrainerF2
	trainer EVENT_BEAT_ROCK_TUNNEL_1_TRAINER_6, 4, CooltrainerF3
	db -1 ; end

RockTunnel1FHiker1Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader0
	jr RockTunnel1FTalkToTrainer

RockTunnel1FHiker2Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader1
	jr RockTunnel1FTalkToTrainer

RockTunnel1FHiker3Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader2
	jr RockTunnel1FTalkToTrainer

RockTunnel1FSuperNerdText:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader3
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF1Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader4
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF2Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader5
	jr RockTunnel1FTalkToTrainer

RockTunnel1FCooltrainerF3Text:
	text_asm
	ld hl, RockTunnel1F_TrainerHeader6
RockTunnel1FTalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

RockTunnel1FHiker1BattleText:
	text "DO YOU PLAN TO"
	line "CROSS THIS LONG"
	cont "TUNNEL?!"
	done

RockTunnel1FHiker1EndBattleText:
	text "I LOST BADLY!"
	prompt

RockTunnel1FHiker1AfterBattleText:
	text "HIGH LEVEL IWARK"
	line "CAN SQUEEZE TIGHT"
	cont "BEWARE OF BIND!"
	done

RockTunnel1FHiker2BattleText:
	text "UHH<⋯> AM I LOST"
	line "ON THIS ROAD?"
	done

RockTunnel1FHiker2EndBattleText:
	text "NOT THE TIME"
	line "TO FIGHT! WHICH"
	cont "WAY IS EXIT?"
	prompt

RockTunnel1FHiker2AfterBattleText:
	text "# WAS SLEEPING"
	line "ON ROUTE 12 RIGHT"
	cont "I TOOK A DETOUR"
	cont "THROUGH HERE!"
	done

RockTunnel1FHiker3BattleText:
	text "I LIVED ON THIS"
	line "MOUNTAIN LONG!"
	cont "OUTSIDERS CANT"
	cont "ACT BIG HERE!"
	done

RockTunnel1FHiker3EndBattleText:
	text "NOT BAD AT ALL!"
	prompt

RockTunnel1FHiker3AfterBattleText:
	text "YOU HAVE PROMISE"
	line "WANT TO BECOME A"
	cont "『YAMA OTOKO』?"
	done

RockTunnel1FSuperNerdBattleText:
	text "# FIGHT!"
	line "READY GO!"
	done

RockTunnel1FSuperNerdEndBattleText:
	text "I WAS DEFEATED?"
	prompt

RockTunnel1FSuperNerdAfterBattleText:
	text "MAYBE I CATCH"
	line "A ZUBAT AND GO"
	cont "HOME<⋯>"
	done

RockTunnel1FCooltrainerF1BattleText:
	text "KYAA! DONT DO"
	line "WEIRD THINGS IN"
	cont "THE DIM DARK!"
	done

RockTunnel1FCooltrainerF1EndBattleText:
	text "<⋯>CANT SEE WELL"
	line "IN THE DARK!"
	prompt

RockTunnel1FCooltrainerF1AfterBattleText:
	text "EVEN IN TUNNELS"
	line "THERE ARE #!"
	cont "I SAW WANRIKY"
	cont "JUST NOW!"
	done

RockTunnel1FCooltrainerF2BattleText:
	text "LOOKING FOR #·"
	line "I CAME ALL THE"
	cont "WAY OUT HERE!"
	done

RockTunnel1FCooltrainerF2EndBattleText:
	text "NO MORE #!"
	prompt

RockTunnel1FCooltrainerF2AfterBattleText:
	text "DESPITE A CUTE"
	line "FACE· YOU ARE"
	cont "QUITE STRONG!"
	done

RockTunnel1FCooltrainerF3BattleText:
	text "AH! THAT IS #"
	line "LET US BEGIN"
	cont "RIGHT AWAY!"
	done

RockTunnel1FCooltrainerF3EndBattleText:
	text "I WILL START"
	line "OVER AGAIN!"
	prompt

RockTunnel1FCooltrainerF3AfterBattleText:
	text "I GOT EXCITED"
	line "AND SWEATED MUCH!"
	done

RockTunnel1FSignText:
	text "ROCK TUNNEL"
	line "HANADA CITY <⋯>"
	cont "SHION TOWN"
	done
