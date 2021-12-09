imprimir MACRO x 
    lea dx, x
    mov ah, 09
    int 21h
ENDM

resultado MACRO x 
    mov dx, 0
    mov ax, x 
    mov bx, 10000
    div bx
    mov bx, dx

    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h

    mov ax, bx 
    mov dx, 0
    mov bx, 1000
    div bx
    mov bx, dx

    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h

    mov ax, bx 
    mov dx, 0
    mov bx, 100
    div bx
    mov bx, dx

    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h

    mov ax, bx 
    mov dx, 0
    mov bx, 10
    div bx
    mov bx, dx

    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h

    mov dl, bl
    add dl, 48
    mov ah, 2h
    int 21h
ENDM

.model small ;Instruye a ensamblador para generar c?digo en modo protegido
.stack ;Modelo de tipo pila


.data ;marca el inicio de datos 
    sopln   db 10,13,'$'
    txt1    db 'Introduce el valor 1: ','$'
    txt2    db 'Introduce el valor 2: ','$'
    err     db 'El valor debe tener un m',160,'ximo de 5 cifras','$'
    vac     db 'Debe ingresar un valor de al menos un d',161,'gito','$'
    num1    dw ?
    num2    dw ?
    ntmp    db ?
    suma    db 'El resultado de la suma es: ','$'
    resta   db 'El resultado de la resta es: ','$'
    mlt     db 'El resultado de la multiplicaci',162,'n es: ','$'
    dvs     db 'El resultado de la divisi',162,'n es: ','$'

.code ;marca el inicio del segmento de c?digo 
main PROC ; proc identifica el inicio de un procedimiento 
    mov ax, @data ;cargamos segmento de datos al registro ax 
        mov ds, AX ;mover el registro ax a ds

        imprimir txt1

        mov bx, 1
        mov cx, 0
        valor1:
            mov ah, 01h ;capturar valor ingresado
            int 21h
            cmp al, 13  ;comparar con retorno de carro
            je enter1 

            inc cx 
            cmp cx, 6
            jl oper1    ;comparar con contador, reiniciar si pasa de 5 cifras
            mov bx, 1
            mov cx, 0
            mov num1, 0 ;reiniciar registros y num1
            call salto
            imprimir err
            call salto  ;imprime error y vuelve a capturar el valor
            call salto 
            imprimir txt1
            jmp valor1

        oper1:
            sub al, 48  ;obtener valor del caracter de teclado
            mov ntmp, al
            mov ax, num1
            mov dx, 0
            mul bx      ;para conservar el valor existente, se multiplica por bx y se suma el nuevo
            add al, ntmp 
            mov num1, ax 

            cmp cx, 1   ;el primer caracter se multiplica por 1, el resto por 10
            jne valor1
            mov bx, 10 
            jmp valor1

        enter1:
            cmp cx, 0
            jne init    ;debe ingresar al menos un d?gito al valor
            call salto 
            imprimir vac 
            call salto 
            call salto 
            imprimir txt1
            jmp valor1

        init:
            call salto
            mov bx, 1
            mov cx, 0
            imprimir txt2
        valor2:
            mov ah, 01h ;capturar valor ingresado
            int 21h
            cmp al, 13  ;comparar con retorno de carro
            je enter2 

            inc cx 
            cmp cx, 6
            jl oper2    ;comparar con contador, reiniciar si pasa de 5 cifras
            mov bx, 1
            mov cx, 0
            mov num2, 0 ;reiniciar registros y num2
            call salto
            imprimir err
            call salto  ;imprime error y vuelve a capturar el valor
            call salto 
            imprimir txt2
            jmp valor2

        oper2:
            sub al, 48  ;obtener valor del caracter de teclado
            mov ntmp, al
            mov ax, num2
            mov dx, 0
            mul bx      ;para conservar el valor existente, se multiplica por bx y se suma el nuevo
            add al, ntmp 
            mov num2, ax 

            cmp cx, 1   ;el primer caracter se multiplica por 1, el resto por 10
            jne valor2
            mov bx, 10 
            jmp valor2

        enter2:
            cmp cx, 0   ;debe ingresar al menos un d?gito al valor
            jne pantalla 
            call salto 
            imprimir vac 
            call salto 
            call salto 
            imprimir txt2
            jmp valor2

        pantalla:
            call salto
            call salto

            ;realizar suma e imprimir resultado
            imprimir suma 
            mov ax, num1 
            add ax, num2 
            resultado ax

            call salto
            ;realizar resta e imprimir resultado
            imprimir resta 
            mov ax, num1 
            sub ax, num2 
            resultado ax

            call salto
            ;realizar multiplicaci?n e imprimir resultado
            imprimir mlt 
            mov dx, 0
            mov ax, num1 
            mov bx, num2
            mul bx 
            resultado ax

            call salto
            ;realizar divisi?n e imprimir resultado
            imprimir dvs 
            mov dx, 0
            mov ax, num1 
            mov bx, num2
            div bx 
            resultado ax

        mov ah, 4ch 
        int 21h

main ENDP ; ENDP marca el final del procedimiento main 

salto proc near
    lea dx, sopln
    mov ah, 09
    int 21h
    ret
salto endp

END main ; END marca la ?ltima l?nea del programa que se va a ensamblar