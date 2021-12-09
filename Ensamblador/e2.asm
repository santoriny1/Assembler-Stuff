;Descripci?n del programa: Operaciones b?sicas
;Autor: David Zavala Moreno
;Fecha de creaci?n: 16/03/2021 
;Revisiones:
;Ultima fecha de modificacion: 16/03/2021

.model small ;Instruye a ensamblador para generar codigo en modo protegido
.stack ;Modelo de tipo de pila

.data ;Inicio de segmento de datos
    ;Aqui se insertan las variables
    var1 db 2
    var2 db 1
    resul db ?
    
.code                   ;Marca el inicio del segmento de codigo
main PROC               ;Identifica el comienzo de un procedimiento
                        ;Aqui van las instrucciones ejecutables
    mov ax, @data       ;cargamos el segmento de datos al registro ax
        mov ds, ax      ;movemos el registro ax a ds
        
        mov al, var1    ;movemos var1 a al
        add al, var2    ;al = al + var2
        ;sub al, var2   ;al = al - var2 
        ;mul var2       ;AX = al * var2
        ;mov ah, 0          
        ;div var2       ;AL = AX div var2   AH = AX MOD var2  
        mov resul, al   ;movemos al a resul 
        
        
        mov ah, 2 ;2 es la interrupcion de DOS, la cual imprime un caracter almacenado en dl
        mov dl, resul 
        add dl, 030h ;sumamos 030h para imprimir el caracter
        int 21h
        
        mov ax, 4C00H ;finalizar el programa
        int 21h  

main ENDP ;ENDP marca el final del procedimiento main
END main ;END marca la linea del programa que se va a ensamblar 