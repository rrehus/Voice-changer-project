#include p18f87k22.inc

    global  Volume_Setup, VolumeSet, VolumeRead, VolumeDisp
    global  volume, voldisp
    extern  division16x16, dividh, dividl, divish, divisl, quoth, quotl
    
    extern  ADC_read_A1, multiplication16x16, multiplication8x16, k16, k8, mul16, prod8x16, prod16x16
    
acs_vol	    udata_acs	; Define variables in user access data
volume	    res 1	; reserve 1 byte for volume
voldisp	    res 2	; reserve 2 bytes for voldisp
voltmp	    res 1	; reserve 1 byte for voltmp
	    
acs_tmp	    access_ovr	; Define temporary variables
delay_count  res	1	; reserve 1 byte for delay_count
       
VolumeControl code

Volume_Setup
    movlw   0x0
    movwf   TRISE	; make port E output (where voltage to be output)
    movwf   TRISG	; make port F output (for WR pin)
    movwf   LATE
    movwf   LATG
    bsf	    PORTG, 1
    
VolumeSet
    clrf    PORTG
    call    delay
    movff   volume, PORTE
    call    delay
    setf    PORTG
    call    delay
    ;clrf    PORTG
    return
    
VolumeRead
    call    ADC_read_A1
    swapf   ADRESL, 0
    andlw   0x0F
    movwf   volume
    swapf   ADRESH, 0
    andlw   0xF0
    addwf   volume, 1
    return
    
VolumeDisp
    rrncf   volume, 0
    movwf   voltmp
    bcf	    voltmp, 7
    movlw   0x64
    mulwf   voltmp
    movff   PRODH, dividh
    movff   PRODL, dividl
    clrf    divish
    movlw   0x7F
    movwf   divisl
    call    division16x16
    movff   quotl, voltmp
    movlw   0x29
    mulwf   voltmp
    swapf   PRODH, 0
    andlw   0x0F
    movwf   voldisp
    movlw   0x0F
    andwf   PRODH, 0
    movwf   k16
    movff   PRODL, k16+1
    movlw   0xA
    call    multiplication8x16
    movlw   0xF0
    andwf   prod8x16+1, 0
    movwf   voldisp+1
    movlw   0x0F
    andwf   prod8x16+1, 0
    movwf   k16
    movff   prod8x16+2, k16+1
    movlw   0xA
    call    multiplication8x16
    swapf   prod8x16+1, 0
    andlw   0x0F
    addwf   voldisp+1
    movf    voldisp, W
    return
    
delay
    movlw   0x8
    movwf   delay_count
delay_loop_nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    decfsz  delay_count
    bra	    delay_loop_nop
    return
    
    END

