default:
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o arduino_bare_metal.o arduino_bare_metal.c
	avr-gcc -o arduino_bare_metal.bin arduino_bare_metal.o
	avr-objcopy -O ihex -R .eeprom arduino_bare_metal.bin arduino_bare_metal.hex
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:arduino_bare_metal.hex
