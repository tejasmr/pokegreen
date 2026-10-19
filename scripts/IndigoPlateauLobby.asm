IndigoPlateauLobby_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	; Reset Elite Four events if the player started challenging them before
	ld hl, wElite4Flags
	bit BIT_STARTED_ELITE_4, [hl]
	res BIT_STARTED_ELITE_4, [hl]
	ret z
	; Elite 4 events
	ResetEventRange INDIGO_PLATEAU_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	def_text_pointers
	dw_const IndigoPlateauLobbyNurseText,            TEXT_INDIGOPLATEAULOBBY_NURSE
	dw_const IndigoPlateauLobbyGymGuideText,         TEXT_INDIGOPLATEAULOBBY_GYM_GUIDE
	dw_const IndigoPlateauLobbyCooltrainerFText,     TEXT_INDIGOPLATEAULOBBY_COOLTRAINER_F
	dw_const IndigoPlateauLobbyClerkText,            TEXT_INDIGOPLATEAULOBBY_CLERK
	dw_const IndigoPlateauLobbyLinkReceptionistText, TEXT_INDIGOPLATEAULOBBY_LINK_RECEPTIONIST

IndigoPlateauLobbyNurseText:
	script_pokecenter_nurse

IndigoPlateauLobbyGymGuideText:
	text "YO！ FUTURE"
	line "CHAMPION！"

	para "# LEAGUE RULE·"
	line "FIGHT 4『SHITENNO』"
	cont "IN A ROW MATCH！"

	para "IF LOSE·RESTART"
	line "FROM FIRST ONE！"
	cont "THIS IS FINAL！"
	cont "DO YOUR BEST！"
	done

IndigoPlateauLobbyCooltrainerFText:
	text "BEYOND HERE YOU"
	line "FIGHT『SHITENNO』"
	cont "ONE BY ONE！"

	para "IF YOU WIN·DOOR"
	line "OPENS TO DEEPER"
	cont "ROOM TO ADVANCE！"
	cont "GOOD LUCK！"
	done

IndigoPlateauLobbyLinkReceptionistText:
	script_cable_club_receptionist
