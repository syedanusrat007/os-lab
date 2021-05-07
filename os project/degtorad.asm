BITS 16

start:
	mov ax, 07C0h		; Set up 4K stack space after this bootloader
	add ax, 288		; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h		; Set data segment to where we're loaded
	mov ds, ax


	mov si, text_string	; Put string position into SI
	call print_string	; Call our string-printing routine

	mov si, deg_string	; Put string position into SI
	call print_string	; Call our string-printing routine
intput_1:

	CALL INPUT 

      
    
     mov bx,22 
     mov ax,cx 
     mul bx
     mov cx,ax
     
     mov bx,1260
     mov ax,cx
     div bx
     mov bl,al
     mov cl,al
     
     
     mov si, rad_string	; Put string position into SI
	call print_string  
     
     MOV Al,Bl
     mov ah,00h;
     CALL OUTDEC ;
     
     
     
     
    mov dl,'.'   
    mov ah,0eh
	int 10h     
     
     
     mov bx,1260;
     mov al,cl
     mul bx
     mov cx,ax
     
     mov bx,22;
     mov ax,cx
     div bx
     mov bl,al
   
    
     
     mov al,bl
     CALL OUTDEC1 ;
      

INPUT:
    
    XOR CX,CX 
    mov bx,cx
   mov ah,00h		
	int 16h  
    
 WHILE:
    MOV AH,0
    SUB AX,48
    PUSH AX
    MOV AX,10
    MUL BX
    POP BX
    
    ADD BX,AX
    mov cx,bx
    
    mov ah,00h;		
    int 16h
    CMP AL,0DH
    JNE WHILE
             
.done:
	ret        
   
OUTDEC:      
    XOR Cx,Cx
    MOV Bx,10
    
              
    .REPEAT:
    CWD
    DIV Bx
    PUSH Dx
    INC Cx
    CMP Ax,0
    JNE .REPEAT          
        
    .PRINT:
    POP Dx
    ADD DL,48
    mov ah,0eh
    int 10h
    LOOP .PRINT
 .done:
	ret        
   
 
OUTDEC1:      
    XOR Cx,Cx
    MOV Bx,10
    
              
    .REPEAT1:
    CWD
    DIV Bx
    PUSH Dx
    INC Cx
    CMP Ax,0
    JNE .REPEAT1          
        
    .PRINT1:
    POP Dx
    ADD DL,48
    mov ah,0eh
	int 10h
    LOOP .PRINT1
   .done:
	ret        
   
	text_string db 'WELCOME TO OUR CONVERTER',0DH,0AH, 0
	deg_string db 'ENTER ANGLE IN DEGREE!',0DH,0AH, 0
	rad_string db 'RADIAN VALUE OF NUMBER: ', 0DH, 0AH, 0

	
	
print_string:			; Routine: output string in SI to screen
	mov ah, 0Eh		; int 10h 'print char' function

.repeat:
	lodsb			; Get character from string
	cmp al, 0
	je .done		; If char is zero, end of string
	int 10h			; Otherwise, print it
	jmp .repeat

.done:
	ret




	times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
	dw 0xAA55		; The standard PC boot signature
