        ORG 100h
        
        JMP inicio
        
array DW 15,10,50,6,44,67,70,46,130,20,33,16
aux DW 24

inicio: MOV bx, 0
        MOV bp, 0
        SUB aux, 2
        
ciclo:  CMP aux, 0
        JE fin
        CMP bx, aux
        JE inicio
        
        ADD bp, 2
        LEA si, array
        MOV dx, [si+bx]
        MOV cx, [si+bp]
        
        CMP dx, cx
        JG cambio
        
return: ADD bx, 2
        JMP ciclo
        
cambio: MOV ax, dx
        MOV [si+bx], cx
        MOV [si+bp], ax
        JMP return                                

fin:    RET




