#-d /**
#-d   \brief hardware script for iPOS8020-Motor-Stoegra-SM107-3-18M12-Parallel-17A
#-d   \details Parmetrization of technosoft IPOS8020 for motor Stoegra-SM107-3-18M12-Parallel (17A)
#-d   \author Anders Sandstroem
#-d   \file
#-d */

#- ###########################################################
#- ############ Parmetrization of technosoft IPOS8020 for Stoegra-SM107-3-18M12-Parallel (17A)
#-
#-   Connection Parallel connection
#-   Run current: 17A
#-   Max current protection: Run current + 3
#-   standby current: 1.0A
#-   NoMicroStepsPerStep=256
#-   NoMotorSteps=200
#-
#-
#- ###########################################################
#-d   I_RUN_SET:     Running current in amps (defualts to 10). Allowed range 0..14 
#-d   I_STDBY_SET:   Stanbby current in amps (defualts to 1) 
#-d   I_MAX_PROT:    Max current protection limit (defaults to ECMC_I_RUN_SET + 3)

ecmcFileExist("${ecmccfg_DIR}ecmciPOS8020BX-Motor-Stoegra-SM107-3-18M12-Parallel-XA.cmd")
${SCRIPTEXEC} ${ecmccfg_DIR}ecmciPOS8020BX-Motor-Stoegra-SM107-3-18M12-Parallel-XA.cmd "I_RUN_SET=17"