CinnabarPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CinnabarPokecenter_TextPointers:
	def_text_pointers
	dw_const CinnabarPokecenterNurseText,            TEXT_CINNABARPOKECENTER_NURSE
	dw_const CinnabarPokecenterCooltrainerFText,     TEXT_CINNABARPOKECENTER_COOLTRAINER_F
	dw_const CinnabarPokecenterGentlemanText,        TEXT_CINNABARPOKECENTER_GENTLEMAN
	dw_const CinnabarPokecenterLinkReceptionistText, TEXT_CINNABARPOKECENTER_LINK_RECEPTIONIST

CinnabarPokecenterNurseText:
	script_pokecenter_nurse

CinnabarPokecenterCooltrainerFText:
	text "DO YOU USE EVOLVE"
	line "CANCEL B-BUTTON?"

	para "STOP EVOLUTION"
	line "MIDWAY TO RAISE"
	cont "IN ORIGINAL FORM!"
	done

CinnabarPokecenterGentlemanText:
	text "DO YOU HAVE MANY"
	line "GOOD FRIENDS?"

	para "TRADED # GROW"
	line "MUCH FASTER!"

	para "IT IS VERY MUCH"
	line "WORTH TRYING!"
	done


CinnabarPokecenterLinkReceptionistText:
	script_cable_club_receptionist
