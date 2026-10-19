RedsHouse1F_Script:
	jp EnableAutoTextBoxDrawing

RedsHouse1F_TextPointers:
	def_text_pointers
	dw_const RedsHouse1FMomText, TEXT_REDSHOUSE1F_MOM
	dw_const RedsHouse1FTVText,  TEXT_REDSHOUSE1F_TV

RedsHouse1FMomText:
	text_asm
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jr nz, .heal
	ld hl, .WakeUpText
	call PrintText
	jr .done
.heal
	call RedsHouse1FMomHealScript
.done
	jp TextScriptEnd

.WakeUpText:
	text "MAMA『<⋯>SOU NE·"
	line "ALL BOYS LEAVE ON"
	cont "TABI· A JOURNEY！"

	para "UN<⋯> YES· IT WAS"
	line "ON TELEVISION！"

	para "SOU IEBA· BY THE"
	line "WAY· DR. OOKIDO"
	cont "CALLS FOR YOU！』"
	done

RedsHouse1FMomHealScript:
	ld hl, RedsHouse1FMomYouShouldRestText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, RedsHouse1FMomLookingGreatText
	jp PrintText

RedsHouse1FMomYouShouldRestText:
	text "MAMA『<PLAYER>！"
	line "REST A BIT· TAKE"
	cont "YASUMI<⋯>？"
	cont "<⋯> <⋯> <⋯>"
	prompt

RedsHouse1FMomLookingGreatText:
	text "MAMA『ARA ARA！"
	line "YOU AND # ARE"
	cont "GENKI FULL ENERGY"

	para "SO BE CAREFUL！"
	line "ITTERASSHAI！"
	cont "HAVE SAFE TRIP！』"
	done

RedsHouse1FTVText:
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, .WrongSideText
	jr nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	call PrintText
	jp TextScriptEnd

.StandByMeMovieText:
	text "A MOVIE ON TV！"
	line "4 BOYS WALK"
	cont "ON RAILROAD<⋯>"

	para "<⋯>BOKU MO！ I MUST"
	line "GO NOW TOO！"
	done

.WrongSideText:
	text "CANNOT SEE<⋯>"
	done
