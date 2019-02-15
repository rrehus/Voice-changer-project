#include p18f87k22.inc

    global  k16, k8, mul18, mul16, prod8x16, prod16x16
Multiplication code

acs0    udata_acs   ; named variables in access ram
k16	res 2	    ; reserve 2 bytes for k16
k8	res 1	    ; reserve 1 byte for k8
mul8	res 1	    ; reserve 1 byte for mul8
mul16	res 2	    ; reserve 2 bytes for mul16
prod8x16    res	3   ; reserve 3 bytes for prod8x16
prod16x16   res	4   ; reserve 4 bytes for prod16x16

acs_ovr	access_ovr
mul1_tmp res 2   ; reserve 2 byte for variable mul1_tmp
mul2_tmp res 3   ; reserve 3 byte for variable mul2_tmp

multiplication8x16
    mulwf   k16+1
    movff   PRODH, mul1_tmp
    movff   PRODL, mul1_tmp+1
    mulwf   k16
    movff   mul1_tmp+1, prod8x16+2
    movf    mul1_tmp, W
    addwfc  PRODL, 1
    movff   PRODL, prod8x16+1
    movlw   0x00
    addwfc  PRODH, 1
    movff   PRODH, prod8x16
    return
    
multiplication16x16
    movf    mul16+1, W
    call    multiplication8x16
    movff   prod8x16, mul2_tmp
    movff   prod8x16+1, mul2_tmp+1
    movff   prod8x16+2, mul2_tmp+2
    movf    mul16, W
    call    multiplication8x16
    movff   mul2_tmp+2, prod16x16+3
    movff   mul2_tmp+1, prod16x16+2
    movf    prod8x16+2, W
    addwfc  prod16x16+2, 1
    movff   mul2_tmp, prod16x16+1
    movf    prod8x16+1, W
    addwfc  prod16x16+1, 1
    movff   prod8x16, prod16x16
    movlw   0x00
    addwfc  prod16x16
    return
 



    END