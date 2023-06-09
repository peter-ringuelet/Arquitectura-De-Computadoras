TIMER EQU 10H
COMP EQU 11H
IMR EQU 21H
EOI EQU 20H
INT1 EQU 25H
N_CLK EQU 10


ORG 40
IP_CLK DW RUT_CLK


ORG 1000H
MIN DB 30H
MIN_NEXT DB 30H
PUNTOS DB 3AH
SEG DB 30H
SEG_NEXT DB 30H
ESPACIO DB " "
FIN DB ?


ORG 3000H
RUT_CLK: PUSH AX
INC SEG_NEXT
CMP SEG_NEXT, 3AH
JNZ RESET
MOV SEG_NEXT, 30H
INC SEG
CMP SEG, 36H
JNZ RESET
MOV SEG, 30H
INC MIN_NEXT
CMP MIN_NEXT, 3AH
JNZ RESET
MOV MIN_NEXT, 30H
INC MIN
CMP MIN, 36H
JNZ RESET
MOV MIN, 30H
RESET: CMP SEG_NEXT, 30H
JNZ ELSE
INT 7
ELSE: MOV AL, 0
OUT TIMER, AL
MOV AL, EOI
OUT EOI, AL
POP AX
IRET


ORG 2000H
CLI
MOV AL, 0FDH ;11111101
OUT IMR, AL ; PIC: registro IMR
MOV AL, N_CLK ; el ID del registro
OUT INT1, AL ; PIC: registro INT1
MOV AL, 1
OUT COMP, AL ; TIMER: registro COMP
MOV AL, 0
OUT TIMER, AL ; TIMER: registro CONT
MOV BX, OFFSET MIN
MOV AL, OFFSET FIN-OFFSET MIN
STI
LAZO: JMP LAZO
END