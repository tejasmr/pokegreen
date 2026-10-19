_GivePokemon::
; returns success in carry
; and whether the mon was added to the party in [wAddedToParty]
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAddedToParty], a
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .addToParty
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr nc, .boxFull
; add to box
	xor a
	ld [wEnemyBattleStatus3], a
	ld a, [wCurPartySpecies]
	ld [wEnemyMonSpecies2], a
	callfar LoadEnemyMonData
	call SetPokedexOwnedFlag
	callfar SendNewMonToBox
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	add '１'
	ld hl, wStringBuffer
	ld [hli], a
	ld [hl], '@'
	ld hl, SentToBoxText
	call PrintText
	scf
	ret
.boxFull
	ld hl, BoxIsFullText
	call PrintText
	and a
	ret
.addToParty
	call SetPokedexOwnedFlag
	call AddPartyMon
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld [wAddedToParty], a
	scf
	ret

SetPokedexOwnedFlag:
	ld a, [wCurPartySpecies]
	push af
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld hl, wPokedexOwned
	ld b, FLAG_SET
	predef FlagActionPredef
	pop af
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, GotMonText
	jp PrintText

GotMonText:
	text "<PLAYER> GOT"
	line "@"
	text_ram wNameBuffer
	text "！@"
	sound_get_item_1
	text_end

SentToBoxText:
	text "NO ROOM IN PARTY·"
	line "@"
	text_ram wBoxMonNicks
	text " SENT TO"
	cont "<PC> BOX @"
	text_ram wStringBuffer
	text "！"
	done

BoxIsFullText:
	text "CANT CARRY MORE！"
	line "BOX IS FULL TOO·"

	para "SWITCH BOX AT"
	line "A # CENTER！"
	done
