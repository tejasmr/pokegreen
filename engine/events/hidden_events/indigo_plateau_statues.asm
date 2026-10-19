IndigoPlateauStatues::
	text_asm
	ld hl, IndigoPlateauStatuesText1
	call PrintText
	ld a, [wXCoord]
	bit 0, a ; even or odd?
	ld hl, IndigoPlateauStatuesText2
	jr nz, .ok
	ld hl, IndigoPlateauStatuesText3
.ok
	call PrintText
	jp TextScriptEnd

IndigoPlateauStatuesText1:
	text "SEKIEI PLATEAU！"
	prompt

IndigoPlateauStatuesText2:
	text "# TRAINER APEX·"
	line "# LEAGUE HQ！"
	done

IndigoPlateauStatuesText3:
	text "TOP AUTHORITY·"
	line "# LEAGUE HQ！"
	done
