CeladonHotel_Script:
	jp EnableAutoTextBoxDrawing

CeladonHotel_TextPointers:
	def_text_pointers
	dw_const CeladonHotelGrannyText,    TEXT_CELADONHOTEL_GRANNY
	dw_const CeladonHotelBeautyText,    TEXT_CELADONHOTEL_BEAUTY
	dw_const CeladonHotelSuperNerdText, TEXT_CELADONHOTEL_SUPER_NERD

CeladonHotelGrannyText:
	text "HUH? #⋯?"
	line "AH⋯! THIS IS AN"
	cont "INN FOR HUMANS!"

	para "SADLY WE ARE ALL"
	line "BOOKED FULL!"
	done

CeladonHotelBeautyText:
	text "ON VACATION WITH"
	line "MY LITTLE BRO"
	cont "AND SWEETHEART!"

	para "TAMAMUSHI CITY"
	line "IS SUCH A PRETTY"
	cont "TOWN TO VISIT!"
	done

CeladonHotelSuperNerdText:
	text "WHY⋯? THIS TRIP"
	line "WAS SUPPOSED TO"
	cont "BE JUST US TWO!"
	done
