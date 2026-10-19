TextScriptEndingText::
	text_end

TextScriptEnd::
	ld hl, TextScriptEndingText
	ret

ExclamationText::
	text "！"
	done

GroundRoseText::
	text "GROUND ROSE UP！"
	done

BoulderText::
	text "NEED STRENGTH<⋯>"
	done

MartSignText::
	text "GOODS FOR #！"
	line "# MART"
	done

PokeCenterSignText::
	text "HEAL YOUR #！"
	line "# CENTER"
	done

PickUpItemText::
	text_asm
	predef PickUpItem
	jp TextScriptEnd
