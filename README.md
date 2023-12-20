# Cryostream 800 (EPICS IOC)

## Overview
Cryostream 800 (Oxford Cryosystems) Driver for EPICS IOC. This is an EPICS stream device driver for the Oxford CryoSystems 800 Series CryoStream. We also implemented a Cryostream 1000 version, please check our repository.

Official Website: [Oxford Cryosystems](https://www.oxcryo.com/)

## Credits
- Original version: [djvine/OxfordCryo_CryoStream800](https://github.com/djvine/OxfordCryo_CryoStream800) (Adapted from James OHea's driver at DLS)
- Current Version:
  - Berkeley Center for Structural Biology
  - Contributors:
    - John Taylor, Berkeley National Laboratory (Email: jrtaylor_at_lbl.gov)
    - Gabriel Gazolla, Berkeley National Laboratory (Email: gabrielgazolla_at_lbl.gov)

Website: [Berkeley Center for Structural Biology](https://bcsb.als.lbl.gov/wordpress/)

## Installation and Setup
### Requirements
- CALC: `/opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/calc-R3-7-4`
- ASYN: `/opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/asyn-R4-42/`
- STREAM: `/opt/epics7/base-7.0.7/modules/synApps_6_2_1/support/StreamDevice-2-8-16`
- Set `EPICS_BASE` last: `/opt/epics7/base-7.0.7`

### Installation Tips
- **Tip 00**: Update the file `Configure > Release` with the correct paths (OXCS800 folder).
- **Tip 01**: Our EPICS base is installed at `/opt/epics7/base-7.0.7`, and the IOCs at `/opt/iocs/CS800/`.
- **Tip 02**: Ensure the `st.cmd` file is executable: `chmod +x st.cmd`
- **Tip 03**: To execute the IOC, run `./st.cmd`.

## Usage
### Basic Commands
- Retrieve variables: `caget OXCRYO:CS800:DEVICEMINTEMP`
- Start cooling (COOL command): Set the temperature first with `CTEMP`.
- List available commands: Run `./st.cmd` and type `dbl`.
- Update IP settings in the `st.cmd` file as needed.

## Contributing
For contributing to this project, please contact us via email.

