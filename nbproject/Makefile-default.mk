#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=ANALOG_DIGITAL.asm config.asm digital_analog_12bit.asm main.asm spi.asm frequency_mixer.asm multiplication.asm VolumeControl.asm division.asm LCD.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ANALOG_DIGITAL.o ${OBJECTDIR}/config.o ${OBJECTDIR}/digital_analog_12bit.o ${OBJECTDIR}/main.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/frequency_mixer.o ${OBJECTDIR}/multiplication.o ${OBJECTDIR}/VolumeControl.o ${OBJECTDIR}/division.o ${OBJECTDIR}/LCD.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ANALOG_DIGITAL.o.d ${OBJECTDIR}/config.o.d ${OBJECTDIR}/digital_analog_12bit.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/spi.o.d ${OBJECTDIR}/frequency_mixer.o.d ${OBJECTDIR}/multiplication.o.d ${OBJECTDIR}/VolumeControl.o.d ${OBJECTDIR}/division.o.d ${OBJECTDIR}/LCD.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ANALOG_DIGITAL.o ${OBJECTDIR}/config.o ${OBJECTDIR}/digital_analog_12bit.o ${OBJECTDIR}/main.o ${OBJECTDIR}/spi.o ${OBJECTDIR}/frequency_mixer.o ${OBJECTDIR}/multiplication.o ${OBJECTDIR}/VolumeControl.o ${OBJECTDIR}/division.o ${OBJECTDIR}/LCD.o

# Source Files
SOURCEFILES=ANALOG_DIGITAL.asm config.asm digital_analog_12bit.asm main.asm spi.asm frequency_mixer.asm multiplication.asm VolumeControl.asm division.asm LCD.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18f87k22
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ANALOG_DIGITAL.o: ANALOG_DIGITAL.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ANALOG_DIGITAL.o.d 
	@${RM} ${OBJECTDIR}/ANALOG_DIGITAL.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ANALOG_DIGITAL.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ANALOG_DIGITAL.lst\" -e\"${OBJECTDIR}/ANALOG_DIGITAL.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ANALOG_DIGITAL.o\" \"ANALOG_DIGITAL.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ANALOG_DIGITAL.o"
	@${FIXDEPS} "${OBJECTDIR}/ANALOG_DIGITAL.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/digital_analog_12bit.o: digital_analog_12bit.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/digital_analog_12bit.o.d 
	@${RM} ${OBJECTDIR}/digital_analog_12bit.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/digital_analog_12bit.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/digital_analog_12bit.lst\" -e\"${OBJECTDIR}/digital_analog_12bit.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/digital_analog_12bit.o\" \"digital_analog_12bit.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/digital_analog_12bit.o"
	@${FIXDEPS} "${OBJECTDIR}/digital_analog_12bit.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/main.o: main.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/main.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/main.lst\" -e\"${OBJECTDIR}/main.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/main.o\" \"main.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/main.o"
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/spi.o: spi.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/spi.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/spi.lst\" -e\"${OBJECTDIR}/spi.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/spi.o\" \"spi.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/spi.o"
	@${FIXDEPS} "${OBJECTDIR}/spi.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/frequency_mixer.o: frequency_mixer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/frequency_mixer.o.d 
	@${RM} ${OBJECTDIR}/frequency_mixer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/frequency_mixer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/frequency_mixer.lst\" -e\"${OBJECTDIR}/frequency_mixer.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/frequency_mixer.o\" \"frequency_mixer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/frequency_mixer.o"
	@${FIXDEPS} "${OBJECTDIR}/frequency_mixer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/multiplication.o: multiplication.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/multiplication.o.d 
	@${RM} ${OBJECTDIR}/multiplication.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/multiplication.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/multiplication.lst\" -e\"${OBJECTDIR}/multiplication.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/multiplication.o\" \"multiplication.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/multiplication.o"
	@${FIXDEPS} "${OBJECTDIR}/multiplication.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/VolumeControl.o: VolumeControl.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/VolumeControl.o.d 
	@${RM} ${OBJECTDIR}/VolumeControl.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/VolumeControl.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/VolumeControl.lst\" -e\"${OBJECTDIR}/VolumeControl.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/VolumeControl.o\" \"VolumeControl.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/VolumeControl.o"
	@${FIXDEPS} "${OBJECTDIR}/VolumeControl.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/division.o: division.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/division.o.d 
	@${RM} ${OBJECTDIR}/division.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/division.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/division.lst\" -e\"${OBJECTDIR}/division.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/division.o\" \"division.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/division.o"
	@${FIXDEPS} "${OBJECTDIR}/division.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_ICD3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/ANALOG_DIGITAL.o: ANALOG_DIGITAL.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ANALOG_DIGITAL.o.d 
	@${RM} ${OBJECTDIR}/ANALOG_DIGITAL.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/ANALOG_DIGITAL.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/ANALOG_DIGITAL.lst\" -e\"${OBJECTDIR}/ANALOG_DIGITAL.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/ANALOG_DIGITAL.o\" \"ANALOG_DIGITAL.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/ANALOG_DIGITAL.o"
	@${FIXDEPS} "${OBJECTDIR}/ANALOG_DIGITAL.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/digital_analog_12bit.o: digital_analog_12bit.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/digital_analog_12bit.o.d 
	@${RM} ${OBJECTDIR}/digital_analog_12bit.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/digital_analog_12bit.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/digital_analog_12bit.lst\" -e\"${OBJECTDIR}/digital_analog_12bit.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/digital_analog_12bit.o\" \"digital_analog_12bit.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/digital_analog_12bit.o"
	@${FIXDEPS} "${OBJECTDIR}/digital_analog_12bit.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/main.o: main.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/main.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/main.lst\" -e\"${OBJECTDIR}/main.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/main.o\" \"main.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/main.o"
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/spi.o: spi.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/spi.o.d 
	@${RM} ${OBJECTDIR}/spi.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/spi.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/spi.lst\" -e\"${OBJECTDIR}/spi.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/spi.o\" \"spi.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/spi.o"
	@${FIXDEPS} "${OBJECTDIR}/spi.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/frequency_mixer.o: frequency_mixer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/frequency_mixer.o.d 
	@${RM} ${OBJECTDIR}/frequency_mixer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/frequency_mixer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/frequency_mixer.lst\" -e\"${OBJECTDIR}/frequency_mixer.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/frequency_mixer.o\" \"frequency_mixer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/frequency_mixer.o"
	@${FIXDEPS} "${OBJECTDIR}/frequency_mixer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/multiplication.o: multiplication.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/multiplication.o.d 
	@${RM} ${OBJECTDIR}/multiplication.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/multiplication.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/multiplication.lst\" -e\"${OBJECTDIR}/multiplication.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/multiplication.o\" \"multiplication.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/multiplication.o"
	@${FIXDEPS} "${OBJECTDIR}/multiplication.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/VolumeControl.o: VolumeControl.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/VolumeControl.o.d 
	@${RM} ${OBJECTDIR}/VolumeControl.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/VolumeControl.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/VolumeControl.lst\" -e\"${OBJECTDIR}/VolumeControl.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/VolumeControl.o\" \"VolumeControl.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/VolumeControl.o"
	@${FIXDEPS} "${OBJECTDIR}/VolumeControl.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/division.o: division.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/division.o.d 
	@${RM} ${OBJECTDIR}/division.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/division.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/division.lst\" -e\"${OBJECTDIR}/division.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/division.o\" \"division.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/division.o"
	@${FIXDEPS} "${OBJECTDIR}/division.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_ICD3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/Voice-changer-project.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
