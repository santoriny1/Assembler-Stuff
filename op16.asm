;Descripcion del programa: Operaciones 16 bits
;Autor: David Zavala Moreno y Luis Eduardo Martinez Morales
;Fecha de creacion: 23 de marzo 2021
;Revisiones: Se agregaron las operaciones y se leen los datos ingresados caracter por caracter
;Ultima fecha de modificacion: 26 de marzo 2021

;convierte los numeros a decimal dependiendo de su posicion
convert MACRO p

    ;se procesa el 5to numero
    mov dx, 0
    mov ax, p 
    mov bx, 10000
    div bx
    mov bx, dx
    
    ;se convierte a decimal el 5to numero
    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h
    
    ;se procesa el 4to numero
    mov ax, bx 
    mov dx, 0
    mov bx, 1000
    div bx
    mov bx, dx
                                
    ;se convierte a decimal el 3er numero
    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h
    
    ;se procesa el 3er numero
    mov ax, bx 
    mov dx, 0
    mov bx, 100
    div bx
    mov bx, dx

    ;se convierte a decimal el 2do numero
    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h

    ;se procesa el 2do numero
    mov ax, bx 
    mov dx, 0
    mov bx, 10
    div bx
    mov bx, dx
    
    ;se procesa el 1er numero
    mov dl, al
    add dl, 48
    mov ah, 2h
    int 21h
    
    ;se convierte a decimal el 1er numero
    mov dl, bl
    add dl, 48
    mov ah, 2h
    int 21h
ENDM

;se imprime una cadena
print MACRO p 
    lea dx, p
    mov ah, 09
    int 21h
ENDM

;instruye a ensamblador para generar c?digo en modo protegido
.model small
;modelo de tipo pila                
.stack                          

;segmento de datos, aqui se declaran las variables
.data
    suma    db 'La suma es: ','$'
    resta   db 'La resta es: ','$'
    mult     db 'La multiplicaci',162,'n es: ','$'
    cos     db 'La divisi',162,'n es: ','$'
    msg1    db 'Introducir primer numero: ','$'
    msg2    db 'Introducir segundo numero: ','$'
    num1    dw ?
    num2    dw ?
    temp    db ?
    salt   db 10,13,'$'

;marca el inicio del segmento de c?digo     
.code

;proc identifica el inicio de un procedimiento
main PROC  

    ;cargamos segmento de datos al registro ax
    mov ax, @data
    ;mover el registro ax a ds  
    mov ds, AX 

    print msg1

    mov bx, 1
    mov cx, 0
    
    inv1:
        ;guarda el primer valor 
        mov ah, 01h 
        int 21h
        cmp al, 13
        je save 

        inc cx 
        cmp cx, 6
        jl sav1
        
        mov bx, 1
        mov cx, 0
        
        ;poner 0 al primer numero ingresado
        mov num1, 0 
        call salto
        print msg1
        jmp inv1

    sav1:
        ;obtener valor de caracteres en decimal
        sub al, 48  
        mov temp, al
        mov ax, num1
        mov dx, 0
        mul bx
        add al, temp 
        mov num1, ax 

        ;multiplica y secciona el numero ingresado en unidades, decenas, centenas , millares y decena de millar
        cmp cx, 1   
        jne inv1
        mov bx, 10 
        jmp inv1

    ;se guarda el numero del primer valor ingresado    
    save:
        cmp cx, 0
        jne segnum    
        call salto 
        print msg1
        jmp inv1

    segnum:
        call salto
        mov bx, 1
        mov cx, 0
        print msg2
        
    opsnum2:
        ;guarda caracter
        mov ah, 01h 
        int 21h
        cmp al, 13 
        je sav2 

        inc cx 
        cmp cx, 6
        jl save2 
        
        ;num2 vuelve a 0
        mov bx, 1
        mov cx, 0
        mov num2, 0 
       
        call salto 
        print msg2
        jmp opsnum2

    save2:
        ;obtener valor de caracteres en decimal
        sub al, 48
        mov temp, al
        mov ax, num2
        mov dx, 0
        mul bx
        add al, temp 
        mov num2, ax 

        ;multiplica y secciona el numero ingresado en unidades, decenas, centenas , millares y decena de millar
        cmp cx, 1   
        jne opsnum2
        
        mov bx, 10 
        jmp opsnum2

    sav2:
        cmp cx, 0
        jne operaciones 
         
        call salto 
        print msg2
        jmp opsnum2

    operaciones:
        call salto
        ;se hace la suma
        print suma 
        mov ax, num1 
        add ax, num2 
        convert ax

        call salto
        ;se hace la resta
        print resta 
        mov ax, num1 
        sub ax, num2 
        convert ax

        call salto
        ;se hace la multiplicacion
        print mult 
        mov dx, 0
        mov ax, num1 
        mov bx, num2
        mul bx 
        convert ax

        call salto
        ;se hace la division
        print cos 
        mov dx, 0
        mov ax, num1 
        mov bx, num2
        div bx 
        convert ax

    mov ah, 04ch 
    int 21h

;ENDP marca el final del procedimiento main     
main ENDP

;este procedimiento imprime un salto de linea
salto proc near
    lea dx, salt
    mov ah, 09
    int 21h
    ret
salto endp

;END marca la ?ltima l?nea del programa que se va a ensamblar
END main 