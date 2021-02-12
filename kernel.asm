; Made by Victor Mout

teststring 		db 'bruh', 0x00
mainloop:
	jmp printstring

printchar:
	mov ah, 0x0e ; Enter teletype mode
        int 0x10 
	jmp mainloop

printstring:
	mov si, teststring
	mov ah, 0x0e
	
	lodsb
	
	int 0x10
	jmp printstring

readchar:
	mov ah, 01h ; Test key
	int 16h

 	mov ah, 00h ; Get key
	int 16h

	jmp printchar
	        
return:
	jmp mainloop 


times 510-($-$$) db 0 ; Repeat db 0 512 times
db 0x55, 0xaa ; End boot sector 0xaa



