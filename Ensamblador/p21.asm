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
                CALL posicion
                CALL escribir
                CALL renglon
                              
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
            
            renglon PROC
            
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax 
                CMP y, 014h
                JE fin2
                
otra:           INC x
                CALL posicion
                
                CMP char, 0FEh
                JE update                
                INC char
                
                CALL escribir
                JMP comp
                
update:         MOV char, 021h
                CALL escribir
                
comp:           CMP x, 027h
                JE salto
                
                JMP otra
                
salto:          MOV x, 00h
                CALL columna
                       
                
fin2:           POP ax
                POP bx
                POP cx
                POP dx
                
                RET    
                
            renglon ENDP
            
            columna PROC
            
                PUSH dx
                PUSH cx
                PUSH bx
                PUSH ax
                
                CMP y, 013h
                JE fin
                         
                
                INC y
                CALL posicion
                
                CMP char, 0FEh
                JE update2                
                INC char
                
                CALL escribir
                JMP otra
                
update2:        MOV char, 021h
                CALL escribir
                             
                
fin:            POP ax
                POP bx
                POP cx
                POP dx
                
                RET    
                
            columna ENDP
            

        codigo ENDS
        END prac21