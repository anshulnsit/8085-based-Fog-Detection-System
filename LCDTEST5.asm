	JMP LABEL0
# ORG 0050
LABEL0:	MVI A,24H
	OUT 01H
	MVI A,20H
	OUT 01H
	CALL DELAY
	MVI A,24H
	OUT 01H
	MVI A,20H
	OUT 01H
	CALL DELAY
	MVI A,84H
	OUT 01H
	MVI A,80H
	OUT 01H
	CALL DELAY
	MVI A,04H
	OUT 01H
	MVI A,00H
	OUT 01H
	CALL DELAY
	MVI A,E4H
	OUT 01H
	MVI A,E0H
	OUT 01H
	CALL DELAY
	MVI A,04H
	OUT 01H
	MVI A,00H
	OUT 01H
	CALL DELAY
	MVI A,64H
	OUT 01H
	MVI A,60H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,8CH
	OUT 01H
	MVI A,88H
	OUT 01H
	CALL DELAY
	HLT
DELAY: 	PUSH PSW
	MVI A,FFH
LOOP: 	DCR A
	JNZ LOOP
	POP PSW
	RET