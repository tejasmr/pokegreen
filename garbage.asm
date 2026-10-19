SECTION "Garbage Header", ROM0
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_header.bin"
ENDC
IF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_header.bin"
ENDC


SECTION "Garbage 0", ROM0
; empty to allow Home expansions


SECTION "Garbage 1", ROMX
; empty to allow Bank 1 expansions


SECTION "Garbage 2", ROMX
IF DEF(_REV0)
	IF DEF(_RED)
		INCBIN "garbage/rev_0/garbage_2.bin", 16
	ENDC
	IF DEF(_GREEN)
		INCBIN "garbage/rev_0/garbage_2.bin"
	ENDC
ENDC
IF DEF(_REV1)
	IF DEF(_RED)
		INCBIN "garbage/rev_1/garbage_2.bin", 16
	ENDC
	IF DEF(_GREEN)
		INCBIN "garbage/rev_1/garbage_2.bin"
	ENDC
ENDC


SECTION "Garbage 3", ROMX
; empty to allow Bank 3 expansions


SECTION "Garbage 4", ROMX
; empty to allow Bank 4 expansions


SECTION "Garbage 5", ROMX
; empty to allow Bank 5 expansions


SECTION "Garbage 6", ROMX
; empty to allow Bank 6 expansions


SECTION "Garbage 7", ROMX
; empty to allow Bank 7 expansions


SECTION "Garbage 9", ROMX
; empty to allow Bank 9 expansions


SECTION "Garbage 10", ROMX
; empty to allow Bank 10 expansions



SECTION "Garbage 11", ROMX
; empty to allow Bank 11 expansions


SECTION "Garbage 12", ROMX
; empty to allow Bank 12 expansions


SECTION "Garbage 14", ROMX
; empty to allow Bank 14 expansions


SECTION "Garbage 15", ROMX
; empty to allow Bank 15 expansions


SECTION "Garbage 16", ROMX
; empty to allow Bank 10 expansions


SECTION "Garbage 17", ROMX
; empty to allow Bank 17 expansions



SECTION "Garbage 18", ROMX
; empty to allow Bank 18 expansions


SECTION "Garbage 19", ROMX
; empty to allow Bank 13 expansions


SECTION "Garbage 20", ROMX
; empty to allow Bank 14 expansions


SECTION "Garbage 21", ROMX
; empty to allow Bank 15 expansions


SECTION "Garbage 22", ROMX
; empty to allow Bank 16 expansions



SECTION "Garbage 23", ROMX
; empty to allow Bank 17 expansions


SECTION "Garbage 24", ROMX
; empty to allow Bank 18 expansions


SECTION "Garbage 25", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_25.bin"
ENDC
IF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_25.bin"
ENDC


; the garbage byte is $00 in REV0, same as padding byte
IF DEF(_REV1)
	SECTION "Garbage 26", ROMX, BANK[26]
		db $FF
ENDC


SECTION "Garbage 28", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_28.bin"
ENDC
IF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_28.bin"
ENDC


SECTION "Garbage 29", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_29.bin"
ENDC
IF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_29.bin"
ENDC


SECTION "Garbage 30", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_30.bin"
ENDC
IF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_30.bin"
ENDC


SECTION "Garbage 31", ROMX
IF DEF(_REV0)
	IF DEF(_RED)
		INCBIN "garbage/rev_0/garbage_31.bin", 16
	ENDC
	IF DEF(_GREEN)
		INCBIN "garbage/rev_0/garbage_31.bin"
	ENDC
ENDC
IF DEF(_REV1)
	IF DEF(_RED)
		INCBIN "garbage/rev_1/garbage_31.bin", 16
	ENDC
	IF DEF(_GREEN)
		INCBIN "garbage/rev_1/garbage_31.bin"
	ENDC
ENDC
