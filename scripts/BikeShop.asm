BikeShop_Script:
	jp EnableAutoTextBoxDrawing

BikeShop_TextPointers:
	def_text_pointers
	dw_const BikeShopClerkText,             TEXT_BIKESHOP_CLERK
	dw_const BikeShopMiddleAgedWomanText,   TEXT_BIKESHOP_MIDDLE_AGED_WOMAN
	dw_const BikeShopYoungsterText,         TEXT_BIKESHOP_YOUNGSTER

BikeShopClerkText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	jr z, .dontHaveBike
	ld hl, BikeShopClerkHowDoYouLikeYourBicycleText
	call PrintText
	jp .Done
.dontHaveBike
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .dontHaveVoucher
	ld hl, BikeShopClerkOhThatsAVoucherText
	call PrintText
	lb bc, BICYCLE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, BIKE_VOUCHER
	ldh [hItemToRemoveID], a
	farcall RemoveItemByID
	SetEvent EVENT_GOT_BICYCLE
	ld hl, BikeShopExchangedVoucherText
	call PrintText
	jr .Done
.BagFull
	ld hl, BikeShopBagFullText
	call PrintText
	jr .Done
.dontHaveVoucher
	ld hl, BikeShopClerkWelcomeText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, $1
	ld [wMaxMenuItem], a
	ld a, $2
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	hlcoord 0, 0
	ld b, 4
	ld c, 15
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 2
	ld de, BikeShopMenuText
	call PlaceString
	ld hl, BikeShopClerkDoYouLikeItText
	call PrintText
	call HandleMenuInput
	bit B_PAD_B, a
	jr nz, .cancel
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .cancel
	ld hl, BikeShopCantAffordText
	call PrintText
.cancel
	ld hl, BikeShopComeAgainText
	call PrintText
.Done
	jp TextScriptEnd

BikeShopMenuText:
	db   "BIKE 1000000円"
	next "DONT BUY@"

BikeShopClerkWelcomeText:
	text "HAI HAI! WELCOME!"
	line "HERE IS MIRACLE"
	cont "CYCLE SHOP!"

	para "HAVE BARGAINS!"
	line "WILL YOU BUY?"
	prompt

BikeShopClerkDoYouLikeItText:
	text "HAVE COOL BIKE!"
	line "WILL YOU BUY IT?"
	done

BikeShopCantAffordText:
	text "HONORED GUEST!"
	line "MONEY IS NOT"
	cont "ENOUGH! NO COIN!"
	prompt

BikeShopClerkOhThatsAVoucherText:
	text "AAH··· THAT IS⋯!"

	para "BIKE VOUCHER"
	line "『HIKIKAEKEN』!"

	para "⋯UNDERSTOOD!"
	line "QUICKLY· TAKE"
	cont "THIS PRESENT!"
	prompt

BikeShopExchangedVoucherText:
	text "<PLAYER> EXCHANGED"
	line "FOR A BICYCLE!@"
	sound_get_key_item
	text_end

BikeShopComeAgainText:
	text "COME AGAIN!"
	line "ARIGATOU VERY"
	cont "MUCH! THANK YOU!"
	done

BikeShopClerkHowDoYouLikeYourBicycleText:
	text "YA! HELLO PAL!"
	line "HOW IS RIDING"
	cont "FEEL OF BICYCLE?"

	para "THAT BIKE CAN"
	line "RUN CYCLING ROAD"
	cont "AND EVEN CAVE!"
	done

BikeShopBagFullText:
	text "BAG IS FULL!"
	line "CANT CARRY BIKE!"
	done

BikeShopMiddleAgedWomanText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "UMM⋯ PERHAPS A"
	line "『MAMA-CHARI』"
	cont "MOM BIKE IS BEST?"

	para "MOUNTAIN BIKE"
	line "DOES NOT MATCH"
	cont "SHOPPING BASKET!"
	done

BikeShopYoungsterText:
	text_asm
	CheckEvent EVENT_GOT_BICYCLE
	ld hl, .CoolBikeText
	jr nz, .gotBike
	ld hl, .TheseBikesAreExpensiveText
.gotBike
	call PrintText
	jp TextScriptEnd

.TheseBikesAreExpensiveText:
	text "BIKES IN THIS"
	line "SHOP ARE GOOD BUT"
	cont "『TAKAI』! PRICEY!"

	para "I CANNOT BUY IT!"
	done

.CoolBikeText:
	text "YOUR BICYCLE IS"
	line "KAKKOII! SO COOL!"
	cont "I AM ENVIOUS!"
	done
