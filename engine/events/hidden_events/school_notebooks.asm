PrintNotebookText:
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenEventFunctionArgument]
	jp PrintPredefTextID

TMNotebook::
	text "IT IS A <TM>"
	line "PAMPHLET BOOK！"
	cont "<⋯><⋯>"

	para "<TM> HAS 50"
	line "KINDS IN TOTAL！"

	para "HIDEN MACHINES"
	line "DO NOT VANISH"
	cont "AFTER BEING USED·"
	cont "5 TYPES IN ALL！"

	para "<⋯>SILPH COMPANY@"
	text_waitbutton
	text_end

ViridianSchoolNotebook::
	text_asm
	ld hl, ViridianSchoolNotebookText1
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText2
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText3
	call PrintText
	call TurnPageSchoolNotebook
	jr nz, .doneReading
	ld hl, ViridianSchoolNotebookText4
	call PrintText
	ld hl, ViridianSchoolNotebookText5
	call PrintText
.doneReading
	jp TextScriptEnd

TurnPageSchoolNotebook:
	ld hl, TurnPageText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret

TurnPageText:
	text "TURN TO NEXT"
	line "PAGE TO READ？"
	done

ViridianSchoolNotebookText5:
	text "GIRL『AAH-ッ！"
	line "DONT PEEK INTO"
	cont "MY NOTEBOOK！@"
	text_waitbutton
	text_end

ViridianSchoolNotebookText1:
	text "PEEKED NOTEBOOK！"

	para "PAGE 1<⋯>"

	para "CATCH # WITH"
	line "MONSTER BALLS·"
	cont "CAN CARRY UP TO"
	cont "6 PETS IN TEAM！"

	para "ONE WHO RAISES"
	line "# TO BATTLE"
	cont "IS『# TRAINER』！"
	prompt

ViridianSchoolNotebookText2:
	text "PAGE 2<⋯>"

	para "WHEN CATCHING #"
	line "WEAKEN IT FIRST！"
	cont "POISON OR BURN"
	cont "ARE GREAT TOO！"

	para "IF IT IS FULL"
	line "HEALTH·IT MAY BE"
	cont "HARD TO CATCH！"
	prompt

ViridianSchoolNotebookText3:
	text "PAGE 3<⋯>"

	para "BATTLING # AND"
	line "WINNING IS THE"
	cont "GREATEST JOY FOR"
	cont "ANY TRAINER！"

	para "IN # GYMS OF"
	line "EACH REGION·"
	cont "FIERCE BATTLES"
	cont "RAGE EVERY DAY！"
	prompt

ViridianSchoolNotebookText4:
	text "PAGE 4<⋯>"

	para "AIM OF TRAINER IS"
	line "TO DEFEAT 8 GYM"
	cont "LEADERS OF LAND！"

	para "AND AT # LEAGUE"
	line "HEADQUARTERS<⋯>"
	cont "FIERCE STRONG"

	para "『SHITENNO』REIGN"
	line "SUPREME ON TOP！"
	prompt
