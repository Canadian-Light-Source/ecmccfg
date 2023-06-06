#==============================================================================
# setAppMode.cmd
#- Arguments: n/a

#-d /**
#-d   \brief Script for switching to operational mode.
#-d   \author Niko Kivel
#-d   \file
#-d */
ecmcFileExist("${ECMC_CONFIG_ROOT}general.cmd",1)
${SCRIPTEXEC} ${ECMC_CONFIG_ROOT}general.cmd

#- Only load ec records if master is selected. ECMC_EC_MASTER_ID is set in startup.cmd.
ecmcEpicsEnvSetCalcTernary(ECMC_MASTER_CMD, "${ECMC_EC_MASTER_ID=0}>=0", "","#- ")
${ECMC_MASTER_CMD} ecmcFileExist("ecmcEc.db",1,1)
${ECMC_MASTER_CMD} dbLoadRecords("ecmcEc.db","P=${ECMC_PREFIX},ECMC_EC_MP=${ECMC_EC_MP=m},PORT=${ECMC_ASYN_PORT},ADDR=0,TIMEOUT=1,MASTER_ID=${ECMC_EC_MASTER_ID},T_SMP_MS=${ECMC_SAMPLE_RATE_MS},TSE=${ECMC_TSE}")

#- Load ecmc information into record
#- Set -1 to mark last in chains
epicsEnvSet(ECMC_DS_CFG,"[${ECMC_DS_CFG=""}-1]")
epicsEnvSet(ECMC_PLG_CFG,"[${ECMC_PLG_CFG=""}-1]")

ecmcFileExist("ecmcMcuConfigs.db",1,1)
dbLoadRecords("ecmcMcuConfigs.db","P=${ECMC_PREFIX},DS_IDS='${ECMC_DS_CFG=""}', PLG_IDS='${ECMC_PLG_CFG=""}',M_ID=${ECMC_EC_MASTER_ID=-1}")

epicsEnvUnset(ECMC_DS_CFG)
epicsEnvUnset(ECMC_PLG_CFG)

#- START
ecmcConfigOrDie "Cfg.SetAppMode(1)"
