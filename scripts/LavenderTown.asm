LavenderTown_Script:
	jp EnableAutoTextBoxDrawing

LavenderTown_TextPointers:
	def_text_pointers
	dw_const LavenderTownLittleGirlText,       TEXT_LAVENDERTOWN_LITTLE_GIRL
	dw_const LavenderTownCooltrainerMText,     TEXT_LAVENDERTOWN_COOLTRAINER_M
	dw_const LavenderTownSuperNerdText,        TEXT_LAVENDERTOWN_SUPER_NERD
	dw_const LavenderTownSignText,             TEXT_LAVENDERTOWN_SIGN
	dw_const LavenderTownSilphScopeSignText,   TEXT_LAVENDERTOWN_SILPH_SCOPE_SIGN
	dw_const MartSignText,                     TEXT_LAVENDERTOWN_MART_SIGN
	dw_const PokeCenterSignText,               TEXT_LAVENDERTOWN_POKECENTER_SIGN
	dw_const LavenderTownPokemonHouseSignText, TEXT_LAVENDERTOWN_POKEMON_HOUSE_SIGN
	dw_const LavenderTownPokemonTowerSignText, TEXT_LAVENDERTOWN_POKEMON_TOWER_SIGN

LavenderTownLittleGirlText:
	text_asm
	ld hl, .DoYouBelieveInGhostsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .HaHaGuessNotText
	jr nz, .got_text
	ld hl, .SoThereAreBelieversText
.got_text
	call PrintText
	jp TextScriptEnd

.DoYouBelieveInGhostsText:
	text "YOU!"
	line "DO YOU THINK"
	cont "GHOSTS EXIST?"
	cont "『YUUREI』·GHOST!"
	done

.SoThereAreBelieversText:
	text "<⋯>HMM!"
	line "SO BELIEVER GUY"
	cont "REALLY EXISTS!"
	done

.HaHaGuessNotText:
	text "HAHA OF COURSE!"

	para "THAT WHITE HAND"
	line "PLACED ON YOUR"
	cont "RIGHT SHOULDER<⋯>"

	para "<⋯>MUST BE VISION"
	line "MISTAKE OF MINE!"
	done

LavenderTownCooltrainerMText:
	text "THIS TOWN FAMOUS"
	line "FOR # GRAVES!"
	cont "『OHAKA』·TOMB!"

	para "WHEN PET # DIES"
	line "WE CARRY TO TOWER"
	cont "AND PRAY FOR"
	cont "『MEIFUKU』·PEACE<⋯>"
	done

LavenderTownSuperNerdText:
	text "LATELY IN #"
	line "TOWER A GHOST"
	cont "APPEARS IT SEEMS!"

	para "SEEMS LIKE GHOST"
	line "OF # MURDERED"
	cont "BY EVIL TEAM"
	cont "<ROCKET> CRIMINALS<⋯>"
	done

LavenderTownSignText:
	text "LAVENDER TOWN"
	line "JAPAN:『SHION』!"
	cont "SHION IS PURPLE"
	cont "NOBLE COLOR!"
	done

LavenderTownSilphScopeSignText:
	text "CAN SEE UNSEEN"
	line "# CLEARLY?"
	cont "NEW PRODUCT!"
	cont "『SHIN SEIHIN』!"

	para "SILPH SCOPE!"
	line "<⋯>SILPH COMPANY"
	done

LavenderTownPokemonHouseSignText:
	text "LOVE VOLUNTEER"
	line "『AI NO BORANTIA』"
	cont "# HOUSE!"
	done

LavenderTownPokemonTowerSignText:
	text "# MEMORIAL"
	line "WORSHIP TOWER"
	cont "『REIHAI TOU』!"
	cont "# TOWER"
	done

