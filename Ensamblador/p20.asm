;Segmento de constantes

       
;Segmento de datos
        datos SEGMENT 
            menu DB "MENU: ", 10, 13, 10, 13, "$" 
            op1 DB "1.- Opcion 1 ", 10, 13, "$"           
            op2 DB "2.- Opcion 2 ", 10, 13, "$"
            op3 DB "3.- Opcion 3 ", 10, 13, "$" 
            quit DB "4.- Salir ", 10, 13,10, 13, "$"
            msj DB "Coloca tu opcion: ", 10, 13, 10, 13, "$"
            res1 DB 10, 13,"Escogiste la OPCION 1 ", 10, 13, 10, 13, "$"
            res2 DB 10, 13,"Escogiste la OPCION 2 ", 10, 13, 10, 13, "$"
            res3 DB 10, 13,"Escogiste la OPCION 3 ", 10, 13, 10, 13, "$"
            err DB 10, 13,"Entrada no valida ", 10, 13, 10, 13, "$"       
            
        datos ENDS    

                       
                    
;Segmento de pila
        pila SEGMENT stack  
            
            DB 128 DUP(0)
            
        pila ENDS    


;Segmento de codigo
        codigo SEGMENT
            
            prac20 PROC FAR
                
            assume cs:codigo, ds:datos, ss:pila

                
                PUSH ds
                XOR ax,ax
                PUSH ax
                MOV ax,datos
                MOV ds,ax
                XOR dx,dx
                
            ;instrucciones
                
menu2:          MOV dx,offset menu
                CALL escribir
                
                MOV dx,offset op1
                CALL escribir
                
                MOV dx,offset op2
                CALL escribir
                
                MOV dx,offset op3
                CALL escribir 
                
                MOV dx,offset quit
                CALL escribir
                
                MOV dx,offset msj
                CALL escribir
                
                CALL leer
                CALL comparar                                
            
                RET
                
            prac20 ENDP
            
            
            escribir PROC
                
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                               
 
                MOV ah, 09h
                INT 21h
                
                POP ax
                POP bx
                POP cx
                POP dx 
             
                RET    
                
            escribir ENDP
            
            leer PROC
                
                PUSH dx
                PUSH cx
                PUSH bx
                               
 
                MOV ah, 01h
                INT 21h
                
                POP bx
                POP cx
                POP dx 
             
                RET    
                
            leer ENDP
            
            comparar PROC
                
                PUSH cx
                PUSH bx
                PUSH ax
                               
                CMP al, 031h
                JE opcion1 
                
                CMP al, 032h
                JE opcion2
                
                CMP al, 033h
                JE opcion3
                
                CMP al, 034h
                JE opcion4
                
                MOV dx,offset err
                CALL escribir
                JMP menu2
                
opcion1:        MOV dx,offset res1
                CALL escribir
                JMP menu2
                
opcion2:        MOV dx,offset res2
                CALL escribir
                JMP menu2
                
opcion3:        MOV dx,offset res3
                CALL escribir
                JMP menu2
                
opcion4:   
                                 
                POP ax
                POP bx
                POP cx

             
                RET    
                
            comparar ENDP

        codigo ENDS
        END prac20