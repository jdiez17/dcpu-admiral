DT_PATH=/usr/bin/

CC=$(DT_PATH)/dtcc
ASM=$(DT_PATH)/dtasm
LD=$(DT_PATH)/dtld
EMU=$(DT_PATH)/dtemu
HEXY=./hexy

TARGET=admiral

all: $(TARGET).bin

run: $(TARGET).bin
	# Emulate the final output
	$(EMU) $(TARGET).bin

$(TARGET).bin: $(TARGET).dasm16
	$(ASM) --binary -o debug.bin $(TARGET).dasm16
	$(HEXY) debug.bin >$(TARGET)_dat.dasm16
#	$(ASM) -o $@.dobj16 -s $@.s -i $(TARGET).dasm16
#    $(LD) -O 3 -o $@.bin -s $@.s $(TARGET).dobj16 -k none

clean:
	rm -fv *.dodj16 *.s *~
