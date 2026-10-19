DisplayOakLabLeftPoster:
	call EnableAutoTextBoxDrawing
	tx_pre_jump PushStartText

PushStartText::
	text "PUSH START BUTTON"
	line "PUSH！ MENU WILL"
	cont "OPEN NOW-NARI！"
	done

DisplayOakLabRightPoster:
	call EnableAutoTextBoxDrawing
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp 2
	tx_pre_id SaveOptionText
	jr c, .ownLessThanTwo
	; own two or more mon
	tx_pre_id StrengthsAndWeaknessesText
.ownLessThanTwo
	jp PrintPredefTextID

SaveOptionText::
	text "TO SAVE·WRITE"
	line "# REPORT DILIGENT"
	cont "OFTEN-NARI！"
	done

StrengthsAndWeaknessesText::
	text "# HAVE STRONG"
	line "TYPES AND WEAK"
	cont "TYPES BY MATCHUP"
	cont "INDEED-NARI！"
	done
