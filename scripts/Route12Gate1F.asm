Route12Gate1F_Script:
	jp EnableAutoTextBoxDrawing

Route12Gate1F_TextPointers:
	def_text_pointers
	dw_const Route12Gate1FGuardText, TEXT_ROUTE12GATE1F_GUARD

Route12Gate1FGuardText:
	text "2F IS LOOKOUT"
	line "DECK WITH GREAT"
	cont "VIEW! TENBOUDAI!"
	done

