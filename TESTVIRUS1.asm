.MODEL SMALL
.STACK 100H
.DATA
FILE DB "*.*", 0
DTA DB 128H DUP(?)   
FILENAME DB 50 DUP(?)

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
    JC QUIT
    
OUTER_LOOP:
    
    LEA SI,DTA+1EH
    CLD  
    LEA DI,FILENAME
    
    MOV CX,5
    INNER_LOOP:
        LODSB
        STOSB
    LOOP INNER_LOOP
    
    ;DELETE
    LEA DX,DTA+1EH
    MOV AH,41H
    INT 21H
    
    MOV DX,OFFSET FILE 
    MOV CX,0
    MOV AH,4FH
    INT 21H
    JC QUIT
    
    JMP OUTER_LOOP
        
    
QUIT:
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
    END MAIN
    
        