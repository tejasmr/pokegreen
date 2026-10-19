ViridianPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

ViridianPokecenter_TextPointers:
	def_text_pointers
	dw_const ViridianPokecenterNurseText,            TEXT_VIRIDIANPOKECENTER_NURSE
	dw_const ViridianPokecenterGentlemanText,        TEXT_VIRIDIANPOKECENTER_GENTLEMAN
	dw_const ViridianPokecenterCooltrainerMText,     TEXT_VIRIDIANPOKECENTER_COOLTRAINER_M
	dw_const ViridianPokecenterLinkReceptionistText, TEXT_VIRIDIANPOKECENTER_LINK_RECEPTIONIST

ViridianPokecenterNurseText:
	script_pokecenter_nurse

ViridianPokecenterGentlemanText:
	text "PLEASE USE <PC>"
	line "FREELY IN CORNER!"

	para "⋯SO SAID MISS"
	line "AT FRONT DESK!"
	cont "KINDNESS INDEED!"
	done

ViridianPokecenterCooltrainerMText:
	text "# CENTER IS IN"
	line "EVERY TOWN AHEAD!"

	para "TOTAL FREE REST"
	line "FOR ANY NUMBER!"
	cont "USE FREQUENTLY!"
	done

ViridianPokecenterLinkReceptionistText:
	script_cable_club_receptionist
