SSAnneCaptainsRoom_Script:
	call SSAnneCaptainsRoomEventScript
	jp EnableAutoTextBoxDrawing

SSAnneCaptainsRoomEventScript:
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wStatusFlags3
	set BIT_NO_NPC_FACE_PLAYER, [hl]
	ret

SSAnneCaptainsRoom_TextPointers:
	def_text_pointers
	dw_const SSAnneCaptainsRoomCaptainText,     TEXT_SSANNECAPTAINSROOM_CAPTAIN
	dw_const SSAnneCaptainsRoomTrashText,       TEXT_SSANNECAPTAINSROOM_TRASH
	dw_const SSAnneCaptainsRoomSeasickBookText, TEXT_SSANNECAPTAINSROOM_SEASICK_BOOK

SSAnneCaptainsRoomCaptainText:
	text_asm
	CheckEvent EVENT_GOT_HM01
	jr nz, .got_item
	ld hl, SSAnneCaptainsRoomRubCaptainsBackText
	call PrintText
	ld hl, SSAnneCaptainsRoomCaptainIFeelMuchBetterText
	call PrintText
	lb bc, HM_CUT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, SSAnneCaptainsRoomCaptainReceivedHM01Text
	call PrintText
	SetEvent EVENT_GOT_HM01
	jr .done
.bag_full
	ld hl, SSAnneCaptainsRoomCaptainHM01NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, SSAnneCaptainsRoomCaptainNotSickAnymoreText
	call PrintText
.done
	jp TextScriptEnd

SSAnneCaptainsRoomRubCaptainsBackText:
	text "CAPTAIN: 『URP<⋯>!"
	line "TOTALLY DOWN WITH"
	cont "SEASICKNESS<⋯>"
	cont "PAINFUL<⋯> URK!"

	para "<PLAYER> RUBBED"
	line "CAPTAIN BACK!"

	para "RUB RUB<⋯> RUB<⋯>"
	line "『SURISURI』<⋯>@"
	text_asm
	ld a, [wAudioROMBank]
	cp BANK("Audio Engine 3")
	ld [wAudioSavedROMBank], a
	jr nz, .not_audio_engine_3
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.not_audio_engine_3
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.loop
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .loop
	call PlayDefaultMusic
	SetEvent EVENT_RUBBED_CAPTAINS_BACK
	ld hl, wStatusFlags3
	res BIT_NO_NPC_FACE_PLAYER, [hl]
	jp TextScriptEnd

SSAnneCaptainsRoomCaptainIFeelMuchBetterText:
	text "CAPTAIN: 『PHEW<⋯>"
	line "THANK YOU! I FEEL"
	cont "MUCH BETTER NOW!"

	para "<⋯>WHAT? YOU CAME"
	line "TO SEE MY SECRET"
	cont "『HIDEN』 MOVE?"

	para "IF HEALTHY· I"
	line "WOULD SHOW OFF MY"
	cont "『IAIGIRI』 CUT<⋯>"

	para "I KNOW! TAKE THIS"
	line "INSTEAD!"

	para "TEACH THIS TO"
	line "YOUR #· YOU CAN"
	cont "SEE CUT ANYTIME!"
	prompt

SSAnneCaptainsRoomCaptainReceivedHM01Text:
	text "<PLAYER> GOT"
	line "@"
	text_ram wStringBuffer
	text "!@"
	sound_get_key_item
	text_end

SSAnneCaptainsRoomCaptainNotSickAnymoreText:
	text "CAPTAIN: 『<⋯>WHEW!"

	para "NOW I FEEL GOOD·"
	line "IT IS TIME SOON!"

	para "S.S. ANNE WILL"
	line "DEPART VERY SOON!"

	para "FAREWELL UNTIL"
	line "WE MEET AGAIN IN"
	cont "KUCHIBA PORT!"
	done

SSAnneCaptainsRoomCaptainHM01NoRoomText:
	text "WHAT A SHOCK!"
	line "PACK IS TOO FULL!"
	done

SSAnneCaptainsRoomTrashText:
	text "LOOKS LIKE BETTER"
	line "NOT TO LOOK<⋯>"
	done

SSAnneCaptainsRoomSeasickBookText:
	text "HOW NOT TO GET"
	line "SEASICK: SAILOR"
	cont "BEGINNER GUIDE<⋯>"

	para "<⋯>THE CAPTAIN IS"
	line "READING THIS!"
	done
