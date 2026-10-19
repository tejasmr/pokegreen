ViridianCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianCity_ScriptPointers
	ld a, [wViridianCityCurScript]
	jp CallFunctionInTable

ViridianCity_ScriptPointers:
	def_script_pointers
	dw_const ViridianCityDefaultScript,                  SCRIPT_VIRIDIANCITY_DEFAULT
	dw_const ViridianCityOldManStartCatchTrainingScript, SCRIPT_VIRIDIANCITY_OLD_MAN_START_CATCH_TRAINING
	dw_const ViridianCityOldManEndCatchTrainingScript,   SCRIPT_VIRIDIANCITY_OLD_MAN_END_CATCH_TRAINING
	dw_const ViridianCityPlayerMovingDownScript,         SCRIPT_VIRIDIANCITY_PLAYER_MOVING_DOWN

ViridianCityDefaultScript:
	call ViridianCityCheckGymOpenScript
	jp ViridianCityCheckGotPokedexScript

ViridianCityCheckGymOpenScript:
	CheckEvent EVENT_VIRIDIAN_GYM_OPEN
	ret nz
	ld a, [wObtainedBadges]
	cp ~(1 << BIT_EARTHBADGE)
	jr nz, .gym_closed
	SetEvent EVENT_VIRIDIAN_GYM_OPEN
	ret
.gym_closed
	ld a, [wYCoord]
	cp 8
	ret nz
	ld a, [wXCoord]
	cp 32
	ret nz
	ld a, TEXT_VIRIDIANCITY_GYM_LOCKED
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call ViridianCityMovePlayerDownScript
	ld a, SCRIPT_VIRIDIANCITY_PLAYER_MOVING_DOWN
	ld [wViridianCityCurScript], a
	ret

ViridianCityCheckGotPokedexScript:
	CheckEvent EVENT_GOT_POKEDEX
	ret nz
	ld a, [wYCoord]
	cp 9
	ret nz
	ld a, [wXCoord]
	cp 19
	ret nz
	ld a, TEXT_VIRIDIANCITY_OLD_MAN_SLEEPY
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ldh [hJoyHeld], a
	call ViridianCityMovePlayerDownScript
	ld a, SCRIPT_VIRIDIANCITY_PLAYER_MOVING_DOWN
	ld [wViridianCityCurScript], a
	ret

ViridianCityOldManStartCatchTrainingScript:
	ld a, [wSprite03StateData1YPixels]
	ld [hSpriteScreenYCoord], a
	ld a, [wSprite03StateData1XPixels]
	ld [hSpriteScreenXCoord], a
	ld a, [wSprite03StateData2MapY]
	ld [hSpriteMapYCoord], a
	ld a, [wSprite03StateData2MapX]
	ld [hSpriteMapXCoord], a
	xor a
	ld [wListScrollOffset], a

	; set up battle for Old Man
	ld a, BATTLE_TYPE_OLD_MAN
	ld [wBattleType], a
	ld a, 5
	ld [wCurEnemyLevel], a
	ld a, WEEDLE
	ld [wCurOpponent], a
	ld a, SCRIPT_VIRIDIANCITY_OLD_MAN_END_CATCH_TRAINING
	ld [wViridianCityCurScript], a
	ret

ViridianCityOldManEndCatchTrainingScript:
	ld a, [hSpriteScreenYCoord]
	ld [wSprite03StateData1YPixels], a
	ld a, [hSpriteScreenXCoord]
	ld [wSprite03StateData1XPixels], a
	ld a, [hSpriteMapYCoord]
	ld [wSprite03StateData2MapY], a
	ld a, [hSpriteMapXCoord]
	ld [wSprite03StateData2MapX], a
	call UpdateSprites
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_VIRIDIANCITY_OLD_MAN_YOU_NEED_TO_WEAKEN_THE_TARGET
	ldh [hTextID], a
	call DisplayTextID
	xor a
	ld [wBattleType], a
	ld [wJoyIgnore], a
	ld a, SCRIPT_VIRIDIANCITY_DEFAULT
	ld [wViridianCityCurScript], a
	ret

ViridianCityPlayerMovingDownScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	ld a, SCRIPT_VIRIDIANCITY_DEFAULT
	ld [wViridianCityCurScript], a
	ret

ViridianCityMovePlayerDownScript:
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wJoyIgnore], a
	ret

ViridianCity_TextPointers:
	def_text_pointers
	dw_const ViridianCityYoungster1Text,                     TEXT_VIRIDIANCITY_YOUNGSTER1
	dw_const ViridianCityGambler1Text,                       TEXT_VIRIDIANCITY_GAMBLER1
	dw_const ViridianCityYoungster2Text,                     TEXT_VIRIDIANCITY_YOUNGSTER2
	dw_const ViridianCityGirlText,                           TEXT_VIRIDIANCITY_GIRL
	dw_const ViridianCityOldManSleepyText,                   TEXT_VIRIDIANCITY_OLD_MAN_SLEEPY
	dw_const ViridianCityFisherText,                         TEXT_VIRIDIANCITY_FISHER
	dw_const ViridianCityOldManText,                         TEXT_VIRIDIANCITY_OLD_MAN
	dw_const ViridianCitySignText,                           TEXT_VIRIDIANCITY_SIGN
	dw_const ViridianCityTrainerTips1Text,                   TEXT_VIRIDIANCITY_TRAINER_TIPS1
	dw_const ViridianCityTrainerTips2Text,                   TEXT_VIRIDIANCITY_TRAINER_TIPS2
	dw_const MartSignText,                                   TEXT_VIRIDIANCITY_MART_SIGN
	dw_const PokeCenterSignText,                             TEXT_VIRIDIANCITY_POKECENTER_SIGN
	dw_const ViridianCityGymSignText,                        TEXT_VIRIDIANCITY_GYM_SIGN
	dw_const ViridianCityGymLockedText,                      TEXT_VIRIDIANCITY_GYM_LOCKED
	dw_const ViridianCityOldManYouNeedToWeakenTheTargetText, TEXT_VIRIDIANCITY_OLD_MAN_YOU_NEED_TO_WEAKEN_THE_TARGET

ViridianCityYoungster1Text:
	text "ON YOUR WAIST<⋯>"
	line "MONSTER BALLS！"
	cont "DEFINITELY # NE！"

	para "TAKE OUT OR PUT"
	line "IN # ANYTIME·"
	cont "SO BENRI WORLD！"
	done

ViridianCityGambler1Text:
	text_asm
	ld a, [wObtainedBadges]
	cp ~(1 << BIT_EARTHBADGE)
	ld hl, .GymLeaderReturnedText
	jr z, .print_text
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .print_text
	ld hl, .GymAlwaysClosedText
.print_text
	call PrintText
	jp TextScriptEnd

.GymAlwaysClosedText:
	text "WHENEVER I COME·"
	line "THIS # GYM IS"
	cont "LOCKED SHUT NE！"

	para "WHAT KIND OF GUY"
	line "IS THE LEADER？"
	done

.GymLeaderReturnedText:
	text "TOKIWA GYM LEADER"
	line "RETURNED BACK！"
	cont "KAETTA ZO！"
	done

ViridianCityYoungster2Text:
	text_asm
	ld hl, .YouWantToKnowAboutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	ld hl, .CaterpieAndWeedleDescriptionText
	call PrintText
	jr .text_script_end
.no
	ld hl, .OkThenText
	call PrintText
.text_script_end
	jp TextScriptEnd

.YouWantToKnowAboutText:
	text "DO YOU KNOW 2"
	line "CATERPILLAR #？"
	done

.OkThenText:
	text "SO THEN· ITS OK！"
	line "II NDA！"
	done

.CaterpieAndWeedleDescriptionText:
	text "CATERPIE HAS NO"
	line "DOKU· POISON· BUT"
	cont "WEEDLE HAS DOKU！"

	para "BE CAREFUL NOT TO"
	line "GET STUNG NE！"
	done

ViridianCityGirlText:
	text_asm
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .got_pokedex
	ld hl, .HasntHadHisCoffeeYetText
	call PrintText
	jr .text_script_end
.got_pokedex
	ld hl, .WhenIGoShopText
	call PrintText
.text_script_end
	jp TextScriptEnd

.HasntHadHisCoffeeYetText:
	text "ARARA GRANDPA！"
	line "SLEEPING HERE·"
	cont "SHOU GA NAI NE！"
	cont "WAIT TILL SOBER！"
	done

.WhenIGoShopText:
	text "SOMETIMES I GO TO"
	line "NIBI CITY TO SHOP"

	para "BUT TOKIWA FOREST"
	line "ROAD IS WINDING！"
	done

ViridianCityOldManSleepyText:
	text_asm
	ld hl, .PrivatePropertyText
	call PrintText
	call ViridianCityMovePlayerDownScript
	ld a, SCRIPT_VIRIDIANCITY_PLAYER_MOVING_DOWN
	ld [wViridianCityCurScript], a
	jp TextScriptEnd

.PrivatePropertyText:
	text "HIC<⋯> HICCUP！"
	line "MATTE YAGARE！"
	cont "LISTEN TO ME！"

	para "<⋯>KORA！ DONT GO！"
	line "I SAID DONT GO！"
	done

ViridianCityFisherText:
	text_asm
	CheckEvent EVENT_GOT_TM42
	jr nz, .got_item
	ld hl, .YouCanHaveThisText
	call PrintText
	lb bc, TM_DREAM_EATER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM42Text
	call PrintText
	SetEvent EVENT_GOT_TM42
	jr .done
.bag_full
	ld hl, .TM42NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .TM42ExplanationText
	call PrintText
.done
	jp TextScriptEnd

.YouCanHaveThisText:
	text "YAWN！ HINATABOKKO"
	line "SUNBATHING AND"
	cont "FELL ASLEEP！"

	para "<⋯>STRANGE DREAM！"
	line "SLEEP MONSTER ATE"
	cont "MY YUME· DREAM！"
	para "<⋯>HUH？ SINCE"
	line "WHEN DO I HAVE"
	cont "THIS <TM> ITEM？"

	para "CREEPY NE！ TAKE"
	line "THIS KORE！"
	prompt

.ReceivedTM42Text:
	text "<PLAYER> GOT"
	line "<TM>42 FROM GUY！@"
	sound_get_item_2
	text_end

.TM42ExplanationText:
	text "<TM>42 IS DREAM"
	line "EATER· YUMEKUI<⋯>"
	cont "<⋯>ZZZ<⋯>"
	done

.TM42NoRoomText:
	text "BAG IS FULL JAN！"
	line "NIMOTSU IPPAI！"
	done

ViridianCityOldManText:
	text_asm
	ld hl, .HadMyCoffeeNowText
	call PrintText
	ld c, 2
	call DelayFrames
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr z, .refused
	ld hl, .KnowHowToCatchPokemonText
	call PrintText
	ld a, SCRIPT_VIRIDIANCITY_OLD_MAN_START_CATCH_TRAINING
	ld [wViridianCityCurScript], a
	jr .done
.refused
	ld hl, .TimeIsMoneyText
	call PrintText
.done
	jp TextScriptEnd

.HadMyCoffeeNowText:
	text "U-N<⋯> SEEMS I WAS"
	line "DRUNK YOPPARAI！"

	para "HEADACHE HURTS<⋯>"

	para "ARE YOU IN A"
	line "HURRY OISOGI<⋯>？"
	done

.KnowHowToCatchPokemonText:
	text "HOH-HOU！ MAKING"
	line "#DEX ARE YOU？"

	para "TAKE MY ADVICE！"
	line "CATCH #· PAGES"
	cont "INCREASE AUTO！"

	para "NANDJA-！ WHAT？"
	line "DONT KNOW HOW TO"
	cont "CATCH #？"

	para "THEN<⋯> I WILL"
	line "SHOW YOU EXAMPLE！"
	done

.TimeIsMoneyText:
	text "TIME IS MONEY<⋯>"
	line "<⋯>TOKI WA KANE！"
	done

ViridianCityOldManYouNeedToWeakenTheTargetText:
	text "THE KOTSU· SECRET"
	line "IS TO WEAKEN #"
	cont "BEFORE CATCHING！"
	done

ViridianCitySignText:
	text "TOKIWA CITY"
	line "TOKIWA IS GREEN·"
	cont "ETERNAL COLOR！"
	done

ViridianCityTrainerTips1Text:
	text "<⋯>USEFUL TIPS！"

	para "CATCH MANY # AND"
	line "INCREASE DONDON！"
	cont "MORE # GIVES"
	cont "ADVANTAGE IN"
	cont "<TRAINER> MATCH！"
	done

ViridianCityTrainerTips2Text:
	text "<⋯>USEFUL TIPS！"

	para "# HAS HP AND ALSO"
	line "POWER POINTS· PP"
	cont "FOR MOVES WAZA！"

	para "IF PP RUNS OUT·"
	line "REST IN # CENTER"
	done

ViridianCityGymSignText:
	text "TOKIWA # GYM"
	done

ViridianCityGymLockedText:
	text "TOKIWA GYM DOOR"
	line "IS LOCKED<⋯>！"
	done
