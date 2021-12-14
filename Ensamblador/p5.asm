ORG 100h

        MOV al, [00h]
        MOV ah, [01h]
        CMP al, ah
;SI al momento de comparar "al" es mayor que "ah", se hace un salto a "mayor"        
        JA mayor
;SI al momento de comparar "al" es menor que "ah", se hace un salto a "menor"        
        JB menor
;SI al momento de comparar "al" es igual que "ah", se hace un salto a "igual"        
        JE igual
mayor:  MOV bl, [00h]
fin1:   RET

menor:  MOV bl, [01h]
fin2:   RET

igual:  MOV bl, [00h]
        SUB bl, al
        ;SI la bandera ZF = 1, se hace el salto a "zf"    
        JZ zf
        ADD al, ah
        ;SI la bandera CF = 1, se hace el salto a "cf"
        JC cf                            
fin3:   RET

zf:     MOV bl, [00h]
fin4:   RET

cf:     MOV bl, [00h]
fin5:   RET