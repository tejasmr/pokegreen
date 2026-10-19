RockTunnelPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

RockTunnelPokecenter_TextPointers:
	def_text_pointers
	dw_const RockTunnelPokecenterNurseText,            TEXT_ROCKTUNNELPOKECENTER_NURSE
	dw_const RockTunnelPokecenterGentlemanText,        TEXT_ROCKTUNNELPOKECENTER_GENTLEMAN
	dw_const RockTunnelPokecenterFisherText,           TEXT_ROCKTUNNELPOKECENTER_FISHER
	dw_const RockTunnelPokecenterLinkReceptionistText, TEXT_ROCKTUNNELPOKECENTER_LINK_RECEPTIONIST

RockTunnelPokecenterNurseText:
	script_pokecenter_nurse

RockTunnelPokecenterGentlemanText:
	text "DEPENDING ON"
	line "TYPES· # HAVE"
	cont "ADVANTAGE OVER"
	cont "SOME AND WEAK"
	cont "AGAINST OTHERS!"
	done

RockTunnelPokecenterFisherText:
	text "NO USE FOR IT·"
	line "SO I SOLD"
	cont "『KIN NO TAMA』!"
	cont "A GOLD NUGGET!"

	para "IT SOLD FOR"
	line "5000 YEN!"
	done

RockTunnelPokecenterLinkReceptionistText:
	script_cable_club_receptionist
