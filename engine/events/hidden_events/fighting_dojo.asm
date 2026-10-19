PrintFightingDojoText2:
	call EnableAutoTextBoxDrawing
	tx_pre_jump EnemiesOnEverySideText

EnemiesOnEverySideText::
	text "『SHIMEN SOKA』！"
	line "FOES ON ALL SIDES"
	done

PrintFightingDojoText3:
	call EnableAutoTextBoxDrawing
	tx_pre_jump WhatGoesAroundComesAroundText

WhatGoesAroundComesAroundText::
	text "『INGA OUHOU』！"
	line "KARMIC JUSTICE！"
	done

PrintFightingDojoText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump FightingDojoText

FightingDojoText::
	text "FIGHTING DOJO！"
	line "『KAKUTOU DOUJOU』"
	done
