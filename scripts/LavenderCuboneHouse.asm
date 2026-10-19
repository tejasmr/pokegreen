LavenderCuboneHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

LavenderCuboneHouse_TextPointers:
	def_text_pointers
	dw_const LavenderCuboneHouseCuboneText,       TEXT_LAVENDERCUBONEHOUSE_CUBONE
	dw_const LavenderCuboneHouseBrunetteGirlText, TEXT_LAVENDERCUBONEHOUSE_BRUNETTE_GIRL

LavenderCuboneHouseCuboneText:
	text "CUBONE:『KYARGUU!』@"
	text_asm
	ld a, CUBONE
	call PlayCry
	jp TextScriptEnd

LavenderCuboneHouseBrunetteGirlText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, .PoorCubonesMotherText
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, .TheGhostIsGoneText
	call PrintText
.done
	jp TextScriptEnd

.PoorCubonesMotherText:
	text "I<⋯>! NEVER"
	line "FORGIVE <ROCKET>!"
	cont "『YURUSANAI』!"

	para "THAT OVER THERE"
	line "CUBONE MOTHER<⋯>"

	para "CAUGHT BY <ROCKET>"
	line "WAS KILLED WHILE"
	cont "TRYING ESCAPE!"
	done

.TheGhostIsGoneText:
	text "# TOWER GHOST"
	line "APPEARS NO MORE!"

	para "SOMEONE PACIFIED"
	line "WANDERING SOUL"
	cont "『TAMASHII』!"
	done

