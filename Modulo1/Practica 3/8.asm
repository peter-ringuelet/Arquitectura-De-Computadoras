EOI EQU 20H
IMR EQU 21H
INT2 EQU 26H
HAND_DATO EQU 40H
HAND_ESTADO EQU 41H
N_HND EQU 10
ORG 40 
IP_HND DW RUT_HND 
ORG 1000H
MSJ DB "UNIVERSIDAD "
DB "NACIONAL DE LA PLATA"
FIN DB ?

ORG 3000H 
RUT_HND: PUSH AX 
MOV AL, [BX] 
OUT HAND_DATO, AL ;el out hand ya guarda en el buffer la letra
INC BX
DEC CL 
MOV AL, 20H 
OUT EOI, AL 
POP AX
IRET 
ORG 2000H
MOV BX, OFFSET MSJ
MOV CL, OFFSET FIN-OFFSET MSJ
CLI
MOV AL, 0FBH ;11111011
OUT IMR, AL
MOV AL, N_HND
OUT INT2, AL
IN AL, HAND_ESTADO
OR AL, 80H ;10000000
OUT HAND_ESTADO, AL
STI
LAZO: CMP CL, 0
JNZ LAZO
IN AL, HAND_ESTADO ;cierro el ESTADO
AND AL, 7FH ; 01111111
OUT HAND_ESTADO, AL
INT 0
END