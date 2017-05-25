JMP START
.ORG 0050H
START	:CALL LCD_INIT
	CALL LCD_COFF
	CALL WELCOME
	CALL DELAY_1
	CALL DELAY_1
	CALL LCD_CLEAR
	CALL GREETING
	CALL DELAY_1
	CALL DELAY_1
	CALL LCD_CLEAR
	CALL CRDTS
	CALL DELAY_1
	HLT

DELAY1S:	PUSH PSW
	PUSH B
	MVI A,0AH
AGAIN:	LXI B,2348H
LOOP1S:	DCX B
	MOV A,C
	ORA B
	JNZ LOOP1S
	DCR A
	JNZ AGAIN
	POP B
	POP PSW
	RET

LCD_BEGN:	PUSH PSW
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
	POP PSW
	RET	

WELCOME:	PUSH PSW
	MVI A,57H
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,4CH
	CALL LCD_SEND
	MVI A,43H
	CALL LCD_SEND
	MVI A,4FH
	CALL LCD_SEND
	MVI A,4DH
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,54H
	CALL LCD_SEND
	MVI A,4FH
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,46H
	CALL LCD_SEND
	MVI A,4FH
	CALL LCD_SEND
	MVI A,47H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND

	CALL LCD_NEWL
		

	MVI A,44H
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,54H
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,43H
	CALL LCD_SEND
	MVI A,54H
	CALL LCD_SEND
	MVI A,49H
	CALL LCD_SEND
	MVI A,4FH
	CALL LCD_SEND
	MVI A,4EH
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,53H
	CALL LCD_SEND
	MVI A,59H
	CALL LCD_SEND
	MVI A,53H
	CALL LCD_SEND
	MVI A,54H
	CALL LCD_SEND
	MVI A,4DH
	CALL LCD_SEND
	POP PSW
	RET

GREETING:	PUSH PSW
	MVI A,41H
	CALL LCD_SEND
	MVI A,4EH
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,38H
	CALL LCD_SEND
	MVI A,30H
	CALL LCD_SEND
	MVI A,38H
	CALL LCD_SEND
	MVI A,35H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,50H
	CALL LCD_SEND
	MVI A,52H
	CALL LCD_SEND
	MVI A,4FH
	CALL LCD_SEND
	MVI A,4AH
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,43H
	CALL LCD_SEND
	MVI A,54H
	CALL LCD_SEND

	CALL LCD_NEWL	

	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,20H
	CALL LCD_SEND
	MVI A,42H
	CALL LCD_SEND
	MVI A,59H
	CALL LCD_SEND
	POP PSW
	RET

CRDTS:	PUSH PSW
	MVI A,41H
	CALL LCD_SEND
	MVI A,4EH
	CALL LCD_SEND
	MVI A,53H
	CALL LCD_SEND
	MVI A,48H
	CALL LCD_SEND
	MVI A,55H
	CALL LCD_SEND
	MVI A,4CH
	CALL LCD_SEND
	MVI A,28H
	CALL LCD_SEND
	MVI A,33H
	CALL LCD_SEND
	MVI A,30H
	CALL LCD_SEND
	MVI A,2FH
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,43H
	CALL LCD_SEND
	MVI A,2FH
	CALL LCD_SEND
	MVI A,31H
	CALL LCD_SEND
	MVI A,34H
	CALL LCD_SEND
	MVI A,29H
	CALL LCD_SEND
	
	CALL LCD_NEWL
	
	MVI A,41H
	CALL LCD_SEND
	MVI A,53H
	CALL LCD_SEND
	MVI A,48H
	CALL LCD_SEND
	MVI A,49H
	CALL LCD_SEND
	MVI A,53H
	CALL LCD_SEND
	MVI A,48H
	CALL LCD_SEND
	MVI A,28H
	CALL LCD_SEND
	MVI A,34H
	CALL LCD_SEND
	MVI A,33H
	CALL LCD_SEND
	MVI A,2FH
	CALL LCD_SEND
	MVI A,45H
	CALL LCD_SEND
	MVI A,43H
	CALL LCD_SEND
	MVI A,2FH
	CALL LCD_SEND
	MVI A,31H
	CALL LCD_SEND
	MVI A,34H
	CALL LCD_SEND
	MVI A,29H
	CALL LCD_SEND
	POP PSW
	RET

LCD_COFF:	PUSH PSW
	MVI A,04H
	OUT 01H
	MVI A,00H
	OUT 01H
	MVI A,0C4H
	OUT 01H
	MVI A,0C0H
	OUT 01H
	POP PSW
	RET

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
	CALL LCD_BEGN
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
