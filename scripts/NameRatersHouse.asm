NameRatersHouse_Script:
	jp EnableAutoTextBoxDrawing

NameRatersHouseYesNoScript:
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

NameRatersHouseCheckMonOTScript:
; return carry if mon's OT name or OT ID do not match the player's
	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerName
	ld c, NAME_LENGTH
	call .check_match_loop
	jr c, .no_match
	ld hl, wPartyMon1OTID
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, wPlayerID
	ld c, $2
.check_match_loop
	ld a, [de]
	cp [hl]
	jr nz, .no_match
	inc hl
	inc de
	dec c
	jr nz, .check_match_loop
	and a
	ret
.no_match
	scf
	ret

NameRatersHouse_TextPointers:
	def_text_pointers
	dw_const NameRatersHouseNameRaterText, TEXT_NAMERATERSHOUSE_NAME_RATER

NameRatersHouseNameRaterText:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, .WantMeToRateText
	call NameRatersHouseYesNoScript
	jr nz, .did_not_rename
	ld hl, .WhichPokemonText
	call PrintText
	xor a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	jr c, .did_not_rename
	call GetPartyMonName2
	call NameRatersHouseCheckMonOTScript
	ld hl, .ATrulyImpeccableNameText
	jr c, .done
	ld hl, .GiveItANiceNameText
	call NameRatersHouseYesNoScript
	jr nz, .did_not_rename
	ld hl, .WhatShouldWeNameItText
	call PrintText
	farcall DisplayNameRaterScreen
	jr c, .did_not_rename
	ld hl, .PokemonHasBeenRenamedText
.done
	call PrintText
	jp TextScriptEnd
.did_not_rename
	ld hl, .ComeAnyTimeYouLikeText
	jr .done

.WantMeToRateText:
	text "YES YES! I AM"
	line "NAME DIVINER!"
	cont "『SEIMEI HANDAN』"
	cont "ONOMIC FORTUNE!"

	para "YES! I APPRAISE"
	line "YOUR # NICKNAME!"
	done

.WhichPokemonText:
	text "WHICH # WILL"
	line "HAVE NICKNAME"
	cont "APPRAISED TODAY?"
	prompt

.GiveItANiceNameText:
	text "HMM @"
	text_ram wNameBuffer
	text "!"
	line "QUITE A DECENT"
	cont "NAME YOU GAVE IT!"

	para "BUT YOU SEE<⋯>"
	line "HOW ABOUT A BIT"
	cont "BETTER ONE?"

	para "SHALL I BESTOW?"
	line "HOW ABOUT IT?"
	done

.WhatShouldWeNameItText:
	text "VERY WELL THEN!"
	line "WHAT NICKNAME"
	cont "SHALL WE BESTOW?"
	prompt

.PokemonHasBeenRenamedText:
	text "OKAY! FROM NOW"
	line "THIS # IS"
	cont "@"
	text_ram wBuffer
	text "!"

	para "ISNT THAT A MUCH"
	line "BETTER NAME NOW?"
	cont "CONGRATULATIONS!"
	done

.ComeAnyTimeYouLikeText:
	text "I SEE! UNDERSTOOD"
	line "PLEASE COME VISIT"
	cont "AGAIN ANYTIME!"
	done

.ATrulyImpeccableNameText:
	text "HMM @"
	text_ram wNameBuffer
	text "!"
	line "TRULY SPLENDID"
	cont "NAME! FLAWLESS!"

	para "TREAT @"
	text_ram wNameBuffer
	text ""
	line "WITH GREAT LOVE"
	cont "ALWAYS FOREVER!"
	done

