; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

Frequency_shift_ CODE  ; let linker place main program

acs_ovr	access_ovr
output_tmp res 2   ; reserve 2 byte for variable mul1_tmp
output2_tmp res 2   ; reserve 3 byte for variable mul2_tmp

frequency_multiplication
 call ADC_read
 movff ADRESH,k_16+1
 movff ADRESL, k_16
 call ADC_read_other
 movff ADRESH, mul_16+1
 movff ADRESL, mul_16
 call multiplication16x16
 movff prod
 

    END