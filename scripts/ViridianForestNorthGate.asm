ViridianForestNorthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestNorthGate_TextPointers:
	def_text_pointers
	dw_const ViridianForestNorthGateSuperNerdText, TEXT_VIRIDIANFORESTNORTHGATE_SUPER_NERD
	dw_const ViridianForestNorthGateGrampsText,    TEXT_VIRIDIANFORESTNORTHGATE_GRAMPS

ViridianForestNorthGateSuperNerdText:
	text "MANY # LIVE"
	line "ONLY IN FORESTS"
	cont "AND CAVES NE！"

	para "TO CATCH MANY #"
	line "SEARCH EVERY"
	cont "CORNER TILL END！"
	done

ViridianForestNorthGateGrampsText:
	text "YOU NOTICED THIN"
	line "TREES BY ROAD？"

	para "HEARD CAN CUT"
	line "WITH # MOVE"
	cont "AND PASS THROUGH！"
	done
