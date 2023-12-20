# Cryostream-800-EPICS-IOC
Cryostream 800 (Oxford Cryosystems - [oxcryo.com](https://www.oxcryo.com/) ) Driver for EPICS IOC

EPICS stream device driver for the Oxford CryoSystems 800 Series CryoStream.

#Credits:

#Adapted from https://github.com/djvine/OxfordCryo_CryoStream800 (which was also adapted from the driver of James OHea (DLS))

#This version was expanded and improved by:

# Berkeley Center for Structural Biology
# https://bcsb.als.lbl.gov/wordpress/
# John Taylor     - Berkeley National Laboratory ( jrtaylor_at_lbl.gov )
# Gabriel Gazolla - Berkeley National Laboratory ( gabrielgazolla_at_lbl.gov )

A few tips:

Tip 01:

Our epics base was installed at:

/opt/epics7/base-7.0.7

and the IOCS like this one at

/opt/iocs/CS800/

Tip 02:

Requirements:

CALC = /opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/calc-R3-7-4
ASYN = /opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/asyn-R4-42/
STREAM = /opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/StreamDevice-2-8-16

# EPICS_BASE should appear last so earlier modules can override stuff:

EPICS_BASE = /opt/epics7/base-7.0.7

You should also update the file Configure > Release, with the correct paths.

Tip 03:

To start the IOC, it needs to be executable. 
Please make the st.cmd file directly executable with command:

chmod +x st.cmd

Tip 04: 

To execute the IOC run:
./st.cmd

Tip 05:

After ./st.cmd is executing, you can retrieve variables with caget command:

caget OXCRYO:CS800:DEVICEMINTEMP

Tip 06:

COOL command requires setting the temperature first (CTEMP). Keep this in mind.

Tip 07: 

to know the available commands, run the IOC ./st.cmd and type the command dbl

Tip 08:

Do not forget to update the ip settings on the st.cmd file.



