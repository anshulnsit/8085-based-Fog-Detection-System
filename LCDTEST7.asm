	JMP LABEL0
# ORG 0050
LABEL0:	CALL LCD_INIT
	HLT
DELAY: 	PUSH PSW
	MVI A,0FH
LOOP: 	DCR A
	JNZ LOOP
	POP PSW
	RET

LCD_INIT :    MVI A,24H
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
LCD_COMM:	CALL DELAY
	MVI A,5CH
	OUT 01H
	MVI A,58H
	OUT 01H
	CALL DELAY
	MVI A,7CH
	OUT 01H
	MVI A,78H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,5CH
	OUT 01H
	MVI A,58H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,CCH
	OUT 01H
	MVI A,C8H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,3CH
	OUT 01H
	MVI A,38H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,FCH
	OUT 01H
	MVI A,F8H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,DCH
	OUT 01H
	MVI A,D8H
	OUT 01H
	CALL DELAY
	MVI A,4CH
	OUT 01H
	MVI A,48H
	OUT 01H
	CALL DELAY
	MVI A,5CH
	OUT 01H
	MVI A,58H
	OUT 01H
	CALL DELAY
	MVI A,2CH
	OUT 01H
	MVI A,28H
	OUT 01H
	CALL DELAY
	MVI A,1CH
	OUT 01H
	MVI A,18H
	OUT 01H