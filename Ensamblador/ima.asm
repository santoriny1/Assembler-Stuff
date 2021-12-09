;Descripcion del programa: Dibujo de imagen por pixel
;   Autores: Luis Eduardo Martinez Morales
;            David Zavala Moreno
;   Fecha de creacion: 13 de junio 2021
;   Revisiones: 13 de junio 2021 -> se establecio el macro para dibujar en consola
;               14 de junio 2021 -> se empezo a dibujar en consola
;   Ultima fecha de modificacion: 15 de junio 2021

dibujar MACRO A:REQ, B:REQ, C:REQ
    push ax
    push bx
    push cx

    mov al,C
    mov ah,0ch
    mov bh,1
    mov cx,A
    mov dx,B
    int 10h     ; set dibujar.

    pop cx
    pop bx
    pop ax
ENDM

fila MACRO A:REQ, B:REQ, C:REQ
    dibujar A+0,B,C
    dibujar A+1,B,C
    dibujar A+2,B,C
    dibujar A+3,B,C
    dibujar A+4,B,C
ENDM

columna MACRO A:REQ, B:REQ, C:REQ
    fila A,B+0,C
    fila A,B+1,C
    fila A,B+2,C
    fila A,B+3,C
    fila A,B+4,C
ENDM

.model small                ;   instruye a ensamblador para generar codigo en modo protegido

.stack                      ;   modelo de tipo pila

.data

.code

main PROC FAR
    mov ax, @data       ;   cargamos el segmento de datos al registro ax
    mov ds, ax          ;   movemos el registro ax a ds
       
    mov al, 13h
    mov ah, 0
    int 10h     ; set graphics video mode. 


    columna 0,70,0fh
    columna 5,65,0fh
    columna 10,65,0fh
    columna 15,60,0fh
    columna 20,60,0fh
    columna 25,65,0fh
    columna 30,65,0fh
    columna 35,60,0fh
    columna 35,55,01h
    columna 30,50,01h
    columna 25,45,01h
    columna 20,40,01h
    columna 25,40,01h
    columna 25,35,0fh
    columna 30,40,01h
    columna 35,40,01h
    columna 40,45,01h
    columna 45,45,01h
    columna 50,50,01h
    columna 55,50,01h
    columna 60,55,01h
    columna 65,55,01h
    columna 60,60,01h
    columna 65,60,01h
    columna 70,60,01h
    columna 75,60,0fh
    columna 80,55,0fh
    columna 85,55,0fh
    columna 90,55,0fh
    columna 95,60,0fh
    columna 100,60,0fh
    columna 105,65,01h
    columna 110,65,0fh
    columna 115,65,0fh
    columna 120,65,0fh
    columna 125,65,0fh
    columna 130,70,0fh
    columna 125,75,0fh
    columna 120,75,0fh
    columna 115,75,01h
    columna 110,80,01h
    columna 105,80,01h ; Subir un dibujar arriba y linea izq
    ;linea de en medio
    columna 105,75,01h
    columna 100,75,01h
    columna 95,75,01h
    columna 90,75,01h
    columna 85,75,01h
    columna 80,75,01h
    columna 75,75,01h
    columna 70,75,01h
    columna 65,75,01h
    columna 60,75,01h
    columna 55,75,01h
    columna 50,75,01h
    columna 45,75,01h
    ;-----------------
    columna 100,85,0fh
    columna 95,85,0fh
    columna 90,85,01h
    columna 85,85,01h
    columna 80,85,01h
    columna 75,90,01h
    columna 70,90,01h
    columna 65,90,01h
    columna 60,90,01h
    columna 60,95,01h
    columna 55,95,0fh
    columna 50,100,0fh
    columna 45,95,0fh
    columna 40,90,0fh
    columna 35,85,0fh
    columna 35,80,0fh
    columna 30,75,0fh
    columna 25,75,0fh
    columna 20,80,0fh
    columna 15,80,0fh
    columna 10,75,0fh
    columna 5,75,0fh
    ;relleno
    columna 5,70,06h
    columna 10,70,06h
    columna 15,65,06h
    columna 20,65,06h
    columna 15,70,0ch
    columna 20,70,0ch
    columna 15,75,06h
    columna 20,75,06h
    columna 25,70,0fh
    columna 30,70,0fh
    columna 40,60,0fh
    columna 45,60,01h
    columna 50,60,01h
    columna 55,60,01h
    columna 40,65,0fh
    columna 40,70,0fh
    columna 40,75,0fh
    columna 45,80,0fh
    columna 50,85,0fh
    columna 55,90,0fh
    columna 50,95,09h
    columna 45,90,09h
    columna 40,85,09h
    columna 40,80,09h
    columna 75,65,01h
    columna 80,65,0fh
    columna 80,60,0ch
    columna 85,60,0ch
    columna 90,60,0ch
    columna 85,65,0ch
    columna 90,65,0ch
    columna 95,65,0ch
    columna 100,65,0ch
    ;-------
    
    mov ah,02h
    mov bh,0
    mov dh,12
    mov dl,15
    int 10h

    mov     ax, 4C00h       ;   Salir del programa
    int     21h
main ENDP
 

END main