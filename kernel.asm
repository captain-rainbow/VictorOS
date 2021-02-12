; Made by Victor Mout
mainloop:
	jmp readchar


printchar:
	mov ah, 0x0e ; Enter teletype mode
	int 0x10
        jmp mainloop
	
readchar:
	mov ah, 01h ; Test key
	int 16h

 	mov ah, 00h ; Get key
	int 16h

	jmp printchar

jmp mainloop 

times 510-($-$$) db 0 ; Repeat db 0 512 times
db 0x55, 0xaa ; End boot sector 0xaa


