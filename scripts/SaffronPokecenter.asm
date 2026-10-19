SaffronPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

SaffronPokecenter_TextPointers:
	def_text_pointers
	dw_const SaffronPokecenterNurseText,            TEXT_SAFFRONPOKECENTER_NURSE
	dw_const SaffronPokecenterBeautyText,           TEXT_SAFFRONPOKECENTER_BEAUTY
	dw_const SaffronPokecenterGentlemanText,        TEXT_SAFFRONPOKECENTER_GENTLEMAN
	dw_const SaffronPokecenterLinkReceptionistText, TEXT_SAFFRONPOKECENTER_LINK_RECEPTIONIST

SaffronPokecenterNurseText:
	script_pokecenter_nurse

SaffronPokecenterBeautyText:
	text "PETS GROW AT"
	line "DIFFERENT TEMPO"
	cont "BY EACH KIND!"
	done

SaffronPokecenterGentlemanText:
	text "ALL MEN KNOW"
	line "SILPH COMPANY!"
	cont "BUT BEING FAMOUS"
	cont "INVITES DANGER!"
	done

SaffronPokecenterLinkReceptionistText:
	script_cable_club_receptionist
