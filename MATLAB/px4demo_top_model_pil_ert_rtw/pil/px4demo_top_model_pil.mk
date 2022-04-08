###########################################################################
## Makefile generated for component 'px4demo_top_model_pil'. 
## 
## Makefile     : px4demo_top_model_pil.mk
## Generated on : Wed Jul 21 21:16:53 2021
## Final product: ./px4demo_top_model_pil.pre.o
## Product type : executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile

PRODUCT_NAME              = px4demo_top_model_pil
MAKEFILE                  = px4demo_top_model_pil.mk
MATLAB_ROOT               = C:/PROGRA~1/MATLAB/R2020b
MATLAB_BIN                = C:/PROGRA~1/MATLAB/R2020b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = C:/Users/camka/Documents/Code/MATLAB
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ../..
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU Tools for PX4 Autopilots
# Supported Version(s):    
# ToolchainInfo Version:   2020b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# TARGET_LOAD_CMD_ARGS
# TARGET_LOAD_CMD
# PX4FIRMWAREROOTDIR
# CMAKEMAKECONFIG
# PYTHONROOTDIR
# CYGWINROOTDIR
# MW_PX4_BUILDCMD

#-----------
# MACROS
#-----------

Q                    = $(if $(V),,@)
CPFLAGS              = -O binary
LIBGCC               = $(shell $(CC) $(ARCHCPUFLAGS) -print-libgcc-file-name)
LIBM                 = $(shell $(CC) $(ARCHCPUFLAGS) -print-file-name=libm.a)
PX4_MAKE             = $(MW_PX4_BUILDCMD)

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm -lm

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: GNU PX4 C Compiler
CC = echo gcc

# Linker: GNU PX4 Pre-Linker
LD = echo gcc

# C++ Compiler: GNU PX4 C++ Compiler
CPP = echo g++

# C++ Linker: GNU PX4 C++ Pre-Linker
CPP_LD = echo gcc

# Archiver: GNU PX4 Archiver
AR = echo

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Invoke Make: Invoke Make
INVOKE = $(call CALLPX4MK)

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%\bin\win64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
ENDGRP              = --end-group
OUTPUT_FLAG         = -o
STARTGRP            = --start-group
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
ENDGRP              = --end-group
OUTPUT_FLAG         = -o
STARTGRP            = --start-group
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @del /f/q
ECHO                = @echo
MV                  = @move
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = ruvs
CFLAGS               =
CPPFLAGS             =
CPP_LDFLAGS          =
CPP_SHAREDLIB_LDFLAGS  =
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
MAKEFILENAME         =
LDFLAGS              =
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE) postdownload_preexecute
SHAREDLIB_LDFLAGS    =



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = ./px4demo_top_model_pil.pre.o
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I$(START_DIR)/px4demo_top_model_pil_ert_rtw -I$(MATLAB_ROOT)/extern/include -I$(MATLAB_ROOT)/simulink/include -I$(MATLAB_ROOT)/rtw/c/src -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common -I$(MATLAB_ROOT)/rtw/c/ert -I$(START_DIR)/slprj/ert/_sharedutils -I$(MATLAB_ROOT)/rtw/c/src/ext_mode/serial -IC:/PROGRA~3/MATLAB/SupportPackages/R2020b/toolbox/target/shared/externalmode_daemon/include -IC:/PROGRA~3/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/include -I$(MATLAB_ROOT)/toolbox/rtw/targets/pil/c -I$(START_DIR)/px4demo_top_model_pil_ert_rtw/pil -I$(MATLAB_ROOT)/extern/include/coder/connectivity/XILTgtAppSvc -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils -I$(MATLAB_ROOT)/toolbox/coder/rtiostream/src -I$(MATLAB_ROOT)/extern/include/coder/connectivity/CodeInstrTgtAppSvc

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__ -DMW_PX4_DISABLE_MAVLINK=1 -DPIL -DRTIOSTREAM_RX_BUFFER_BYTE_SIZE=128 -DRTIOSTREAM_TX_BUFFER_BYTE_SIZE=128 -DMW_PX4_EXTMODE_BAUD_RATE=3000000 -DMW_PX4_EXTMODE_HWPORT="/dev/ttyACM0"
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=0 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0
DEFINES_CUSTOM = 
DEFINES_OPTS = -DTID01EQ=0 -DCODER_ASSUMPTIONS_ENABLED=0 -DCODE_INSTRUMENTATION_ENABLED=1 -DMEM_UNIT_BYTES=1 -DMemUnit_T=uint8_T
DEFINES_SKIPFORSIL = -DPX4 -DFMUv5 -DNULL=0 -DMW_PX4_NUTTX_BUILD -DEXTMODE_DISABLETESTING -DEXTMODE_DISABLEPRINTF -DEXTMODE_DISABLE_ARGS_PROCESSING=1 -DDAEMON_MODE=1 -DSTACK_SIZE=64 -DRT
DEFINES_STANDARD = -DMODEL=px4demo_top_model_pil -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_interface_lib.c $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_data_stream.c $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_services.c $(START_DIR)/px4demo_top_model_pil_ert_rtw/pil/xil_interface.cpp $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xilcomms_rtiostream.c $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_rtiostream.c $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/rtiostream_utils.c C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/pil_main_px4.cpp C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/MW_PX4_rtiostream_serial.cpp C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/MW_PX4_TaskControl.cpp C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/nuttxinitialize.cpp $(START_DIR)/px4demo_top_model_pil_ert_rtw/pil/xil_instrumentation.cpp $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/codeinstr_data_stream.c $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/codeinstr_rtiostream.c C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/profiler_timer.c

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = xil_interface_lib.o xil_data_stream.o xil_services.o xil_interface.cpp.o xilcomms_rtiostream.o xil_rtiostream.o rtiostream_utils.o pil_main_px4.cpp.o MW_PX4_rtiostream_serial.cpp.o MW_PX4_TaskControl.cpp.o nuttxinitialize.cpp.o xil_instrumentation.cpp.o codeinstr_data_stream.o codeinstr_rtiostream.o profiler_timer.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_BASIC)

###########################################################################
## INLINED COMMANDS
###########################################################################


define CALLPX4MK 
	@echo "Making Firmware $2"
	@(cd $(PX4FIRMWAREROOTDIR)/Firmware && $(PX4_MAKE) )
	@echo "### End of Simulink Build ###"
endef



-include codertarget_assembly_flags.mk
-include ../codertarget_assembly_flags.mk


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild download postdownload_preexecute execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS)
	@echo "### Successfully generated all binary outputs."


prebuild : 


download : $(PRODUCT)


postdownload_preexecute : download
	@echo "### Invoking postbuild tool "Invoke Make" ..."
	$(INVOKE) $(MAKEFILENAME)
	@echo "### Done invoking postbuild tool."


execute : postdownload_preexecute
	@echo "### Invoking postbuild tool "Execute" ..."
	$(EXECUTE) $(EXECUTE_FLAGS)
	@echo "### Done invoking postbuild tool."


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	@echo "### Creating standalone executable "$(PRODUCT)" ..."
	$(CPP_LD) $(CPP_LDFLAGS) -o $(PRODUCT) $(OBJS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


xil_interface_lib.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_interface_lib.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xil_data_stream.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_data_stream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xil_services.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_services.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xil_interface.cpp.o : $(START_DIR)/px4demo_top_model_pil_ert_rtw/pil/xil_interface.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


xilcomms_rtiostream.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xilcomms_rtiostream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xil_rtiostream.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/xil_rtiostream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtiostream_utils.o : $(MATLAB_ROOT)/toolbox/coder/rtiostream/src/utils/rtiostream_utils.c
	$(CC) $(CFLAGS) -o "$@" "$<"


pil_main_px4.cpp.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/pil_main_px4.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MW_PX4_rtiostream_serial.cpp.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/MW_PX4_rtiostream_serial.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


MW_PX4_TaskControl.cpp.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/MW_PX4_TaskControl.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


nuttxinitialize.cpp.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/nuttxinitialize.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


xil_instrumentation.cpp.o : $(START_DIR)/px4demo_top_model_pil_ert_rtw/pil/xil_instrumentation.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


codeinstr_data_stream.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/codeinstr_data_stream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


codeinstr_rtiostream.o : $(MATLAB_ROOT)/toolbox/rtw/targets/pil/c/codeinstr_rtiostream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


profiler_timer.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/px4/src/profiler_timer.c
	$(CC) $(CFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### MAKEFILENAME = $(MAKEFILENAME)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	$(RM) $(subst /,\,$(PRODUCT))
	$(RM) $(subst /,\,$(ALL_OBJS))
	$(ECHO) "### Deleted all derived files."


