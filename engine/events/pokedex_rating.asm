DisplayDexRating:
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsSeen], a
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ldh [hDexRatingNumMonsOwned], a
	ld hl, DexRatingsTable
.findRating
	ld a, [hli]
	ld b, a
	ldh a, [hDexRatingNumMonsOwned]
	cp b
	jr c, .foundRating
	inc hl
	inc hl
	jr .findRating
.foundRating
	ld a, [hli]
	ld h, [hl]
	ld l, a ; load text pointer into hl
	CheckAndResetEventA EVENT_HALL_OF_FAME_DEX_RATING
	jr nz, .hallOfFame
	push hl
	ld hl, DexCompletionText
	call PrintText
	pop hl
	call PrintText
	farcall PlayPokedexRatingSfx
	jp WaitForTextScrollButtonPress
.hallOfFame
	ld de, wDexRatingNumMonsSeen
	ldh a, [hDexRatingNumMonsSeen]
	ld [de], a
	inc de
	ldh a, [hDexRatingNumMonsOwned]
	ld [de], a
	inc de
.copyRatingTextLoop
	ld a, [hli]
	cp '<DONE>'
	jr z, .doneCopying
	ld [de], a
	inc de
	jr .copyRatingTextLoop
.doneCopying
	ld [de], a
	ret

DexCompletionText:
	text "<⋯>CURRENT #DEX"
	line "COMPLETION IS<⋯>"

	para "SEEN #:@"
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text "！"
	line "OWNED #:@"
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text "！"

	para "PROF.OAK RATING<⋯>"
	prompt

DexRatingsTable:
	dbw 10, DexRatingText_Own0To9
	dbw 20, DexRatingText_Own10To19
	dbw 30, DexRatingText_Own20To29
	dbw 40, DexRatingText_Own30To39
	dbw 50, DexRatingText_Own40To49
	dbw 60, DexRatingText_Own50To59
	dbw 70, DexRatingText_Own60To69
	dbw 80, DexRatingText_Own70To79
	dbw 90, DexRatingText_Own80To89
	dbw 100, DexRatingText_Own90To99
	dbw 110, DexRatingText_Own100To109
	dbw 120, DexRatingText_Own110To119
	dbw 130, DexRatingText_Own120To129
	dbw 140, DexRatingText_Own130To139
	dbw 150, DexRatingText_Own140To149
	dbw NUM_POKEMON + 1, DexRatingText_Own150To151

DexRatingText_Own0To9:
	text "STILL MADA-MADA<⋯>"
	line "ENTER TALL GRASS"
	cont "AND CATCH MORE #！"
	done

DexRatingText_Own10To19:
	text "GETTING IN RHYTHM"
	line "CHOU-SHI II NE！"
	cont "MY JOSHU AIDE HAS"
	cont "FLASH！ GO GET IT！"
	done

DexRatingText_Own20To29:
	text "STILL LACKS SOME"
	line "VOLUME TARIN！"
	cont "CATCH DIFFERENT"
	cont "KINDS OF # MONS！"
	done

DexRatingText_Own30To39:
	text "FUMU<⋯>GANBATTERU！"
	line "TRYING HARD NE！"
	cont "MY JOSHU AIDE HAS"
	cont "AN ITEMFINDER！"
	done

DexRatingText_Own40To49:
	text "II DEKIBAE NE！"
	line "LOOKING SO GOOD！"
	cont "MY JOSHU AIDE HAS"
	cont "AN EXP.ALL FOR U！"
	done

DexRatingText_Own50To59:
	text "FINALLY EXCEEDED"
	line "50 SPECIES！"
	cont "KONO CHOUSHI JA！"
	cont "KEEP IT UP！"
	done

DexRatingText_Own60To69:
	text "HO HO-！ THIS IS"
	line "TURNING INTO A"
	cont "FINE #DEX！"
	done

DexRatingText_Own70To79:
	text "ZEKKOUCHOU PEAK！"
	line "FISH MONS IN THE"
	cont "SEA TO GET MORE！"
	done

DexRatingText_Own80To89:
	text "WONDERFUL SUGOI！"
	line "DO YOU LIKE TO"
	cont "COLLECT THINGS<⋯>？"
	done

DexRatingText_Own90To99:
	text "IYAHAYA<⋯>SUGOI！"
	line "IT WAS TAIHEN"
	cont "HARD WORK RIGHT！"
	done

DexRatingText_Own100To109:
	text "AT LAST OVER 100"
	line "MON SPECIES！"
	cont "<⋯>UNBELIEVABLE"
	cont "UDEMAE SKILL JA！"
	done

DexRatingText_Own110To119:
	text "EVOLVED SHINKA"
	line "# ARE INCLUDED<⋯>"
	cont "SUBARASHII GREAT！"
	done

DexRatingText_Own120To129:
	text "EXCELLENT！ TRADE"
	line "KOUKAN WITH PALS"
	cont "TO GET EVEN MORE！"
	done

DexRatingText_Own130To139:
	text "DEX IS THIS FAR·"
	line "YOU ARE ALREADY A"
	cont "PROFESSIONAL JA！"
	done

DexRatingText_Own140To149:
	text "I HAVE NOTHING"
	line "LEFT TO SAY！"
	cont "YOU ARE THE #"
	cont "HAKASE PROFESSOR！"
	done

DexRatingText_Own150To151:
	text "PERFECT #DEX IS"
	line "KANSEI COMPLETE！"
	cont "<⋯>OMEDETOU！"
	cont "CONGRATULATIONS！"
	done
