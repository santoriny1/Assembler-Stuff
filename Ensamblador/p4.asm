
;La directiva EQU asigna un nombre simbolico 
;al valor de una expresion. El compilador, 
;cuando encuentre en el codigo dicho nombre simbolico,
;lo sustituira por el valor de la expresion. 
;La expresion indicada puede ser:
;Una constante numerica. 
;Una referencia de direccion (cualquier modo de direccionamiento).
;Cualquier combinacion de simbolos y operaciones que generen un valor numerico. 
;Otro nombre simbolico.
;Sintaxis: nombre EQU expresion 

ORG 100h

var1 EQU 32
var2 EQU 0

inicio: MOV al, var1
        MOV ah, var2
        CMP al, ah
        JA mayor
        JB menor
        JE igual
mayor:  MOV bl, 1
fin1:   RET
menor:  MOV bl, 0
fin2:   RET
igual:  MOV bl, 32        
fin3:   RET




