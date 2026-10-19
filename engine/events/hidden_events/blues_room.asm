
	ret ; unused

UnusedPredefText::
	text_end

PrintBookcaseText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump BookcaseText

BookcaseText::
	text "LINED UP ON THE"
	line "BOOKSHELF ARE"
	cont "ONLY # BOOKS！"
	done
