LavenderMart_Script:
	jp EnableAutoTextBoxDrawing

LavenderMart_TextPointers:
	def_text_pointers
	dw_const LavenderMartClerkText,        TEXT_LAVENDERMART_CLERK
	dw_const LavenderMartBaldingGuyText,   TEXT_LAVENDERMART_BALDING_GUY
	dw_const LavenderMartCooltrainerMText, TEXT_LAVENDERMART_COOLTRAINER_M

LavenderMartBaldingGuyText:
	text "UNCLE IS HUNTING"
	line "FOR ITEMS THAT<⋯>"

	para "TEMPORARILY BOOST"
	line "STAT POWER DURING"
	cont "# BATTLE TIME!"

	para "PLUS POWER!"
	line "DEFENDER!"
	cont "SPEEDER!"
	cont "SPECIAL UP<⋯>"

	para "SUCH ARE NAMES"
	line "YOU KNOW THEM?"
	done

LavenderMartCooltrainerMText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	jr nz, .Nugget
	ld hl, .ReviveText
	call PrintText
	jr .done
.Nugget
	ld hl, .NuggetText
	call PrintText
.done
	jp TextScriptEnd

.ReviveText
	text "BOUGHT REVIVE?"
	line "『GENKI NO KAKERA』"
	cont "PIECE OF VIGOR!"

	para "VERY HANDY ITEM"
	line "TO MAKE FAINTED"
	cont "『HINSHI』# WELL!"
	done

.NuggetText
	text "OTHER DAY IN DEEP"
	line "MOUNTAIN I PICKED"
	cont "UP A GOLD NUGGET"
	cont "『KIN NO TAMA』!"

	para "CANNOT BE USED"
	line "BUT SOLD FOR"
	cont "WHOLE 5000 YEN!"
	done
