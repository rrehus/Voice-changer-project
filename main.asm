#include p18f87k22.inc
    
    extern  DAC_write, DAC_Setup, DAC_end_write
    extern  ADC_Setup, ADC_read_A0, ADC_read_A5
    extern  k16, k8, mul16, prod8x16, prod16x16
    extern  mixed_l, mixed_h , frequency_mix
    extern  Volume_Setup, VolumeDo
    extern  LCD_Setup
    extern  division16x16, dividh, dividl, divish, divisl, quoth, quotl

    extern  a, c, s
    extern  random_numbers, random_init
    extern  UART_Setup, UART_Transmit_Byte, UART_Receive_Byte
    extern  noise
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program

START
	call	ADC_Setup	    ; run the analog to digital conversion setup
	call	DAC_Setup           ; run the digital to analog conversion setup
	call    random_init         ; run the setup for generation of random numbers
	call	UART_Setup          ; run the setup for the UART data transmission and receiving
	call	LCD_Setup	    ; run LCD Setup
	call	Volume_Setup	    ; run Volume Setup
	
main_loop
	call    VolumeDo            ; reads and sets volume
	;call	ADC_read_A0
	;movff	ADRESH, mixed_h
	;movff	ADRESL,	mixed_l
	call    frequency_mix       ; changes the frequency of the signal
	;movff	mixed_h, s
	;movff	mixed_l, s+1
	call    noise_loop          ; combines the signal with the noise
	call    output_loop         ; output the modified signal via DAC and UART
	goto    main_loop

noise_loop
	call random_numbers	    ; call random number generator
	movff mixed_h, s	    ; move upper byte of digital data into upper byte of s
	movf mixed_l, W		    ; move lower byte of digital data into W register
	addwf s+1, 1		    ; combine the digital data with noise
	return
	
gaussian_noise_loop
	call	UART_Receive_Byte   ; receive the noise byte from python via UART
	movf	noise, W	    ; move noise to W
	addwf	mixed_l, 0	    ; add noise to lower byte of signal
	movwf	s+1		    ; move lower byte into s+1
	movff	mixed_h, s	    ; move upper byte of digital data into W register
	return
	
output_loop
	;call	UART_Transmit	    ; Tranmit signal to UART
	movf	s, W		    ; output the higher byte with the configuration bits added
	addlw	b'00110000'
	call	DAC_write
	movf	s+1, W		    ; output the lower byte
	call	DAC_write
	call	DAC_end_write
	return
	
UART_Transmit
	movf   s, W
	call   UART_Transmit_Byte   ; transmit the byte via UART 
	movf   s+1, W
	call   UART_Transmit_Byte   ; transmit the other byte via UART
	return
	
	;#######################################################
measure_loop ; used for testing purposes
	call	ADC_read_A0	    ; analog to digital conversion
	movf	ADRESH, W
	addlw   b'00110000'	    ; convert the second 8bits (with configuration bits) to analog
	call    DAC_write	    ; convert the first 8 bits of the digital data to analog
	movf	ADRESL, W
	call    DAC_write
	call	DAC_end_write
	goto	measure_loop	    ; loop forever  
	
	END
