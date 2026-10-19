Route15GateLeftBinoculars:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre Route15UpstairsBinocularsText
	ld a, ARTICUNO
	ld [wCurPartySpecies], a
	call PlayCry
	jp DisplayMonFrontSpriteInBox

Route15UpstairsBinocularsText::
	text "LOOKED INTO"
	line "BINOCULARS<⋯>"

	para "A LARGE BIRD IS"
	line "SHINING BRIGHT·"
	cont "FLYING TOWARD"
	cont "THE OCEAN SEA<⋯>"
	done
