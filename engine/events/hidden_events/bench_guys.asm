PrintBenchGuyText:
	call EnableAutoTextBoxDrawing
	ld hl, BenchGuyTextPointers
	ld a, [wCurMap]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr z, .match
	inc hl
	inc hl
	jr .loop
.match
	ld a, [hli]
	ld b, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp b

	; bug: an 'inc hl' instruction is needed before looping back. When trying to
	; talk to a bench guy from above, this Sprite Facing test will fail, and the
	; next loop iteration will be misaligned within BenchGuyTextPointers table.
	; As a result, the routine will miss the terminator byte, and continue to
	; process data beyond the table boundary.
	; It seems that it will only return after starting to read data from VRAM
	; (According to Pan Docs, during PPU mode 3, reads return garbage value,
	; usually $FF).
	jr nz, .loop ; player isn't facing the bench guy
	ld a, [hl]
	jp PrintPredefTextID

INCLUDE "data/events/bench_guys.asm"

ViridianCityPokecenterBenchGuyText::
	text "LEAVE AT # CTR·"
	line "EVEN TIRED #"
	cont "BECOME HEALTHY"
	cont "AND FULL VIGOR！"
	done

PewterCityPokecenterBenchGuyText::
	text "HAA-HYAA<⋯>！"

	para "HEARING PURIN"
	line "SINGING VOICE<⋯>"
	cont "MOST ALL #"
	cont "BECOME SLEEPY！"

	para "<⋯>AND SO"
	line "ME TOO<⋯>ZZZ<⋯>"
	done

CeruleanCityPokecenterBenchGuyText::
	text "BIG BRO MASAKI"
	line "HAS MANY #！"

	para "HE COLLECTS"
	line "VERY RARE # TOO"
	cont "SO THEY SAY！"
	done

LavenderCityPokecenterBenchGuyText::
	text "KARAKARA TRIBE"
	line "WEARS A SKULL"
	cont "BONE·RIGHT？"

	para "HEARD THAT SELLS"
	line "FOR VERY HIGH"
	cont "PRICE MONEY！"
	done

MtMoonPokecenterBenchGuyText::
	text "WHEN CATCHING"
	line "MANY #·AND"
	cont "CANT CARRY MORE·"

	para "DEPOSIT THEM"
	line "USING <PC> COMM！"
	done

RockTunnelPokecenterBenchGuyText::
	text "IN SHION TOWN·"
	line "GHOST # IS"
	cont "SEEN·EVERYONE"
	cont "MAKES COMMOTION"
	cont "UP IN ARMS！"
	done

SafariZoneWestRestHouseStoolText::
	text "I WANT TO CATCH"
	line "# TOO-MAN！"
	done

SafariZoneEastRestHouseStoolText::
	text "PLAYED TOO MUCH·"
	line "SO TIRED OUT<⋯>"
	done

SafariZoneNorthRestHouseStoolText::
	text "SILPH CHIEF IS"
	line "HIDING SOMEWHERE"
	cont "IN SAFARI ZONE！"
	done

VermilionCityPokecenterBenchGuyText::
	text "HIGH LEVEL #"
	line "ARE CERTAINLY"
	cont "STRONG·BUT<⋯>"

	para "BY # TYPE·"
	line "THEY HAVE FOES"
	cont "THEY ARE WEAK TO"

	para "AN ABSOLUTE ALL"
	line "POWERFUL # IS"
	cont "HARD TO EXIST！"
	done

CeladonCityPokecenterBenchGuyText::
	text "IF I HAD BICYCLE"
	line "TOO·I WOULD GO"
	cont "TO CYCLING ROAD！"
	done

FuchsiaCityPokecenterBenchGuyText::
	text "HEY BROTHER！ IF"
	line "YOU ARE MAKING"
	cont "『# ZUKAN』·GO"
	cont "TO SAFARI ZONE！"

	para "MANY RARE # ARE"
	line "BREEDING THERE"
	cont "THEY SAY！"
	done

CinnabarIslandPokecenterBenchGuyText::
	text "EVEN AFTER CANCEL"
	line "EVOLUTION·#"
	cont "STILL LEARN MOVES"

	para "MAKING THEM LEARN"
	line "MOVES FIRST THEN"
	cont "EVOLVE IS KNACK！"
	done

SaffronCityPokecenterBenchGuyText::
	text_asm
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ld hl, SaffronCityPokecenterBenchGuyText2
	jr nz, .printText
	ld hl, SaffronCityPokecenterBenchGuyText1
.printText
	call PrintText
	jp TextScriptEnd

SaffronCityPokecenterBenchGuyText1:
	text "AAH<⋯>"
	line "IF ONLY #"
	cont "『SHITENNO』CAME"
	cont "TO BEAT <ROCKET>"
	cont "THAT WOULD BE SO"
	cont "WONDERFUL！"
	done

SaffronCityPokecenterBenchGuyText2:
	text "<ROCKET> FLED！"
	line "NOW WALKING OUT"
	cont "IS NOT SCARY AT"
	cont "ALL ANYMORE！"
	cont "SO GLAD RIGHT！"
	done

CeladonCityHotelText::
	text "YAY！ ON A TRIP！"
	line "I LOVE MY BIG"
	cont "SISTER DEARLY！"
	done
