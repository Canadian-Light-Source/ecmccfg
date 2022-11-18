#-d /**
#-d   \brief hardware script for ecmcEL33XX-Sensor-generic
#-d   \details Parmetrization default SDO settings for EL33XX
#-d   \author Anders Sandstroem
#-d   \file
#-d */

############################################################
############# Parmetrization default SDO settings for EL33XX
#
#- Environment variables needed:
#- -ECMC_EC_SDO_INDEX "0x80n0" where n is channel 0..3
#- -ECMC_EC_SLAVE_NUM = slave number
#-

#- Enable user scale (default 0=disabled)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x1")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Disabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Presentation:
#- 0 = Signed (Default)
#- 1 = Absolute, MSB as sign
#- 2 = High precision (only available for certain terminals)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x2")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Signed
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable Siemens S5 bits: (not available for all EL33XX)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x5")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Disabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable filter
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x6")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "1")  # Enabled
#- NOTE: According to documentation the filter is always enabled independent of setting since needed for measure process. So rely on default value.
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable limit 1 (not available for all EL33XX)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x7")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Disabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable limit 2 (not available for all EL33XX)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x8")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Disabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable user calibration
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0xA")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Disabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Enable vendor calibration
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0xB")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "1")  # Enabled
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Cold junction compensation
#- 0 = Internal (default)
#- 1 = No compensation
#- 2 = Extern process data
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0xC")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Internal
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Disable wirebreak detection
#- 0 = Wire break detection active (default)
#- 1 = Wire break detection not active
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0xE")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "1")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Active
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- User scale offset
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x11")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- User scale gain (Represented in fixed point format with factor 2^⁻16=> 1 corresponds to  65535)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x12")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "4")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "65535")  # Gain 1
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Limit 1 (not available for all EL33XX)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x13")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Limit 2 (not available for all EL33XX)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x14")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Filter settings
#-  Index   All EL33XX except EL3314-0002   EL3314-0002
#- ------- ------------------------------- -------------
#-      0   50 Hz                           2.5 Hz
#-      1   60 Hz                           5 Hz
#-      2   100 Hz                          10 Hz
#-      3   500 Hz                          16.6 Hz
#-      4   1 kHz                           20 Hz
#-      5   2 kHz                           50 Hz
#-      6   3.75 kHz                        60 Hz
#-      7   7.5 kHz                         100 Hz
#-      8   15 kHz
#-      9   30 kHz
#-     10   5 Hz
#-     11   10 Hz
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x15")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")
#- NOTE: Per channel configuration is not possible. All channels use channel 1 setting.
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- User calibration offset
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x17")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- User calibration gain (Represented in fixed point format with factor 2^⁻16=> 1 corresponds to  65535)
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x18")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "65535")
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- TC Element (different for EL33XX, List for EL3314-0000 below)
#- 0 = K -200..1370 degC (default)
#- 1 = J -100..1200 degC
#- 2 = L 0..900 degC
#- 3 = E -100..1000 degC
#- 4 = T -200..400 degC
#- 5 = N -100..1300 degC
#- 6 = U 0..600 degC
#- 7 = B 600..1800 degC
#- 8 = R 0..1767 degC
#- 9 = S 0..1760 degC
#- 10 = C 0..2320 degC
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x19")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # K
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

# MC filter only EL3314-0002, EL3314-0010
#- 0 = Inactive (default)
#- 1 = IIR 1
#- 2 = IIR 2
#- 3 = IIR 3
#- 4 = IIR 4
#- 5 = FIR 4
#- 6 = FIR 8
#- 7 = FIR 16
#- 8 = FIR 32
epicsEnvSet("ECMC_EC_SDO_INDEX_OFFSET",  "0x1A")
epicsEnvSet("ECMC_EC_SDO_SIZE",          "2")
epicsEnvSet("ECMC_EC_SDO_VALUE",         "0")  # Inactive
#ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},${ECMC_EC_SDO_INDEX},$(ECMC_EC_SDO_INDEX_OFFSET),$(ECMC_EC_SDO_VALUE),$(ECMC_EC_SDO_SIZE))"

#- Cleanup
epicsEnvUnset("ECMC_EC_SDO_INDEX_OFFSET")
epicsEnvUnset("ECMC_EC_SDO_SIZE")
epicsEnvUnset("ECMC_EC_SDO_VALUE")
