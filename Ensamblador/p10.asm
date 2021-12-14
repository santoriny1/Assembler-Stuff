        ORG 100h

        MOV cx, 00000h
        MOV ax, 00000h
        MOV bx, 00000h
        
ciclo:  MOV ax, cx
        ADD ax, 010h
        MOV [bx],ax
        ADD bx, 00002h         
        INC cx
        CMP cx, 00014h
        
        JZ fin
        
        JMP ciclo
        
fin:    RET




