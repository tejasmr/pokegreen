CreditsTextPointers:
; entries correspond to CRED_* constants
	table_width 2
	dw .CredStaff
	dw .CredTajiri
	dw .CredOota
	dw .CredMorimoto
	dw .CredWatanabe
	dw .CredMasuda
	dw .CredNisino
	dw .CredSugimori
	dw .CredNishida
	dw .CredMiyamoto
	dw .CredKawaguchi
	dw .CredIshihara
	dw .CredYamauchi
	dw .CredZinnai
	dw .CredHishida
	dw .CredSakai
	dw .CredYamaguchi
	dw .CredYamamoto
	dw .CredTaniguchi
	dw .CredNonomura
	dw .CredFuziwara
	dw .CredMatsusima
	dw .CredTomisawa
	dw .CredKawamoto
	dw .CredKakei
	dw .CredTsuchiya
	dw .CredNakamura
	dw .CredYuda
	dw .CredMon
	dw .CredDirector
	dw .CredProgrammers
	dw .CredCharDesign
	dw .CredMusic
	dw .CredSoundEffects
	dw .CredGameDesign
	dw .CredMonsterDesign
	dw .CredGameScene
	dw .CredParam
	dw .CredMap
	dw .CredTest
	dw .CredSpecial
	dw .CredProducers
	dw .CredExecutive
	assert_table_length NUM_CRED_STRINGS

.CredStaff:
	db "STAFF@"
.CredTajiri:
	db "SATOSHI TAJIRI@"
.CredOota:
	db "TAKENORI OOTA@"
.CredMorimoto:
	db "SHIGEKI MORIMOTO@"
.CredWatanabe:
	db "TETSUYA WATANABE@"
.CredMasuda:
	db "JUNICHI MASUDA@"
.CredNisino:
	db "KOHJI NISHINO@"
.CredSugimori:
	db "KEN SUGIMORI@"
.CredNishida:
	db "ATSUKO NISHIDA@"
.CredMiyamoto:
	db "SHIGERU MIYAMOTO@"
.CredKawaguchi:
	db "TAKASHI KAWAGUCHI@"
.CredIshihara:
	db "TSUNEKAZU ISHIHARA@"
.CredYamauchi:
	db "HIROSHI YAMAUCHI@"
.CredZinnai:
	db "HIROYUKI ZINNAI@"
.CredHishida:
	db "TATSUYA HISHIDA@"
.CredSakai:
	db "YASUHIRO SAKAI@"
.CredYamaguchi:
	db "WATARU YAMAGUCHI@"
.CredYamamoto:
	db "KAZUYUKI YAMAMOTO@"
.CredTaniguchi:
	db "RYOSUKE TANIGUCHI@"
.CredNonomura:
	db "FUMIHIRO NONOMURA@"
.CredFuziwara:
	db "MOTOFUMI FUZIWARA@"
.CredMatsusima:
	db "KENJI MATSUSHIMA@"
.CredTomisawa:
	db "AKIHITO TOMISAWA@"
.CredKawamoto:
	db "HIROSHI KAWAMOTO@"
.CredKakei:
	db "AKIYOSHI KAKEI@"
.CredTsuchiya:
	db "KAZUKI TSUCHIYA@"
.CredNakamura:
	db "TAKEO NAKAMURA@"
.CredYuda:
	db "MASAMITSU YUDA@"
.CredMon:
	db "POKEMON@"
.CredDirector:
	db "DIRECTOR@"
.CredProgrammers:
	db "PROGRAMMERS@"
.CredCharDesign:
	db "CHARACTER DESIGN@"
.CredMusic:
	db "MUSIC@"
.CredSoundEffects:
	db "SOUND EFFECTS@"
.CredGameDesign:
	db "GAME DESIGN@"
.CredMonsterDesign:
	db "MONSTER DESIGN@"
.CredGameScene:
	db "SCENARIO@"
.CredParam:
	db "PARAM SETTING@"
.CredMap:
	db "MAP DESIGN@"
.CredTest:
	db "TEST PLAYERS@"
.CredSpecial:
	db "SPECIAL THANKS@"
.CredProducers:
	db "PRODUCERS@"
.CredExecutive:
	db "EXECUTIVE PRODUCER@"

CreditsTextOffsets:
	table_width 1
	db -2 ; CRED_STAFF
	db -6 ; CRED_TAJIRI
	db -6 ; CRED_OOTA
	db -7 ; CRED_MORIMOTO
	db -7 ; CRED_WATANABE
	db -6 ; CRED_MASUDE
	db -6 ; CRED_NISINO
	db -5 ; CRED_SUGIMORI
	db -6 ; CRED_NISHIDA
	db -7 ; CRED_MIYAMOTO
	db -8 ; CRED_KAWAGUCHI
	db -8 ; CRED_ISHIHARA
	db -7 ; CRED_YAMAUCHI
	db -7 ; CRED_ZINNAI
	db -7 ; CRED_HISHIDA
	db -6 ; CRED_SAKAI
	db -7 ; CRED_YAMAGUCHI
	db -8 ; CRED_YAMAMOTO
	db -8 ; CRED_TANIGUCHI
	db -8 ; CRED_NONOMURA
	db -8 ; CRED_FUZIWARA
	db -7 ; CRED_MATSUSIMA
	db -7 ; CRED_TOMISAWA
	db -7 ; CRED_KAWAMOTO
	db -6 ; CRED_KAKEI
	db -7 ; CRED_TSUCHIYA
	db -6 ; CRED_NAKAMURA
	db -6 ; CRED_YUDA
	db -3 ; CRED_MON
	db -3 ; CRED_DIRECTOR
	db -5 ; CRED_PROGRAMMERS
	db -7 ; CRED_CHAR_DESIGN
	db -2 ; CRED_MUSIC
	db -6 ; CRED_SOUND_EFFECTS
	db -5 ; CRED_GAME_DESIGN
	db -6 ; CRED_MONSTER_DESIGN
	db -3 ; CRED_GAME_SCENE
	db -6 ; CRED_PARAM
	db -4 ; CRED_MAP
	db -5 ; CRED_TEST
	db -6 ; CRED_SPECIAL
	db -4 ; CRED_PRODUCERS
	db -8 ; CRED_EXECUTIVE
	assert_table_length NUM_CRED_STRINGS
