        ORG 100h
        
        JMP inicio

var1 DB 0C8h
var2 DB 028h
resu DB ?

inicio: MOV al, var1
        MOV bl, var2
        
cero:   CMP al, 0
        JE ai0
        
        CMP bl, 0
        JE bi0
        
        JMP ciclo
        
ciclo:  DIV bl
        MOV al, bl
        MOV bl, ah
        MOV ah, 0
        MOV bh, 0 
        JMP cero
        
        
        
ai0:    MOV resu, bl
        JMP fin
        
bi0:    MOV resu, al
        JMP fin            

fin:    RET