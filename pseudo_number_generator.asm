#include p18f87k22.inc
    extern multiplication16x16, multiplication8x16
    global a, c, m, s, random_numbers
acs udata_acs
 a res 2 ;reserve two bytes of data for multiplier
 c res 2 ;reserve two bytes of data for increment
acs_ovr access_ovr
 s res 2 ;reserve two bytes of data for seed

  movlw 0x5 ;set the initial value of the seed
  movwf s+1
  movlw b'10100001' ;set the initial value of the multiplier
  movwf a+1
  movlw b'00000010'
  movwf a
  movlw b'11100111' ;set the initial value of the increment
  movwf c+1
  movlw b'00000001'
  movwf c
 
random_numbers CODE
 movff a+1,k16+1 ;move the multiplier into k16
 movff a, k16
 movff s+1, mul16+1 ;move the seed into mul16
 movff s, mul16
 call multiplication16x16 ;multiply k16 and mul16
 bcf STATUS, 0 ;clear the carry bit 
 movfw c+1
 addwfc prod16x16+3,1 ;add the increment to the product of the multiplication
 movff s+1
 movfw c
 addwfc prod16x16+2,0
 andwf b'00001111'
 movwf s
 return

    END