#include p18f87k22.inc
    
    global  division16x16
    global  dividh, dividl, divish, divisl, quoth, quotl
    
acs_div	udata_acs		; Define Variables in user access
	
dividh	    res 1		; reserve 1 byte for dividh
dividl	    res 1		; reserve 1 byte for dividl
dividh_save res 1		; reserve 1 byte for dividh_save
dividl_save res 1		; reserve 1 byte for dividl_save
divish	    res 1		; reserve 1 byte for divish
divisl	    res 1		; reserve 1 byte for divisl
quoth	    res 1		; reserve 1 byte for quoth
quotl	    res 1		; reserve 1 byte for quotl
count	    res 1		; reserve 1 byte for count
	
	
	
Division    CODE
    
division16x16			; Adapted from www.8052mcu.com/div16
    clrf    count		; Set counter to 0x00
    clrf    quoth		; Set quoth to 0x00
    clrf    quotl		; Set quotl to 0x00
    bcf	    STATUS, C		; Clear carry bit
division1
    incf    count		; increment count for each left shift
    rlcf    divisl, 1		; rotate low divisor byte through carry
    rlcf    divish, 1		; rotate high divisor byte through carry
    bnc	    division1		; branch to division1 if carry not set
division2
    rrcf    divish, 1		; rotate high byte of divisor through carry
    rrcf    divisl, 1		; rotate low byte of divisor through carry
    bsf	    STATUS, C		; Clear carry bit
    movff   dividh, dividh_save	; make safe copy of dividh
    movff   dividl, dividl_save	; make safe copy of dividl
    movf    divisl, W		; move divisl to W for subtraction
    subwfb  dividl, 1		; Subtraction with borrow dividl - divisl, save back in dividl
    movf    divish, W		; move divish to W for subtraction
    subwfb  dividh, 1		; Subtraction with borrow dividh - divish, save back in dividh
    bc	    division3		; if carry bit is set branch to division3
    movff   dividh_save, dividh	; undo subtraction
    movff   dividl_save, dividl	; undo subtraction
division3
    rlcf    quotl, 1		; rotate quotl left through carry
    rlcf    quoth, 1		; rotate quoth left through carry
    decfsz  count, 1		; decrement count until 0
    bra	    division2		; loop until count = 0
    return
    
    END


