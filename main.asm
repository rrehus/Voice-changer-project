#include p18f87k22.inc
    
    extern  DAC_write, DAC_Setup, DAC_end_write
    extern  ADC_Setup, ADC_read_A0, ADC_read_A5
    extern  k16, k8, mul16, prod8x16, prod16x16
    extern  frequency_multiplication, output_tmp
    extern  Volume_Setup, VolumeDo
    extern  LCD_Setup
    extern  division16x16, dividh, dividl, divish, divisl, quoth, quotl

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program

START
	call	ADC_Setup	    ; run ADC Setup
	call	DAC_Setup	    ; run DAC Setup
	call	LCD_Setup	    ; run LCD Setup
	call	Volume_Setup	    ; run Volume Setup
	goto    LCD_loop
	

measure_loop
	call	ADC_read_A0	    ;analog to digital conversion
	movf	ADRESH, W
	addlw   b'00110000'	    ;convert the second 8bits (with configuration bits) to analog
	call    DAC_write	    ;convert the first 8 bits of the digital data to analog
	movf	ADRESL, W
	call    DAC_write
	call	DAC_end_write
	goto	measure_loop	    ; loop forever       
frequency_mix
	call	ADC_read_A0	    ;convert analog to digital
        movff	ADRESL,k16+1	    ;move the lower bits of the digital data to k_16+1
        movff	ADRESH, k16	    ;move the higher bits of the digital data to k_16
        call	ADC_read_A5	    ;convert the other analog signal to digital
        movff	ADRESL, mul16+1	    ;move the lower bits of the other digital data to mul_16+1
        movff	ADRESH, mul16	    ;move the higher bits of the other digital data to mul_16
	call	frequency_multiplication    ; mix signals
	call	DAC_write	    ;digital to analog conversion
        movf	output_tmp, W 
        call	DAC_write
        call	DAC_end_write
	goto	frequency_mix
	
	
LCD_loop
	call	VolumeDo
	goto	LCD_loop
	
division_loop
	movlw	0x13
	movwf	dividh
	movlw	0x88
	movwf	dividl
	clrf	divish
	movlw	0x7F
	movwf	divisl
	call	division16x16
	goto	division_loop
	
    
	END