.data 
TABLA: .word 1, 2 ,3, 4, 5, 6, 7, 8, 9, 10
dimL: .word 10
X: .word 5
CANT: .word 0
RES: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.code
dadd r1, r0, r0     ; pos tabla
ld r6, dimL(r0)     ; dimL tabla
dadd r2, r0, r0     ; cont > X
ld r3, X(r0)        ; elemento que comparo


loop: ld r4, TABLA(r1)
slt r5, r3, r4      ; r5 = 1 si r3 < r4