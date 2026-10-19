TrainerNamePointers:
; These are shortened variants of some trainer class names, used for trainers' defeat speeches.
; In English, all trainers use their full class name stored in wTrainerName.
	table_width 2
	REPT NUM_TRAINERS
		dw wTrainerName
	ENDR
	assert_table_length NUM_TRAINERS
