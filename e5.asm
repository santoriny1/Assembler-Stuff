;   Descripcion del programa: Imprimir cadenas y caracteres
;   Autor: David Zavala Moreno
;   Fecha de creacion: 23 de marzo 2021
;   Revisiones: 0
;   Ultima fecha de modificacion: 23 de marzo 2021

print       MACRO   p       ; declarar macros x es la variable
    lea     dx, p
    mov     ah,09
    int     21h
ENDM

print_car   MACRO   p

    mov ah, 2
    mov dl, p
    int 21h    
    
ENDM

;regresar metodo de imprimir caracter



.model small                ;   instruye a ensamblador para generar codigo en modo protegido

.stack                      ;   modelo de tipo pila

.data        
    arreglo db "0", "1", 50, "$"                   
    cadena db 50 dup (" "), "$"
    texto db "Introduce informacion", 10, 13, "$"
.code
                       
main PROC FAR               
                            
    mov     ax, @data       ;   cargamos el segmento de datos al registro ax
    mov     ds, ax          ;   movemos el registro ax a ds
    
     mov si, offset [arreglo]
     ciclo:
     mov al, [si]
     cmp al, "$" ;al=$
     je fin ;salta si es igual
            ;jne salta si no es igual
            ;jl salta si es menor que 
            ;jg salta si es mayor que 
     print_car al
     inc si
     jmp ciclo
     fin:
   
comment #    
    mov cx, 3 ;repetimos 3 veces
    mov si, offset [arreglo]
    ciclo:
    mov al, [si]
    print_car al
    inc si
    loop ciclo
    #
    
comment#    
    print texto 
    mov dx, offset [cadena]
    mov ah, 03fh
    int 21h
    print cadena
    
    #
    
    mov     ax, 4C00h       ;   Salir del programa
    int     21h
main ENDP    
    
END main 