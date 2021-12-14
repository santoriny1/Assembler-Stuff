        ORG 100h
;;Mostrar un caracter con INT 10h
	    MOV al, 'a'
	    MOV bh, 00h
	    MOV bl, 0000010
	    MOV cx, 1
        MOV ah, 09
        INT 10h
        
;Mostrar un caracter con INT 10h que no sea en la posicion inicial        
        MOV dh, 5 ;row
    	MOV dl, 15 ;column
    	MOV bh, 0
    	MOV ah, 2
    	INT 10h
        
        MOV al, 'b'
        MOV bh, 00h
        MOV cx, 1
        MOV ah, 09h
        INT 10h

;Mostrar un caracter con INT 21h
        MOV dh, 00 ;row
    	MOV dl, 00 ;column
    	MOV bh, 0
	    MOV bl, 0000100
        MOV ah, 2
        INT 10h

        MOV ah, 2
        MOV dl, 'c'
        INT 21h 

;Mostrar un caracter con INT 21h que no sea en la posicion inicial        
        MOV dh, 20 ;row
    	MOV dl, 25 ;column
    	MOV bh, 0
        MOV ah, 2
        INT 10h

        MOV ah, 2
        MOV dl, 'd'
        INT 21h
  
;==================================================================        

;Mostrar una cadena con INT 10h                 
        MOV al, 1
    	MOV bh, 0
    	MOV bl, 0011_1011b
    	MOV cx, msg1end - offset msg1 
    	MOV dl, 0 ;column
    	MOV dh, 0 ;row
    	PUSH cs
    	POP es
    	MOV bp, offset msg1
	    MOV ah, 13h
	    INT 10h
	    JMP msg1end
	    msg1 DB " hola, mundo! "
	    msg1end:  
	    
;Mostrar una cadena con INT 10h que no sea en la posicion inicial                
        MOV al, 1
    	MOV bh, 0
    	MOV bl, 0011_1011b
    	MOV cx, msg2end - offset msg2 
    	MOV dl, 18 ;column
    	MOV dh, 9 ;row
    	PUSH cs
    	POP es
    	MOV bp, offset msg2
	    MOV ah, 13h
	    INT 10h
	    JMP msg2end
	    msg2 DB " hola, mundo! "
	    msg2end:
	    
;Mostrar una cadena con INT 21h
        MOV dh, 00 ;row
    	MOV dl, 00 ;column
    	MOV bh, 0
	    MOV bl, 0000100
        MOV ah, 2
        INT 10h
        
		MOV dx, offset msg3
		MOV ah, 9
		INT 21h
		msg3 DB "hola mundo! $" 
		
;Mostrar una cadena con INT 21h que no sea en la posicion inicial        		
		MOV dh, 20 ;row
    	MOV dl, 10 ;column
    	MOV bh, 0
        MOV ah, 2
        INT 10h	
        
        MOV dx, offset msg4
		MOV ah, 9
		INT 21h
		msg4 DB "hola mundo! $"     
	    
        RET




