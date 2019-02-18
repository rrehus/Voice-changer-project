#include p18f87k22.inc
global frequency_multiplication, output_tmp
Frequency_shift_ CODE  ; let linker place main program

acs_ovr	access_ovr
output_tmp res 1   ; reserve 1 byte for variable output_tmp

frequency_multiplication
  call multiplication16x16 ;multiply the two signals together
  swapf prod16x16+2, 0  ;swap the bits of the lower product
  andlw b'00001111' ;only the last 4 digits are significant
  movwf output_tmp
  swapf prod16x16+1, 0 ;swap the bits of the higher product
  andlw b'11110000' ;only the first 4 digits are significant
  addwf output_tmp, 1 
  swapf prod16x16+1, 0 ;swap the bits of the product
  andlw b'00001111' ;only the last 4 digits are significant
  addlw b'00110000' ;add the configuration bits
    END