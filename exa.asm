;Ejercicio 1 y 2
.model small
.stack
.data
	cad db 21 dup(?)
	var1 db 0
	base db 10
	men db 'La suma es: ',10,13,'$'
	men1 db '',10,13,'$'
.code
;INICIO
principal proc far
MOV AX,@DATA
MOV DS,AX

;LIMPIA PANTALLA
MOV AL,3
MOV AH,0
INT 10H

;PIDE POR TECLADO

MOV SI,0
CICLOG:
MOV AH,1
INT 21H
CMP AL,13D
JE IMPRIME
MOV CAD[si],AL
INC SI
MOV AX,0
JMP CICLOG

IMPRIME:
MOV CAD[SI],24H
MOV AH,9
MOV DX,OFFSET CAD
INT 21H
MOV SI,0

MOV AH,9
MOV DX,OFFSET MEN1
INT 21H

SUMAR:
CMP CAD[SI],24H
JE IMPRIMESS
sub cad[si],30h
MOV AL,CAD[SI]
ADD var1,AL
mov ax,0
inc si
JMP SUMAR

IMPRIMESS:
MOV AH,9
MOV DX,OFFSET men
int 21h
MOV BL,24H
PUSH BX
jmp imprimes



imprimes:
MOV AX,0
MOV AL,VAR1
CMP AL,0
JE SACA
DIV base
MOV VAR1,AL
MOV BL,AH
OR BL,30H
MOV BH,0
PUSH BX
JMP IMPRIMES

SACA:
POP DX
CMP DL,24H
JE FIN
MOV AH,0EH
MOV AL,DL
INT 10H
JMP SACA








FIN:
MOV AH,4CH
INT 21H

;FIN
principal endp
end principal