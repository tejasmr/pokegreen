OpenOaksPC:
	call SaveScreenTilesToBuffer2
	ld hl, AccessedOaksPCText
	call PrintText
	ld hl, GetDexRatedText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .closePC
	predef DisplayDexRating
.closePC
	ld hl, ClosedOaksPCText
	call PrintText
	jp LoadScreenTilesFromBuffer2

GetDexRatedText:
	text "GET CURRENT #DEX"
	line "EVALUATED OK？"
	done

ClosedOaksPCText:
	text "<⋯>CLOSED LINK TO"
	line "PROF OAK <PC>！@"
	text_waitbutton
	text_end

AccessedOaksPCText:
	text "LINKED TO"
	line "PROF OAK <PC>！"

	para "#DEX RATING"
	line "SYSTEM ACCESSED！"
	prompt
