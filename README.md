# UnoRubber
Transform your Arduino Uno into a bridge to install malware (only for educational purpose).

## How to
+ Install the HoodLoader2 bootloader (https://github.com/NicoHood/HoodLoader2/wiki/Installation-sketch-%28standalone-Arduino-Uno-Mega%29)
+ Add the HoodLoader2 board definition in your Arduino IDE (https://github.com/NicoHood/HoodLoader2/wiki/Software-Installation)
+ Download HID-Project in your Arduino IDE (https://github.com/NicoHood/HID/wiki/Installation)
+ Change the payload link in the UnoRubber_USB sketch and upload it selecting the board HoodLoader2 16u2
+ Upload the UnoRubber_IO sketch selecting the board HoodLoader2 Uno
+ Hack the world

### Todo
+ Add the italian keyboard layout
+ Hack some friends PCs