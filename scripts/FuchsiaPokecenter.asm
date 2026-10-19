FuchsiaPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

FuchsiaPokecenter_TextPointers:
	def_text_pointers
	dw_const FuchsiaPokecenterNurseText,            TEXT_FUCHSIAPOKECENTER_NURSE
	dw_const FuchsiaPokecenterRockerText,           TEXT_FUCHSIAPOKECENTER_ROCKER
	dw_const FuchsiaPokecenterCooltrainerFText,     TEXT_FUCHSIAPOKECENTER_COOLTRAINER_F
	dw_const FuchsiaPokecenterLinkReceptionistText, TEXT_FUCHSIAPOKECENTER_LINK_RECEPTIONIST

FuchsiaPokecenterNurseText:
	script_pokecenter_nurse

FuchsiaPokecenterRockerText:
	text "RAISING ONLY 1"
	line "MON WONT MAKE"
	cont "YOU STRONG!"

	para "BALANCING MANY"
	line "# IS TOUGH WORK"
	cont "THOUGH!"
	done

FuchsiaPokecenterCooltrainerFText:
	text "WEST OF TOKIWA·"
	line "VIRIDIAN CITY·IS"
	cont "A NARROW PATH."

	para "AT ITS END IS"
	line "# LEAGUE HQ"
	cont "FOR ALL TRAINERS!"
	done


FuchsiaPokecenterLinkReceptionistText:
	script_cable_club_receptionist
