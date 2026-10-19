MtMoonPokecenter_Script:
	call Serial_TryEstablishingExternallyClockedConnection
	jp EnableAutoTextBoxDrawing

MtMoonPokecenter_TextPointers:
	def_text_pointers
	dw_const MtMoonPokecenterNurseText,            TEXT_MTMOONPOKECENTER_NURSE
	dw_const MtMoonPokecenterYoungsterText,        TEXT_MTMOONPOKECENTER_YOUNGSTER
	dw_const MtMoonPokecenterGentlemanText,        TEXT_MTMOONPOKECENTER_GENTLEMAN
	dw_const MtMoonPokecenterMagikarpSalesmanText, TEXT_MTMOONPOKECENTER_MAGIKARP_SALESMAN
	dw_const MtMoonPokecenterClipboardText,        TEXT_MTMOONPOKECENTER_CLIPBOARD
	dw_const MtMoonPokecenterLinkReceptionistText, TEXT_MTMOONPOKECENTER_LINK_RECEPTIONIST

MtMoonPokecenterNurseText:
	script_pokecenter_nurse

MtMoonPokecenterYoungsterText:
	text "SET BALLS ON"
	line "BELT: 1 2 3 4"
	cont "5 6⋯ AND DONE!"

	para "YES⋯ ONE CAN"
	line "CARRY UP TO 6"
	cont "# IN PARTY!"
	done

MtMoonPokecenterGentlemanText:
	text "A HANADA HOUSE"
	line "WAS ATTACKED⋯?!"

	para "NOT A SINGLE DAY"
	line "PASSES WITHOUT"
	cont "NEWS OF <ROCKET>!"
	done

MtMoonPokecenterMagikarpSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
	ld hl, .IGotADealText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	lb bc, MAGIKARP, 5 ; BUG: money is lost even if there is no room (party or box) to receive the mon
	call GivePokemon
	jr nc, .done
	SetEvent EVENT_BOUGHT_MAGIKARP
	jr .done
.choseNo
	ld hl, .NoText
	jr .printText
.alreadyBoughtMagikarp
	ld hl, .NoRefundsText
.printText
	call PrintText
.done
	jp TextScriptEnd

.IGotADealText
	text "MAN:「HEY BOY!"
	line "ONLY FOR YOU⋯!"
	cont "I HAVE A SWEET"
	cont "SPECIAL DEAL!"

	para "SECRET # KOIKING"
	line "FOR ONLY 500 YEN!"
	cont "WANT TO BUY IT?"
	done

.NoText
	text "SO? WHAT A"
	line "SHAME THAT IS⋯"
	done

.NoMoneyText
	text "SEEMS YOU DONT"
	line "HAVE ENOUGH CASH!"
	done

.NoRefundsText
	text "MAN:「NO REFUNDS"
	line "ACCEPTED FOR #"
	cont "REMEMBER THAT!」"
	done

MtMoonPokecenterClipboardText:
	text_start
	done

MtMoonPokecenterLinkReceptionistText:
	script_cable_club_receptionist
