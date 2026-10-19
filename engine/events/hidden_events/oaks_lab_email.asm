DisplayOakLabEmailText:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	call EnableAutoTextBoxDrawing
	tx_pre_jump OakLabEmailText

OakLabEmailText::
	text "LOOKING AT <PC>·"
	line "AN E-MAIL HAS"
	cont "ARRIVED INBOX！"

	para "<⋯><⋯><⋯>"

	para "# TRAINERS WHO"
	line "RAISE # STRONG"
	cont "AND BATTLE！"
	cont "HERE STRONGEST"
	cont "TRAINERS GATHER！"

	para "LOCATION IS"
	line "SEKIEI PLATEAU"
	cont "# LEAGUE HQ！"
	cont "DR. OOKIDO PLEASE"
	cont "COME OBSERVE ONCE"
	cont "<⋯>FROM # LEAGUE"
	cont "<⋯><⋯><⋯>"
	done
