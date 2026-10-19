PrintMagazinesText:
	call EnableAutoTextBoxDrawing
	tx_pre MagazinesText
	ret

MagazinesText::
	text "# MAGAZINES"
	line "ARE LINED UP！"

	para "<⋯># HANDBOOK"

	para "<⋯># GRAPH"
	done
