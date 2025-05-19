.text
.global _start

_start:
    ldr r0, =array     // R0 = dirección base del array
    mov r1, #10        // R1 = tamaño del array
    mov r2, #5         // R2 = constante y
    mov r3, #0         // R3 = índice i

loop:
    cmp r3, r1
    beq end_program

    ldr r5, [r0, r3, LSL #2]   

    cmp r5, r2
    bge greater_equal

less:
    add r5, r5, r2             
    b   store_value

greater_equal:
    mul r5, r5, r2             

store_value:
    str r5, [r0, r3, LSL #2]   
    add r3, r3, #1
    b loop

end_program:
    // Cargar los 10 valores del array en R4–R13
    ldr r0, =array
    ldr r4,  [r0, #0]
    ldr r5,  [r0, #4]
    ldr r6,  [r0, #8]
    ldr r7,  [r0, #12]
    ldr r8,  [r0, #16]
    ldr r9,  [r0, #20]
    ldr r10, [r0, #24]
    ldr r11, [r0, #28]
    ldr r12, [r0, #32]
    ldr r13, [r0, #36]

    b . // loop infinito para que puedas revisar los registros

.data
array: .word 1, 3, 4, 2, 8, 6, 5, 7, 9, 0
