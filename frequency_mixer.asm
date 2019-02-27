#include p18f87k22.inc
    global	mixed_l, mixed_h , frequency_mix
    extern	multiplication16x16, prod16x16

acs1	udata_acs
output_tmp res 1   ; reserve 1 byte for variable output_tmp
mixed_h      res 1
mixed_l      res 1
Frequency_shift_ CODE
 
frequency_multiplication
    call multiplication16x16 ;multiply the two signals together
    swapf prod16x16+2, 0  ;swap the nibbles of the lower product
    andlw b'00001111' ;only the last 4 digits are significant
    movwf output_tmp
    swapf prod16x16+1, 0 ;swap the bits of the higher product
    andlw b'11110000' ;only the first 4 digits are significant
    addwf output_tmp, 1 
    swapf prod16x16+1, 0 ;swap the bits of the product
    andlw b'00001111' ;only the last 4 digits are significant
    return
    
frequency_mix
	call	ADC_read_A0	    ;convert analog to digital
        movff	ADRESL,k16+1	    ;move the lower bits of the digital data to k_16+1
        movff	ADRESH, k16	    ;move the higher bits of the digital data to k_16
        call	ADC_read_A5	    ;convert the other analog signal to digital
        movff	ADRESL, mul16+1	    ;move the lower bits of the other digital data to mul_16+1
        movff	ADRESH, mul16	    ;move the higher bits of the other digital data to mul_16
	call	frequency_multiplication    ; mix signals
	movwf	mixed_h             ;move the high mixed byte
        movff	output_tmp, mixed_l ;move low mixed byte
        return
    
    END