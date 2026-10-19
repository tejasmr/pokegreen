FuchsiaCity_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaCity_TextPointers:
	def_text_pointers
	dw_const FuchsiaCityYoungster1Text,      TEXT_FUCHSIACITY_YOUNGSTER1
	dw_const FuchsiaCityGamblerText,         TEXT_FUCHSIACITY_GAMBLER
	dw_const FuchsiaCityErikText,            TEXT_FUCHSIACITY_ERIK
	dw_const FuchsiaCityYoungster2Text,      TEXT_FUCHSIACITY_YOUNGSTER2
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_CHANSEY
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_VOLTORB
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_KANGASKHAN
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_SLOWPOKE
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_LAPRAS
	dw_const FuchsiaCityPokemonText,         TEXT_FUCHSIACITY_FOSSIL
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN1
	dw_const FuchsiaCitySignText,            TEXT_FUCHSIACITY_SIGN2
	dw_const FuchsiaCitySafariGameSignText,  TEXT_FUCHSIACITY_SAFARI_GAME_SIGN
	dw_const MartSignText,                   TEXT_FUCHSIACITY_MART_SIGN
	dw_const PokeCenterSignText,             TEXT_FUCHSIACITY_POKECENTER_SIGN
	dw_const FuchsiaCityWardensHomeSignText, TEXT_FUCHSIACITY_WARDENS_HOME_SIGN
	dw_const FuchsiaCitySafariZoneSignText,  TEXT_FUCHSIACITY_SAFARI_ZONE_SIGN
	dw_const FuchsiaCityGymSignText,         TEXT_FUCHSIACITY_GYM_SIGN
	dw_const FuchsiaCityChanseySignText,     TEXT_FUCHSIACITY_CHANSEY_SIGN
	dw_const FuchsiaCityVoltorbSignText,     TEXT_FUCHSIACITY_VOLTORB_SIGN
	dw_const FuchsiaCityKangaskhanSignText,  TEXT_FUCHSIACITY_KANGASKHAN_SIGN
	dw_const FuchsiaCitySlowpokeSignText,    TEXT_FUCHSIACITY_SLOWPOKE_SIGN
	dw_const FuchsiaCityLaprasSignText,      TEXT_FUCHSIACITY_LAPRAS_SIGN
	dw_const FuchsiaCityFossilSignText,      TEXT_FUCHSIACITY_FOSSIL_SIGN

FuchsiaCityYoungster1Text:
	text "DID YOU TRY"
	line "SAFARI GAME YET?"
	cont "RARE MONS ONLY"
	cont "FOUND THERE LIVE!"
	done

FuchsiaCityGamblerText:
	text "FRONT OF SAFARI"
	line "ZONE IS A ZOO!"

	para "DEEP INSIDE IS"
	line "CATCH-ALL SAFARI!"
	done

FuchsiaCityErikText:
	text "KOUJI『STRANGE<⋯>"
	line "MEETING ATSUKO TO"
	cont "CATCH BIRDS BUT"
	cont "NO BIRDS IN SIGHT"
	done

FuchsiaCityYoungster2Text:
	text "YOU WANTED THAT"
	line "ITEM BALL TOO?"
	cont "<⋯><⋯><⋯>ME TOO!"
	cont "<⋯>EH? THAT IS A"
	cont "LIVING CREATURE?!"
	done

FuchsiaCityPokemonText:
	text "！"
	done

FuchsiaCitySignText:
	text "SEKICHIKU CITY"
	line "PINK·THE COLOR OF"
	cont "GORGEOUS BLOOM!"
	done

FuchsiaCitySafariGameSignText:
	text "FAMOUS SAFARI!"
	line "<⋯><⋯>CATCH ALL"
	cont "THE # YOU WANT!"
	done

FuchsiaCityWardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDENS HOME"
	done

FuchsiaCitySafariZoneSignText:
	text "MANY VARIED #!"
	line "WELCOME TO"
	cont "SAFARI ZONE!"
	done

FuchsiaCityGymSignText:
	text "SEKICHIKU CITY"
	line "# GYM LEADER:"
	cont "KYOU KOGA!"
	cont "POISON EXPERT"
	cont "MASTER OF DOKU!"
	done

FuchsiaCityChanseySignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, CHANSEY
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "NAME: LUCKY"
	line "SUPER LUCKY IF"
	cont "YOU CATCH IT!"
	prompt

FuchsiaCityVoltorbSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, VOLTORB
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "NAME: BIRIRIDAMA"
	line "VOLTORB LOOKS"
	cont "JUST LIKE A BALL!"
	prompt

FuchsiaCityKangaskhanSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, KANGASKHAN
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "NAME: GARURA"
	line "FRIENDLY PARENT"
	cont "AND CHILD #!"

	para "RAISES BABY IN"
	line "POUCH ON BELLY!"
	prompt

FuchsiaCitySlowpokeSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, SLOWPOKE
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "NAME: YADON"
	line "FRIENDLY POPULAR"
	cont "SLOWPOKE #!"
	prompt

FuchsiaCityLaprasSignText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, LAPRAS
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "NAME: LAPLACE"
	line "KING OF THE SEAS·"
	cont "THE SEA DRAGON!"
	prompt

FuchsiaCityFossilSignText:
	text_asm
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .got_dome_fossil
	CheckEventReuseA EVENT_GOT_HELIX_FOSSIL
	jr nz, .got_helix_fossil
	ld hl, .UndeterminedText
	call PrintText
	jr .done
.got_dome_fossil
	ld hl, .OmanyteText
	call PrintText
	ld a, OMANYTE
	jr .display
.got_helix_fossil
	ld hl, .KabutoText
	call PrintText
	ld a, KABUTO
.display
	call DisplayPokedex
.done
	jp TextScriptEnd

.OmanyteText:
	text "NAME: OMNITE"
	line "REVIVED FROM AN"
	cont "ANCIENT FOSSIL!"
	prompt

.KabutoText:
	text "NAME: KABUTO"
	line "REVIVED FROM AN"
	cont "ANCIENT FOSSIL!"
	prompt

.UndeterminedText:
	text "<⋯>"
	done

