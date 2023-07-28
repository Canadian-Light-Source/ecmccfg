#-d /**
#-d   \brief hardware script for EL7047-Motor-Leadshine-57HS13 (series wiring)
#-d   \details Parmetrization of EL7047 for motor Nanotec Leadshine Tecnology mod. 57HS13 (series wiring)
#-d   \file
#-d */

#- Load common config from EL7041
${SCRIPTEXEC} ${ECMC_CONFIG_ROOT}ecmcEL7041-Motor-Leadshine-57HS13-series.cmd

#- Nominal voltage 68V (unit 10mV)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0x3,6800,2)"

#- Coil inductance 8.4mH (unit 0.01mH)
ecmcConfigOrDie "Cfg.EcAddSdo(${ECMC_EC_SLAVE_NUM},0x8010,0xA,840,2)"
