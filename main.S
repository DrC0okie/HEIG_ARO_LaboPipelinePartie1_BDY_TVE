@ @ programme 1
@ mov r0,#0x3E
@ mov r1,#3
@ mov r2,#0xCB
@ mov r3,#6
@ nop
@ @ Partie à analyser
@ add r4,r0,#2
@ strh r2,[r0,#4*2]
@ ldrh r1,[r0,#4*2]
@ b fin
@ nop
@ nop
@ nop
@ nop
@ nop
@ .org 0x40
@ fin:
@ and r1,r3
@ nop
@ nop
@ nop
@ nop
@ nop
@ @ fin de l’analyse

@ MAIN_START:         @Dép RAW
@ MOV r0, #1          @
@ MOV r1, #2          @
@ MOV r2, #6          @
@ nop
@ nop
@ STRH r0, [r1, #4]   @ r1
@ ADD r4, r2, #1      @ r2
@ ADD r3, r2, #4      @ r2
@ SUB r4, r1, r0      @ r1, r0
@ ADD r0, r0, #5      @ r0
@ LSL r2, r2, #1      @ r2
@ nop
@ nop
@ nop
@ LSL r2, r2, #1      @ r2
@ B PART_2            @

@ .org 0x40           @
@ PART_2:             @
@ MOV r0, #3          @
@ MOV r1, #4          @
@ MOV r2, #8          @
@ b SAUTZERO          @
@ ADD r0, r1, r2      @ r1, r2

@ .org 0x60           @
@ SAUTZERO:	        @
@ MOV r0, #255	    @
@ BNE SAUTC           @
@ MOV r1, #5          @

@ .org 0x80           @
@ SAUTC:              @
@ MOV r0, #0          @
@ BNE NOT_TAKEN       @
@ MOV r1, #0          @
@ BEQ MAIN_START      @

@ .org 0xA0           @
@ NOT_TAKEN:          @
@ B MAIN_START        @
@ MOV r4, #6          @


@ Programme de test des aléa de controle
mov r0, #5
mov r1, #6
mov r2, #7
b test_1

.org 0x40
test_1:
mov r0, #8
mov r1, #9
mov r2, r1
b test_2:

.org 0x50
test_2:
mov r0, #9
mov r1, #10
mov r2, r1
