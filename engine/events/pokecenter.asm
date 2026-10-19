DisplayPokemonCenterDialogue_::
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, PokemonCenterWelcomeText
	call PrintText
	ld hl, wStatusFlags4
	bit BIT_USED_POKECENTER, [hl]
	set BIT_UNKNOWN_4_1, [hl]
	set BIT_USED_POKECENTER, [hl]
	jr nz, .skipShallWeHealYourPokemon
	ld hl, ShallWeHealYourPokemonText
	call PrintText
.skipShallWeHealYourPokemon
	call YesNoChoicePokeCenter ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	call SetLastBlackoutMap
	call LoadScreenTilesFromBuffer1 ; restore screen
	ld hl, NeedYourPokemonText
	call PrintText
	ld a, $18
	ld [wSprite01StateData1ImageIndex], a ; make the nurse turn to face the machine
	call Delay3
	predef HealParty
	farcall AnimateHealingMachine ; do the healing machine animation
	xor a
	ld [wAudioFadeOutControl], a
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, [wMapMusicSoundID]
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a
	call PlaySound
	ld hl, PokemonFightingFitText
	call PrintText
	ld a, $14
	ld [wSprite01StateData1ImageIndex], a ; make the nurse bow
	ld c, a
	call DelayFrames
	jr .done
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	call PrintText
	jp UpdateSprites

PokemonCenterWelcomeText:
	text "WELCOME TO THE"
	line "# CENTER！"

	para "WE FULL RESTORE"
	line "YOUR # HEALTH"
	cont "ENERGY RECOVERY！"
	prompt

ShallWeHealYourPokemonText:
	text_pause
	text "WILL YOU LEAVE"
	line "YOUR MONSTER"
	cont "BALLS WITH US？"
	done

NeedYourPokemonText:
	text "OKAY THEN！ WE"
	line "SHALL TAKE THEM"
	cont "RIGHT NOW！"
	done

PokemonFightingFitText:
	text "THANK YOU FOR"
	line "WAITING PATIENT！"

	para "YOUR PET # ARE"
	line "ALL HEALTHY AND"
	cont "FULL ENERGETIC！"
	prompt

PokemonCenterFarewellText:
	text_pause
	text "WE AWAIT YOUR"
	line "NEXT VISIT！"
	cont "MATA DOUZO！"
	done
