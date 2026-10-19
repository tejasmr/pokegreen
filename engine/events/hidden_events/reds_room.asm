PrintRedSNESText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomSNESText

RedBedroomSNESText::
	text "<PLAYER> IS"
	line "PLAYING FAMICOM！"
	cont "<⋯><⋯>ALRIGHT！"
	cont "TIME TO HEAD OUT！"
	done

OpenRedsPC:
	call EnableAutoTextBoxDrawing
	tx_pre_jump RedBedroomPCText

RedBedroomPCText::
	script_players_pc
