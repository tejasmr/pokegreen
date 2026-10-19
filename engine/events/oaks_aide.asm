OaksAideScript:
	ld hl, OaksAideHiText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hOaksAideNumMonsOwned], a
	ld b, a
	ldh a, [hOaksAideRequirement]
	cp b
	jr z, .giveItem
	jr nc, .notEnoughOwnedMons
.giveItem
	ld hl, OaksAideHereYouGoText
	call PrintText
	ldh a, [hOaksAideRewardItem]
	ld b, a
	ld c, 1
	call GiveItem
	jr nc, .bagFull
	ld hl, OaksAideGotItemText
	call PrintText
	ld a, OAKS_AIDE_GOT_ITEM
	jr .done
.bagFull
	ld hl, OaksAideNoRoomText
	call PrintText
	xor a ; OAKS_AIDE_BAG_FULL
	jr .done
.notEnoughOwnedMons
	ld hl, OaksAideUhOhText
	call PrintText
	ld a, OAKS_AIDE_NOT_ENOUGH_MONS
	jr .done
.choseNo
	ld hl, OaksAideComeBackText
	call PrintText
	ld a, OAKS_AIDE_REFUSED
.done
	ldh [hOaksAideResult], a
	ret

OaksAideHiText:
	text "REMEMBER ME？"
	line "I AM PROF.OAK"
	cont "JOSHU AIDE！"

	para "IF YOUR #DEX HAS"
	line "@"
	text_decimal hOaksAideRequirement, 1, 3
	text " MON SPECIES·"
	cont "HAKASE SAID TO"
	cont "GIVE YOU THIS·"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "！"

	para "SO THEN <PLAYER>！"
	line "DID YOU CATCH"
	cont "@"
	text_decimal hOaksAideRequirement, 1, 3
	text " MON SPECIES？"
	done

OaksAideUhOhText:
	text "<⋯>LET ME SEE！"
	line "CAUGHT # IS<⋯>"
	cont "ARERE-？ HUH？"
	cont "YOU ONLY HAVE"
	cont "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " SPECIES！"

	para "IF NOT @"
	text_decimal hOaksAideRequirement, 1, 3
	text " MONS·"
	line "THIS ITEM IS FOR"
	cont "MATA KONDO LATER！"
	done

OaksAideComeBackText:
	text "<⋯>SOU DESU KA·"
	line "I SEE HOW IT IS<⋯>"

	para "IF NOT @"
	text_decimal hOaksAideRequirement, 1, 3
	text " MONS·"
	line "THIS ITEM IS FOR"
	cont "MATA KONDO LATER！"
	done

OaksAideHereYouGoText:
	text "<⋯>NARUHODO！"
	line "CAUGHT # IS<⋯>"
	cont "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " SPECIES！"
	cont "OMEDETOU GREAT！"

	para "SO THEN I HAND"
	line "THIS OVER TO YOU！"
	prompt

OaksAideGotItemText:
	text "<PLAYER> GOT"
	line "@"
	text_ram wOaksAideRewardItemName
	text_start
	cont "FROM JOSHU AIDE！@"
	sound_get_item_1
	text_end

OaksAideNoRoomText:
	text "<⋯>BUT YOUR BAG"
	line "IS FULL OF ITEMS·"

	para "SO THIS ITEM IS"
	line "MATA KONDO LATER！"
	done
