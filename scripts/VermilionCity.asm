VermilionCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_2, [hl]
	res BIT_CUR_MAP_LOADED_2, [hl]
	push hl
	call nz, VermilionCityLeftSSAnneCallbackScript
	pop hl
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	call nz, .setFirstLockTrashCanIndex
	ld hl, VermilionCity_ScriptPointers
	ld a, [wVermilionCityCurScript]
	jp CallFunctionInTable

.setFirstLockTrashCanIndex
	call Random
	ldh a, [hRandomSub]
	and $e
	ld [wFirstLockTrashCanIndex], a
	ret

VermilionCityLeftSSAnneCallbackScript:
	CheckEventHL EVENT_SS_ANNE_LEFT
	ret z
	CheckEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	SetEventReuseHL EVENT_WALKED_PAST_GUARD_AFTER_SS_ANNE_LEFT
	ret nz
	ld a, SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_ScriptPointers:
	def_script_pointers
	dw_const VermilionCityDefaultScript,             SCRIPT_VERMILIONCITY_DEFAULT
	dw_const VermilionCityPlayerMovingUp1Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	dw_const VermilionCityPlayerExitShipScript,      SCRIPT_VERMILIONCITY_PLAYER_EXIT_SHIP
	dw_const VermilionCityPlayerMovingUp2Script,     SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	dw_const VermilionCityPlayerAllowedToPassScript, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS

VermilionCityDefaultScript:
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a ; cp SPRITE_FACING_DOWN
	ret nz
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ldh [hJoyHeld], a
	ld [wSavedCoordIndex], a ; unnecessary
	ld a, TEXT_VERMILIONCITY_SAILOR1
	ldh [hTextID], a
	call DisplayTextID
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret nz
.ship_departed
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP1
	ld [wVermilionCityCurScript], a
	ret

SSAnneTicketCheckCoords:
	dbmapcoord 18, 30
	db -1 ; end

VermilionCityPlayerAllowedToPassScript:
	ld hl, SSAnneTicketCheckCoords
	call ArePlayerCoordsInArray
	ret c
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerExitShipScript:
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, PAD_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesEnd + 1], a
	ld a, 2
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_VERMILIONCITY_PLAYER_MOVING_UP2
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp2Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ldh [hJoyHeld], a
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCityPlayerMovingUp1Script:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld c, 10
	call DelayFrames
	ld a, SCRIPT_VERMILIONCITY_DEFAULT
	ld [wVermilionCityCurScript], a
	ret

VermilionCity_TextPointers:
	def_text_pointers
	dw_const VermilionCityBeautyText,             TEXT_VERMILIONCITY_BEAUTY
	dw_const VermilionCityGambler1Text,           TEXT_VERMILIONCITY_GAMBLER1
	dw_const VermilionCitySailor1Text,            TEXT_VERMILIONCITY_SAILOR1
	dw_const VermilionCityGambler2Text,           TEXT_VERMILIONCITY_GAMBLER2
	dw_const VermilionCityMachopText,             TEXT_VERMILIONCITY_MACHOP
	dw_const VermilionCitySailor2Text,            TEXT_VERMILIONCITY_SAILOR2
	dw_const VermilionCitySignText,               TEXT_VERMILIONCITY_SIGN
	dw_const VermilionCityNoticeSignText,         TEXT_VERMILIONCITY_NOTICE_SIGN
	dw_const MartSignText,                        TEXT_VERMILIONCITY_MART_SIGN
	dw_const PokeCenterSignText,                  TEXT_VERMILIONCITY_POKECENTER_SIGN
	dw_const VermilionCityPokemonFanClubSignText, TEXT_VERMILIONCITY_POKEMON_FAN_CLUB_SIGN
	dw_const VermilionCityGymSignText,            TEXT_VERMILIONCITY_GYM_SIGN
	dw_const VermilionCityHarborSignText,         TEXT_VERMILIONCITY_HARBOR_SIGN

VermilionCityBeautyText:
	text "AFTER SPORTS I AM"
	line "SO 『BETOBETO』!"
	cont "STICKY SWEATY!"

	para "<⋯>DID YOU KNOW?"
	line "BETBETER WAS BORN"
	cont "FROM SEA SLUDGE!"
	done

VermilionCityGambler1Text:
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
	ld hl, .DidYouSeeText
	call PrintText
	jr .text_script_end
.ship_departed
	ld hl, .SSAnneDepartedText
	call PrintText
.text_script_end
	jp TextScriptEnd

.DidYouSeeText:
	text "DID YOU SEE IT?"
	line "THE SHIP NAMED"
	cont "S·S·ANNE IS IN"
	cont "THE HARBOR PORT!"
	done

.SSAnneDepartedText:
	text "OH! S·S·ANNE"
	line "HAS SET SAIL!"

	para "NEXT TIME IT"
	line "VISITS KUCHIBA"
	cont "IS NEXT YEAR<⋯>"
	done

VermilionCitySailor1Text:
	text_asm
	CheckEvent EVENT_SS_ANNE_LEFT
	jr nz, .ship_departed
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_RIGHT
	jr z, .greet_player
	ld hl, .inFrontOfOrBehindGuardCoords
	call ArePlayerCoordsInArray
	jr nc, .greet_player_and_check_ticket
.greet_player
	ld hl, .WelcomeToSSAnneText
	call PrintText
	jr .end
.greet_player_and_check_ticket
	ld hl, .DoYouHaveATicketText
	call PrintText
	ld b, S_S_TICKET
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr nz, .player_has_ticket
	ld hl, .YouNeedATicketText
	call PrintText
	jr .end
.player_has_ticket
	ld hl, .FlashedTicketText
	call PrintText
	ld a, SCRIPT_VERMILIONCITY_PLAYER_ALLOWED_TO_PASS
	ld [wVermilionCityCurScript], a
	jr .end
.ship_departed
	ld hl, .ShipSetSailText
	call PrintText
.end
	jp TextScriptEnd

.inFrontOfOrBehindGuardCoords
	dbmapcoord 19, 29 ; in front of guard
	dbmapcoord 19, 31 ; behind guard
	db -1 ; end

.WelcomeToSSAnneText:
	text "WELCOME ABOARD"
	line "THE S·S·ANNE!"
	done

.DoYouHaveATicketText:
	text "WELCOME ABOARD"
	line "THE S·S·ANNE!"

	para "HOLD ON SIR!"
	line "MAY I SEE YOUR"
	cont "PASS TICKET?"
	prompt

.FlashedTicketText:
	text "<PLAYER> FLASHED"
	line "THE S·S·TICKET!"

	para "RIGHT! PERFECT!"
	line "WELCOME ABOARD"
	cont "THE S·S·ANNE!"
	done

.YouNeedATicketText:
	text "<PLAYER> TRIED TO"
	line "SHOW TICKET<⋯>"
	cont "NO TICKET<⋯>!"

	para "<⋯>TERRIBLY SORRY!"

	para "ONLY PASSENGERS"
	line "WITH TICKETS MAY"
	cont "BOARD THE SHIP!"
	done

.ShipSetSailText:
	text "THE SHIP SET SAIL"
	line "ALREADY!"
	done

VermilionCityGambler2Text:
	text "I AM 『JINUSHI』"
	line "THE LANDLORD!"
	cont "THIS SQUARE LOT"
	cont "IS ALL MY LAND!"

	para "PLAN TO BUILD A"
	line "BUILDING HERE SO"
	cont "MY # FLATTENS"
	cont "THE GROUND FLAT!"
	done

VermilionCityMachopText:
	text "WANRIKY『GUOOO!@"
	text_asm
	ld a, MACHOP
	call PlayCry
	call WaitForSoundToFinish
	ld hl, .StompingTheLandFlatText
	ret

.StompingTheLandFlatText:
	text_start

	para "WANRIKY STOMPS"
	line "THE GROUND FLAT"
	cont "WITH DEEP GRUNTS!"
	done

VermilionCitySailor2Text:
	text "S·S·ANNE IS A"
	line "FAMOUS LUXURY"
	cont "PASSENGER LINER!"

	para "IT DOCKS AT PORT"
	line "KUCHIBA ONLY"
	cont "ONCE A YEAR!"
	done

VermilionCitySignText:
	text "VERMILION CITY"
	line "KUCHIBA ORANGE"
	cont "COLOR OF SUNSET"
	done

VermilionCityNoticeSignText:
	text "NOTICE FLYER!"

	para "A SLEEPING MON"
	line "BLOCKS ROUTE 12!"

	para "TRAVELERS BOUND"
	line "FOR SHION TOWN"
	cont "USE ROCK TUNNEL"
	cont "DETOUR INSTEAD!"

	para "<⋯>KUCHIBA POLICE"
	done

VermilionCityPokemonFanClubSignText:
	text "# FAN CLUB"
	line "ALL # LOVERS"
	cont "ARE WELCOME!"
	done

VermilionCityGymSignText:
	text "VERMILION GYM"
	line "LEADER: MATIS"
	cont "THE LIGHTNING"
	cont "AMERICAN!"
	done

VermilionCityHarborSignText:
	text "VERMILION HARBOR"
	line "PORT ENTRANCE"
	done
