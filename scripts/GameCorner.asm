GameCorner_Script:
	call GameCornerSelectLuckySlotMachine
	call GameCornerSetRocketHideoutDoorTile
	call EnableAutoTextBoxDrawing
	ld hl, GameCorner_ScriptPointers
	ld a, [wGameCornerCurScript]
	jp CallFunctionInTable

GameCornerSelectLuckySlotMachine:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	ret z
	call Random
	ldh a, [hRandomAdd]
	cp $7
	jr nc, .not_max
	ld a, $8
.not_max
	srl a
	srl a
	srl a
	ld [wLuckySlotHiddenEventIndex], a
	ret

GameCornerSetRocketHideoutDoorTile:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_FOUND_ROCKET_HIDEOUT
	ret nz
	ld a, $2a
	ld [wNewTileBlockID], a
	lb bc, 2, 8
	predef_jump ReplaceTileBlock

GameCornerReenterMapAfterPlayerLoss:
	xor a ; SCRIPT_GAMECORNER_DEFAULT
	ld [wJoyIgnore], a
	ld [wGameCornerCurScript], a
	ld [wCurMapScript], a
	ret

GameCorner_ScriptPointers:
	def_script_pointers
	dw_const GameCornerDefaultScript,      SCRIPT_GAMECORNER_DEFAULT
	dw_const GameCornerRocketBattleScript, SCRIPT_GAMECORNER_ROCKET_BATTLE
	dw_const GameCornerRocketExitScript,   SCRIPT_GAMECORNER_ROCKET_EXIT

GameCornerDefaultScript:
	ret

GameCornerRocketBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, GameCornerReenterMapAfterPlayerLoss
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, TEXT_GAMECORNER_ROCKET_AFTER_BATTLE
	ldh [hTextID], a
	call DisplayTextID
	ld a, GAMECORNER_ROCKET
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, GameCornerMovement_Rocket_WalkAroundPlayer
	ld a, [wYCoord]
	cp 6
	jr nz, .not_direct_movement
	ld de, GameCornerMovement_Rocket_WalkDirect
	jr .got_rocket_movement
.not_direct_movement
	ld a, [wXCoord]
	cp 8
	jr nz, .got_rocket_movement
	ld de, GameCornerMovement_Rocket_WalkDirect
.got_rocket_movement
	ld a, GAMECORNER_ROCKET
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_GAMECORNER_ROCKET_EXIT
	ld [wGameCornerCurScript], a
	ret

GameCornerMovement_Rocket_WalkAroundPlayer:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

GameCornerMovement_Rocket_WalkDirect:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

GameCornerRocketExitScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TOGGLE_GAME_CORNER_ROCKET
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	set BIT_CUR_MAP_LOADED_2, [hl]
	ld a, SCRIPT_GAMECORNER_DEFAULT
	ld [wGameCornerCurScript], a
	ret

GameCorner_TextPointers:
	def_text_pointers
	dw_const GameCornerBeauty1Text,           TEXT_GAMECORNER_BEAUTY1
	dw_const GameCornerClerk1Text,            TEXT_GAMECORNER_CLERK1
	dw_const GameCornerMiddleAgedMan1Text,    TEXT_GAMECORNER_MIDDLE_AGED_MAN
	dw_const GameCornerBeauty2Text,           TEXT_GAMECORNER_BEAUTY2
	dw_const GameCornerFishingGuruText,       TEXT_GAMECORNER_FISHING_GURU
	dw_const GameCornerMiddleAgedWomanText,   TEXT_GAMECORNER_MIDDLE_AGED_WOMAN
	dw_const GameCornerGymGuideText,          TEXT_GAMECORNER_GYM_GUIDE
	dw_const GameCornerGamblerText,           TEXT_GAMECORNER_GAMBLER
	dw_const GameCornerClerk2Text,            TEXT_GAMECORNER_CLERK2
	dw_const GameCornerGentlemanText,         TEXT_GAMECORNER_GENTLEMAN
	dw_const GameCornerRocketText,            TEXT_GAMECORNER_ROCKET
	dw_const GameCornerPosterText,            TEXT_GAMECORNER_POSTER
	dw_const GameCornerRocketAfterBattleText, TEXT_GAMECORNER_ROCKET_AFTER_BATTLE

GameCornerBeauty1Text:
	text "WELCOME!"

	para "EXCHANGE COINS"
	line "FROM GAMES FOR"
	cont "PRIZES AT BOOTH"
	cont "NEXT DOOR!"
	done

GameCornerClerk1Text:
	text_asm
	; Show player's coins
	call GameCornerDrawCoinBox
	ld hl, .DoYouNeedSomeGameCoins
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined
	; Can only get more coins if you
	; - have the Coin Case
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .no_coin_case
	; - have room in the Coin Case for at least 9 coins
	call Has9990Coins
	jr nc, .coin_case_full
	; - have at least 1000 yen
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .buy_coins
	ld hl, .CantAffordTheCoins
	jr .print_ret
.buy_coins
	; Spend 1000 yen
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	ld hl, hMoney + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	; Receive 50 coins
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $50
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	; Update display
	call GameCornerDrawCoinBox
	ld hl, .ThanksHereAre50Coins
	jr .print_ret
.declined
	ld hl, .PleaseComePlaySometime
	jr .print_ret
.coin_case_full
	ld hl, .CoinCaseIsFull
	jr .print_ret
.no_coin_case
	ld hl, .DontHaveCoinCase
.print_ret
	call PrintText
	jp TextScriptEnd

.DoYouNeedSomeGameCoins:
	text "WELCOME! TO THE"
	line "ROCKET GAME"
	cont "CORNER!"

	para "NEED GAME COINS?"
	line "1000 YEN BUYS"
	cont "50 COINS!"

	para "BUY SOME COINS?"
	done

.ThanksHereAre50Coins:
	text "YES! THANK YOU!"
	line "HERE ARE 50"
	cont "GAME COINS!"
	done

.PleaseComePlaySometime:
	text "⋯NO COINS?"
	line "PLEASE COME PLAY"
	cont "ANOTHER TIME!"
	done

.CantAffordTheCoins:
	text "YOU DONT HAVE"
	line "ENOUGH MONEY!"
	done

.CoinCaseIsFull:
	text "WHOA⋯! YOUR"
	line "COIN CASE IS"
	cont "ALREADY FULL!"
	done

.DontHaveCoinCase:
	text "HUH? YOU DONT"
	line "HAVE A COIN CASE"
	cont "TO HOLD THEM!"
	done

GameCornerMiddleAgedMan1Text:
	text "⋯A SECRET TALK⋯"

	para "RUMOR HAS IT"
	line "THIS GAME CORNER"
	cont "IS RUN BY TEAM"
	cont "ROCKET⋯ SHH⋯!"
	done

GameCornerBeauty2Text:
	text "SEEMS SOME SLOTS"
	line "PAY OUT BETTER"
	cont "DEPENDING ON"
	cont "THE MACHINE!"
	done

GameCornerFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_10_COINS
	jr nz, .alreadyGotNpcCoins
	ld hl, .WantToPlayText
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr nc, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $10
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_10_COINS
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .Received10CoinsText
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, .WinsComeAndGoText
	jr .print_ret
.coinCaseFull
	ld hl, .DontNeedMyCoinsText
	jr .print_ret
.dontHaveCoinCase
	ld hl, GameCornerOopsForgotCoinCaseText
.print_ret
	call PrintText
	jp TextScriptEnd

.WantToPlayText:
	text "⋯HEY KID! WANT"
	line "TO PLAY GAMES?"
	prompt

.Received10CoinsText:
	text "<PLAYER> GOT"
	line "10 COINS FROM"
	cont "THE MAN!@"
	sound_get_item_1
	text_end

.DontNeedMyCoinsText:
	text "GUESS YOU DONT"
	line "NEED MY COINS!"
	done

.WinsComeAndGoText:
	text "WHEN YOU WIN·"
	line "YOU WIN! BUT"
	cont "WHEN YOU LOSE·"
	cont "YOU LOSE BIG!"
	done

GameCornerMiddleAgedWomanText:
	text "SLOT GAMES ARE"
	line "SO MUCH FUN!"
	cont "I FORGET TIME"
	cont "PASSING BY!"
	done

GameCornerGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_ERIKA
	ld hl, GameCornerGymGuideChampInMakingText
	jr z, .not_defeated
	ld hl, GameCornerGymGuideTheyOfferRarePokemonText
.not_defeated
	call PrintText
	jp TextScriptEnd

GameCornerGymGuideChampInMakingText:
	text "OH MY⋯!"

	para "SLACKING OFF"
	line "IN SUCH A PLACE?"
	cont "FUTURE CHAMPION!"

	para "TAMAMUSHI LEADER"
	line "ERIKA USES GRASS"
	cont "# THAT COMMUNE"
	cont "WITH NATURE!"

	para "SHE SEEMS QUIET"
	line "ARRANGING FLOWERS"
	cont "BUT SHE IS A"
	cont "TOUGH OPPONENT!"
	done

GameCornerGymGuideTheyOfferRarePokemonText:
	text "THEY HAVE RARE #"
	line "FOR PRIZES!"

	para "I AM TRYING HARD"
	line "BUT HAVING NO"
	cont "LUCK AT ALL!"
	done

GameCornerGamblerText:
	text "WHEW⋯! GAMES ARE"
	line "SO SCARY!"
	cont "JUST A SHORT"
	cont "BREAK BECOMES AN"
	cont "ALL-NIGHTER!"
	done

GameCornerClerk2Text:
	text_asm
	CheckEvent EVENT_GOT_20_COINS_2
	jr nz, .alreadyGotNpcCoins
	ld hl, .WantSomeCoinsText
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr nc, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $20
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_20_COINS_2
	ld hl, .Received20CoinsText
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, .INeedMoreCoinsText
	jr .print_ret
.coinCaseFull
	ld hl, .YouHaveLotsOfCoinsText
	jr .print_ret
.dontHaveCoinCase
	ld hl, GameCornerOopsForgotCoinCaseText
.print_ret
	call PrintText
	jp TextScriptEnd

.WantSomeCoinsText:
	text "⋯WHAT IS IT?"
	line "WANT SOME OF MY"
	cont "COINS PAL?"
	prompt

.Received20CoinsText:
	text "<PLAYER> GOT"
	line "20 COINS FROM"
	cont "THE GUY!@"
	sound_get_item_1
	text_end

.YouHaveLotsOfCoinsText:
	text "YOU HAVE PLENTY"
	line "OF COINS ALREADY!"
	done

.INeedMoreCoinsText:
	text "DARN! NO LUCK!"
	line "I REALLY WANT"
	cont "THAT BIG PRIZE!"
	done

GameCornerGentlemanText:
	text_asm
	CheckEvent EVENT_GOT_20_COINS
	jr nz, .alreadyGotNpcCoins
	ld hl, .ThrowingMeOffText
	call PrintText
	ld b, COIN_CASE
	call IsItemInBag
	jr z, .dontHaveCoinCase
	call Has9990Coins
	jr z, .coinCaseFull
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ld a, $20
	ldh [hCoins + 1], a
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	SetEvent EVENT_GOT_20_COINS
	ld hl, .Received20CoinsText
	jr .print_ret
.alreadyGotNpcCoins
	ld hl, .CloselyWatchTheReelsText
	jr .print_ret
.coinCaseFull
	ld hl, .YouGotYourOwnCoinsText
	jr .print_ret
.dontHaveCoinCase
	ld hl, GameCornerOopsForgotCoinCaseText
.print_ret
	call PrintText
	jp TextScriptEnd

.ThrowingMeOffText:
	text "WHOA! HEY!"
	line "⋯YOU ARE THROWING"
	cont "OFF MY TIMING!"

	para "HERE ARE COINS·"
	line "NOW SHOO AWAY!"
	prompt

.Received20CoinsText:
	text "<PLAYER> GOT"
	line "20 COINS FROM"
	cont "THE GENTLEMAN!@"
	sound_get_item_1
	text_end

.YouGotYourOwnCoinsText:
	text "YOU HAVE GOT"
	line "LOTS OF COINS!"
	done

.CloselyWatchTheReelsText:
	text "WATCH REELS VERY"
	line "CLOSELY BEFORE"
	cont "PRESSING BUTTON!"
	done

GameCornerRocketText:
	text_asm
	ld hl, .ImGuardingThisPosterText
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .BattleEndText
	ld de, .BattleEndText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ld a, SCRIPT_GAMECORNER_ROCKET_BATTLE
	ld [wGameCornerCurScript], a
	jp TextScriptEnd

.ImGuardingThisPosterText:
	text "I AM GUARDING"
	line "THIS POSTER HERE!"

	para "INTERFERE AND YOU"
	line "WILL TASTE PAIN!"
	done

.BattleEndText:
	text "D-DAMN IT!"
	prompt

GameCornerRocketAfterBattleText:
	text "AT THIS RATE· OUR"
	line "<ROCKET> HIDEOUT"
	cont "WILL BE EXPOSED!"

	para "I MUST INFORM"
	line "THE BOSS AT ONCE!"
	done

GameCornerPosterText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .SwitchBehindPosterText
	call PrintText
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	SetEvent EVENT_FOUND_ROCKET_HIDEOUT
	ld a, $43
	ld [wNewTileBlockID], a
	lb bc, 2, 8
	predef ReplaceTileBlock
	jp TextScriptEnd

.SwitchBehindPosterText:
	text "AH!"

	para "BEHIND POSTER·"
	line "FOUND A SECRET"
	cont "BUTTON SWITCH!"

	para "LET US PRESS IT!"
	line "⋯CLICK!@"
	text_asm
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

GameCornerOopsForgotCoinCaseText:
	text "OOPS! I DONT"
	line "HAVE A COIN CASE!"
	done

GameCornerDrawCoinBox:
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 11, 0
	ld b, 5
	ld c, 7
	call TextBoxBorder
	call UpdateSprites
	hlcoord 12, 1
	ld b, 4
	ld c, 7
	call ClearScreenArea
	hlcoord 12, 2
	ld de, GameCornerMoneyText
	call PlaceString
	hlcoord 12, 3
	ld de, GameCornerYenText
	call PlaceString
	hlcoord 12, 3
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES
	call PrintBCDNumber
	hlcoord 12, 4
	ld de, GameCornerCoinText
	call PlaceString
	hlcoord 12, 5
	ld de, GameCornerCoinCounterText
	call PlaceString
	hlcoord 13, 5
	ld de, wPlayerCoins
	ld c, 2 | LEADING_ZEROES
	call PrintBCDNumber
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ret

GameCornerMoneyText:
	db "MONEY@"

GameCornerCoinText:
	db "COIN@"

GameCornerYenText:
	db "      円@"

GameCornerCoinCounterText:
	db "       @"

Has9990Coins:
	ld a, $99
	ldh [hCoins], a
	ld a, $90
	ldh [hCoins + 1], a
	jp HasEnoughCoins
