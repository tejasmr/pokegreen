PrintSafariZoneBattleText:
	ld hl, wSafariBaitFactor
	ld a, [hl]
	and a
	jr z, .no_bait
	dec [hl]
	ld hl, SafariZoneEatingText
	jr .done
.no_bait
	dec hl
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld hl, SafariZoneAngryText
	jr nz, .done
	push hl
	ld a, [wEnemyMonSpecies]
	ld [wCurSpecies], a
	call GetMonHeader
	ld a, [wMonHCatchRate]
	ld [wEnemyMonActualCatchRate], a
	pop hl
.done
	push hl
	call LoadScreenTilesFromBuffer1
	pop hl
	jp PrintText

SafariZoneEatingText:
	text "WILD @"
	text_ram wEnemyMonNick
	line "IS EATING BAIT！"
	prompt

SafariZoneAngryText:
	text "WILD @"
	text_ram wEnemyMonNick
	line "IS ANGRY OKORU！"
	prompt
