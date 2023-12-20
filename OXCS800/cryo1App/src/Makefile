TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += cryo1Support

# Compile and add code to the support library
cryo1Support_SRCS += xxxRecord.c
cryo1Support_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
cryo1Support_SRCS += dbSubExample.c
cryo1Support_SRCS += devcryo1Version.c
cryo1Support_SRCS += cryo1Hello.c
cryo1Support_SRCS += initTrace.c

cryo1Support_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = cryo1Version.h
# Macro name
GENVERSIONMACRO = cryo1VERSION

# Build the IOC application
PROD_IOC = cryo1

# cryo1.dbd will be created and installed
DBD += cryo1.dbd

# cryo1.dbd will include these files:
cryo1_DBD += base.dbd
cryo1_DBD += xxxSupport.dbd
cryo1_DBD += dbSubExample.dbd
cryo1_DBD += devcryo1Version.dbd
cryo1_DBD += cryo1Hello.dbd
cryo1_DBD += initTrace.dbd

cryo1_DBD += calc.dbd 
cryo1_DBD += stream.dbd 
cryo1_DBD += asyn.dbd 

# cryo1_registerRecordDeviceDriver.cpp derives from cryo1.dbd
cryo1_SRCS += cryo1_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
cryo1_SRCS_DEFAULT += cryo1Main.cpp
cryo1_SRCS_vxWorks += -nil-

# Link in the code from our support library
cryo1_LIBS += cryo1Support

cryo1_LIBS += calc stream asyn 

DB_INSTALLS += $(ASYN)/db/asynRecord.db
#DB_INSTALLS += /opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/calc-R3-7-4/db


# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into cryo1Support
    sncExample_SNCFLAGS += +r
    cryo1_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    cryo1Support_SRCS += sncExample.stt
    cryo1Support_LIBS += seq pv
    cryo1_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    cryo1_LIBS += qsrv
    cryo1_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    cryo1_DBD += PVAServerRegister.dbd
    cryo1_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
cryo1_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devcryo1Version$(DEP): $(COMMON_DIR)/$(GENVERSION)
