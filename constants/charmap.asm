; $00-$16 are also TX_* constants (see macros/scripts/text.asm)

; Control characters (see home/text.asm)

	charmap "<NULL>",    $00
	charmap "<PAGE>",    $49
	charmap "<PKMN>",    $4a ; "<PK><MN>"
	charmap "<_CONT>",   $4b ; implements "<CONT>"
	charmap "<SCROLL>",  $4c
	charmap "<NEXT>",    $4e
	charmap "<LINE>",    $4f
	charmap "@",         $50 ; string terminator
	charmap "<PARA>",    $51
	charmap "<PLAYER>",  $52 ; wPlayerName
	charmap "<RIVAL>",   $53 ; wRivalName
	charmap "#",         $54 ; "POKé"
	charmap "<CONT>",    $55
	charmap "<⋯>",      $56 ; "……"
	charmap "<DONE>",    $57
	charmap "<PROMPT>",  $58
	charmap "<TARGET>",  $59
	charmap "<USER>",    $5a
	charmap "<PC>",      $5b ; "PC"
	charmap "<TM>",      $5c ; "TM"
	charmap "<TRAINER>", $5d ; "TRAINER"
	charmap "<ROCKET>",  $5e ; "ROCKET"
	charmap "<DEXEND>",  $5f

; Actual characters (from gfx/font/font_extra.png)

	charmap "·",         $74 ; middle dot
	charmap "⋯",         $75 ; ellipsis
	charmap "「",         $70 ; opening single quote
	charmap "」",         $71 ; closing single quote
	charmap "『",         $72 ; opening quote
	charmap "』",         $73 ; closing quote

	charmap "┌",         $79
	charmap "─",         $7a
	charmap "┐",         $7b
	charmap "│",         $7c
	charmap "└",         $7d
	charmap "┘",         $7e
	charmap " ",         $7f
	charmap "　",        $7f

; Actual characters (from gfx/font/font_battle_extra.png)

	charmap "<LV>",      $6e
	charmap "<to>",      $70
	charmap "<do>",      $70
	charmap "<ID>",      $73
	charmap "№",         $74

; Actual characters (from gfx/pokedex/pokedex.png)

	charmap "ｍ",        $60
	charmap "ｋ",        $61
	charmap "ｇ",        $62

; Actual characters (from other graphics files)

	charmap "<BOLD_P>",  $72 ; gfx/font/P.1bpp
	charmap "▲",         $ed ; gfx/town_map/up_arrow.1bpp
	charmap "<ED>",      $f0 ; gfx/font/ED.1bpp

; Actual characters (from gfx/font/font.png)

	charmap "A",         $80
	charmap "B",         $81
	charmap "C",         $82
	charmap "D",         $83
	charmap "E",         $84
	charmap "F",         $85
	charmap "G",         $86
	charmap "H",         $87
	charmap "I",         $88
	charmap "J",         $89
	charmap "K",         $8a
	charmap "L",         $8b
	charmap "M",         $8c
	charmap "N",         $8d
	charmap "O",         $8e
	charmap "P",         $8f
	charmap "Q",         $90
	charmap "R",         $91
	charmap "S",         $92
	charmap "T",         $93
	charmap "U",         $94
	charmap "V",         $95
	charmap "W",         $96
	charmap "X",         $97
	charmap "Y",         $98
	charmap "Z",         $99

	charmap "(",         $9a
	charmap ")",         $9b
	charmap ":",         $9c
	charmap ";",         $9d
	charmap "[",         $9e
	charmap "]",         $9f

	charmap "a",         $a0
	charmap "b",         $a1
	charmap "c",         $a2
	charmap "d",         $a3
	charmap "e",         $a4
	charmap "f",         $a5
	charmap "g",         $a6
	charmap "h",         $a7
	charmap "i",         $a8
	charmap "j",         $a9
	charmap "k",         $aa
	charmap "l",         $ab
	charmap "m",         $ac
	charmap "n",         $ad
	charmap "o",         $ae
	charmap "p",         $af
	charmap "q",         $b0
	charmap "r",         $b1
	charmap "s",         $b2
	charmap "t",         $b3
	charmap "u",         $b4
	charmap "v",         $b5
	charmap "w",         $b6
	charmap "x",         $b7
	charmap "y",         $b8
	charmap "z",         $b9

	charmap "é",         $ba
	charmap "'d",        $bb
	charmap "'l",        $bc
	charmap "'s",        $bd
	charmap "'t",        $be
	charmap "'v",        $bf

	charmap "ッ",        $c0

	charmap "'",         $e0
	charmap "<PK>",      $e1
	charmap "<MN>",      $e2
	charmap "-",         $e3
	charmap "ー",        $e3
	charmap "'r",        $e4
	charmap "'m",        $e5

	charmap "?",         $e6
	charmap "？",        $e6
	charmap "!",         $e7
	charmap "！",        $e7
	charmap ".",         $e8
	charmap "。",        $e8

	charmap "▷",         $ec
	charmap "▶",         $ed
	charmap "▼",         $ee
	charmap "♂",         $ef
	charmap "円",        $f0
	charmap "×",         $f1
	charmap "．",        $f2
	charmap "/",         $f3
	charmap "／",        $f3
	charmap ",",         $f4
	charmap "♀",         $f5

	charmap "0",         $f6
	charmap "1",         $f7
	charmap "2",         $f8
	charmap "3",         $f9
	charmap "4",         $fa
	charmap "5",         $fb
	charmap "6",         $fc
	charmap "7",         $fd
	charmap "8",         $fe
	charmap "9",         $ff

	charmap "０",        $f6
	charmap "１",        $f7
	charmap "２",        $f8
	charmap "３",        $f9
	charmap "４",        $fa
	charmap "５",        $fb
	charmap "６",        $fc
	charmap "７",        $fd
	charmap "８",        $fe
	charmap "９",        $ff

; Fullwidth Latin aliases
	charmap "Ａ", $80
	charmap "Ｂ", $81
	charmap "Ｃ", $82
	charmap "Ｄ", $83
	charmap "Ｅ", $84
	charmap "Ｆ", $85
	charmap "Ｇ", $86
	charmap "Ｈ", $87
	charmap "Ｉ", $88
	charmap "Ｊ", $89
	charmap "Ｋ", $8a
	charmap "Ｌ", $8b
	charmap "Ｍ", $8c
	charmap "Ｎ", $8d
	charmap "Ｏ", $8e
	charmap "Ｐ", $8f
	charmap "Ｑ", $90
	charmap "Ｒ", $91
	charmap "Ｓ", $92
	charmap "Ｔ", $93
	charmap "Ｕ", $94
	charmap "Ｖ", $95
	charmap "Ｗ", $96
	charmap "Ｘ", $97
	charmap "Ｙ", $98
	charmap "Ｚ", $99
	charmap "：", $9c
