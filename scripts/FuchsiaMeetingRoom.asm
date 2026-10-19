FuchsiaMeetingRoom_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaMeetingRoom_TextPointers:
	def_text_pointers
	dw_const FuchsiaMeetingRoomSafariZoneWorker1, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER1
	dw_const FuchsiaMeetingRoomSafariZoneWorker2, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER2
	dw_const FuchsiaMeetingRoomSafariZoneWorker3, TEXT_FUCHSIAMEETINGROOM_SAFARI_ZONE_WORKER3

FuchsiaMeetingRoomSafariZoneWorker1:
	text "WARDENS NICKNAME"
	line "IS YADON SLOWPOKE"

	para "SEE! SLOWPOKE #·"
	line "SO GOOFY LOOKING!"
	done

FuchsiaMeetingRoomSafariZoneWorker2:
	text "MR. YADON KNOWS"
	line "SO MUCH ABOUT #"

	para "HE HAS UNSEEN #"
	line "FOSSILS AND MORE!"
	done

FuchsiaMeetingRoomSafariZoneWorker3:
	text "OUR WARDEN WAS"
	line "MUMBLING STRANGE"
	cont "WORDS LATELY<⋯>"

	para "IS HE SENILE?"
	done

