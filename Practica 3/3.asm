EOI     EQU 20H 
IMR     EQU 21H 
CONT   EQU 10H
COMP   EQU 11H
PA     EQU 30H
PB     EQU 31H
CA     EQU 32H
CB     EQU 33H
INT1   EQU 25H
N_CLK   EQU 10

        ORG 40
IP_CLK  DW  RUT_CLK

        ORG 1000
INICIO  DB  1

        ORG 3000H
RUT_CLK: MOV AL, INICIO
OUT PB,  AL ;PB
CMP DL, 0FFH
JNZ DECREMENTAR 
INC INICIO
CMP AL, 6
JNZ FINAL
MOV DL, 00H
JMP FINAL

DECREMENTAR: DEC INICIO
CMP AL, 1
JNZ FINAL
MOV DL, 0FFH
FINAL:  MOV AL,     0
        OUT CONT,  AL
        MOV AL,     20H
        OUT EOI,    AL
        IRET

        ORG 2000H
        CLI
        MOV AL,     0FDH
        OUT IMR,  AL
        MOV AL,     N_CLK
        OUT INT1,  AL
        MOV AL,     1
        OUT COMP,AL
        MOV AL, 0
        OUT CB,  AL ;CB
        OUT PB,  AL ;PB
        OUT CONT,  AL
        MOV DL, 0FFH ; FFH si tengo que aumentar, 00H para decrementar
        STI
LAZO:   JMP LAZO
        HLT
        END