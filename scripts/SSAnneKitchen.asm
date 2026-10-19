SSAnneKitchen_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnneKitchen_TextPointers:
	def_text_pointers
	dw_const SSAnneKitchenCook1Text, TEXT_SSANNEKITCHEN_COOK1
	dw_const SSAnneKitchenCook2Text, TEXT_SSANNEKITCHEN_COOK2
	dw_const SSAnneKitchenCook3Text, TEXT_SSANNEKITCHEN_COOK3
	dw_const SSAnneKitchenCook4Text, TEXT_SSANNEKITCHEN_COOK4
	dw_const SSAnneKitchenCook5Text, TEXT_SSANNEKITCHEN_COOK5
	dw_const SSAnneKitchenCook6Text, TEXT_SSANNEKITCHEN_COOK6
	dw_const SSAnneKitchenCook7Text, TEXT_SSANNEKITCHEN_COOK7

SSAnneKitchenCook1Text:
	text "HEY! YOU ARE"
	line "IN THE WAY!"
	cont "OUT OF THE WAY!"
	cont "YOU ARE 『JAMA』!"
	done

SSAnneKitchenCook2Text:
	text "A STRANGE BALL"
	line "WAS THROWN IN"
	cont "THE TRASH CAN·"
	cont "I WONDER WHAT?"
	done

SSAnneKitchenCook3Text:
	text "I AM SO BUSY"
	line "MY HEAD SPINS!"
	cont "PLEASE GO AWAY"
	cont "OVER THERE!"
	done

SSAnneKitchenCook4Text:
	text "PEELING AWAY<⋯>"
	line "『SESSE SESSE』!"

	para "EVERY DAY I PEEL"
	line "POTATO SKINS!"
	cont "『SESSE SESSE』<⋯>"
	done

SSAnneKitchenCook5Text:
	text "BY THE WAY· DO"
	line "YOU KNOW GLUTTON"
	cont "KABIGON?"

	para "NO OTHER # EATS"
	line "SO MUCH AND"
	cont "SLEEPS SO MUCH!"
	done

SSAnneKitchenCook6Text:
	text "SOBBING AWAY<⋯>"
	line "『SHIKUSHIKU』<⋯>"

	para "EVERY DAY I PEEL"
	line "ONIONS AND CRY!"
	cont "『SHIKUSHIKU』<⋯>"
	done

SSAnneKitchenCook7Text:
	text_asm
	ld hl, .MainCourseIsText
	call PrintText
	ldh a, [hRandomAdd]
	bit 7, a
	jr z, .not_dialog_1
	ld hl, .SalmonDuSaladText
	jr .done
.not_dialog_1
	bit 4, a
	jr z, .not_dialog_2
	ld hl, .EelsAuBarbecueText
	jr .done
.not_dialog_2
	ld hl, .PrimeBeefSteakText
.done
	call PrintText
	jp TextScriptEnd

.MainCourseIsText:
	text "AHEM! I AM THE"
	line "CHEF OF KITCHEN!"

	para "TODAY MAIN DISH"
	line "SHALL BE"
	prompt

.SalmonDuSaladText:
	text "SOLE MEUNIERE!"

	para "BUT GUESTS MIGHT"
	line "SAY: FISH AGAIN?"
	done

.EelsAuBarbecueText:
	text "SALT-GRILLED"
	line "PACIFIC SAURY!"

	para "<⋯>WILL GUESTS GET"
	line "ANGRY AT THAT?"
	done

.PrimeBeefSteakText:
	text "BEEF FILLET"
	line "STEAK!"

	para "BUT DO WE HAVE"
	line "ENOUGH FOR ALL"
	cont "OUR GUESTS?"
	done
