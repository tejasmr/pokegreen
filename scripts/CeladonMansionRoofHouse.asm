CeladonMansionRoofHouse_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansionRoofHouse_TextPointers:
	def_text_pointers
	dw_const CeladonMansionRoofHouseHikerText,         TEXT_CELADONMANSION_ROOF_HOUSE_HIKER
	dw_const CeladonMansionRoofHouseEeveePokeballText, TEXT_CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL

CeladonMansionRoofHouseHikerText:
	text "AS WRITTEN ON"
	line "BLACKBOARD⋯"
	cont "I KNOW ALL"
	cont "IN THE WORLD!"

	para "EVEN THAT A WORLD"
	line "IS IN GAME BOY!"

	para "BY ALL MEANS!"
	line "GATHER PALS AND"
	cont "ENJOY TRADING #"
	cont "TOGETHER LOTS!"
	done

CeladonMansionRoofHouseEeveePokeballText:
	text_asm
	lb bc, EEVEE, 25
	call GivePokemon
	jr nc, .party_full
	ld a, TOGGLE_CELADON_MANSION_EEVEE_GIFT
	ld [wToggleableObjectIndex], a
	predef HideObject
.party_full
	jp TextScriptEnd
