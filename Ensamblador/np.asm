;Descripcion del programa: Identificar si un n?mero ingresado es par o impar
;Autor: David Zavala Moreno y Luis Eduardo Martinez Morales
;Fecha de creacion: 21 de mayo 2021
;Revisiones:
;Ultima fecha de modificacion: 21 de mayo 2021

imprimir MACRO p            ;declarar macros x es la variable
    lea dx, p
    mov ah,09
    int 21h
ENDM

.model small                ;instruye a ensamblador para generar codigo en modo protegido

.stack                      ;modelo de tipo pila

.data

    inicio db "Introduce un valor: ", 10, 13, "$"
    esPar db "El numero es par", 10, 13, "$"
    esImpar db "El numero es impar", 10, 13, "$"
    salto_ascci db 10,13,"$"
    primerDigito dw ?
    ultimoDigito dw ?,"$"
    posDigito db 3 dup (" "),"$"
    x dw ?
    
.code

main PROC FAR
    mov ax, @data           ;cargamos el segmento de datos al registro ax
    mov ds, ax              ;movemos el registro ax a ds
    
    ;Imprimimos mensaje de inicio
    imprimir inicio
    
    mov     si,offset[posDigito]
    mov     cx,0
    mov     primerDigito,0
    
    ciclo_pos1:
    cmp     cx,3
    je      ciclo_UltimaPos
    
    mov     ah,1
    int     21h             
    mov     ah,0          
    cmp     al,13
    je      ciclo_UltimaPos    
    mov     [si],al   
    inc     si
    inc     cx
    mov     primerDigito,cx
    jmp     ciclo_pos1

    ciclo_UltimaPos:
    imprimir   salto_ascci
    mov     cx,primerDigito         
    mov     si,offset[posDigito]
    mov     x,0h
    
   numero1:
    sub     [si],48
    mov     ah,0
    cmp     cx,3
    je      numero1Alto
    cmp     cx,2
    je      numero1Medio
    cmp     cx,1
    je      numero1Bajo
    
    numero1Alto:
    mov al,[si]
    mov bl,100
    mul bl
    jmp numero1Entre
    
    numero1Medio:       
    mov al,[si]
    mov bl,10
    mul bl
    jmp numero1Entre
    
    numero1Bajo:     
    mov al,[si]  
    jmp numero1Entre
    
    numero1Entre:  
    mov ultimoDigito,ax
    add x,ax     
    inc si                
    loop numero1 
    mov ax, ultimoDigito
    mov dx,0
    mov bx,2
    div bx
    cmp dx,0
    jz  par
    jnz impar
    
    par:
    imprimir esPar
    jmp fin
    
    impar:
    imprimir esImpar
    jmp fin

    ;Salir del programa    
    fin:
    mov ax, 4C00h       
    int 21h 
    
main ENDP

salto proc near  
    imprimir salto_ascci
    ret
salto    endp

END main