# Arduino Learning Wokwi

A small starter repo for learning Arduino with the Wokwi simulator extension.

## First sketch

`Arduino-Learning-Wokwi.ino` blinks the built-in LED on an Arduino Uno and writes status messages to the serial monitor.

## How to use

1. Open this folder in VS Code.
2. Open `diagram.json`.
3. Click the green play button in the Wokwi diagram editor.

## Build firmware locally

This repo uses Arduino CLI to compile the firmware Wokwi runs.

```powershell
.\tools\arduino-cli\arduino-cli.exe compile --fqbn arduino:avr:uno --build-path build .
```

Wokwi reads these files from `wokwi.toml`:

- `build/Arduino-Learning-Wokwi.ino.hex`
- `build/Arduino-Learning-Wokwi.ino.elf`

## Files

- `Arduino-Learning-Wokwi.ino` - Arduino code.
- `diagram.json` - Wokwi virtual circuit.
- `wokwi.toml` - Wokwi project configuration.
- `main.c` - scratch C file for learning C syntax.