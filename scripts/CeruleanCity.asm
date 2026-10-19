CeruleanCity_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCity_ScriptPointers
	ld a, [wCeruleanCityCurScript]
	jp CallFunctionInTable

CeruleanCityClearScripts:
	xor a ; SCRIPT_CERULEANCITY_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ld a, TOGGLE_CERULEAN_RIVAL
	ld [wToggleableObjectIndex], a
	predef_jump HideObject

CeruleanCity_ScriptPointers:
	def_script_pointers
	dw_const CeruleanCityDefaultScript,        SCRIPT_CERULEANCITY_DEFAULT
	dw_const CeruleanCityRivalBattleScript,    SCRIPT_CERULEANCITY_RIVAL_BATTLE
	dw_const CeruleanCityRivalDefeatedScript,  SCRIPT_CERULEANCITY_RIVAL_DEFEATED
	dw_const CeruleanCityRivalCleanupScript,   SCRIPT_CERULEANCITY_RIVAL_CLEANUP
	dw_const CeruleanCityRocketDefeatedScript, SCRIPT_CERULEANCITY_ROCKET_DEFEATED

CeruleanCityRocketDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff ; lost battle
	jp z, CeruleanCityClearScripts
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	ld a, TEXT_CERULEANCITY_ROCKET
	ldh [hTextID], a
	call DisplayTextID
	xor a ; SCRIPT_CERULEANCITY_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityDefaultScript:
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .skipRocketThiefEncounter
	ld hl, CeruleanCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .skipRocketThiefEncounter
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_UP
	ld b, SPRITE_FACING_DOWN
	jr nz, .playerBelowRocketThief
	ld a, PLAYER_DIR_DOWN
	ld b, SPRITE_FACING_UP
.playerBelowRocketThief
	ld [wPlayerMovingDirection], a
	ld a, b
	ld [wSprite02StateData1FacingDirection], a
	call Delay3
	ld a, TEXT_CERULEANCITY_ROCKET
	ldh [hTextID], a
	jp DisplayTextID
.skipRocketThiefEncounter
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	ret nz
	ld hl, CeruleanCityCoords2
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
.walking
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	ld a, [wXCoord]
	cp 20 ; is the player standing on the right side of the bridge?
	jr z, .playerOnRightSideOfBridge
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	ld a, SPRITESTATEDATA2_MAPX
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData2
	ld [hl], 25
.playerOnRightSideOfBridge
	ld a, TOGGLE_CERULEAN_RIVAL
	ld [wToggleableObjectIndex], a
	predef ShowObject
	ld de, CeruleanCityMovement1
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CERULEANCITY_RIVAL_BATTLE
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityCoords1:
	dbmapcoord 30,  7
	dbmapcoord 30,  9
	db -1 ; end

CeruleanCityCoords2:
	dbmapcoord 20,  6
	dbmapcoord 21,  6
	db -1 ; end

CeruleanCityMovement1:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityFaceRivalScript:
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	xor a ; SPRITE_FACING_DOWN
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirectionAndDelay ; face object

CeruleanCityRivalBattleScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, CeruleanCityRivalDefeatedText
	ld de, CeruleanCityRivalVictoryText
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL1
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $7
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $8
	jr .done
.Charmander
	ld a, $9
.done
	ld [wTrainerNo], a

	xor a
	ldh [hJoyHeld], a
	call CeruleanCityFaceRivalScript
	ld a, SCRIPT_CERULEANCITY_RIVAL_DEFEATED
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityRivalDefeatedScript:
	ld a, [wIsInBattle]
	cp $ff ; lost battle
	jp z, CeruleanCityClearScripts
	call CeruleanCityFaceRivalScript
	ld a, PAD_CTRL_PAD
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_CERULEAN_RIVAL
	ld a, TEXT_CERULEANCITY_RIVAL
	ldh [hTextID], a
	call DisplayTextID
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	farcall Music_RivalAlternateStart
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, [wXCoord]
	cp 20 ; is the player standing on the right side of the bridge?
	jr nz, .playerOnRightSideOfBridge
	ld de, CeruleanCityMovement4
	jr .skip
.playerOnRightSideOfBridge
	ld de, CeruleanCityMovement3
.skip
	ld a, CERULEANCITY_RIVAL
	ldh [hSpriteIndex], a
	call MoveSprite
	ld a, SCRIPT_CERULEANCITY_RIVAL_CLEANUP
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCityMovement3:
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityMovement4:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

CeruleanCityRivalCleanupScript:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz
	ld a, TOGGLE_CERULEAN_RIVAL
	ld [wToggleableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, SCRIPT_CERULEANCITY_DEFAULT
	ld [wCeruleanCityCurScript], a
	ret

CeruleanCity_TextPointers:
	def_text_pointers
	dw_const CeruleanCityRivalText,         TEXT_CERULEANCITY_RIVAL
	dw_const CeruleanCityRocketText,        TEXT_CERULEANCITY_ROCKET
	dw_const CeruleanCityCooltrainerMText,  TEXT_CERULEANCITY_COOLTRAINER_M
	dw_const CeruleanCitySuperNerd1Text,    TEXT_CERULEANCITY_SUPER_NERD1
	dw_const CeruleanCitySuperNerd2Text,    TEXT_CERULEANCITY_SUPER_NERD2
	dw_const CeruleanCityGuardText,         TEXT_CERULEANCITY_GUARD1
	dw_const CeruleanCityCooltrainerF1Text, TEXT_CERULEANCITY_COOLTRAINER_F1
	dw_const CeruleanCitySlowbroText,       TEXT_CERULEANCITY_SLOWBRO
	dw_const CeruleanCityCooltrainerF2Text, TEXT_CERULEANCITY_COOLTRAINER_F2
	dw_const CeruleanCitySuperNerd3Text,    TEXT_CERULEANCITY_SUPER_NERD3
	dw_const CeruleanCityGuardText,         TEXT_CERULEANCITY_GUARD2
	dw_const CeruleanCitySignText,          TEXT_CERULEANCITY_SIGN
	dw_const CeruleanCityTrainerTipsText,   TEXT_CERULEANCITY_TRAINER_TIPS
	dw_const MartSignText,                  TEXT_CERULEANCITY_MART_SIGN
	dw_const PokeCenterSignText,            TEXT_CERULEANCITY_POKECENTER_SIGN
	dw_const CeruleanCityBikeShopSign,      TEXT_CERULEANCITY_BIKESHOP_SIGN
	dw_const CeruleanCityGymSign,           TEXT_CERULEANCITY_GYM_SIGN

CeruleanCityRivalText:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_RIVAL
	; do pre-battle text
	jr z, .PreBattle
	; or talk about bill
	ld hl, CeruleanCityRivalIWentToBillsText
	call PrintText
	jr .end
.PreBattle
	ld hl, .PreBattleText
	call PrintText
.end
	jp TextScriptEnd

.PreBattleText:
	text "<RIVAL>『YO!"
	line "<PLAYER>!"

	para "ROAM 『URO-CHORO』"
	line "IN SUCH A PLACE?"

	para "I CAUGHT MANY"
	line "STRONG MONS! I AM"
	cont "『ZEKKOUCHOU』"
	cont "IN TOP FORM!"

	para "<⋯>WHAT DID YOU"
	line "CATCH? SHOW ME!』"
	done

CeruleanCityRivalDefeatedText:
	text "WHAT THE HECK!"
	line "GETTING ALL"
	cont "WORKED UP SO!"
	cont "<⋯>OKAY·I GET IT!"
	prompt

CeruleanCityRivalVictoryText:
	text "AFTER ALL I AM A"
	line "TRUE 『TENSAI』!"
	prompt

CeruleanCityRivalIWentToBillsText:
	text "<RIVAL>『HEH-HEH!"

	para "I WENT TO VISIT"
	line "MASAKI BILL AND"
	cont "SAW RARE MONS!"

	para "HE SHOWED ME LOTS"
	line "SO MY #DEX"
	cont "PAGES INCREASED!"

	para "AFTER ALL MASAKI"
	line "IS A FAMOUS"
	cont "# 『MANIA』!"

	para "HE EVEN MADE THE"
	line "# STORAGE"
	cont "SYSTEM ON <PC>!"

	para "YOU USE IT TOO SO"
	line "GO AND THANK HIM!"

	para "OOPS NO TIME TO"
	line "LOAF AROUND!"
	cont "<⋯>『BAIBII』! BYE!』"
	done

CeruleanCityRocketText:
	text_asm
	CheckEvent EVENT_BEAT_CERULEAN_ROCKET_THIEF
	jr nz, .beatRocketThief
	ld hl, .Text
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .IGiveUpText
	ld de, .IGiveUpText
	call SaveEndBattleTextPointers
	ldh a, [hTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_CERULEANCITY_ROCKET_DEFEATED
	ld [wCeruleanCityCurScript], a
	jp TextScriptEnd
.beatRocketThief
	ld hl, .IllReturnTheTMText
	call PrintText
	lb bc, TM_DIG, 1
	call GiveItem
	jr c, .Success
	ld hl, .TM28NoRoomText
	call PrintText
	jr .Done
.Success
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .ReceivedTM28Text
	call PrintText
	farcall CeruleanHideRocket
.Done
	jp TextScriptEnd

.Text:
	text "HEY! DONT TRES-"
	line "PASS IN SOMEONES"
	cont "YARD! <⋯>EH ME?"

	para "JUST A STRANGER"
	line "PASSING BY! NOT"
	cont "SUSPICIOUS! NOT!"
	cont "<⋯><⋯>AM I?"
	done

.ReceivedTM28Text:
	text "<PLAYER> RECOVERED"
	line "TM28 DIG FROM"
	cont "THE THIEF!@"
	sound_get_item_1
	text_start

	para "W-WELL THEN<⋯>!"
	line "I RETREAT AWAY!"
	cont "<⋯><⋯>BYE-BYE!@"
	text_waitbutton
	text_end

.TM28NoRoomText:
	text "BAG IS FULL!"

	para "<⋯>IF I CANT GIVE"
	line "THIS I CANT RUN"
	cont "AWAY EITHER!"
	done

.IGiveUpText:
	text "HYOE! I GIVE UP!"
	line "WONT DO IT AGAIN!"
	cont "SPARE ME PLEASE!"
	prompt

.IllReturnTheTMText:
	text "<⋯>ALL RIGHT!"
	line "I RETURN THE"
	cont "STOLEN <TM> TOO!"
	prompt

CeruleanCityCooltrainerMText:
	text "YOU TRAIN # TOO?"
	line "CATCHING·BATTLING"
	cont "IS TOUGH WORK!"
	done

CeruleanCitySuperNerd1Text:
	text "BUSH IN FRONT OF"
	line "SHOP IS 『JYAMA』!"
	cont "BLOCKS THE WAY!"

	para "BUT DETOUR AROUND"
	line "CAN GET YOU IN<⋯>"
	done

CeruleanCitySuperNerd2Text:
	text "HOHO<⋯>! MAKING"
	line "A # ENCYCLOPEDIA?"
	cont "SOUNDS SO FUN!"
	done

CeruleanCityGuardText:
	text "HOW PITIFUL<⋯>"

	para "A 『DOROBOU』 THIEF"
	line "BROKE IN HERE!"
	cont "WE KNOW IT WAS"
	cont "BY TEAM ROCKET!"

	para "EVEN POLICE ARE"
	line "TROUBLED BY THEIR"
	cont "EVIL DEEDS!"
	done

CeruleanCityCooltrainerF1Text:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, .SlowbroUseSonicboomText
	call PrintText
	jr .end
.notFirstText
	cp 100 ; 80/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .SlowbroPunchText
	call PrintText
	jr .end
.notSecondText
	; 100/256 chance of 3rd dialogue
	ld hl, .SlowbroWithdrawText
	call PrintText
.end
	jp TextScriptEnd

.SlowbroUseSonicboomText:
	text "NOW YADORAN!"
	line "USE SONIC BOOM!"
	cont "<⋯>COME ON YADORAN"
	cont "LISTEN TO ME!"
	done

.SlowbroPunchText:
	text "YADORAN! PUNCH!"
	line "<⋯>SIGH·NO GOOD!"
	done

.SlowbroWithdrawText:
	text "YADORAN! WITHDRAW"
	line "INTO YOUR SHELL!"
	cont "NO<⋯> NOT THAT!"
	cont "# IS SO HARD!"

	para "WHETHER MONS OBEY"
	line "DEPENDS ON THE"
	cont "TRAINERS SKILL!"
	done

CeruleanCitySlowbroText:
	text_asm
	ldh a, [hRandomAdd]
	cp 180 ; 76/256 chance of 1st dialogue
	jr c, .notFirstText
	ld hl, .TookASnoozeText
	call PrintText
	jr .end
.notFirstText
	cp 120 ; 60/256 chance of 2nd dialogue
	jr c, .notSecondText
	ld hl, .IsLoafingAroundText
	call PrintText
	jr .end
.notSecondText
	cp 60 ; 60/256 chance of 3rd dialogue
	jr c, .notThirdText
	ld hl, .TurnedAwayText
	call PrintText
	jr .end
.notThirdText
	; 60/256 chance of 4th dialogue
	ld hl, .IgnoredOrdersText
	call PrintText
.end
	jp TextScriptEnd

.TookASnoozeText:
	text "YADORAN TOOK A"
	line "『HIRUNE』 NAP<⋯>"
	done

.IsLoafingAroundText:
	text "YADORAN IS"
	line "LOAFING AROUND<⋯>"
	done

.TurnedAwayText:
	text "YADORAN TURNED"
	line "AWAY IN DISGUST!"
	done

.IgnoredOrdersText:
	text "YADORAN PLAYED"
	line "『SHIRANPURI』!"
	cont "IGNORED ORDERS<⋯>"
	done

CeruleanCityCooltrainerF2Text:
	text "I WANT A BICYCLE!"
	line "BRIGHT RED BIKE!"

	para "DONT WANT TO GET"
	line "IT DIRTY SO I"
	cont "WILL DISPLAY IT!"
	done

CeruleanCitySuperNerd3Text:
	text "HANADA CAVE LIES"
	line "AHEAD<⋯> MONS OF"
	cont "FEARFUL POWER"
	cont "LIVE INSIDE!"

	para "ONLY A CERTIFIED"
	line "# LEAGUE CHAMPION"
	cont "MAY ENTER HERE!"
	done

CeruleanCitySignText:
	text "CERULEAN CITY"
	line "HANADA IS BLUE"
	cont "COLOR OF MYSTERY"
	done

CeruleanCityTrainerTipsText:
	text "TRAINER TIPS!"

	para "PRESS B BUTTON"
	line "DURING EVOLUTION"
	cont "TO CANCEL IT!"
	done

CeruleanCityBikeShopSign:
	text "GLIDE SMOOTHLY ON"
	line "GRASS AND CAVES!"
	cont "<⋯>MIRACLE CYCLE"
	done

CeruleanCityGymSign:
	text "CERULEAN GYM"
	line "LEADER: KASUMI"
	cont "THE TOMBOYISH"
	cont "MERMAID!"
	done
