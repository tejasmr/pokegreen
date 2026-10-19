CinnabarLab_Script:
	call EnableAutoTextBoxDrawing
	ret

CinnabarLab_TextPointers:
	def_text_pointers
	dw_const CinnabarLabFishingGuruText,     TEXT_CINNABARLAB_FISHING_GURU
	dw_const CinnabarLabPhotoText,           TEXT_CINNABARLAB_PHOTO
	dw_const CinnabarLabMeetingRoomSignText, TEXT_CINNABARLAB_MEETING_ROOM_SIGN
	dw_const CinnabarLabRAndDSignText,       TEXT_CINNABARLAB_R_AND_D_SIGN
	dw_const CinnabarLabTestingRoomSignText, TEXT_CINNABARLAB_TESTING_ROOM_SIGN

CinnabarLabFishingGuruText:
	text "WE RESEARCH #"
	line "EVERY SINGLE DAY!"

	para "GUESTS ALSO BRING"
	line "RARE # FOR US"
	cont "TO EXAMINE!"
	done

CinnabarLabPhotoText:
	text "PHOTO OF LAB"
	line "FOUNDER·DR. FUJI!"
	done

CinnabarLabMeetingRoomSignText:
	text "# LAB"
	line "MEETING ROOM"
	done

CinnabarLabRAndDSignText:
	text "# LAB"
	line "R-AND-D ROOM"
	done

CinnabarLabTestingRoomSignText:
	text "# LAB"
	line "TESTING ROOM"
	done

