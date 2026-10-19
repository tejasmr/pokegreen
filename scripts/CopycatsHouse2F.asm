CopycatsHouse2F_Script:
	jp EnableAutoTextBoxDrawing

CopycatsHouse2F_TextPointers:
	def_text_pointers
	dw_const CopycatsHouse2FCopycatText,      TEXT_COPYCATSHOUSE2F_COPYCAT
	dw_const CopycatsHouse2FDoduoText,        TEXT_COPYCATSHOUSE2F_DODUO
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_MONSTER
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_BIRD
	dw_const CopycatsHouse2FRareDollText,     TEXT_COPYCATSHOUSE2F_FAIRY
	dw_const CopycatsHouse2FSNESText,         TEXT_COPYCATSHOUSE2F_SNES
	dw_const CopycatsHouse2FPCText,           TEXT_COPYCATSHOUSE2F_PC

CopycatsHouse2FCopycatText:
	text_asm
	CheckEvent EVENT_GOT_TM31
	jr nz, .got_item
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .DoYouLikePokemonText
	call PrintText
	ld b, POKE_DOLL
	call IsItemInBag
	jr z, .done
	ld hl, .TM31PreReceiveText
	call PrintText
	lb bc, TM_MIMIC, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM31Text
	call PrintText
	ld a, POKE_DOLL
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_TM31
	jr .done
.bag_full
	ld hl, .TM31NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM31ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.DoYouLikePokemonText:
	text "<PLAYER>『HIYA!"
	line "DO YOU LIKE PETS?"

	para "<PLAYER>『NOT ME!"
	line "ASKING YOU!"

	para "<PLAYER>『WHAT?!"
	line "YOU ARE WEIRD!"

	para "COPYCAT: ⋯WHAT?"
	line "DONT MIMIC YOU?"

	para "BUT MIMIC IS MY"
	line "FAVORITE HOBBY!"
	prompt

.TM31PreReceiveText:
	text "WAAAH! GIVING ME"
	line "PIPPI DOLL?!"

	para "SO GLAD! URESHII!"

	para "⋯THEN SEE! I GIVE"
	line "THIS TO YOU!"
	prompt

.ReceivedTM31Text:
	text "<PLAYER> RECEIVED"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_item_1
	text_start

	para "<TM>31 CONTAINS MY"
	line "FAVORITE MIMIC!"

	para "TEACH IT TO YOUR"
	line "FAVORITE PET!@"
	text_waitbutton
	text_end

.TM31ExplanationText:
	text "<PLAYER>『THANKS"
	line "FOR <TM> EARLIER!"

	para "<PLAYER>『⋯WHAT?"

	para "<PLAYER>『IS IT"
	line "THAT FUN TO COPY"
	cont "WHAT I SAY?"

	para "COPYCAT: YEAH⋯!"
	line "VERY MUCH FUN!"
	done

.TM31NoRoomText:
	text "PACK IS FULL!@"
	text_waitbutton
	text_end

CopycatsHouse2FDoduoText:
	text "DODUO: 『GII GII!"

	para "⋯MIRROR MIRROR!"
	line "WHO IS CUTEST"
	cont "GIRL IN WORLD?"
	done

CopycatsHouse2FRareDollText:
	text "IS THIS RARE PET?"
	line "⋯HUH? JUST A"
	cont "STUFFED DOLL!"
	done

CopycatsHouse2FSNESText:
	text "THIS IS⋯ A GAME!"
	line "MARIO WEARS"
	cont "A BUCKET AND"
	cont "WALKS FORWARD!"
	done

CopycatsHouse2FPCText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .CantSeeText
	jr nz, .notUp
	ld hl, .MySecretsText
.notUp
	call PrintText
	jp TextScriptEnd

.MySecretsText:
	text "⋯⋯⋯"

	para "MY SECRET⋯!"

	para "SKILL⋯ MIMIC!"
	line "HOBBY⋯ DOLLS!"
	cont "FAVORITE⋯ PIPPI!"
	cont "⋯⋯⋯"
	done

.CantSeeText:
	text "? CANT SEE IT⋯"
	done
