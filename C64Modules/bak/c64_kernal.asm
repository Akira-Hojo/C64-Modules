;░█▄▀▒██▀▒█▀▄░█▄░█▒▄▀▄░█▒░░░▒█▀▄░▄▀▄░█▒█░▀█▀░█░█▄░█▒██▀░▄▀▀
;░█▒█░█▄▄░█▀▄░█▒▀█░█▀█▒█▄▄▒░░█▀▄░▀▄▀░▀▄█░▒█▒░█░█▒▀█░█▄▄▒▄██
;*******************************************************************************
;Kernal Routines - Modify as needed to save ram
;*******************************************************************************

CLRSCRN = $E544   ;58692  Clears Screen (Slow?-ish)
ACPTR   = $FFA5   ;65445  Input byte from serial port
CHKIN   = $FFC6   ;65478  Open channel for input
CHKOUT  = $FFC9   ;65481  Open a channel for output
CHRIN   = $FFCF   ;65487  Get a character from the input channel
CHROUT  = $FFD2   ;65490  Output a character
CIOUT   = $FFA8   ;65448  Transmit a byte over the serial bus
CINT    = $FF81   ;65409  Initialize the screen editor and VIC-II Chip
CLALL   = $FFE7   ;65511  Close all open files
CLOSE   = $FFC3   ;65475  Close a logical file
CLRCHN  = $FFCC   ;65484  Clear all I/O channels
GETIN   = $FFE4   ;65508  Get a character
IOBASE  = $FFF3   ;65523  Define I/O memory page
IOINIT  = $FF84   ;65412  Initialize I/O devices
LISTEN  = $FFB1   ;65457  Command a device on the serial bus to listen
LOAD    = $FFD5   ;65493  Load RAM from device
MEMBOT  = $FF9C   ;65436  Set bottom of memory
MEMTOP  = $FF99   ;65433  Set the top of RAM
OPEN    = $FFC0   ;65472  Open a logical file
PLOT    = $FFF0   ;65520  Set or retrieve cursor location
RAMTAS  = $FF87   ;65415  Perform RAM test
RDTIM   = $FFDE   ;65502  Read system clock
READST  = $FFB7   ;65463  Read status word
RESTOR  = $FF8A   ;65418  Set the top of RAM
SAVE    = $FFD8   ;65496  Save memory to a device
SCNKEY  = $FF9F   ;65439  Scan the keyboard
SCREEN  = $FFED   ;65517  Return screen format
SECOND  = $FF93   ;65427  Send secondary address for LISTEN
SETLFS  = $FFBA   ;65466  Set up a logical file
SETMSG  = $FF90   ;65424  Set system message output
SETNAM  = $FFBD   ;65469  Set up file name
SETTIM  = $FFDB   ;65499  Set the system clock
SETTMO  = $FFA2   ;65442  Set IEEE bus card timeout flag
STOP    = $FFE1   ;65505  Check if STOP key is pressed
TALK    = $FFB4   ;65460  Command a device on the serial bus to talk
TKSA    = $FF96   ;65430  Send a secondary address to a device commanded to talk
UDTIM   = $FFEA   ;65514  Update the system clock
UNLSN   = $FFAE   ;65454  Send an UNLISTEN command
UNTLK   = $FFAB   ;65451  Send an UNTALK command
VECTOR  = $FF8D   ;65421  Manage RAM vectors

;*******************************************************************************