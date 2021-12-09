;Descripcion del programa: Imprimir en pantalla nombre, n?mero de control, instituto, carrera
;Autor: David Zavala Moreno
;Fecha de creaci?n: 12/03/2021 
;Revisiones
;?ltima fecha de modificaci?n: 12/03/2021

.model small ;Instrye a ensamblador para generar c?digo en modo protegido
.stack ;Modelo de tipo de pila

.data ;Inicio de segmento de datos
    ;Aqu? se insertan las variables
    texto1 DB "David Zavala Moreno", 10, 13, "$" ;DB BYTE, $ indice hasta donde se deja de leer la memoria
    texto2 DB "17121071",10, 13, "$"
    texto3 DB "Instituto Tecnol", 162, "gico de Morelia",10, 13, "$"
    texto4 DB "Ingenier", 161 ,"a en Sistemas Computacionales", "$"
    
.code ;Marca el inicio del segmento de codigo
main PROC ;Identifica el comienzo de un procedimiento
;Aqui van las instrucciones ejecutables
    mov ax, @data ;cargamos el segmento de datos al registro ax
        mov ds, ax ;movemos el registro ax a ds
        
        lea dx, texto1 ;mostrar o leer un mensaje
        mov ah, 09 ;09 es la interrupcion de DOS, la cual imprime cadena almacenada en dx
        int 21h ;interrupcion MS DOS
        
        lea dx, texto2 ;mostrar o leer un mensaje
        mov ah, 09 ;09 es la interrupcion de DOS, la cual imprime cadena almacenada en dx
        int 21h ;interrupcion MS DOS
        
        lea dx, texto3 ;mostrar o leer un mensaje
        mov ah, 09 ;09 es la interrupcion de DOS, la cual imprime cadena almacenada en dx
        int 21h ;interrupcion MS DOS
        
        lea dx, texto4 ;mostrar o leer un mensaje
        mov ah, 09 ;09 es la interrupcion de DOS, la cual imprime cadena almacenada en dx
        int 21h ;interrupcion MS DOS
        
        mov ax, 4C00H ;finalizar el programa
        int 21h  

main ENDP ;ENDP marca el final del procedimiento main
END main ;END marca la linea del programa que se va a ensamblar 