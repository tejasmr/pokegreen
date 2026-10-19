CeruleanPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

CeruleanPokecenter_TextPointers:
	def_text_pointers
	dw_const CeruleanPokecenterNurseText,            TEXT_CERULEANPOKECENTER_NURSE
	dw_const CeruleanPokecenterSuperNerdText,        TEXT_CERULEANPOKECENTER_SUPER_NERD
	dw_const CeruleanPokecenterGentlemanText,        TEXT_CERULEANPOKECENTER_GENTLEMAN
	dw_const CeruleanPokecenterLinkReceptionistText, TEXT_CERULEANPOKECENTER_LINK_RECEPTIONIST

CeruleanPokecenterLinkReceptionistText:
	script_cable_club_receptionist

CeruleanPokecenterNurseText:
	script_pokecenter_nurse

CeruleanPokecenterSuperNerdText:
	text "THAT MASAKI GUY!"

	para "TO GET HIS HANDS"
	line "ON RARE #⋯"

	para "I HEARD HE DOES"
	line "THIS AND THAT"
	cont "WITHOUT QUALMS!"
	done

CeruleanPokecenterGentlemanText:
	text "HAVE YOU HEARD"
	line "RUMORS OF MASAKI?"

	para "EVERYONE CALLS"
	line "HIM # MANIAC!"

	para "BUT COLLECTING"
	line "AND TO SHOW OFF·"
	cont "ALL PEOPLE HAVE"
	cont "SUCH FEELINGS!"

	para "THEY ARE ONLY"
	line "JEALOUS OF HIM!"
	done
