.text
li s11, LED_MATRIX_0_BASE
li s10, LED_MATRIX_0_WIDTH
li s9, LED_MATRIX_0_HEIGHT
li s8, 0x000000
li s7, 1
li s6, 3
div s5, s10, s6
add s4, s5, s5
add s3, s4, s5

mul s2, s10, s9
addi s2, s2, 1

mv a0, s11
addi a0, a0, -4

draw:
    sw s8, 0(a0)
    addi a0, a0, 4
    addi s2, s2, -1
    beq s2, x0, end
    beq s7, s10, reset
    ble s7, s5, col1
    ble s7, s4, col2
    ble s7, s3, col3
    j void
     
col1:
    li s8, 0x0000FF
    addi s7, s7, 1
    j draw

col2:
    li s8, 0xFFFFFF
    addi s7, s7, 1
    j draw

col3:
    li s8, 0xFF0000
    addi s7, s7, 1
    j draw

void:
    li s8, 0x000000
    addi s7, s7, 1
    j draw

reset:
    li s7, 1
    j draw
end:
    nop