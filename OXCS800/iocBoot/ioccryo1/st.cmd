#!../../bin/linux-x86_64/cryo1

#- You may have to change cryo1 to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet ("STREAM_PROTOCOL_PATH","$(TOP)/db")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/cryo1.dbd"
cryo1_registerRecordDeviceDriver pdbbase

# Status Packets
# CS800 broadcasts using UDP to the subnetwork
drvAsynIPPortConfigure("L0", "255.255.255.255:30304:30304 UDP", 0, 0, 0)

# Commands are sent on 30305 port using UDP
drvAsynIPPortConfigure("OC_CMD", "131.243.74.36:30305 UDP*", 0, 0, 0)

# Status Packet
dbLoadRecords("db/MDO.db", "P=OXCRYO:,Q=CS800,PORT=L0,R=MDO:,L=0,A=0,PORTCMD=OC_CMD")

# Commands 
dbLoadRecords("db/asynRecord.db","P=OXCRYO:,R=CS800:ASYN:CMD,PORT=L0,ADDR=0,OMAX=1000,IMAX=1000")

#- Set this to see messages from mySub
#-var mySubDebug 1

#- Run this to trace the stages of iocInit
#-traceIocInit

cd "${TOP}/iocBoot/${IOC}"
adTemplate "db/user.substitutions"

iocInit

