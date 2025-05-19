.text
.global _start

_start:
loop:
    LDR r0, =0x1000       
    LDR r1, [r0]          

    LDR r2, =0xE048       // Flecha arriba
    CMP r1, r2
    BEQ key_up

    LDR r2, =0xE050       // Flecha abajo
    CMP r1, r2
    BEQ key_down

    B loop                // Si no es ninguna, sigue leyendo

key_up:
    LDR r3, =0x2000       
    LDR r4, [r3]          
    ADD r4, r4, #1        
    STR r4, [r3]          
    B loop

key_down:
    LDR r3, =0x2000       
    LDR r4, [r3]          
    SUB r4, r4, #1        
    STR r4, [r3]          
    B loop

	
	