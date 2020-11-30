;░█▄▀▒██▀▒█▀▄░█▄░█▒▄▀▄░█▒░░░▒█▀▄░▄▀▄░█▒█░▀█▀░█░█▄░█▒██▀░▄▀▀
;░█▒█░█▄▄░█▀▄░█▒▀█░█▀█▒█▄▄▒░░█▀▄░▀▄▀░▀▄█░▒█▒░█░█▒▀█░█▄▄▒▄██
;*******************************************************************************
;Kernal Routines - Modify as needed to save ram
;*******************************************************************************

clrscrn = $e544   ;58692  clears screen (slow?-ish)
acptr   = $ffa5   ;65445  input byte from serial port
chkin   = $ffc6   ;65478  open channel for input
chkout  = $ffc9   ;65481  open a channel for output
chrin   = $ffcf   ;65487  get a character from the input channel
chrout  = $ffd2   ;65490  output a character
ciout   = $ffa8   ;65448  transmit a byte over the serial bus
cint    = $ff81   ;65409  initialize the screen editor and vic-ii chip
clall   = $ffe7   ;65511  close all open files
close   = $ffc3   ;65475  close a logical file
clrchn  = $ffcc   ;65484  clear all i/o channels
getin   = $ffe4   ;65508  get a character
iobase  = $fff3   ;65523  define i/o memory page
ioinit  = $ff84   ;65412  initialize i/o devices
listen  = $ffb1   ;65457  command a device on the serial bus to listen
load    = $ffd5   ;65493  load ram from device
membot  = $ff9c   ;65436  set bottom of memory
memtop  = $ff99   ;65433  set the top of ram
open    = $ffc0   ;65472  open a logical file
plot    = $fff0   ;65520  set or retrieve cursor location
ramtas  = $ff87   ;65415  perform ram test
rdtim   = $ffde   ;65502  read system clock
readst  = $ffb7   ;65463  read status word
restor  = $ff8a   ;65418  set the top of ram
save    = $ffd8   ;65496  save memory to a device
scnkey  = $ff9f   ;65439  scan the keyboard
screen  = $ffed   ;65517  return screen format
second  = $ff93   ;65427  send secondary address for listen
setlfs  = $ffba   ;65466  set up a logical file
setmsg  = $ff90   ;65424  set system message output
setnam  = $ffbd   ;65469  set up file name
settim  = $ffdb   ;65499  set the system clock
settmo  = $ffa2   ;65442  set ieee bus card timeout flag
stop    = $ffe1   ;65505  check if stop key is pressed
talk    = $ffb4   ;65460  command a device on the serial bus to talk
tksa    = $ff96   ;65430  send a secondary address to a device commanded to talk
udtim   = $ffea   ;65514  update the system clock
unlsn   = $ffae   ;65454  send an unlisten command
untlk   = $ffab   ;65451  send an untalk command
vector  = $ff8d   ;65421  manage ram vectors

;*******************************************************************************