        ORG 100h

        ;Asignacion de valores a memoria modularmente
        MOV [0000h], 00001h
        MOV [0002h], 00002h
        MOV [0004h], 00003h
        MOV [0006h], 00004h
        MOV [0008h], 00005h
        MOV [000Ah], 00006h
        MOV [000Ch], 00007h
        MOV [000Eh], 00008h
        MOV [0010h], 00009h
        MOV [0012h], 0000Ah
        
        ;Asignacion de valores a memoria con LOOP
        MOV cx, 0000Ah
        MOV bx, 00000h
ciclo:  MOV [bx], cx
        ADD bx, 00002h 
        LOOP ciclo

        RET




