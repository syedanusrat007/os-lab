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

	mov si, in_string	; Put string position into SI
	call print_string	; Call our string-printing routine
intput_1:
	mov ah,00h		
	int 16h 	;it takes input from the keystroke and                  store it in al when ah=00h	

	mov cl,al 

	mov dl,cl

	mov ah,0eh
	int 10h

	mov ah,00h		
	int 16h 

	mov al,0Ah
	mov ah,0eh
	int 10h 

	mov al,0dh
	mov ah,0eh
	int 10h
	
	
	

input_2:
	mov ah,00h		
	int 16h 	;it takes input from the keystroke and                  store it in al when ah=00h	

	mov bl,al
	mov dl,bl
	
	mov ah,0eh
	int 10h

	mov ah,00h		
	int 16h
	
	mov al,0Ah
	mov ah,0eh
	int 10h 

	mov al,0dh
	mov ah,0eh
	int 10h
;-------------------
add:	mov al, cl
	add al,bl
	mov bl, al
;------------------------
	mov si, add_string	; Put string position into SI
	call print_string	; Call our string-printing routine
	
	
	
	mov al, bl
	sub al, 48
	
	mov ah,0eh
	int 10h
	

				
intput_3:
	mov ah,00h		
	int 16h 	;it takes input from the keystroke and                  store it in al when ah=00h	

	mov cl,al 

	mov dl,cl

	mov ah,0eh
	int 10h

	mov ah,00h		
	int 16h 

	mov al,0Ah
	mov ah,0eh
	int 10h 

	mov al,0dh
	mov ah,0eh
	int 10h
	
	
	

input_4:
	mov ah,00h		
	int 16h 	;it takes input from the keystroke and                  store it in al when ah=00h	

	mov bl,al
	mov dl,bl
	
	mov ah,0eh
	int 10h

	mov ah,00h		
	int 16h
	
	mov al,0Ah
	mov ah,0eh
	int 10h 

	mov al,0dh
	mov ah,0eh
	int 10h
;-------------------
sub:	mov al, cl
	sub al,bl
	mov bl, al
;------------------------
	mov si, add_string	; Put string position into SI
	call print_string	; Call our string-printing routine
	
	
	
	mov al, bl
	
	
	mov ah,0eh
	int 10h
	

				


	text_string db 'WELCOME TO OUR CALCULATOR',0DH,0AH, 0
	in_string db 'enter two numbers for Calculation!',0DH,0AH, 0
	add_string db 'summation of given numbers: ', 0DH, 0AH, 0
	sub_string db 0dh, 0ah, 'difference of given numbers: ', 0DH, 0AH, 0
	
	
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
