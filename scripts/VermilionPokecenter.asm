VermilionPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

VermilionPokecenter_TextPointers:
	def_text_pointers
	dw_const VermilionPokecenterNurseText,            TEXT_VERMILIONPOKECENTER_NURSE
	dw_const VermilionPokecenterFishingGuruText,      TEXT_VERMILIONPOKECENTER_FISHING_GURU
	dw_const VermilionPokecenterSailorText,           TEXT_VERMILIONPOKECENTER_SAILOR
	dw_const VermilionPokecenterLinkReceptionistText, TEXT_VERMILIONPOKECENTER_LINK_RECEPTIONIST

VermilionPokecenterNurseText:
	script_pokecenter_nurse

VermilionPokecenterFishingGuruText:
	text "EVEN AT SAME"
	line "LEVEL· # HAVE"
	cont "DIFFERENT POWER!"

	para "AND # RAISED"
	line "BY HUMANS GROW"
	cont "STRONGER THAN"
	cont "WILD ONES!"
	done

VermilionPokecenterSailorText:
	text "MY # TOOK"
	line "POISON AND LOST"
	cont "ALL HP WHILE"
	cont "WALKING AROUND!"
	done

VermilionPokecenterLinkReceptionistText:
	script_cable_club_receptionist
