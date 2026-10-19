SSAnne1FRooms_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne1FRooms_TrainerHeaders
	ld de, SSAnne1FRooms_ScriptPointers
	ld a, [wSSAnne1FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne1FRoomsCurScript], a
	ret

SSAnne1FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNE1FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNE1FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNE1FROOMS_END_BATTLE

SSAnne1FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnne1FRoomsGentleman1Text,    TEXT_SSANNE1FROOMS_GENTLEMAN1
	dw_const SSAnne1FRoomsGentleman2Text,    TEXT_SSANNE1FROOMS_GENTLEMAN2
	dw_const SSAnne1FRoomsYoungsterText,     TEXT_SSANNE1FROOMS_YOUNGSTER
	dw_const SSAnne1FRoomsCooltrainerFText,  TEXT_SSANNE1FROOMS_COOLTRAINER_F
	dw_const SSAnne1FRoomsGirl1Text,         TEXT_SSANNE1FROOMS_GIRL1
	dw_const SSAnne1FRoomsMiddleAgedManText, TEXT_SSANNE1FROOMS_MIDDLE_AGED_MAN
	dw_const SSAnne1FRoomsLittleGirlText,    TEXT_SSANNE1FROOMS_LITTLE_GIRL
	dw_const SSAnne1FRoomsWigglytuffText,    TEXT_SSANNE1FROOMS_WIGGLYTUFF
	dw_const SSAnne1FRoomsGirl2Text,         TEXT_SSANNE1FROOMS_GIRL2
	dw_const PickUpItemText,                 TEXT_SSANNE1FROOMS_TM_BODY_SLAM
	dw_const SSAnne1FRoomsGentleman3Text,    TEXT_SSANNE1FROOMS_GENTLEMAN3

	def_trainers SSAnne1FRooms
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_0, 2, Gentleman1
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_1, 3, Gentleman2
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_2, 2, Youngster
	trainer EVENT_BEAT_SS_ANNE_8_TRAINER_3, 2, CooltrainerF
	db -1 ; end

SSAnne1FRoomsGentleman1Text:
	text_asm
	ld hl, SSAnne1FRooms_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsGentleman1BattleText:
	text "I AM TRAVELER<⋯>"
	line "『TABIBITO』!"

	para "# CAUGHT ON ROAD"
	line "ARE MY ONLY"
	cont "FRIENDS!"
	done

SSAnne1FRoomsGentleman1EndBattleText:
	text "M-MY FRIENDS<⋯>"
	prompt

SSAnne1FRoomsGentleman1AfterBattleText:
	text "LISTEN HERE!"
	line "TREAT YOUR"
	cont "FRIENDS WELL!"
	done

SSAnne1FRoomsGentleman2Text:
	text_asm
	ld hl, SSAnne1FRooms_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsGentleman2BattleText:
	text "HM? WHO ARE YOU?"
	line "ENTERING QUIETLY"
	cont "SO RUDE A CHILD!"
	done

SSAnne1FRoomsGentleman2EndBattleText:
	text "HUMPH! YOU HAVE"
	line "NO 『REIGI』"
	cont "MANNERS AT ALL!"
	prompt

SSAnne1FRoomsGentleman2AfterBattleText:
	text "I WANT TO BE"
	line "ALONE IN PEACE!"
	cont "PLEASE GET OUT!"
	done

SSAnne1FRoomsYoungsterText:
	text_asm
	ld hl, SSAnne1FRooms_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsYoungsterBattleText:
	text "I LOVE #!"
	line "DO YOU PLAY WITH"
	cont "# TOO?"
	done

SSAnne1FRoomsYoungsterEndBattleText:
	text "UWAA! YOU ARE"
	line "SO STRONG!"
	prompt

SSAnne1FRoomsYoungsterAfterBattleText:
	text "HEY HEY! BECOME"
	line "MY FRIEND!"

	para "LET US DO SOME"
	line "# TRADING!"
	done

SSAnne1FRoomsCooltrainerFText:
	text_asm
	ld hl, SSAnne1FRooms_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne1FRoomsCooltrainerFBattleText:
	text "LOOK AT MY #"
	line "COLLECTED FROM"
	cont "ALL OVER WORLD!"
	done

SSAnne1FRoomsCooltrainerFEndBattleText:
	text "NO WAY! AND THEY"
	line "WERE WORLD #<⋯>"
	prompt

SSAnne1FRoomsCooltrainerFAfterBattleText:
	text "GEEZ<⋯>! LOOK AT"
	line "WHAT YOU DID TO"
	cont "MY DEAR #!"

	para "I MUST HEAL THEM"
	line "AT # CENTER!"
	done

SSAnne1FRoomsGirl1Text:
	text "HEY WAITER BOY!"
	line "I WANT SOME CAKE!"
	cont "MILLE-FEUILLE·"
	cont "PLEASE BRING IT!"
	done

SSAnne1FRoomsMiddleAgedManText:
	text "OVERSEAS TRAVEL"
	line "BY SHIP IS SO"
	cont "ELEGANT AND NICE!"
	done

SSAnne1FRoomsLittleGirlText:
	text "ME AND PUKURIN"
	line "ARE ALWAYS"
	cont "TOGETHER!"
	done

SSAnne1FRoomsWigglytuffText:
	text "PUKURIN: 『PUU"
	line "PUPUU』!@"
	text_asm
	ld a, WIGGLYTUFF
	call PlayCry
	jp TextScriptEnd

SSAnne1FRoomsGirl2Text:
	text "I TRAVEL AROUND"
	line "THE WORLD WITH"
	cont "MY KIDS· OHOHO!"
	done

SSAnne1FRoomsGentleman3Text:
	text "SHH<⋯>! I AM"
	line "『KOKUSAI』 POLICE!"
	cont "GLOBAL AGENT!"

	para "I AM TRACKING"
	line "<ROCKET> EVIL PLOT!"
	done
