;Descripcion del programa:  Nombres con muchos colores
;Autores:                   Luis Eduardo Martinez Morales
;                           David Zavala Moreno
;Fecha de creacion:         15/06/2021
;Version;                   2.0
;Fecha de modificacion:     16/06/2021

pos MACRO A,B
    push ax
    push bx
    push cx
    push dx
    
    mov ah,02h
    mov bh,0
    mov dh,A
    mov dl,B
    int 10h
    
    pop dx
    pop cx
    pop bx
    pop ax
ENDM

.model small                ;   instruye a ensamblador para generar codigo en modo protegido

.stack                      ;   modelo de tipo pila

.data

.code

main PROC FAR
    mov ax, @data       ;   cargamos el segmento de datos al registro ax
    mov ds, ax          ;   movemos el registro ax a ds

    mov al,03h          ;   modo texto
    mov ah,0
    int 10h
    mov ax, 1003h
    mov bx, 0   ; desactivar parpadeo. 
    int 10h
    
    mov bh,0
    mov cx,1
    mov ah,09h
    ;Imprimir Autor 1
    ;Luis
    pos 1,1
    mov al,'L'
    mov bl,0001b
    int 10h
    pos 1,2
    mov al,'u'
    mov bl,0010b
    int 10h
    pos 1,3
    mov al,'i'
    mov bl,0011b
    int 10h
    pos 1,4
    mov al,'s'
    mov bl,0100b
    int 10h
    
    ;Eduardo
    pos 1,6
    mov al,'E'
    mov bl,0110b
    int 10h
    pos 1,7
    mov al,'d'
    mov bl,0111b
    int 10h
    pos 1,8
    mov al,'u'
    mov bl,1000b
    int 10h
    pos 1,9
    mov al,'a'
    mov bl,1001b
    int 10h
    pos 1,10
    mov al,'r'
    mov bl,1010b
    int 10h
    pos 1,11
    mov al,'d'
    mov bl,1011b
    int 10h
    pos 1,12
    mov al,'o'
    mov bl,1100b
    int 10h
    
    ;Mart?nez
    pos 1,14
    mov al,'M'
    mov bl,1110b
    int 10h
    pos 1,15
    mov al,'a'
    mov bl,0100b
    int 10h
    pos 1,16
    mov al,'r'
    mov bl,1101b
    int 10h
    pos 1,17
    mov al,'t'
    mov bl,0111b
    int 10h
    pos 1,18
    mov al,161
    mov bl,1111b
    int 10h
    pos 1,19
    mov al,'n'
    mov bl,1010b
    int 10h
    pos 1,20
    mov al,'e'
    mov bl,0001b
    int 10h
    pos 1,21
    mov al,'z'
    mov bl,1000b
    int 10h
    
    ;Morales
    pos 1,23
    mov al,'M'
    mov bl,1110b
    int 10h
    pos 1,24
    mov al,'o'
    mov bl,1101b
    int 10h
    pos 1,25
    mov al,'r'
    mov bl,0101b
    int 10h
    pos 1,26
    mov al,'a'
    mov bl,1001b
    int 10h
    pos 1,27
    mov al,'l'
    mov bl,0110b
    int 10h
    pos 1,28
    mov al,'e'
    mov bl,0101b
    int 10h
    pos 1,29
    mov al,'s'
    mov bl,1110b
    int 10h
    
    ;==================
    ;Imprimir Autor 2
    ;David
    pos 2,1
    mov al,'D'
    mov bl,0010b
    int 10h
    pos 2,2
    mov al,'a'
    mov bl,0011b
    int 10h
    pos 2,3
    mov al,'v'
    mov bl,0100b
    int 10h
    pos 2,4
    mov al,'i'
    mov bl,0101b
    int 10h
    pos 2,5
    mov al,'d'
    mov bl,0110b
    int 10h
    
    ;Zavala
    pos 2,7
    mov al,'Z'
    mov bl,0111b
    int 10h
    pos 2,8
    mov al,'a'
    mov bl,1000b
    int 10h
    pos 2,9
    mov al,'v'
    mov bl,1001b
    int 10h
    pos 2,10
    mov al,'a'
    mov bl,1010b
    int 10h
    pos 2,11
    mov al,'l'
    mov bl,1011b
    int 10h
    pos 2,12
    mov al,'a'
    mov bl,1100b
    int 10h
    
    ;Moreno
    pos 2,14
    mov al,'M'
    mov bl,1110b
    int 10h
    pos 2,15
    mov al,'o'
    mov bl,1111b
    int 10h
    pos 2,16
    mov al,'r'
    mov bl,0001b
    int 10h
    pos 2,17
    mov al,'e'
    mov bl,0010b
    int 10h
    pos 2,18
    mov al,'n'
    mov bl,0011b
    int 10h
    pos 2,19
    mov al,'o'
    mov bl,0100b
    int 10h
    
    mov ah,02h
    mov bh,0
    mov dh,12
    mov dl,15
    int 10h

main ENDP
 

END main