#-d /**
#-d   \brief hardware script for MCS2
#-d   \details SmarAct MCS2 piezo controller with EtherCAT interface
#-d   \author Niko Kivel, Anders Sandström
#-d   \file
#-d   \note SDOS
#-d */

epicsEnvSet("ECMC_EC_HWTYPE"             "MCS2")
epicsEnvSet("ECMC_EC_VENDOR_ID"          "0x00536d61")                                          
epicsEnvSet("ECMC_EC_PRODUCT_ID"         "0x00020d08")

ecmcConfigOrDie "Cfg.EcSlaveVerify(0,${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID})"

#- Consider read which channels are deteced in 0xf050?!

#- mandatory setting of 0xF030, which subseqently defines SM2 and SM3
#- use Cfg.EcWriteSdo, this needs to happen at I->P
#- TODO: clarify which mechanism actually ensures that this happens at I->P.

epicsEnvSet("ECMC_SDO_INDEX",              "0xF030")
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},$(ECMC_SDO_INDEX),0x0,0,1)"
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},$(ECMC_SDO_INDEX),0x1,0x000a0000,4)"
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},$(ECMC_SDO_INDEX),0x2,0x000a0000,4)"
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},$(ECMC_SDO_INDEX),0x3,0x000a0000,4)"
ecmcConfigOrDie "Cfg.EcWriteSdo(${ECMC_EC_SLAVE_NUM},$(ECMC_SDO_INDEX),0x0,3,1)"

#- Go to INIT
system "${ECMC_EC_TOOL_PATH} states -m${ECMC_EC_MASTER_ID} -p${ECMC_EC_SLAVE_NUM} INIT"

#- and then back to PREOP
system "{ECMC_EC_TOOL_PATH} states -m${ECMC_EC_MASTER_ID} -p${ECMC_EC_SLAVE_NUM} PREOP"

#- SyncManager 2
#- 0x1600 "csp/csv RxPDO"
#- CH1
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1600,0x6040,0x00,16,drivedriveControl01)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1600,0x607a,0x00,32,1,positionSetpoint01)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1600,0x6060,0x00,16,mode01)"
#- 0x1610 "csp/csv RxPDO"
#- CH2
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1610,0x6840,0x00,16,driveControl02)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1610,0x687a,0x00,32,1,positionSetpoint02)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1610,0x6860,0x00,16,mode02)"
#- 0x1620 "csp/csv RxPDO"
#- CH3
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1620,0x7040,0x00,16,driveControl03)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1620,0x707a,0x00,32,1,positionSetpoint03)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},1,2,0x1620,0x7060,0x00,16,mode03)"

#- SyncManager 3
#- 0x1a00 "csp/csv TxPDO"
#- CH2
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6061,0x00,16,modeActual01)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6041,0x00,16,driveStatus01)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a00,0x6064,0x00,32,positionActual01)"
#- 0x1a10 "csp/csv TxPDO"
#- CH2
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a10,0x6861,0x00,16,modeActual02)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a10,0x6841,0x00,16,driveStatus02)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a10,0x6864,0x00,32,positionActual02)"
#- 0x1a20 "csp/csv TxPDO"
#- CH3
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a20,0x7061,0x00,16,modeActual03)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a20,0x7041,0x00,16,driveStatus03)"
ecmcConfigOrDie "Cfg.EcAddEntryComplete(${ECMC_EC_SLAVE_NUM},${ECMC_EC_VENDOR_ID},${ECMC_EC_PRODUCT_ID},2,3,0x1a20,0x7064,0x00,32,positionActual03)"

#- Activly choose CSP mode
#- set mode to 8, aka CSP
#- -1 Calibration
#-  0 None
#-  1 Profile Position
#-  6 Homing
#-  8 Cyclic Synchronous Position
#- CH1
# ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x6060,0x00,8,2)"
# #- CH2
# ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x6860,0x00,8,2)"
# #- CH3
# ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x7060,0x00,8,2)"
