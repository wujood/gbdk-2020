        .include        "global.s"

        .globl  .copy_vram

        ;; BANKED:      checked
        .area   _BASE

_get_bkg_data::
_get_win_data::
        LDH     A,(.LCDC)
        AND     #LCDCF_BG8000
        JP      NZ,_get_sprite_data

        PUSH    BC

        LDA     HL,7(SP)        ; Skip return address and registers
        LD      A,(HL-)         ; BC = data
        LD      B, A
        LD      A,(HL-)
        LD      C, A
        LD      A,(HL-)         ; E = nb_tiles
        LD      E, A
        LD      L,(HL)          ; L = first_tile
        PUSH    HL

        XOR     A
        OR      E               ; Is nb_tiles == 0?
        JR      NZ,1$
        LD      DE,#0x1000      ; DE = nb_tiles = 256
        JR      2$
1$:
        LD      H,#0x00         ; HL = nb_tiles
        LD      L,E
        ADD     HL,HL           ; HL *= 16
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      D,H             ; DE = nb_tiles
        LD      E,L
2$:
        POP     HL              ; HL = first_tile
        LD      A,L
        RLCA                    ; Sign extend (patterns have signed numbers)
        SBC     A
        LD      H,A
        ADD     HL,HL           ; HL *= 16
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL

        PUSH    BC
        LD      BC,#0x9000
        ADD     HL,BC
        POP     BC

3$:                             ; Special version of '.copy_vram'
        BIT     3,H             ; Bigger than 0x9800
        JR      Z,4$
        BIT     4,H
        JR      Z,4$
        RES     4,H             ; Switch to 0x8800
4$:
        WAIT_STAT

        LD      A,(HL+)
        LD      (BC),A
        INC     BC
        DEC     DE
        LD      A,D
        OR      E
        JR      NZ,3$

        POP     BC
        RET

_get_sprite_data::
        PUSH    BC

        LDA     HL,7(SP)        ; Skip return address and registers
        LD      A,(HL-)         ; BC = data
        LD      B, A
        LD      A,(HL-)
        LD      C, A
        LD      A,(HL-)         ; E = nb_tiles
        LD      E, A
        LD      L,(HL)          ; L = first_tile
        PUSH    HL

        XOR     A
        OR      E               ; Is nb_tiles == 0?
        JR      NZ,1$
        LD      DE,#0x1000      ; DE = nb_tiles = 256
        JR      2$
1$:
        LD      H,#0x00         ; HL = nb_tiles
        LD      L,E
        ADD     HL,HL           ; HL *= 16
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL
        LD      D,H             ; DE = nb_tiles
        LD      E,L
2$:
        POP     HL              ; HL = first_tile
        LD      L,A
        ADD     HL,HL           ; HL *= 16
        ADD     HL,HL
        ADD     HL,HL
        ADD     HL,HL

        PUSH    BC
        LD      BC,#0x8000
        ADD     HL,BC
        LD      B,H
        LD      C,L
        POP     HL

        CALL    .copy_vram

        POP     BC
        RET
