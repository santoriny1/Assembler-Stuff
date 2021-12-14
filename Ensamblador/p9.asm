        ORG 100h
        
        JMP inicio 
        
oper1   DW  0ffffh
oper2   DW  00011h
resulh  DW  ?
resull  DW  ?

inicio: MOV bx, oper1
        MOV cx, oper2
        MOV ax, 0
        MOV dx, 0
        JMP condi
        
ciclo:  ADD ax, oper1
        MOV resull, ax 
        DEC cx
        JC max
        JMP condi
        
max:    ADD dx, 1
        MOV resulh, dx
        CLC  
        
condi:  CMP cx, 1
        JNL ciclo                 
                

        RET

        

