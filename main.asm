#include p18f87k22.inc
    
    extern ADC_read, DAC_write

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START

measure_loop
	call	ADC_read   ;analog to digital conversion
	movff   ADRESL, W  
	call    DAC_write  ;convert the first 8 bits of the digital data to analog
	movff   ADRESH, W
	addlw   b'00110000' ;convert the second 8bits (with configuration bits) to analog
	call    DAC_write
	goto	measure_loop	; loop forever
                       

    END