JMP START
.ORG 0050H
START:	CALL LCD_INIT
	MVI A,30H
	CALL LCD_SEND
	MVI A,39H
	CALL LCD_SEND
	CALL DELAY_1
	CALL LCD_NEWL
	MVI A,41H
	CALL LCD_SEND
	CALL DELAY_1
	CALL DELAY_1
	CALL LCD_CLEAR
	HLT

LCD_CLEAR:	PUSH PSW
	MVI A,04H
	OUT 01H
	MVI A,00H
	OUT 01H
	CALL DELAY
	MVI A,14H
	OUT 01H
	MVI A,10H
	OUT 01H
	CALL DELAY
	POP PSW
	RET

LCD_NEWL:	PUSH PSW
	MVI A,0C4H
	OUT 01H
	MVI A,0C0H
	OUT 01H
	CALL DELAY
	MVI A,04H
	OUT 01H
	MVI A,00H
	OUT 01H
	CALL DELAY
	POP PSW
	RET


DELAY_1:	PUSH B
	PUSH D
	MVI B,2EH
Loop1:	MVI C,6AH
Loop2:	MVI D,1CH
Loop3:	DCR D
	JNZ Loop3
	DCR C
	JNZ Loop2
	DCR B
	JNZ Loop1
	POP D
	POP B
	RET

DELAY: 	PUSH PSW
	MVI A,0FH
LOOP: 	DCR A
	JNZ LOOP
	POP PSW
	RET

LCD_INIT: PUSH PSW
	MVI A,024H
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
	MVI A,0E4H
	OUT 01H
	MVI A,0E0H
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
	POP PSW
	RET

LCD_SEND:   	PUSH PSW
	PUSH B
	PUSH D
	MOV B,A
	ANI 0F0H
	MVI D,0CH
	ORA D
	OUT 01H
	CALL DELAY
	ANI 0F8H
	OUT 01H
	MOV A,B
	RLC
	RLC
	RLC
	RLC
	ANI 0F0H
	MVI D,0CH
	ORA D
	OUT 01H
	CALL DELAY
	ANI 0F8H
	OUT 01H
	POP D
	POP B
	POP PSW
	RET