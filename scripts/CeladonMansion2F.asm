CeladonMansion2F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonMansion2F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion2FMeetingRoomSignText, TEXT_CELADONMANSION2F_MEETING_ROOM_SIGN

CeladonMansion2FMeetingRoomSignText:
	text "GAME FREAK"
	line "RECEPTION ROOM"
	done
