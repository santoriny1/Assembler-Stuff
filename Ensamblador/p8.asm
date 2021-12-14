        ORG 100h 
    num EQU 15 ;numero primo

  primo DB 0
  resi  DB 0

inicio: MOV cx, num
aqui:   MOV ax, num
        MOV bx, cx
        MOV dx, 0
        DIV bx   
        OR dx, 0
        JZ prmo
        LOOP aqui
        JMP fin
prmo:   INC resi
        LOOP aqui

fin:  RET




