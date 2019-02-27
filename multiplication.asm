#include p18f87k22.inc

    global  k16, k8, mul16, prod8x16, prod16x16
    global  multiplication16x16, multiplication8x16

acs0	    udata_acs		    ; named variables in access ram
k16	    res 2		    ; reserve 2 bytes for k16
k8	    res 1		    ; reserve 1 byte for k8
mul16	    res 2		    ; reserve 2 bytes for mul16
prod8x16    res	3		    ; reserve 3 bytes for prod8x16
prod16x16   res	4		    ; reserve 4 bytes for prod16x16
bit	    res 1		    ; reserve 1 byte for bit

acs_ovr	access_ovr
mul1_tmp    res 2		    ; reserve 2 byte for variable mul1_tmp
mul2_tmp    res 3		    ; reserve 3 byte for variable mul2_tmp

Multiplication code
 
multiplication8x16
    mulwf   k16+1		    ; multiply lower byte with 8-bit number
    movff   PRODH, mul1_tmp	    ; move upper byte of lower byte multiplication to temporary storage
    movff   PRODL, mul1_tmp+1	    ; move lower byte of lower byte multiplication to temporary storage
    mulwf   k16			    ; multiply upper byte with 8-bit number
    movff   mul1_tmp+1, prod8x16+2  ; move lower byte of lower byte multiplication to lowest result byte
    movf    mul1_tmp, W		    ; move upper byte of lower byte multiplication to W for adding
    addwfc  PRODL, 1		    ; add upper byte of lower byte multiplication to lower byte of upper byte multiplication with carry
    movff   PRODL, prod8x16+1	    ; move previous result to middle byte of result
    movlw   0x00		    ; move 0x0 to W for adding
    addwfc  PRODH, 1		    ; add upper byte of upper byte multiplication to 0x0 with carry
    movff   PRODH, prod8x16	    ; move previous result to upper byte of result
    return
    
multiplication16x16
    movf    mul16+1, W		    ; move lower byte of factor to W for multiplication
    call    multiplication8x16	    ; multiply lower byte of factor to other factor in k16 and k16+1
    movff   prod8x16, mul2_tmp	    ; move highest byte of multiplication to temporary storage
    movff   prod8x16+1, mul2_tmp+1  ; move middle byte of multiplication to temporary storage
    movff   prod8x16+2, mul2_tmp+2  ; move lowest byte of multiplication to temporary storage
    movf    mul16, W		    ; move high byte of factor to W for multiplication
    call    multiplication8x16	    ; multiply high byte of factor to other factor in k16 and k16+1
    movff   mul2_tmp+2, prod16x16+3 ; move lowest byte of 1st multiplication to lowest byte of result
    movff   mul2_tmp+1, prod16x16+2 ; move middle byte of 1st multiplication to middle low byte of result for adding
    movf    prod8x16+2, W	    ; move lowest byte of 2nd multiplication to W for adding
    addwfc  prod16x16+2, 1	    ; add middle byte of 1st multiplication to lowest byte of 2nd multiplication with carry and save in middle low byte of result
    movff   mul2_tmp, prod16x16+1   ; move high byte of 1st multiplication to middle high byte of result for adding
    movf    prod8x16+1, W	    ; move middle byte of 2nd multiplication to W for adding
    addwfc  prod16x16+1, 1	    ; add high byte of 1st multiplication to middle byte in 2nd multiplication with carry and save in middle high byte of result
    movff   prod8x16, prod16x16	    ; move high byte of 2nd multiplication to highest byte of result for adding
    movlw   0x00		    ; move 0x0 to W for adding
    addwfc  prod16x16		    ; add 0x0 to high byte of 2nd multiplication with carry and save as highest byte of result
    return
 



    END