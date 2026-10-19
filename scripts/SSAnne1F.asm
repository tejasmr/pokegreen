SSAnne1F_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnne1F_TextPointers:
	def_text_pointers
	dw_const SSAnne1FWaiterText, TEXT_SSANNE1F_WAITER
	dw_const SSAnne1FSailorText, TEXT_SSANNE1F_SAILOR

SSAnne1FWaiterText:
	text "BONJOUR!"
	line "I AM CABIN WAITER"
	cont "ON THIS SHIP!"

	para "ANY SERVICE YOU"
	line "NEED· JUST ASK!"

	para "<⋯> <⋯> <⋯>"
	line "<⋯>YOU ARE VERY"
	cont "『MUKUCHI』!"
	cont "SO QUIET PERSON!"
	done

SSAnne1FSailorText:
	text "PASSENGERS ARE"
	line "SO BORED OF"
	cont "THIS LONG TRIP!"

	para "SOME MAY BATTLE"
	line "YOU TO KILL"
	cont "『HIMA』 TIME!"
	done
