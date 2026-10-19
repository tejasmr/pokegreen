CeladonMart3F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart3F_TextPointers:
	def_text_pointers
	dw_const CeladonMart3FClerkText,            TEXT_CELADONMART3F_CLERK
	dw_const CeladonMart3FGameBoyKid1Text,      TEXT_CELADONMART3F_GAMEBOY_KID1
	dw_const CeladonMart3FGameBoyKid2Text,      TEXT_CELADONMART3F_GAMEBOY_KID2
	dw_const CeladonMart3FGameBoyKid3Text,      TEXT_CELADONMART3F_GAMEBOY_KID3
	dw_const CeladonMart3FLittleBoyText,        TEXT_CELADONMART3F_LITTLE_BOY
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES1
	dw_const CeladonMart3FRPGText,              TEXT_CELADONMART3F_RPG
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES2
	dw_const CeladonMart3FSportsGameText,       TEXT_CELADONMART3F_SPORTS_GAME
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES3
	dw_const CeladonMart3FPuzzleGameText,       TEXT_CELADONMART3F_PUZZLE_GAME
	dw_const CeladonMart3FSNESText,             TEXT_CELADONMART3F_SNES4
	dw_const CeladonMart3FFightingGameText,     TEXT_CELADONMART3F_FIGHTING_GAME
	dw_const CeladonMart3FCurrentFloorSignText, TEXT_CELADONMART3F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER1
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER2
	dw_const CeladonMart3FPokemonPosterText,    TEXT_CELADONMART3F_POKEMON_POSTER3

CeladonMart3FClerkText:
	text_asm
	CheckEvent EVENT_GOT_TM18
	jr nz, .got_item
	ld hl, .TM18PreReceiveText
	call PrintText
	lb bc, TM_COUNTER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_TM18
	ld hl, .ReceivedTM18Text
	jr .done
.bag_full
	ld hl, .TM18NoRoomText
	jr .done
.got_item
	ld hl, .TM18ExplanationText
.done
	call PrintText
	jp TextScriptEnd


.TM18PreReceiveText:
	text "WELCOME!"
	line "MAN OH MAN!"
	cont "I FINALLY BEAT #"

	para "NOT YOU YET?"
	line "THEN I WILL GIVE"
	cont "A GOOD THING!"
	prompt

.ReceivedTM18Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_end

.TM18ExplanationText:
	text "A CLERK GIFT⋯"
	line "<TM>18 MOVE IS"
	cont "⋯COUNTER! GET IT?"

	para "DO YOUR BEST NOW!"
	done

.TM18NoRoomText:
	text "YOUR PACK IS"
	line "OUT OF ROOM!"
	done

CeladonMart3FGameBoyKid1Text:
	text "ORIGINAL TRAINER"
	line "NAME AND <ID> ARE"
	cont "RECORDED FOR EACH"
	cont "# CAUGHT!"
	done

CeladonMart3FGameBoyKid2Text:
	text "ALRIGHT-T!"

	para "KID NEXT DOOR"
	line "TRADES GHOST FOR"
	cont "MY GARURA!"
	done

CeladonMart3FGameBoyKid3Text:
	text "COME QUICKLY!"
	line "DEAR GHOST-CHAN!"

	para "I AM A REAL"
	line "GHOST MANIAC!"

	para "⋯HUH⋯?!"

	para "THE TRADED GHOST"
	line "BECAME ANOTHER"
	cont "# ENTIRELY?!"
	done

CeladonMart3FLittleBoyText:
	text "TRADED # HAVE"
	line "DIFFERENT <ID> SO"
	cont "YOU CAN TELL!"
	done

CeladonMart3FSNESText:
	text "SUPER FAMICOM!"
	done

CeladonMart3FRPGText:
	text "AN RPG GAME!"
	line "⋯NO TIME TO PLAY"
	cont "RIGHT NOW!"
	done

CeladonMart3FSportsGameText:
	text "A SPORTS GAME!"
	line "⋯PAPA WOULD LIKE"
	cont "THIS ONE!"
	done

CeladonMart3FPuzzleGameText:
	text "A PUZZLE GAME⋯!"
	line "⋯CANT STOP ONCE"
	cont "YOU START IT!"
	done

CeladonMart3FFightingGameText:
	text "FIGHTING ACTION!"
	line "⋯LOOKS A BIT"
	cont "TOO DIFFICULT!"
	done

CeladonMart3FCurrentFloorSignText:
	text "3F: TV GAME SHOP"
	done

CeladonMart3FPokemonPosterText:
	text "RED AND GREEN!"
	line "BOTH ARE POCKET"
	cont "MONSTERS!"
	done
