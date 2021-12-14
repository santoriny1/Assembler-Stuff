;Segmento de constantes

       
;Segmento de datos
        datos SEGMENT  
            
            x DB 00h
            y DB 00h
            char DB 021h      
            
        datos ENDS    

                       
                    
;Segmento de pila
        pila SEGMENT stack  
            
            DB 128 DUP(0)
            
        pila ENDS    


;Segmento de codigo
        codigo SEGMENT
            
            prac21 PROC FAR
                
            assume cs:codigo, ds:datos, ss:pila

                
                PUSH ds
                XOR ax,ax
                PUSH ax
                MOV ax,datos
                MOV ds,ax
                XOR dx,dx
                
            ;instrucciones
aumx:           CALL posicion
                CALL escribir
                
                INC x
                INC char
                CMP x,028h
                JE decx
                JMP aumx
                
decx:           DEC x
                
aumy:           INC y
                INC char
                
                CALL posicion
                CALL escribir
                
                CMP y, 013h
                JE disx
                JMP aumy
               
                
disx:           DEC x
                INC char
                
                CALL posicion
                CALL escribir
                
                CMP x, 00h
                JE disy
                JMP disx

disy:           DEC y
                INC char
                
                CALL posicion
                CALL escribir
                
                CMP y, 01h
                JA disy                       
                
                              
                RET
                
            prac21 ENDP
            
            
            escribir PROC
                
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                               
                MOV dl, char
                MOV ah, 02h
                INT 21h
                
                POP ax
                POP bx
                POP cx
                POP dx 
             
                RET    
                
            escribir ENDP
            
            posicion PROC
            
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                
                MOV dh, y
                MOV dl, x
                MOV ah, 2
                INT 10h
                
                POP ax
                POP bx
                POP cx
                POP dx
                
                RET    
                
            posicion ENDP

        codigo ENDS
        END prac21