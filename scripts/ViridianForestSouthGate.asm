ViridianForestSouthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestSouthGate_TextPointers:
	def_text_pointers
	dw_const ViridianForestSouthGateGirlText,       TEXT_VIRIDIANFORESTSOUTHGATE_GIRL
	dw_const ViridianForestSouthGateLittleGirlText, TEXT_VIRIDIANFORESTSOUTHGATE_LITTLE_GIRL

ViridianForestSouthGateGirlText:
	text "GOING TO FOREST"
	line "OF TOKIWA?"
	para "FOREST IS A"
	line "NATURAL MAZE!"
	cont "BEWARE LEST YOU"
	cont "GET LOST IN IT!"
	done

ViridianForestSouthGateLittleGirlText:
	text "KORATTA IS TINY"
	line "YET FRONT TOOTH"
	cont "BITE IS FIERCE!"
	para "DID YOU CATCH"
	line "ONE ALREADY?"
	done
