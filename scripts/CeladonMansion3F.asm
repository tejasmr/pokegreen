CeladonMansion3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion3F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion3FProgrammerText,     TEXT_CELADONMANSION3F_PROGRAMMER
	dw_const CeladonMansion3FGraphicArtistText,  TEXT_CELADONMANSION3F_GRAPHIC_ARTIST
	dw_const CeladonMansion3FWriterText,         TEXT_CELADONMANSION3F_WRITER
	dw_const CeladonMansion3FGameDesignerText,   TEXT_CELADONMANSION3F_GAME_DESIGNER
	dw_const CeladonMansion3FGameProgramPCText,  TEXT_CELADONMANSION3F_GAME_PROGRAM_PC
	dw_const CeladonMansion3FPlayingGamePCText,  TEXT_CELADONMANSION3F_PLAYING_GAME_PC
	dw_const CeladonMansion3FGameScriptPCText,   TEXT_CELADONMANSION3F_GAME_SCRIPT_PC
	dw_const CeladonMansion3FDevRoomSignText,    TEXT_CELADONMANSION3F_DEV_ROOM_SIGN

CeladonMansion3FProgrammerText:
	text "ME? I AM THE"
	line "PROGRAMMER!"
	done

CeladonMansion3FGraphicArtistText:
	text "I AM GRAPHIC"
	line "ARTIST! I DREW"
	cont "YOU MYSELF!"
	done

CeladonMansion3FWriterText:
	text "I WROTE STORY!"
	line "ERIKA IS CUTE"
	cont "IS SHE NOT⋯?"

	para "KASUMI IS VERY"
	line "NICE TOO!"

	para "NATSUME ALSO IS"
	line "VERY NICE TOO!"
	done

CeladonMansion3FGameDesignerText:
	text_asm
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	cp NUM_POKEMON - 1 ; discount Mew
	jr nc, .completed_dex
	ld hl, .Text
	jr .done
.completed_dex
	ld hl, .CompletedDexText
.done
	call PrintText
	jp TextScriptEnd

.Text:
	text "IS THAT SO-!"

	para "I AM THE GAME"
	line "DESIGNER!"

	para "FILLING UP THE"
	line "# BOOK IS SO"
	cont "HARD· BUT FIGHT!"

	para "TELL ME IF YOU"
	line "GET THEM ALL!"
	done

.CompletedDexText:
	text "WAH! AMAZING!"
	line "EVERY SINGLE PAGE"
	cont "OF # BOOK IS"
	cont "FINALLY FULL!"
	cont "CONGRATULATIONS!"
	cont "⋯⋯@"
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd

CeladonMansion3FGameProgramPCText:
	text "GAME SOURCE CODE!"
	line "TOUCHING IT MIGHT"
	cont "SPAWN BUGS!"
	done

CeladonMansion3FPlayingGamePCText:
	text "WORKING ON <PC>⋯"
	line "WAIT· HE IS JUST"
	cont "PLAYING GAMES!"
	done

CeladonMansion3FGameScriptPCText:
	text "⋯# SCENARIO!"
	line "THIS IS THE"
	cont "ENDING PLOT!"

	para "BETTER NOT PEEK"
	line "FOR NOW⋯!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "DEVELOPMENT ROOM"
	done
