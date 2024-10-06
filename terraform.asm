.ORIG x3000
GETP 
 ; GET POSITION OF PLAYER X-R0, Y-R1, Z-R2
add r4, r1, #0   ; store y in r4

add r0, r0, #-1  ;dec x
add r2, r2, #-1  ;dec z
add r5, r5, #3

 
outer_loop
add r7, r7, #3

inner_loop
geth
add r1, r1, #1
not r1, r1
add r1, r1, #1
add r6, r4, r1
BRn break_down
BRz done
BRp build_up

break_down
not r1, r1
add r1, r1, #1
add r1, r1, #-1
loopp
ld r3, AIR_BLOCK
setb
add r1, r1, #-1
add r6, r6, #1
BRn loopp

build_up
not r1, r1
add r1, r1, #1
loop 
ld r3, COBBLESTONE_BLOCK
setb
add r1, r1, #1
add r6, r6, #-1
BRp loop

done
add r2, r2, #1
add r7, r7, #-1

BRz done1
BRp inner_loop

done1
add r2, r2, #-3
add r0, r0, #1
add r5, r5, #-1
 
BRz final
BRp outer_loop

final

HALT

COBBLESTONE_BLOCK .FILL #4
AIR_BLOCK .FILL #0

.END