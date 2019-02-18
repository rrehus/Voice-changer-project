#include p18f87k22.inc
    
    extern ADC_read, DAC_write, ADC_Setup, DAC_Setup, DAC_end_write

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
	call	ADC_Setup
	call	DAC_Setup
	goto    frequency_mix
	

measure_loop
	call	ADC_read   ;analog to digital conversion
	movf	ADRESH, W
	addlw   b'00110000' ;convert the second 8bits (with configuration bits) to analog
	call    DAC_write  ;convert the first 8 bits of the digital data to analog
	movf	ADRESL, W
	call    DAC_write
	call	DAC_end_write
	goto	measure_loop	; loop forever       
frequency_mix
	call ADC_read ;convert analog to digital
        movff ADRESH,k_16+1 ;move the higher bits of the digital data to k_16+1
        movff ADRESL, k_16 ;move the lower bits of the digital data to k_16
        call ADC_read_other ;convert the other analog signal to digital
        movff ADRESH, mul_16+1 ;move the higher bits of the other digital data to mul_16+1
        movff ADRESL, mul_16 ;move the lower bits of the other digital data to mul_16
	call frequency_multiplication
	call DAC_write ;digital to analog conversion
        movf output_tmp, W 
        call DAC_write
        call DAC_end_write
	goto frequency_mix
END