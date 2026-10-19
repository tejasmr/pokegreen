CeruleanTrashedHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanTrashedHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanTrashedHouseFishingGuruText, TEXT_CERULEANTRASHEDHOUSE_FISHING_GURU
	dw_const CeruleanTrashedHouseGirlText,        TEXT_CERULEANTRASHEDHOUSE_GIRL
	dw_const CeruleanTrashedHouseWallHoleText,    TEXT_CERULEANTRASHEDHOUSE_WALL_HOLE

CeruleanTrashedHouseFishingGuruText:
	text_asm
	ld b, TM_DIG
	predef GetQuantityOfItemInBag
	and b
	jr z, .no_dig_tm
	ld hl, .WhatsLostIsLostText
	call PrintText
	jr .done
.no_dig_tm
	ld hl, .TheyStoleATMText
	call PrintText
.done
	jp TextScriptEnd

.TheyStoleATMText:
	text "GRR⋯! THAT"
	line "CURSED <ROCKET>!"

	para "THEY TRASHED MY"
	line "HOUSE LIKE THIS!"

	para "THE STOLEN <TM>"
	line "TEACHES DIGGING"
	cont "GROUND TO MANKIE"
	cont "AND SAND!"

	para "THAT WAS SO"
	line "EXPENSIVE TOO!"
	done

.WhatsLostIsLostText:
	text "I GAVE UP ON"
	line "STOLEN THINGS"
	cont "RETURNING!"

	para "I WILL JUST"
	line "TRAIN MY DIGDA"
	cont "PATIENTLY TO"
	cont "LEARN TO DIG!"
	done

CeruleanTrashedHouseGirlText:
	text "<ROCKET>⋯!"
	line "MAKING # DIG"
	cont "HOLES LIKE THAT·"

	para "THEY MUST BE"
	line "PLOTTING EVIL"
	cont "SCHEMES AGAIN!"
	done

CeruleanTrashedHouseWallHoleText:
	text "A BIG HOLE IS"
	line "IN THE WALL!"

	para "YOU CAN EXIT"
	line "OUTSIDE FROM IT!"
	done
