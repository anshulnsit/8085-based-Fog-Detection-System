	JMP MAIN
.ORG 003CH
	JMP ISR75
.ORG 0050
MAIN:	LXI SP,FFFFH
	CALL LCD_INIT
	MVI A,0FH
	SIM

X:	CALL DELAY_1

	MVI A,C0H
	SIM
	CALL DELAY_20
	MVI A,40H
	SIM
	CALL DELAY_20U
	CALL DELAY_80
	CALL DELAY_80
	
	LXI H,8000H
	MVI A,0BH
	SIM
	EI
	MVI A,00H
	ADI 20H
L3:	JNZ L3
	DI
	MVI A,0FH
	SIM
	
	
	
	LXI H,8000H
	CALL DATA_GET
	STA 9000H
	MOV B,A
	CALL DATA_GET
	STA 9001H
	MOV C,A
	CALL DATA_GET
	STA 9002H
	MOV D,A
	CALL DATA_GET
	STA 9003H
	MOV E,A
	CALL PRINT
	CALL DELAY_1
	;JMP X
	HLT

PRINT:	PUSH PSW
	MOV A,B
	CPI 46H
	JC NOFOG
	JNC FOG

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

FOG:	PUSH PSW
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
	MVI A,45H
	CALL LCD_SEND
	MVI A,44H
	CALL LCD_SEND

	POP PSW
	RET	

NOFOG:	PUSH PSW
	MVI A,4EH
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
	;MVI A,44H
	;CALL LCD_SEND
	;MVI A,45H
	;CALL LCD_SEND
	;MVI A,54H
	;CALL LCD_SEND
	;MVI A,45H
	;CALL LCD_SEND
	;MVI A,43H
	;CALL LCD_SEND
	;MVI A,54H
	;CALL LCD_SEND
	;MVI A,45H
	;CALL LCD_SEND
	;MVI A,44H
	;CALL LCD_SEND

	POP PSW
	RET

DATA_GET: 	MVI B,08H
	MVI D,00H
L4:	MOV A,D
	MOV C,M
	ORA C
	RLC
	INX H
	MOV D,A
	MOV A,B
	DCR A
	MOV B,A
	JNZ L4
	MOV A,D
	RET	
		

DELAY_20:   	PUSH B
	LXI B,681H
LOOP_20:	DCX B
	MOV A,B
	ORA C
	JNZ LOOP_20
	POP B
	RET

DELAY_20U: 	PUSH PSW
	MVI A,01H
LOOP_20U: 	DCR A
	JNZ LOOP_20U
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

LCD_INIT :    PUSH PSW
	MVI A,24H
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
	POP PSW
	RET

LCD_SEND:   	PUSH PSW
	PUSH B
	PUSH D
	MOV B,A
	ANI F0H
	MVI D,0CH
	ORA D
	OUT 01H
	CALL DELAY
	ANI F8
	OUT 01H
	MOV A,B
	RLC
	RLC
	RLC
	RLC
	ANI F0H
	MVI D,0CH
	ORA D
	OUT 01H
	CALL DELAY
	ANI F8H
	OUT 01H
	POP D
	POP B
	POP PSW
	RET

ISR75: 	PUSH PSW
	PUSH B
	MVI B,00H
ISR_L1:	RIM
	ANI 80H
	INR B
	JNZ ISR_L1
	MOV A,B
	CPI 04H
	JC BIT_0
	JNC BIT_1
	INX H
	POP B
	POP PSW
	DCR A
	EI
	RET

BIT_0 :	PUSH PSW
	MVI A,00H
	MOV M,A
	POP PSW
	RET

BIT_1:	PUSH PSW
	MVI A,01H
	MOV M,A
	POP PSW
	RET

DELAY_80:   PUSH PSW
	MVI B,0BH
DELAY_80Loop:   DCR B
	   JNZ DELAY_80Loop
	POP PSW
	   RET
