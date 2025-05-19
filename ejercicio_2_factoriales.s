    .global _start

_start:
    // PRUEBA X = 4
    mov     r0, #4          
    bl      factorial       
    mov     r4, r1          

    // PRUEBA 2: X = 5
    mov     r0, #5
    bl      factorial
    mov     r5, r1          @ Guardar resultado en r5

    // PRUEBA 3: X = 6
    mov     r0, #6
    bl      factorial
    mov     r6, r1          @ Guardar resultado en r6

    // Fin del programa (puedes poner un bucle infinito si lo corres en bare metal)
    b       .

factorial:
    mov     r1, #1          @ r1 = resultado
    cmp     r0, #0
    beq     end_factorial

factorial_loop:
    mul     r1, r1, r0      @ r1 = r1 * r0
    sub     r0, r0, #1      @ r0--
    cmp     r0, #0
    bgt     factorial_loop

end_factorial:
    bx      lr              @ return
