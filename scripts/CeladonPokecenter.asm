CeladonPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeladonPokecenter_TextPointers:
	def_text_pointers
	dw_const CeladonPokecenterNurseText,            TEXT_CELADONPOKECENTER_NURSE
	dw_const CeladonPokecenterGentlemanText,        TEXT_CELADONPOKECENTER_GENTLEMAN
	dw_const CeladonPokecenterBeautyText,           TEXT_CELADONPOKECENTER_BEAUTY
	dw_const CeladonPokecenterLinkReceptionistText, TEXT_CELADONPOKECENTER_LINK_RECEPTIONIST

CeladonPokecenterLinkReceptionistText:
	script_cable_club_receptionist

CeladonPokecenterNurseText:
	script_pokecenter_nurse

CeladonPokecenterGentlemanText:
	text "SLEEPING # JUMP"
	line "AWAKE AT SOUND"
	cont "OF # FLUTE"

	para "BECAUSE IT PLAYS"
	line "A SPECIAL TONE"
	cont "INAUDIBLE TO"
	cont "HUMAN EARS!"
	done

CeladonPokecenterBeautyText:
	text "CAME UP FROM"
	line "SEKICHIKU CITY!"

	para "CYCLING ROAD IS"
	line "ALL UPHILL SO"
	cont "I AM EXHAUSTED!"
	done
