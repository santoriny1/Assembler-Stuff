        ORG 100h

        JMP inicio
        
cad1 DB "Hola $"
cad2 DB "Hola $"
apun DW 0
resu DB ?

inicio: MOV si, apun

ciclo:  MOV al, cad1[si]
        CMP cad2[si], al
        JNE fin
        
        CMP cad2[si], "$"
        JZ fin2
        MOV resu[si],1
        INC si
        JMP ciclo           
  

fin:    MOV resu[si], 0
        RET

fin2:   MOV resu[si], 1
        RET


