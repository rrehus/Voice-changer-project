; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

Frequency_shift_ CODE  ; let linker place main program

acs_ovr	access_ovr
output_tmp res 1   ; reserve 1 byte for variable output_tmp

frequency_multiplication
 call ADC_read ;convert analog to digital
 movff ADRESH,k_16+1 ;move the higher bits of the digital data to k_16+1
 movff ADRESL, k_16 ;move the lower bits of the digital data to k_16
 call ADC_read_other ;convert the other analog signal to digital
 movff ADRESH, mul_16+1 ;move the higher bits of the other digital data to mul_16+1
 movff ADRESL, mul_16 ;move the lower bits of the other digital data to mul_16
 call multiplication16x16 ;multiply the two signals together
 swapf prod16x16+2, 0  ;swap the bits of the lower product
 andlw b'00001111' 
 movwf output_tmp
 swapf prod16x16+1, 0
 andlw b'11110000'
 andwf output_tmp, 1
 movf prod16x16+1
 movf prod16x16, W
 andlw b'00001111'
 addlw b'00110000'
 call DAC_write
 movf output_tmp, W
 call DAC_write
 call DAC_end_write
    END