SafariZoneCenterRestHouse_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneCenterRestHouse_TextPointers:
	def_text_pointers
	dw_const SafariZoneCenterRestHouseGirlText,      TEXT_SAFARIZONECENTERRESTHOUSE_GIRL
	dw_const SafariZoneCenterRestHouseScientistText, TEXT_SAFARIZONECENTERRESTHOUSE_SCIENTIST

SafariZoneCenterRestHouseGirlText:
	text "ATSUKO『HE SAID"
	line "LETS GO CATCH #"
	cont "WHERE IS KOUJI?!"
	done

SafariZoneCenterRestHouseScientistText:
	text "ALRIGHT! CATCHING"
	line "LOTS OF # AS"
	cont "OMIYAGE SOUVENIR!"
	done

