AskName:
	call SaveScreenTilesToBuffer1
	call GetPredefRegisters
	push hl
	ld a, [wIsInBattle]
	dec a
	hlcoord 1, 0
	ld b, 4
	ld c, 10
	call z, ClearScreenArea ; only if in wild battle
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, DoYouWantToNicknameText
	call PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedNickname
	ld a, [wUpdateSpritesEnabled]
	push af
	xor a
	ld [wUpdateSpritesEnabled], a
	push hl
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	call DisplayNamingScreen
	ld a, [wIsInBattle]
	and a
	jr nz, .inBattle
	call ReloadMapSpriteTilePatterns
.inBattle
	call LoadScreenTilesFromBuffer1
	pop hl
	pop af
	ld [wUpdateSpritesEnabled], a
	ld a, [wStringBuffer]
	cp '@'
	ret nz
.declinedNickname
	ld d, h
	ld e, l
	ld hl, wNameBuffer
	ld bc, NAME_LENGTH
	jp CopyData

DoYouWantToNicknameText:
	text_ram wNameBuffer
	text "に"
	line "ニックネームを　つけますか？"
	done

DisplayNameRaterScreen::
	ld hl, wBuffer
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	call DisplayNamingScreen
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld a, [wStringBuffer]
	cp '@'
	jr z, .playerCancelled
	ld hl, wPartyMonNicks
	ld bc, NAME_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wBuffer
	ld bc, NAME_LENGTH
	call CopyData
	and a
	ret
.playerCancelled
	scf
	ret

DisplayNamingScreen:
	push hl
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	call LoadTextBoxTilePatterns
	call LoadUnderscoreTiles
	call LoadEDTile
	farcall LoadMonPartySpriteGfx
	hlcoord 0, 4
	ld b, 9
	ld c, 18
	call TextBoxBorder
	call PrintNamingText
	ld a, 3
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	ld [wLastMenuItem], a
	ld [wCurrentMenuItem], a
	ld a, $ff
	ld [wMenuWatchedKeys], a
	ld a, 6
	ld [wMaxMenuItem], a
	ld a, '@'
	ld [wStringBuffer], a
	xor a
	ld hl, wNamingScreenSubmitName
	ld [hli], a
	ld [hli], a
	ld [wAnimCounter], a
.selectReturnPoint
	call PrintAlphabet
	call GBPalNormal
.ABStartReturnPoint
	ld a, [wNamingScreenSubmitName]
	and a
	jr nz, .submitNickname
	call PrintNicknameAndUnderscores
.dPadReturnPoint
	call PlaceMenuCursor
.inputLoop
	ld a, [wCurrentMenuItem]
	push af
	farcall AnimatePartyMon_ForceSpeed1
	pop af
	ld [wCurrentMenuItem], a
	call JoypadLowSensitivity
	ldh a, [hJoyPressed]
	and a
	jr z, .inputLoop
	ld hl, .namingScreenButtonFunctions
.checkForPressedButton
	sla a
	jr c, .foundPressedButton
	inc hl
	inc hl
	inc hl
	inc hl
	jr .checkForPressedButton
.foundPressedButton
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	jp hl

.submitNickname
	pop de
	ld hl, wStringBuffer
	ld bc, NAME_LENGTH
	ld a, [wNamingScreenType]
	cp NAME_MON_SCREEN
	jr nc, .gotCopyLength
	ld bc, PLAYER_NAME_LENGTH
.gotCopyLength
	call CopyData
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call ClearSprites
	call RunDefaultPaletteCommand
	call GBPalNormal
	xor a
	ld [wAnimCounter], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wIsInBattle]
	and a
	jp z, LoadTextBoxTilePatterns
	jpfar LoadHudTilePatterns

.namingScreenButtonFunctions
	dw .dPadReturnPoint
	dw .pressedDown
	dw .dPadReturnPoint
	dw .pressedUp
	dw .dPadReturnPoint
	dw .pressedLeft
	dw .dPadReturnPoint
	dw .pressedRight
	dw .ABStartReturnPoint
	dw .pressedStart
	dw .dPadReturnPoint
	dw .pressedSelect
	dw .ABStartReturnPoint
	dw .pressedB
	dw .ABStartReturnPoint
	dw .pressedA

.pressedSelect
	ret

.pressedStart
	ld a, 1
	ld [wNamingScreenSubmitName], a
	ret

.pressedA
	ld a, [wCurrentMenuItem]
	cp $5 ; "ED" row
	jr nz, .didNotPressED
	ld a, [wTopMenuItemX]
	cp $11 ; "ED" column
	jr z, .pressedStart
.didNotPressED
	; Calculate index in Alphabet = (wCurrentMenuItem - 1) * 9 + (wTopMenuItemX >> 1)
	ld a, [wCurrentMenuItem]
	dec a ; 0..4
	ld b, a
	add a ; * 2
	add a ; * 4
	add a ; * 8
	add b ; * 9
	ld c, a
	ld a, [wTopMenuItemX]
	srl a ; 0..8
	add c ; 0..44
	ld c, a
	ld b, 0
	ld hl, Alphabet
	add hl, bc
	ld a, [hl]
	ld [wNamingScreenLetter], a
	call CalcStringLength
	ld a, [wNamingScreenType]
	cp NAME_MON_SCREEN
	jr nc, .checkMonNameLength
	ld a, [wNamingScreenNameLength]
	cp PLAYER_NAME_LENGTH - 1
	jr .checkNameLength
.checkMonNameLength
	ld a, [wNamingScreenNameLength]
	cp NAME_LENGTH - 1
.checkNameLength
	jr c, .addLetter
	ret

.addLetter
	ld a, [wNamingScreenLetter]
	ld [hli], a
	ld [hl], '@'
	ld a, SFX_PRESS_AB
	call PlaySound
	ret

.pressedB
	ld a, [wNamingScreenNameLength]
	and a
	ret z
	call CalcStringLength
	dec hl
	ld [hl], '@'
	ret

.pressedRight
	ld a, [wTopMenuItemX]
	cp $11 ; max
	jp z, .wrapToFirstColumn
	inc a
	inc a
	jr .done
.wrapToFirstColumn
	ld a, $1
	jr .done

.pressedLeft
	ld a, [wTopMenuItemX]
	dec a
	jp z, .wrapToLastColumn
	dec a
	jr .done
.wrapToLastColumn
	ld a, $11 ; max
	jr .done

.pressedUp
	ld a, [wCurrentMenuItem]
	dec a
	ld [wCurrentMenuItem], a
	and a
	ret nz
	ld a, $5 ; wrap to bottom row
	ld [wCurrentMenuItem], a
	ret

.pressedDown
	ld a, [wCurrentMenuItem]
	inc a
	ld [wCurrentMenuItem], a
	cp $6
	ret nz
	ld a, $1 ; wrap to top row
	ld [wCurrentMenuItem], a
	ret

.done
	ld [wTopMenuItemX], a
	jp EraseMenuCursor

LoadEDTile:
	ld de, ED_Tile
	ld hl, vFont tile $70
	lb bc, BANK(ED_Tile), (ED_TileEnd - ED_Tile) / TILE_1BPP_SIZE
	jp CopyVideoDataDouble

ED_Tile:
	INCBIN "gfx/font/ED.1bpp"
ED_TileEnd:

LoadUnderscoreTiles:
	ld de, HpBarAndStatusGraphics + 20 tiles
	ld hl, vChars2 tile $76
	lb bc, BANK(HpBarAndStatusGraphics), 2
	jp CopyVideoData

CharToTile:
	cp $1d
	jr c, .notExtra1
	cp $25 + 1
	jr nc, .notExtra1
	add $4b - $1d
	ret
.notExtra1
	cp $35
	jr c, .notExtra2
	cp $38 + 1
	jr nc, .notExtra2
	add $54 - $35
	ret
.notExtra2
	ret

PrintAlphabet:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld de, Alphabet
	hlcoord 2, 5
	lb bc, 5, 9 ; 5 rows, 9 columns
.outerLoop
	push bc
.innerLoop
	ld a, [de]
	push de
	call CharToTile
	ld [hli], a
	pop de
	inc hl
	inc de
	dec c
	jr nz, .innerLoop
	ld bc, SCREEN_WIDTH + 2
	add hl, bc
	pop bc
	dec b
	jr nz, .outerLoop
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

INCLUDE "data/text/alphabets.asm"

PrintNicknameAndUnderscores:
	call CalcStringLength
	ld a, c
	ld [wNamingScreenNameLength], a
	hlcoord 10, 2
	lb bc, 1, 10
	call ClearScreenArea
	hlcoord 10, 2
	ld de, wStringBuffer
	call PlaceString
	hlcoord 10, 3
	ld a, [wNamingScreenType]
	cp NAME_MON_SCREEN
	jr nc, .pokemon
; player or rival
	ld b, PLAYER_NAME_LENGTH - 1
	jr .gotUnderscoreCount
.pokemon
	ld b, NAME_LENGTH - 1
.gotUnderscoreCount
	ld a, $76 ; underscore tile id
.placeUnderscoreLoop
	ld [hli], a
	dec b
	jr nz, .placeUnderscoreLoop
	ld a, [wNamingScreenType]
	cp NAME_MON_SCREEN
	ld a, [wNamingScreenNameLength]
	jr nc, .pokemon2
; player or rival
	cp PLAYER_NAME_LENGTH - 1
	jr .checkEmptySpaces
.pokemon2
	cp NAME_LENGTH - 1
.checkEmptySpaces
	jr nz, .placeRaisedUnderscore ; jump if empty spaces remain
	; when all spaces are filled, force the cursor onto the ED tile,
	; and keep the last underscore raised
	call EraseMenuCursor
	ld a, $11 ; "ED" x coord
	ld [wTopMenuItemX], a
	ld a, $5 ; "ED" y coord
	ld [wCurrentMenuItem], a
	ld a, [wNamingScreenType]
	cp NAME_MON_SCREEN
	ld a, NAME_LENGTH - 2
	jr nc, .placeRaisedUnderscore
	ld a, PLAYER_NAME_LENGTH - 2
.placeRaisedUnderscore
	ld c, a
	ld b, $0
	hlcoord 10, 3
	add hl, bc
	ld [hl], $77 ; raised underscore tile id
	ret

; calculates the length of the string at wStringBuffer and stores it in c
CalcStringLength:
	ld hl, wStringBuffer
	ld c, $0
.loop
	ld a, [hl]
	cp '@'
	ret z
	inc hl
	inc c
	jr .loop

PrintNamingText:
	hlcoord 0, 1
	ld a, [wNamingScreenType]
	ld de, YourTextString
	and a
	jr z, .notNickname
	ld de, RivalsTextString
	dec a
	jr z, .notNickname
	ld a, [wCurPartySpecies]
	ld [wMonPartySpriteSpecies], a
	push af
	farcall WriteMonPartySpriteOAMBySpecies
	pop af
	hlcoord 1, 3
	ld de, NicknameTextString
	jr .placeString
.notNickname
	call PlaceString
	ld l, c
	ld h, b
	ld de, NameTextString
.placeString
	jp PlaceString


