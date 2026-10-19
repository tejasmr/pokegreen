PrintStatusAilment::
	ld a, [de]
	ld de, .StatusAilmentStrings
	bit PSN, a
	jr nz, .found
	inc de
	inc de
	inc de
	bit BRN, a
	jr nz, .found
	inc de
	inc de
	inc de
	bit FRZ, a
	jr nz, .found
	inc de
	inc de
	inc de
	bit PAR, a
	jr nz, .found
	inc de
	inc de
	inc de
	and SLP_MASK
	ret z
.found
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

.StatusAilmentStrings:
	db "PSN"
	db "BRN"
	db "FRZ"
	db "PAR"
	db "SLP"
