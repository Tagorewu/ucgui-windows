########################################
##makefile
########################################
#****************************************************************************
# Cross complie path
#****************************************************************************
#CHAIN_ROOT=/home/yang/imax283/ctools/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin

#CROSS_COMPILE=$(CHAIN_ROOT)/arm-none-linux-gnueabi-

#CHAIN_ROOT= /home/yang/b503/ctools/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin
#CROSS_COMPILE=$(CHAIN_ROOT)/arm-linux-gnueabihf-
#CROSS_COMPILE = 

CC     := $(CROSS_COMPILE)gcc
CXX    := $(CROSS_COMPILE)g++
AS	   := $(CROSS_COMPILE)as
AR     := $(CROSS_COMPILE)ar 
LD     := $(CROSS_COMPILE)ld
RANLIB := $(CROSS_COMPILE)ranlib
OBJDUMP:= $(CROSS_COMPILE)objdump
OBJCOPY:= $(CROSS_COMPILE)objcopy
STRIP  := $(CROSS_COMPILE)strip

#****************************************************************************
# Source files
#****************************************************************************
SRC_C=$(shell gfind . -name "*.c")

OBJ_C=$(patsubst %.c, %.o, $(SRC_C))

SRCS := $(SRC_C) $(SRC_C)

OBJS := $(OBJ_C) 

#****************************************************************************
# Flags
#****************************************************************************

CFLAGS=  -I./GUI_X -I./GUI/Core -I./GUI/WM -I./GUI/Widget
LDSCRIPT= 
LDFLAGS= 
#****************************************************************************
# Targets of the build
#****************************************************************************
TARGET   	:= libucgui

.PHONY: clean
all:  prebuild  $(TARGET).a

#****************************************************************************
# TARGET
#****************************************************************************
prebuild:
	@echo Building lib...

$(TARGET).a : $(OBJS)
	@echo Generating lib...
	ar crv $(TARGET).a $(OBJS) 
	cp $(TARGET).a ../
	@echo OK!

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o  $@
	
clean:
	@echo The following files:
	rm  -f  $(TARGET) *.a
	gfind . -name "*.[od]" |xargs rm
	@echo Removed!
