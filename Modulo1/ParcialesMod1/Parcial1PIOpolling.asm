EOI EQU 20H
IMR EQU 21H
PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
CADENA DB "AadLKsdIkPzZ"
FIN DB ?

ORG 3000H
INI_IMP: MOV AL, 11111101B
OUT CA, AL
MOV AL, 0
OUT CB, AL
IN AL, PA
AND AL, 11111101B
OUT PA, AL
RET

PULSO: IN AL, PA
OR AL, 2
OUT PA, AL
IN AL, PA
AND AL, 11111101B
OUT PA, AL
RET

SELECCIONADO: PUSH AX
PUSH BX
PUSH CX
MOV DL, 0
CMP BYTE PTR [BX], 41H
JS TERMINAR
MOV AL, 5AH
CMP AL, BYTE PTR [BX]
JS TERMINAR
MOV DL, 1
TERMINAR: POP CX
POP BX
POP AX
RET

ORG 2000H
PUSH AX
CALL INI_IMP
POP AX
MOV BX, OFFSET CADENA
MOV CL, OFFSET FIN - OFFSET CADENA
LAZO: CALL SELECCIONADO
CMP DL, 1
JNZ SIGUIENTE
POLL: IN AL, PA
AND AL, 1
JNZ POLL
MOV AL, [BX]
OUT PB, AL
PUSH AX
CALL PULSO
POP AX
SIGUIENTE: INC BX
DEC CL
JNZ LAZO
INT 0
END