;Descripci?n del programa: Suma de 8 bits
;Autor: David Zavala Moreno y Luis Eduardo Mart?nez Morales
;Fecha de creaci?n: 16/03/2021 
;Revisiones:
;Ultima fecha de modificacion: 16/03/2021

.model small            ;Instruye a ensamblador para generar codigo en modo protegido
.stack                  ;Modelo de tipo de pila

.data                   ;Inicio de segmento de datos
                        ;Aqui se insertan las variables
    var1 db 254
    var2 db 1
    var3 db 10
    resul1 db ?
    resul2 db ?
    resul3 db ?
    
.code                   ;Marca el inicio del segmento de codigo
    main PROC           ;Identifica el comienzo de un procedimiento
                        ;Aqui van las instrucciones ejecutables
        mov ax, @data   ;cargamos el segmento de datos al registro ax
        mov ds, ax      ;movemos el registro ax a ds
        mov ax, 0       ;limpiar registro ax
                
        mov al, var1    ;movemos var1 a al
        add al, var2    ;al = al + var2
        
        div var3         ; Dividimos entre 10 para obtener digito por digito el resultado
        mov resul3, ah   ;movemos ah a resul3
        mov ah, 0        ;limpiamos el registro ah
        
        div var3         ; Dividimos entre 10 para obtener digito por digito el resultado       
        mov resul2, ah   ;movemos al a resul       
        mov ah, 0        ;limpiamos el registro ah
        
        div var3         ; Dividimos entre 10 para obtener digito por digito el resultado     
        mov resul1, ah   ;movemos al a resul   
        mov ah, 0        ;limpiamos el registro ah
                 
        
        mov ah, 2       ;2 es la interrupcion de DOS, la cual imprime un caracter almacenado en dl
        mov dl, resul1  ; movemos a dl lo que hay en resul1
        add dl, 030h    ;sumamos 030h para imprimir el caracter
        int 21h
        
        mov ah, 2       ;2 es la interrupcion de DOS, la cual imprime un caracter almacenado en dl
        mov dl, resul2  ; movemos a dl lo que hay en resul2
        add dl, 030h    ;sumamos 030h para imprimir el caracter
        int 21h
        
        mov ah, 2       ;2 es la interrupcion de DOS, la cual imprime un caracter almacenado en dl
        mov dl, resul3  ; movemos a dl lo que hay en resul3
        add dl, 030h    ;sumamos 030h para imprimir el caracter
        int 21h 

        mov ax, 4C00H   ;finalizar el programa
        int 21h  

    main ENDP           ;ENDP marca el final del procedimiento main
END main                ;END marca la linea del programa que se va a ensamblar 