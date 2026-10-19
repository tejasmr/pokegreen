PokemonFanClub_Script:
	jp EnableAutoTextBoxDrawing

PokemonFanClub_CheckBikeInBag:
; check if any bike paraphernalia in bag
	CheckEvent EVENT_GOT_BIKE_VOUCHER
	ret nz
	ld b, BICYCLE
	call IsItemInBag
	ret nz
	ld b, BIKE_VOUCHER
	jp IsItemInBag

PokemonFanClub_TextPointers:
	def_text_pointers
	dw_const PokemonFanClubPikachuFanText,   TEXT_POKEMONFANCLUB_PIKACHU_FAN
	dw_const PokemonFanClubSeelFanText,      TEXT_POKEMONFANCLUB_SEEL_FAN
	dw_const PokemonFanClubPikachuText,      TEXT_POKEMONFANCLUB_PIKACHU
	dw_const PokemonFanClubSeelText,         TEXT_POKEMONFANCLUB_SEEL
	dw_const PokemonFanClubChairmanText,     TEXT_POKEMONFANCLUB_CHAIRMAN
	dw_const PokemonFanClubReceptionistText, TEXT_POKEMONFANCLUB_RECEPTIONIST
	dw_const PokemonFanClubSign1Text,        TEXT_POKEMONFANCLUB_SIGN_1
	dw_const PokemonFanClubSign2Text,        TEXT_POKEMONFANCLUB_SIGN_2

PokemonFanClubPikachuFanText:
	text_asm
	CheckEvent EVENT_PIKACHU_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .NormalText
	call PrintText
	SetEvent EVENT_SEEL_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .BetterText
	call PrintText
	ResetEvent EVENT_PIKACHU_FAN_BOAST
.done
	jp TextScriptEnd

.NormalText:
	text "LOOK AT MY"
	line "PIKACHU! SUCH A"
	cont "『KAWAII』 TAIL!"
	cont "CUTE BEYOND WORDS"
	done

.BetterText:
	text "WHAT DID YOU SAY!"

	para "MY PIKACHU IS"
	line "TWICE AS 『KAWAII』"
	cont "AS THAT THING!"
	done

PokemonFanClubSeelFanText:
	text_asm
	CheckEvent EVENT_SEEL_FAN_BOAST
	jr nz, .mineisbetter
	ld hl, .NormalText
	call PrintText
	SetEvent EVENT_PIKACHU_FAN_BOAST
	jr .done
.mineisbetter
	ld hl, .BetterText
	call PrintText
	ResetEvent EVENT_SEEL_FAN_BOAST
.done
	jp TextScriptEnd

.NormalText:
	text "MY BELOVED"
	line "PAUWAU!"

	para "WHEN I HUG IT·"
	line "IT CRIES 『KYUU』!"
	cont "SO SWEET!"
	done

.BetterText:
	text "OHOHO!"

	para "MY PAUWAU IS"
	line "TWICE AS CUTE"
	cont "AS YOURS!"
	done

PokemonFanClubPikachuText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.Text
	text "PIKACHU: 『CHUU"
	line "PIKACHUU』!"
	done

PokemonFanClubSeelText:
	text_asm
	ld hl, .Text
	call PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.Text:
	text "PAUWAU: 『KYUU』!"
	done

PokemonFanClubChairmanText:
	text_asm
	call PokemonFanClub_CheckBikeInBag
	jr nz, .nothingleft

	ld hl, .IntroText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .nothanks

	; tell the story
	ld hl, .StoryText
	call PrintText
	lb bc, BIKE_VOUCHER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .BikeVoucherText
	call PrintText
	SetEvent EVENT_GOT_BIKE_VOUCHER
	jr .done
.bag_full
	ld hl, .BagFullText
	call PrintText
	jr .done
.nothanks
	ld hl, .NoStoryText
	call PrintText
	jr .done
.nothingleft
	ld hl, .FinalText
	call PrintText
.done
	jp TextScriptEnd

.IntroText:
	text "I AM 『KAICHOU』"
	line "OF # FAN CLUB!"
	cont "THAT IS CHAIRMAN!"

	para "I HAVE RAISED"
	line "OVER 100 #!"

	para "ABOUT #· I AM"
	line "VERY PARTICULAR!"

	para "SO<⋯>"

	para "DID YOU COME"
	line "TO HEAR MY"
	cont "# 『JIMAN』?"
	cont "THAT IS BOASTING!"
	done

.StoryText:
	text "GOOD! THEN LET US"
	line "BEGIN RIGHT AWAY!"

	para "YOU SEE<⋯> MY"
	line "FAVORITE GALLOP<⋯>"

	para "<⋯>AND SO<⋯>"
	cont "<⋯>SO 『KAWAII』<⋯>"
	cont "CANT BEAR IT<⋯>"
	cont "<⋯>MOREOVER<⋯>"
	cont "TOO AMAZING<⋯>"
	cont "<⋯>YOU AGREE<⋯>?"
	cont "I LOVE IT SO<⋯>"
	cont "<⋯>HAH!"

	para "<⋯>HUGGING TIGHT"
	cont "WHEN SLEEPING<⋯>"
	cont "<⋯>ISNT IT SO<⋯>"
	cont "<⋯>WONDERFUL<⋯>!"
	cont "<⋯>BEAUTIFUL<⋯>"
	cont "<⋯>OH MY GOODNESS"
	cont "LOOK AT THE TIME!"
	cont "I TALKED TOO MUCH"

	para "FOR HEARING MY"
	line "# 『JIMAN』·"
	cont "TAKE THIS TOKEN!"
	prompt

.BikeVoucherText:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!"
	sound_get_key_item
	text_start

	para "WITH THAT TICKET"
	line "YOU CAN GET A"
	cont "BIKE FOR FREE!"

	para "I HAVE MY DEAR"
	line "BIRD # ONIDRILL"
	cont "CAN FLY ANYWHERE"
	cont "IN A FLASH!"

	para "SO I DONT NEED"
	line "ANY BICYCLE!"

	para "YOU GO RIDE IT"
	line "HAPPILY MY BOY!"
	done

.NoStoryText:
	text "WHAT<⋯> HOW DULL!"
	line "COME BACK WHEN"
	cont "YOU WANT TO HEAR!"
	done

.FinalText:
	text "HELLO <PLAYER>!"

	para "DID YOU COME TO"
	line "HEAR MY # BOAST"
	cont "ONCE AGAIN?"

	para "<⋯>EH? NOT SO?"
	line "HOW BORING<⋯>"
	done

.BagFullText:
	text "YOUR PACK IS"
	line "FULL OF STUFF!"
	done

PokemonFanClubReceptionistText:
	text "OUR 『KAICHOU』"
	line "CHAIRMAN IS REAL"
	cont "CRAZY ABOUT #!"
	done

PokemonFanClubSign1Text:
	text "LISTEN QUIETLY"
	line "TO AN OWNER"
	cont "BOASTING STORY!"
	done

PokemonFanClubSign2Text:
	text "RETURN SOMEONES"
	line "BOASTING STORY"
	cont "BY 10 TIMES MORE!"
	done
