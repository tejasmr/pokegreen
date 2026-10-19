MrFujisHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

MrFujisHouse_TextPointers:
	def_text_pointers
	dw_const MrFujisHouseSuperNerdText,     TEXT_MRFUJISHOUSE_SUPER_NERD
	dw_const MrFujisHouseLittleGirlText,    TEXT_MRFUJISHOUSE_LITTLE_GIRL
	dw_const MrFujisHousePsyduckText,       TEXT_MRFUJISHOUSE_PSYDUCK
	dw_const MrFujisHouseNidorinoText,      TEXT_MRFUJISHOUSE_NIDORINO
	dw_const MrFujisHouseMrFujiText,        TEXT_MRFUJISHOUSE_MR_FUJI
	dw_const MrFujisHouseMrFujiPokedexText, TEXT_MRFUJISHOUSE_POKEDEX

MrFujisHouseSuperNerdText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, .MrFujiIsntHereText
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, .MrFujiHadBeenPrayingText
	call PrintText
.done
	jp TextScriptEnd

.MrFujiIsntHereText:
	text "STRANGE NE！"
	line "ELDER FUJI"
	cont "IS NOT HERE！"
	cont "WHERE DID HE GO？"
	done

.MrFujiHadBeenPrayingText:
	text "ELDER FUJI WENT"
	line "TO COMFORT SOUL"
	cont "OF KARAKARA NE！"
	done

MrFujisHouseLittleGirlText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .rescued_mr_fuji
	ld hl, .ThisIsMrFujisHouseText
	call PrintText
	jr .done
.rescued_mr_fuji
	ld hl, .PokemonAreNiceToHugText
	call PrintText
.done
	jp TextScriptEnd

.ThisIsMrFujisHouseText:
	text "THIS IS HOUSE"
	line "OF GRANDPA FUJI！"

	para "GRANDPA IS"
	line "VERY KIND NE！"

	para "HE TAKES CARE"
	line "OF ABANDONED"
	cont "POOR #！"
	done

.PokemonAreNiceToHugText:
	text "HAAH WARM<⋯>！"
	line "# ARE VERY"
	cont "WARM TO HUG NE！"
	done

MrFujisHousePsyduckText:
	text "KODUCK『GWAPPA！@"
	text_asm
	ld a, PSYDUCK
	call PlayCry
	jp TextScriptEnd

MrFujisHouseNidorinoText:
	text "NIDORINO『GAOO！@"
	text_asm
	ld a, NIDORINO
	call PlayCry
	jp TextScriptEnd

MrFujisHouseMrFujiText:
	text_asm
	CheckEvent EVENT_GOT_POKE_FLUTE
	jr nz, .got_item
	ld hl, .IThinkThisMayHelpYourQuestText
	call PrintText
	lb bc, POKE_FLUTE, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedPokeFluteText
	call PrintText
	SetEvent EVENT_GOT_POKE_FLUTE
	jr .done
.bag_full
	ld hl, .PokeFluteNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .HasMyFluteHelpedYouText
	call PrintText
.done
	jp TextScriptEnd

.IThinkThisMayHelpYourQuestText:
	text "FUJI『WELL NOW"
	line "<PLAYER><⋯>"

	para "MAKING #DEX"
	line "WITHOUT DEEP"
	cont "LOVE FOR #"
	cont "VERY HARD TASK！"

	para "MAY THIS HELP"
	line "YOUR JOURNEY"
	cont "TAKE THIS NOW！"
	prompt

.ReceivedPokeFluteText:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "！@"
	sound_get_key_item
	text_start

	para "UPON BLOWING"
	line "# FLUTE·"
	cont "FAST ASLEEP #"
	cont "WAKES UP GINKI！"

	para "IF ASLEEP #"
	line "BLOCKS THE WAY"
	cont "USE THIS FLUTE！"
	done

.PokeFluteNoRoomText:
	text "BAG IS FULL NE！"
	done

.HasMyFluteHelpedYouText:
	text "FUJI『HAS FLUTE"
	line "I GAVE YOU"
	cont "BEEN OF HELP？"
	done

MrFujisHouseMrFujiPokedexText:
	text "WIN BIG PRIZES！"
	line "MONTHLY # PAL"
	cont "BIG PRESENT！"

	para "<⋯>HOW TO ENTER？"

	para "<⋯>ARA！ IT WAS"
	line "CUT OFF ALREADY！"
	done
