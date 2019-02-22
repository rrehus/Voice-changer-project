#include p18f87k22.inc

    global  Volume_Setup, VolumeSet, VolumeRead, VolumeDisp
    global  volume, voldisp
    
    extern  ADC_read_A1, multiplication16x16, multiplication8x16, k16, k8, mul16, prod8x16, prod16x16
    
acs_vol	    udata_acs	; Define variables in user access data
volume	    res 1	; reserve 1 byte for volume
voldisp	    res 2	; reserve 2 bytes for voldisp
voltmp	    res 1	; reserve 1 byte for voltmp
       
VolumeControl code

Volume_Setup
    movlw   0x0
    movwf   TRISC	; make port F output (where voltage to be output)
    movwf   TRISG	; make port G output (for WR pin)
    movwf   LATC
    
VolumeSet
    bsf	    PORTG, 0
    nop
    movff   volume, PORTC
    nop
    bcf	    PORTG, 0
    nop
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
    
    
    END

