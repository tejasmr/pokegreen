Route11Gate1F_Script:
	jp EnableAutoTextBoxDrawing

Route11Gate1F_TextPointers:
	def_text_pointers
	dw_const Route11Gate1FGuardText, TEXT_ROUTE11GATE1F_GUARD

Route11Gate1FGuardText:
	text "CATCHING MANY"
	line "# MAKES IT"
	cont "HARD TO NAME"
	cont "THEM ALL!"

	para "AHEAD IN SHION"
	line "TOWN· SOMEONE"
	cont "CAN FORTUNE TELL"
	cont "YOUR # NAME!"

	para "HE CAN RENAME"
	line "YOUR # WITH"
	cont "A BETTER NAME!"
	done
