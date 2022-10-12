// Created with Corsair v1.0.2
#ifndef __REGS_H
#define __REGS_H

#define __I  volatile const // 'read only' permissions
#define __O  volatile       // 'write only' permissions
#define __IO volatile       // 'read / write' permissions

#include "stdint.h"

#ifdef __cplusplus
extern "C" {
#endif

#define CSR_BASE_ADDR 0x1a110000

// I_BIAS_CONTROL - Control register.
#define CSR_I_BIAS_CONTROL_ADDR 0x0
#define CSR_I_BIAS_CONTROL_RESET 0x0
typedef struct {
    uint32_t POWER_DOWN : 3; // Selection of devices to power down
} csr_i_bias_control_t;

// I_BIAS_CONTROL.power_down - Selection of devices to power down
#define CSR_I_BIAS_CONTROL_POWER_DOWN_WIDTH 3
#define CSR_I_BIAS_CONTROL_POWER_DOWN_LSB 0
#define CSR_I_BIAS_CONTROL_POWER_DOWN_MASK 0x0
#define CSR_I_BIAS_CONTROL_POWER_DOWN_RESET 0x0
typedef enum {
    CSR_I_BIAS_CONTROL_POWER_DOWN_COMMON = 0x1, //power down general Vref
    CSR_I_BIAS_CONTROL_POWER_DOWN_ADC1 = 0x2, //power down ADC1 Vref
    CSR_I_BIAS_CONTROL_POWER_DOWN_ADC2 = 0x4, //power down ADC2 Vref
    CSR_I_BIAS_CONTROL_POWER_DOWN_ALL = 0x7, //power down all 3 Vref
} csr_i_bias_control_power_down_t;

// I_BIAS_SW - Switch configuration
#define CSR_I_BIAS_SW_ADDR 0x4
#define CSR_I_BIAS_SW_RESET 0x3
typedef struct {
    uint32_t SOURCE_SEL : 2; // Selection of Vref source
} csr_i_bias_sw_t;

// I_BIAS_SW.source_sel - Selection of Vref source
#define CSR_I_BIAS_SW_SOURCE_SEL_WIDTH 2
#define CSR_I_BIAS_SW_SOURCE_SEL_LSB 0
#define CSR_I_BIAS_SW_SOURCE_SEL_MASK 0x4
#define CSR_I_BIAS_SW_SOURCE_SEL_RESET 0x3
typedef enum {
    CSR_I_BIAS_SW_SOURCE_SEL_INT = 0x1, //activate internal resistive voltage divider
    CSR_I_BIAS_SW_SOURCE_SEL_EXT = 0x2, //connect external Vref pad
} csr_i_bias_sw_source_sel_t;

// PGA1_CONTROL - Control register.
#define CSR_PGA1_CONTROL_ADDR 0x100
#define CSR_PGA1_CONTROL_RESET 0x0
typedef struct {
    uint32_t POWER_DOWN : 3; // Selection of devices to power down
} csr_pga1_control_t;

// PGA1_CONTROL.power_down - Selection of devices to power down
#define CSR_PGA1_CONTROL_POWER_DOWN_WIDTH 3
#define CSR_PGA1_CONTROL_POWER_DOWN_LSB 0
#define CSR_PGA1_CONTROL_POWER_DOWN_MASK 0x100
#define CSR_PGA1_CONTROL_POWER_DOWN_RESET 0x0
typedef enum {
    CSR_PGA1_CONTROL_POWER_DOWN_OP1 = 0x1, //power down OPAMP1
    CSR_PGA1_CONTROL_POWER_DOWN_OP2 = 0x2, //power down OPAMP2
    CSR_PGA1_CONTROL_POWER_DOWN_DIFFAMP = 0x4, //power down DIFFAMP
    CSR_PGA1_CONTROL_POWER_DOWN_ALL = 0x7, //power down all 3 opamps
} csr_pga1_control_power_down_t;

// PGA1_INT_SW - Switch configuration for internal connectivity
#define CSR_PGA1_INT_SW_ADDR 0x110
#define CSR_PGA1_INT_SW_RESET 0x3f00
typedef struct {
    uint32_t OFFSET_COMPENSATION : 6; // Selection of switches that are to be put into offset compensation mode
    uint32_t :8; // reserved
    uint32_t SE : 2; // LNA input connection switch
    uint32_t :10; // reserved
    uint32_t SM : 2; // diffamp input connection switch
    uint32_t :12; // reserved
    uint32_t SC : 2; // LNA feedback cap switch
} csr_pga1_int_sw_t;

// PGA1_INT_SW.offset_compensation - Selection of switches that are to be put into offset compensation mode
#define CSR_PGA1_INT_SW_OFFSET_COMPENSATION_WIDTH 6
#define CSR_PGA1_INT_SW_OFFSET_COMPENSATION_LSB 0
#define CSR_PGA1_INT_SW_OFFSET_COMPENSATION_MASK 0x110
#define CSR_PGA1_INT_SW_OFFSET_COMPENSATION_RESET 0x0
typedef enum {
    CSR_PGA1_INT_SW_OFFSET_COMPENSATION_OC_OP1 = 0x7, //configuration for OP1
    CSR_PGA1_INT_SW_OFFSET_COMPENSATION_OC_OP2 = 0x38, //configuration for OP2
} csr_pga1_int_sw_offset_compensation_t;

// PGA1_INT_SW.se - LNA input connection switch
#define CSR_PGA1_INT_SW_SE_WIDTH 2
#define CSR_PGA1_INT_SW_SE_LSB 8
#define CSR_PGA1_INT_SW_SE_MASK 0x110
#define CSR_PGA1_INT_SW_SE_RESET 0x3
typedef enum {
    CSR_PGA1_INT_SW_SE_OPERATION = 0x3, //configuration for normal operation
} csr_pga1_int_sw_se_t;

// PGA1_INT_SW.sm - diffamp input connection switch
#define CSR_PGA1_INT_SW_SM_WIDTH 2
#define CSR_PGA1_INT_SW_SM_LSB 10
#define CSR_PGA1_INT_SW_SM_MASK 0x110
#define CSR_PGA1_INT_SW_SM_RESET 0x3
typedef enum {
    CSR_PGA1_INT_SW_SM_OPERATION = 0x3, //configuration for normal operation
} csr_pga1_int_sw_sm_t;

// PGA1_INT_SW.sc - LNA feedback cap switch
#define CSR_PGA1_INT_SW_SC_WIDTH 2
#define CSR_PGA1_INT_SW_SC_LSB 12
#define CSR_PGA1_INT_SW_SC_MASK 0x110
#define CSR_PGA1_INT_SW_SC_RESET 0x3
typedef enum {
    CSR_PGA1_INT_SW_SC_OPERATION = 0x3, //configuration for normal operation
} csr_pga1_int_sw_sc_t;

// PGA1_TST_SW - Switch configuration for testpad connectivity
#define CSR_PGA1_TST_SW_ADDR 0x120
#define CSR_PGA1_TST_SW_RESET 0xf1
typedef struct {
    uint32_t SI : 6; // SI switches that are connected to testpads
    uint32_t :6; // reserved
    uint32_t SO : 4; // SO switches that are connected to testpads
} csr_pga1_tst_sw_t;

// PGA1_TST_SW.si - SI switches that are connected to testpads
#define CSR_PGA1_TST_SW_SI_WIDTH 6
#define CSR_PGA1_TST_SW_SI_LSB 0
#define CSR_PGA1_TST_SW_SI_MASK 0x120
#define CSR_PGA1_TST_SW_SI_RESET 0x31
typedef enum {
    CSR_PGA1_TST_SW_SI_OPERATION = 0x0, //configuration for normal operation
} csr_pga1_tst_sw_si_t;

// PGA1_TST_SW.so - SO switches that are connected to testpads
#define CSR_PGA1_TST_SW_SO_WIDTH 4
#define CSR_PGA1_TST_SW_SO_LSB 6
#define CSR_PGA1_TST_SW_SO_MASK 0x120
#define CSR_PGA1_TST_SW_SO_RESET 0x3
typedef enum {
    CSR_PGA1_TST_SW_SO_OPERATION = 0x0, //configuration for normal operation
} csr_pga1_tst_sw_so_t;

// PGA1_OC1 - Offset compensation values for OPAMP1
#define CSR_PGA1_OC1_ADDR 0x140
#define CSR_PGA1_OC1_RESET 0x0
typedef struct {
    uint32_t OC1_P : 8; // P side
    uint32_t :8; // reserved
    uint32_t OC1_N : 8; // N side
} csr_pga1_oc1_t;

// PGA1_OC1.OC1_P - P side
#define CSR_PGA1_OC1_OC1_P_WIDTH 8
#define CSR_PGA1_OC1_OC1_P_LSB 0
#define CSR_PGA1_OC1_OC1_P_MASK 0x140
#define CSR_PGA1_OC1_OC1_P_RESET 0x0

// PGA1_OC1.OC1_N - N side
#define CSR_PGA1_OC1_OC1_N_WIDTH 8
#define CSR_PGA1_OC1_OC1_N_LSB 8
#define CSR_PGA1_OC1_OC1_N_MASK 0x140
#define CSR_PGA1_OC1_OC1_N_RESET 0x0

// PGA1_OC2 - Offset compensation values for OPAMP2
#define CSR_PGA1_OC2_ADDR 0x144
#define CSR_PGA1_OC2_RESET 0x0
typedef struct {
    uint32_t OC1_P : 8; // P side
    uint32_t :8; // reserved
    uint32_t OC1_N : 8; // N side
} csr_pga1_oc2_t;

// PGA1_OC2.OC1_P - P side
#define CSR_PGA1_OC2_OC1_P_WIDTH 8
#define CSR_PGA1_OC2_OC1_P_LSB 0
#define CSR_PGA1_OC2_OC1_P_MASK 0x144
#define CSR_PGA1_OC2_OC1_P_RESET 0x0

// PGA1_OC2.OC1_N - N side
#define CSR_PGA1_OC2_OC1_N_WIDTH 8
#define CSR_PGA1_OC2_OC1_N_LSB 8
#define CSR_PGA1_OC2_OC1_N_MASK 0x144
#define CSR_PGA1_OC2_OC1_N_RESET 0x0

// PGA1_GAIN1 - Gain for first amplifier stage
#define CSR_PGA1_GAIN1_ADDR 0x150
#define CSR_PGA1_GAIN1_RESET 0x1
typedef struct {
    uint32_t GAIN : 7; // gain; linear between 1 and 128
} csr_pga1_gain1_t;

// PGA1_GAIN1.gain - gain; linear between 1 and 128
#define CSR_PGA1_GAIN1_GAIN_WIDTH 7
#define CSR_PGA1_GAIN1_GAIN_LSB 0
#define CSR_PGA1_GAIN1_GAIN_MASK 0x150
#define CSR_PGA1_GAIN1_GAIN_RESET 0x1
typedef enum {
    CSR_PGA1_GAIN1_GAIN_MIN = 0x0, //gain = 1
    CSR_PGA1_GAIN1_GAIN_MAX = 0x7f, //gain = 128
} csr_pga1_gain1_gain_t;

// PGA1_GAIN2_1 - Gain for second amplifier stage, P path
#define CSR_PGA1_GAIN2_1_ADDR 0x160
#define CSR_PGA1_GAIN2_1_RESET 0x1
typedef struct {
    uint32_t GAIN : 3; // gain; linear between 0.5 and 4
} csr_pga1_gain2_1_t;

// PGA1_GAIN2_1.gain - gain; linear between 0.5 and 4
#define CSR_PGA1_GAIN2_1_GAIN_WIDTH 3
#define CSR_PGA1_GAIN2_1_GAIN_LSB 0
#define CSR_PGA1_GAIN2_1_GAIN_MASK 0x160
#define CSR_PGA1_GAIN2_1_GAIN_RESET 0x1
typedef enum {
    CSR_PGA1_GAIN2_1_GAIN_BREAK = 0x0, //decouple diffamp input from LNA output
    CSR_PGA1_GAIN2_1_GAIN_MIN = 0x1, //gain = 0.5
    CSR_PGA1_GAIN2_1_GAIN_MAX = 0x7, //gain = 3.5
} csr_pga1_gain2_1_gain_t;

// PGA1_GAIN2_2 - Gain for second amplifier stage, N path
#define CSR_PGA1_GAIN2_2_ADDR 0x164
#define CSR_PGA1_GAIN2_2_RESET 0x1
typedef struct {
    uint32_t GAIN : 3; // gain; linear between 0.5 and 3.5
} csr_pga1_gain2_2_t;

// PGA1_GAIN2_2.gain - gain; linear between 0.5 and 3.5
#define CSR_PGA1_GAIN2_2_GAIN_WIDTH 3
#define CSR_PGA1_GAIN2_2_GAIN_LSB 0
#define CSR_PGA1_GAIN2_2_GAIN_MASK 0x164
#define CSR_PGA1_GAIN2_2_GAIN_RESET 0x1
typedef enum {
    CSR_PGA1_GAIN2_2_GAIN_BREAK = 0x0, //decouple diffamp input from LNA output
    CSR_PGA1_GAIN2_2_GAIN_MIN = 0x1, //gain = 0.5
    CSR_PGA1_GAIN2_2_GAIN_MAX = 0x7, //gain = 3.5
} csr_pga1_gain2_2_gain_t;

// PGA2_CONTROL - Control register.
#define CSR_PGA2_CONTROL_ADDR 0x200
#define CSR_PGA2_CONTROL_RESET 0x0
typedef struct {
    uint32_t POWER_DOWN : 3; // Selection of devices to power down
} csr_pga2_control_t;

// PGA2_CONTROL.power_down - Selection of devices to power down
#define CSR_PGA2_CONTROL_POWER_DOWN_WIDTH 3
#define CSR_PGA2_CONTROL_POWER_DOWN_LSB 0
#define CSR_PGA2_CONTROL_POWER_DOWN_MASK 0x200
#define CSR_PGA2_CONTROL_POWER_DOWN_RESET 0x0
typedef enum {
    CSR_PGA2_CONTROL_POWER_DOWN_OP1 = 0x1, //power down OPAMP1
    CSR_PGA2_CONTROL_POWER_DOWN_OP2 = 0x2, //power down OPAMP2
    CSR_PGA2_CONTROL_POWER_DOWN_DIFFAMP = 0x4, //power down DIFFAMP
    CSR_PGA2_CONTROL_POWER_DOWN_ALL = 0x7, //power down all 3 opamps
} csr_pga2_control_power_down_t;

// PGA2_INT_SW - Switch configuration for internal connectivity
#define CSR_PGA2_INT_SW_ADDR 0x210
#define CSR_PGA2_INT_SW_RESET 0x3f00
typedef struct {
    uint32_t OFFSET_COMPENSATION : 6; // Selection of switches that are to be put into offset compensation mode
    uint32_t :8; // reserved
    uint32_t SE : 2; // LNA input connection switch
    uint32_t :10; // reserved
    uint32_t SM : 2; // diffamp input connection switch
    uint32_t :12; // reserved
    uint32_t SC : 2; // LNA feedback cap switch
} csr_pga2_int_sw_t;

// PGA2_INT_SW.offset_compensation - Selection of switches that are to be put into offset compensation mode
#define CSR_PGA2_INT_SW_OFFSET_COMPENSATION_WIDTH 6
#define CSR_PGA2_INT_SW_OFFSET_COMPENSATION_LSB 0
#define CSR_PGA2_INT_SW_OFFSET_COMPENSATION_MASK 0x210
#define CSR_PGA2_INT_SW_OFFSET_COMPENSATION_RESET 0x0
typedef enum {
    CSR_PGA2_INT_SW_OFFSET_COMPENSATION_OC_OP1 = 0x7, //configuration for OP1
    CSR_PGA2_INT_SW_OFFSET_COMPENSATION_OC_OP2 = 0x38, //configuration for OP2
} csr_pga2_int_sw_offset_compensation_t;

// PGA2_INT_SW.se - LNA input connection switch
#define CSR_PGA2_INT_SW_SE_WIDTH 2
#define CSR_PGA2_INT_SW_SE_LSB 8
#define CSR_PGA2_INT_SW_SE_MASK 0x210
#define CSR_PGA2_INT_SW_SE_RESET 0x3
typedef enum {
    CSR_PGA2_INT_SW_SE_OPERATION = 0x3, //configuration for normal operation
} csr_pga2_int_sw_se_t;

// PGA2_INT_SW.sm - diffamp input connection switch
#define CSR_PGA2_INT_SW_SM_WIDTH 2
#define CSR_PGA2_INT_SW_SM_LSB 10
#define CSR_PGA2_INT_SW_SM_MASK 0x210
#define CSR_PGA2_INT_SW_SM_RESET 0x3
typedef enum {
    CSR_PGA2_INT_SW_SM_OPERATION = 0x3, //configuration for normal operation
} csr_pga2_int_sw_sm_t;

// PGA2_INT_SW.sc - LNA feedback cap switch
#define CSR_PGA2_INT_SW_SC_WIDTH 2
#define CSR_PGA2_INT_SW_SC_LSB 12
#define CSR_PGA2_INT_SW_SC_MASK 0x210
#define CSR_PGA2_INT_SW_SC_RESET 0x3
typedef enum {
    CSR_PGA2_INT_SW_SC_OPERATION = 0x3, //configuration for normal operation
} csr_pga2_int_sw_sc_t;

// PGA2_TST_SW - Switch configuration for testpad connectivity
#define CSR_PGA2_TST_SW_ADDR 0x220
#define CSR_PGA2_TST_SW_RESET 0xf1
typedef struct {
    uint32_t SI : 6; // SI switches that are connected to testpads
    uint32_t :6; // reserved
    uint32_t SO : 4; // SO switches that are connected to testpads
} csr_pga2_tst_sw_t;

// PGA2_TST_SW.si - SI switches that are connected to testpads
#define CSR_PGA2_TST_SW_SI_WIDTH 6
#define CSR_PGA2_TST_SW_SI_LSB 0
#define CSR_PGA2_TST_SW_SI_MASK 0x220
#define CSR_PGA2_TST_SW_SI_RESET 0x31
typedef enum {
    CSR_PGA2_TST_SW_SI_OPERATION = 0x0, //configuration for normal operation
} csr_pga2_tst_sw_si_t;

// PGA2_TST_SW.so - SO switches that are connected to testpads
#define CSR_PGA2_TST_SW_SO_WIDTH 4
#define CSR_PGA2_TST_SW_SO_LSB 6
#define CSR_PGA2_TST_SW_SO_MASK 0x220
#define CSR_PGA2_TST_SW_SO_RESET 0x3
typedef enum {
    CSR_PGA2_TST_SW_SO_OPERATION = 0x0, //configuration for normal operation
} csr_pga2_tst_sw_so_t;

// PGA2_OC1 - Offset compensation values for OPAMP1
#define CSR_PGA2_OC1_ADDR 0x240
#define CSR_PGA2_OC1_RESET 0x0
typedef struct {
    uint32_t OC1_P : 8; // P side
    uint32_t :8; // reserved
    uint32_t OC1_N : 8; // N side
} csr_pga2_oc1_t;

// PGA2_OC1.OC1_P - P side
#define CSR_PGA2_OC1_OC1_P_WIDTH 8
#define CSR_PGA2_OC1_OC1_P_LSB 0
#define CSR_PGA2_OC1_OC1_P_MASK 0x240
#define CSR_PGA2_OC1_OC1_P_RESET 0x0

// PGA2_OC1.OC1_N - N side
#define CSR_PGA2_OC1_OC1_N_WIDTH 8
#define CSR_PGA2_OC1_OC1_N_LSB 8
#define CSR_PGA2_OC1_OC1_N_MASK 0x240
#define CSR_PGA2_OC1_OC1_N_RESET 0x0

// PGA2_OC2 - Offset compensation values for OPAMP2
#define CSR_PGA2_OC2_ADDR 0x244
#define CSR_PGA2_OC2_RESET 0x0
typedef struct {
    uint32_t OC1_P : 8; // P side
    uint32_t :8; // reserved
    uint32_t OC1_N : 8; // N side
} csr_pga2_oc2_t;

// PGA2_OC2.OC1_P - P side
#define CSR_PGA2_OC2_OC1_P_WIDTH 8
#define CSR_PGA2_OC2_OC1_P_LSB 0
#define CSR_PGA2_OC2_OC1_P_MASK 0x244
#define CSR_PGA2_OC2_OC1_P_RESET 0x0

// PGA2_OC2.OC1_N - N side
#define CSR_PGA2_OC2_OC1_N_WIDTH 8
#define CSR_PGA2_OC2_OC1_N_LSB 8
#define CSR_PGA2_OC2_OC1_N_MASK 0x244
#define CSR_PGA2_OC2_OC1_N_RESET 0x0

// PGA2_GAIN1 - Gain for first amplifier stage
#define CSR_PGA2_GAIN1_ADDR 0x250
#define CSR_PGA2_GAIN1_RESET 0x13
typedef struct {
    uint32_t GAIN : 7; // gain; linear between 1 and 128
} csr_pga2_gain1_t;

// PGA2_GAIN1.gain - gain; linear between 1 and 128
#define CSR_PGA2_GAIN1_GAIN_WIDTH 7
#define CSR_PGA2_GAIN1_GAIN_LSB 0
#define CSR_PGA2_GAIN1_GAIN_MASK 0x250
#define CSR_PGA2_GAIN1_GAIN_RESET 0x13
typedef enum {
    CSR_PGA2_GAIN1_GAIN_MIN = 0x0, //gain = 1
    CSR_PGA2_GAIN1_GAIN_MAX = 0x7f, //gain = 128
} csr_pga2_gain1_gain_t;

// PGA2_GAIN2_1 - Gain for second amplifier stage, P path
#define CSR_PGA2_GAIN2_1_ADDR 0x260
#define CSR_PGA2_GAIN2_1_RESET 0x4
typedef struct {
    uint32_t GAIN : 3; // gain; linear between 0.5 and 3.5
} csr_pga2_gain2_1_t;

// PGA2_GAIN2_1.gain - gain; linear between 0.5 and 3.5
#define CSR_PGA2_GAIN2_1_GAIN_WIDTH 3
#define CSR_PGA2_GAIN2_1_GAIN_LSB 0
#define CSR_PGA2_GAIN2_1_GAIN_MASK 0x260
#define CSR_PGA2_GAIN2_1_GAIN_RESET 0x4
typedef enum {
    CSR_PGA2_GAIN2_1_GAIN_BREAK = 0x0, //decouple diffamp input from LNA output
    CSR_PGA2_GAIN2_1_GAIN_MIN = 0x1, //gain = 0.5
    CSR_PGA2_GAIN2_1_GAIN_MAX = 0x7, //gain = 4
} csr_pga2_gain2_1_gain_t;

// PGA2_GAIN2_2 - Gain for second amplifier stage, N path
#define CSR_PGA2_GAIN2_2_ADDR 0x264
#define CSR_PGA2_GAIN2_2_RESET 0x4
typedef struct {
    uint32_t GAIN : 3; // gain; linear between 0.5 and 3.5
} csr_pga2_gain2_2_t;

// PGA2_GAIN2_2.gain - gain; linear between 0.5 and 3.5
#define CSR_PGA2_GAIN2_2_GAIN_WIDTH 3
#define CSR_PGA2_GAIN2_2_GAIN_LSB 0
#define CSR_PGA2_GAIN2_2_GAIN_MASK 0x264
#define CSR_PGA2_GAIN2_2_GAIN_RESET 0x4
typedef enum {
    CSR_PGA2_GAIN2_2_GAIN_BREAK = 0x0, //decouple diffamp input from LNA output
    CSR_PGA2_GAIN2_2_GAIN_MIN = 0x1, //gain = 0.5
    CSR_PGA2_GAIN2_2_GAIN_MAX = 0x7, //gain = 3.5
} csr_pga2_gain2_2_gain_t;

// TI_CONTROL - Transimpedance control register
#define CSR_TI_CONTROL_ADDR 0x280
#define CSR_TI_CONTROL_RESET 0x0
typedef struct {
    uint32_t PD : 1; // power_down
} csr_ti_control_t;

// TI_CONTROL.pd - power_down
#define CSR_TI_CONTROL_PD_WIDTH 1
#define CSR_TI_CONTROL_PD_LSB 0
#define CSR_TI_CONTROL_PD_MASK 0x280
#define CSR_TI_CONTROL_PD_RESET 0x0
typedef enum {
    CSR_TI_CONTROL_PD_OPAMP_ON = 0x0, //opamp running
    CSR_TI_CONTROL_PD_OPAMP_OFF = 0x1, //opamp power down
} csr_ti_control_pd_t;

// TI_GAIN - Transimpedance gain
#define CSR_TI_GAIN_ADDR 0x284
#define CSR_TI_GAIN_RESET 0x0
typedef struct {
    uint32_t RES : 3; // resistor selection
} csr_ti_gain_t;

// TI_GAIN.res - resistor selection
#define CSR_TI_GAIN_RES_WIDTH 3
#define CSR_TI_GAIN_RES_LSB 0
#define CSR_TI_GAIN_RES_MASK 0x284
#define CSR_TI_GAIN_RES_RESET 0x0

// TI_SW - Transimpedance switch configuration
#define CSR_TI_SW_ADDR 0x288
#define CSR_TI_SW_RESET 0x1
typedef struct {
    uint32_t TP_SWITCH : 1; // testpad on/off
} csr_ti_sw_t;

// TI_SW.tp_switch - testpad on/off
#define CSR_TI_SW_TP_SWITCH_WIDTH 1
#define CSR_TI_SW_TP_SWITCH_LSB 0
#define CSR_TI_SW_TP_SWITCH_MASK 0x288
#define CSR_TI_SW_TP_SWITCH_RESET 0x1
typedef enum {
    CSR_TI_SW_TP_SWITCH_OPERATION = 0x0, //value during normal operation
} csr_ti_sw_tp_switch_t;

// ADC1_CONTROL - Control register
#define CSR_ADC1_CONTROL_ADDR 0x300
#define CSR_ADC1_CONTROL_RESET 0x1
typedef struct {
    uint32_t EN : 1; // enable
    uint32_t :1; // reserved
    uint32_t HOLDTYPE : 1; // hold type
} csr_adc1_control_t;

// ADC1_CONTROL.en - enable
#define CSR_ADC1_CONTROL_EN_WIDTH 1
#define CSR_ADC1_CONTROL_EN_LSB 0
#define CSR_ADC1_CONTROL_EN_MASK 0x300
#define CSR_ADC1_CONTROL_EN_RESET 0x1
typedef enum {
    CSR_ADC1_CONTROL_EN_ADC_OFF = 0x0, //ADC off
    CSR_ADC1_CONTROL_EN_ADC_ON = 0x1, //ADC running
} csr_adc1_control_en_t;

// ADC1_CONTROL.holdtype - hold type
#define CSR_ADC1_CONTROL_HOLDTYPE_WIDTH 1
#define CSR_ADC1_CONTROL_HOLDTYPE_LSB 1
#define CSR_ADC1_CONTROL_HOLDTYPE_MASK 0x300
#define CSR_ADC1_CONTROL_HOLDTYPE_RESET 0x0
typedef enum {
    CSR_ADC1_CONTROL_HOLDTYPE_TH = 0x0, //track&hold
    CSR_ADC1_CONTROL_HOLDTYPE_SH = 0x1, //sample&hold
} csr_adc1_control_holdtype_t;

// ADC1_DELAY - delay settings
#define CSR_ADC1_DELAY_ADDR 0x310
#define CSR_ADC1_DELAY_RESET 0xc82
typedef struct {
    uint32_t HOLD_TIME : 5; // number of clock cycles to hold before sampling. Ignored in track&hold.
    uint32_t :5; // reserved
    uint32_t HIGH_BITS_DELAY : 4; // number of clock cycles to wait after switching bits 9..7
    uint32_t :9; // reserved
    uint32_t MID_BITS_DELAY : 2; // number of clock cycles to wait after switching bits 6..4
    uint32_t :11; // reserved
    uint32_t LOW_BITS_DELAY : 2; // number of clock cycles to wait after switching bits 3..0
} csr_adc1_delay_t;

// ADC1_DELAY.hold_time - number of clock cycles to hold before sampling. Ignored in track&hold.
#define CSR_ADC1_DELAY_HOLD_TIME_WIDTH 5
#define CSR_ADC1_DELAY_HOLD_TIME_LSB 0
#define CSR_ADC1_DELAY_HOLD_TIME_MASK 0x310
#define CSR_ADC1_DELAY_HOLD_TIME_RESET 0x2

// ADC1_DELAY.high_bits_delay - number of clock cycles to wait after switching bits 9..7
#define CSR_ADC1_DELAY_HIGH_BITS_DELAY_WIDTH 4
#define CSR_ADC1_DELAY_HIGH_BITS_DELAY_LSB 5
#define CSR_ADC1_DELAY_HIGH_BITS_DELAY_MASK 0x310
#define CSR_ADC1_DELAY_HIGH_BITS_DELAY_RESET 0x4

// ADC1_DELAY.mid_bits_delay - number of clock cycles to wait after switching bits 6..4
#define CSR_ADC1_DELAY_MID_BITS_DELAY_WIDTH 2
#define CSR_ADC1_DELAY_MID_BITS_DELAY_LSB 9
#define CSR_ADC1_DELAY_MID_BITS_DELAY_MASK 0x310
#define CSR_ADC1_DELAY_MID_BITS_DELAY_RESET 0x2

// ADC1_DELAY.low_bits_delay - number of clock cycles to wait after switching bits 3..0
#define CSR_ADC1_DELAY_LOW_BITS_DELAY_WIDTH 2
#define CSR_ADC1_DELAY_LOW_BITS_DELAY_LSB 11
#define CSR_ADC1_DELAY_LOW_BITS_DELAY_MASK 0x310
#define CSR_ADC1_DELAY_LOW_BITS_DELAY_RESET 0x1

// ADC1_OUT - ADC output value
#define CSR_ADC1_OUT_ADDR 0x380
#define CSR_ADC1_OUT_RESET 0x0
typedef struct {
    uint32_t OUTPUT_VALUE : 12; // AD converted value
} csr_adc1_out_t;

// ADC1_OUT.output_value - AD converted value
#define CSR_ADC1_OUT_OUTPUT_VALUE_WIDTH 12
#define CSR_ADC1_OUT_OUTPUT_VALUE_LSB 0
#define CSR_ADC1_OUT_OUTPUT_VALUE_MASK 0x380
#define CSR_ADC1_OUT_OUTPUT_VALUE_RESET 0x0

// ADC2_CONTROL - Control register
#define CSR_ADC2_CONTROL_ADDR 0x400
#define CSR_ADC2_CONTROL_RESET 0x1
typedef struct {
    uint32_t EN : 1; // enable
    uint32_t :1; // reserved
    uint32_t HOLDTYPE : 1; // hold type
} csr_adc2_control_t;

// ADC2_CONTROL.en - enable
#define CSR_ADC2_CONTROL_EN_WIDTH 1
#define CSR_ADC2_CONTROL_EN_LSB 0
#define CSR_ADC2_CONTROL_EN_MASK 0x400
#define CSR_ADC2_CONTROL_EN_RESET 0x1
typedef enum {
    CSR_ADC2_CONTROL_EN_ADC_OFF = 0x0, //ADC off
    CSR_ADC2_CONTROL_EN_ADC_ON = 0x1, //ADC running
} csr_adc2_control_en_t;

// ADC2_CONTROL.holdtype - hold type
#define CSR_ADC2_CONTROL_HOLDTYPE_WIDTH 1
#define CSR_ADC2_CONTROL_HOLDTYPE_LSB 1
#define CSR_ADC2_CONTROL_HOLDTYPE_MASK 0x400
#define CSR_ADC2_CONTROL_HOLDTYPE_RESET 0x0
typedef enum {
    CSR_ADC2_CONTROL_HOLDTYPE_TH = 0x0, //track&hold
    CSR_ADC2_CONTROL_HOLDTYPE_SH = 0x1, //sample&hold
} csr_adc2_control_holdtype_t;

// ADC2_DELAY - delay settings
#define CSR_ADC2_DELAY_ADDR 0x410
#define CSR_ADC2_DELAY_RESET 0xc82
typedef struct {
    uint32_t HOLD_TIME : 5; // number of clock cycles to hold before sampling. Ignored in track&hold.
    uint32_t :5; // reserved
    uint32_t HIGH_BITS_DELAY : 4; // number of clock cycles to wait after switching bits 9..7
    uint32_t :9; // reserved
    uint32_t MID_BITS_DELAY : 2; // number of clock cycles to wait after switching bits 6..4
    uint32_t :11; // reserved
    uint32_t LOW_BITS_DELAY : 2; // number of clock cycles to wait after switching bits 3..0
} csr_adc2_delay_t;

// ADC2_DELAY.hold_time - number of clock cycles to hold before sampling. Ignored in track&hold.
#define CSR_ADC2_DELAY_HOLD_TIME_WIDTH 5
#define CSR_ADC2_DELAY_HOLD_TIME_LSB 0
#define CSR_ADC2_DELAY_HOLD_TIME_MASK 0x410
#define CSR_ADC2_DELAY_HOLD_TIME_RESET 0x2

// ADC2_DELAY.high_bits_delay - number of clock cycles to wait after switching bits 9..7
#define CSR_ADC2_DELAY_HIGH_BITS_DELAY_WIDTH 4
#define CSR_ADC2_DELAY_HIGH_BITS_DELAY_LSB 5
#define CSR_ADC2_DELAY_HIGH_BITS_DELAY_MASK 0x410
#define CSR_ADC2_DELAY_HIGH_BITS_DELAY_RESET 0x4

// ADC2_DELAY.mid_bits_delay - number of clock cycles to wait after switching bits 6..4
#define CSR_ADC2_DELAY_MID_BITS_DELAY_WIDTH 2
#define CSR_ADC2_DELAY_MID_BITS_DELAY_LSB 9
#define CSR_ADC2_DELAY_MID_BITS_DELAY_MASK 0x410
#define CSR_ADC2_DELAY_MID_BITS_DELAY_RESET 0x2

// ADC2_DELAY.low_bits_delay - number of clock cycles to wait after switching bits 3..0
#define CSR_ADC2_DELAY_LOW_BITS_DELAY_WIDTH 2
#define CSR_ADC2_DELAY_LOW_BITS_DELAY_LSB 11
#define CSR_ADC2_DELAY_LOW_BITS_DELAY_MASK 0x410
#define CSR_ADC2_DELAY_LOW_BITS_DELAY_RESET 0x1

// ADC2_OUT - ADC output value
#define CSR_ADC2_OUT_ADDR 0x480
#define CSR_ADC2_OUT_RESET 0x0
typedef struct {
    uint32_t OUTPUT_VALUE : 12; // AD converted value
} csr_adc2_out_t;

// ADC2_OUT.output_value - AD converted value
#define CSR_ADC2_OUT_OUTPUT_VALUE_WIDTH 12
#define CSR_ADC2_OUT_OUTPUT_VALUE_LSB 0
#define CSR_ADC2_OUT_OUTPUT_VALUE_MASK 0x480
#define CSR_ADC2_OUT_OUTPUT_VALUE_RESET 0x0

// DAC1_CONTROL - Control register
#define CSR_DAC1_CONTROL_ADDR 0x500
#define CSR_DAC1_CONTROL_RESET 0x0
typedef struct {
    uint32_t PD : 1; // power down
} csr_dac1_control_t;

// DAC1_CONTROL.pd - power down
#define CSR_DAC1_CONTROL_PD_WIDTH 1
#define CSR_DAC1_CONTROL_PD_LSB 0
#define CSR_DAC1_CONTROL_PD_MASK 0x500
#define CSR_DAC1_CONTROL_PD_RESET 0x0
typedef enum {
    CSR_DAC1_CONTROL_PD_DAC_ON = 0x0, //ADC running
    CSR_DAC1_CONTROL_PD_DAC_OFF = 0x1, //ADC off
} csr_dac1_control_pd_t;

// DAC1_TST_SW - Switch register
#define CSR_DAC1_TST_SW_ADDR 0x510
#define CSR_DAC1_TST_SW_RESET 0x0
typedef struct {
    uint32_t SWITCH_POSITION : 1; // testpad switch position
} csr_dac1_tst_sw_t;

// DAC1_TST_SW.switch_position - testpad switch position
#define CSR_DAC1_TST_SW_SWITCH_POSITION_WIDTH 1
#define CSR_DAC1_TST_SW_SWITCH_POSITION_LSB 0
#define CSR_DAC1_TST_SW_SWITCH_POSITION_MASK 0x510
#define CSR_DAC1_TST_SW_SWITCH_POSITION_RESET 0x0
typedef enum {
    CSR_DAC1_TST_SW_SWITCH_POSITION_TP_OFF = 0x0, //testpad disconnected
    CSR_DAC1_TST_SW_SWITCH_POSITION_TP_ON = 0x1, //testpad connected
} csr_dac1_tst_sw_switch_position_t;

// DAC1_GAIN - analog gain selection
#define CSR_DAC1_GAIN_ADDR 0x520
#define CSR_DAC1_GAIN_RESET 0x1
typedef struct {
    uint32_t GAIN : 2; // gain selection (0.8, 1, 1.8)
} csr_dac1_gain_t;

// DAC1_GAIN.gain - gain selection (0.8, 1, 1.8)
#define CSR_DAC1_GAIN_GAIN_WIDTH 2
#define CSR_DAC1_GAIN_GAIN_LSB 0
#define CSR_DAC1_GAIN_GAIN_MASK 0x520
#define CSR_DAC1_GAIN_GAIN_RESET 0x1
typedef enum {
    CSR_DAC1_GAIN_GAIN_BREAK = 0x0, //decouple output buffer from DAC output
    CSR_DAC1_GAIN_GAIN_MIN = 0x1, //gain = 0.8
    CSR_DAC1_GAIN_GAIN_ONE = 0x2, //gain = 1
    CSR_DAC1_GAIN_GAIN_MAX = 0x3, //gain = 1.8 - above saturation when using sine LUT
} csr_dac1_gain_gain_t;

// DAC1_ROUT - output resistance selection
#define CSR_DAC1_ROUT_ADDR 0x530
#define CSR_DAC1_ROUT_RESET 0x3
typedef struct {
    uint32_t ROUT : 3; // output resistance selection (100k, 25k, 6.4k)
} csr_dac1_rout_t;

// DAC1_ROUT.Rout - output resistance selection (100k, 25k, 6.4k)
#define CSR_DAC1_ROUT_ROUT_WIDTH 3
#define CSR_DAC1_ROUT_ROUT_LSB 0
#define CSR_DAC1_ROUT_ROUT_MASK 0x530
#define CSR_DAC1_ROUT_ROUT_RESET 0x3

// DAC2_CONTROL - Control register
#define CSR_DAC2_CONTROL_ADDR 0x600
#define CSR_DAC2_CONTROL_RESET 0x0
typedef struct {
    uint32_t PD : 1; // power down
} csr_dac2_control_t;

// DAC2_CONTROL.pd - power down
#define CSR_DAC2_CONTROL_PD_WIDTH 1
#define CSR_DAC2_CONTROL_PD_LSB 0
#define CSR_DAC2_CONTROL_PD_MASK 0x600
#define CSR_DAC2_CONTROL_PD_RESET 0x0
typedef enum {
    CSR_DAC2_CONTROL_PD_DAC_ON = 0x0, //ADC running
    CSR_DAC2_CONTROL_PD_DAC_OFF = 0x1, //ADC off
} csr_dac2_control_pd_t;

// DAC2_TST_SW - Switch register
#define CSR_DAC2_TST_SW_ADDR 0x610
#define CSR_DAC2_TST_SW_RESET 0x0
typedef struct {
    uint32_t SWITCH_POSITION : 1; // testpad switch position
} csr_dac2_tst_sw_t;

// DAC2_TST_SW.switch_position - testpad switch position
#define CSR_DAC2_TST_SW_SWITCH_POSITION_WIDTH 1
#define CSR_DAC2_TST_SW_SWITCH_POSITION_LSB 0
#define CSR_DAC2_TST_SW_SWITCH_POSITION_MASK 0x610
#define CSR_DAC2_TST_SW_SWITCH_POSITION_RESET 0x0
typedef enum {
    CSR_DAC2_TST_SW_SWITCH_POSITION_TP_OFF = 0x0, //testpad disconnected
    CSR_DAC2_TST_SW_SWITCH_POSITION_TP_ON = 0x1, //testpad connected
} csr_dac2_tst_sw_switch_position_t;

// DAC2_GAIN - analog gain selection
#define CSR_DAC2_GAIN_ADDR 0x620
#define CSR_DAC2_GAIN_RESET 0x1
typedef struct {
    uint32_t GAIN : 2; // gain selection (0.8, 1, 1.8)
} csr_dac2_gain_t;

// DAC2_GAIN.gain - gain selection (0.8, 1, 1.8)
#define CSR_DAC2_GAIN_GAIN_WIDTH 2
#define CSR_DAC2_GAIN_GAIN_LSB 0
#define CSR_DAC2_GAIN_GAIN_MASK 0x620
#define CSR_DAC2_GAIN_GAIN_RESET 0x1
typedef enum {
    CSR_DAC2_GAIN_GAIN_BREAK = 0x0, //decouple output buffer from DAC output
    CSR_DAC2_GAIN_GAIN_MIN = 0x1, //gain = 0.8
    CSR_DAC2_GAIN_GAIN_ONE = 0x2, //gain = 1
    CSR_DAC2_GAIN_GAIN_MAX = 0x3, //gain = 1.8 - above saturation when using sine LUT
} csr_dac2_gain_gain_t;

// DAC2_ROUT - output resistance selection
#define CSR_DAC2_ROUT_ADDR 0x630
#define CSR_DAC2_ROUT_RESET 0x3
typedef struct {
    uint32_t ROUT : 3; // output resistance selection (100k, 25k, 6.4k)
} csr_dac2_rout_t;

// DAC2_ROUT.Rout - output resistance selection (100k, 25k, 6.4k)
#define CSR_DAC2_ROUT_ROUT_WIDTH 3
#define CSR_DAC2_ROUT_ROUT_LSB 0
#define CSR_DAC2_ROUT_ROUT_MASK 0x630
#define CSR_DAC2_ROUT_ROUT_RESET 0x3

// SINE_LUT_STEP - step size selection
#define CSR_SINE_LUT_STEP_ADDR 0x710
#define CSR_SINE_LUT_STEP_RESET 0x1
typedef struct {
    uint32_t STEP_SIZE : 10; // step size selection (in 1 / 1024 per rotation)
} csr_sine_lut_step_t;

// SINE_LUT_STEP.step_size - step size selection (in 1 / 1024 per rotation)
#define CSR_SINE_LUT_STEP_STEP_SIZE_WIDTH 10
#define CSR_SINE_LUT_STEP_STEP_SIZE_LSB 0
#define CSR_SINE_LUT_STEP_STEP_SIZE_MASK 0x710
#define CSR_SINE_LUT_STEP_STEP_SIZE_RESET 0x1

// SINE_LUT_OUT0 - current sine at 0° tap
#define CSR_SINE_LUT_OUT0_ADDR 0x780
#define CSR_SINE_LUT_OUT0_RESET 0x0
typedef struct {
    uint32_t OUT0 : 10; // current sine at 0° tap
} csr_sine_lut_out0_t;

// SINE_LUT_OUT0.out0 - current sine at 0° tap
#define CSR_SINE_LUT_OUT0_OUT0_WIDTH 10
#define CSR_SINE_LUT_OUT0_OUT0_LSB 0
#define CSR_SINE_LUT_OUT0_OUT0_MASK 0x780
#define CSR_SINE_LUT_OUT0_OUT0_RESET 0x0

// SINE_LUT_OUT90 - current sine at 90° tap
#define CSR_SINE_LUT_OUT90_ADDR 0x784
#define CSR_SINE_LUT_OUT90_RESET 0x0
typedef struct {
    uint32_t OUT0 : 10; // current sine at 90° tap
} csr_sine_lut_out90_t;

// SINE_LUT_OUT90.out0 - current sine at 90° tap
#define CSR_SINE_LUT_OUT90_OUT0_WIDTH 10
#define CSR_SINE_LUT_OUT90_OUT0_LSB 0
#define CSR_SINE_LUT_OUT90_OUT0_MASK 0x784
#define CSR_SINE_LUT_OUT90_OUT0_RESET 0x0

// LOCKIN_PLACEHOLDER - TBD
#define CSR_LOCKIN_PLACEHOLDER_ADDR 0x800
#define CSR_LOCKIN_PLACEHOLDER_RESET 0x0
typedef struct {
    uint32_t TBD : 8; // TBD
} csr_lockin_placeholder_t;

// LOCKIN_PLACEHOLDER.TBD - TBD
#define CSR_LOCKIN_PLACEHOLDER_TBD_WIDTH 8
#define CSR_LOCKIN_PLACEHOLDER_TBD_LSB 0
#define CSR_LOCKIN_PLACEHOLDER_TBD_MASK 0x800
#define CSR_LOCKIN_PLACEHOLDER_TBD_RESET 0x0


// Register map structure
typedef struct {
    union {
        __IO uint32_t I_BIAS_CONTROL; // Control register.
        __IO csr_i_bias_control_t I_BIAS_CONTROL_bf; // Bit access for I_BIAS_CONTROL register
    };
    union {
        __IO uint32_t I_BIAS_SW; // Switch configuration
        __IO csr_i_bias_sw_t I_BIAS_SW_bf; // Bit access for I_BIAS_SW register
    };
    __IO uint32_t RESERVED0[62];
    union {
        __IO uint32_t PGA1_CONTROL; // Control register.
        __IO csr_pga1_control_t PGA1_CONTROL_bf; // Bit access for PGA1_CONTROL register
    };
    __IO uint32_t RESERVED1[3];
    union {
        __IO uint32_t PGA1_INT_SW; // Switch configuration for internal connectivity
        __IO csr_pga1_int_sw_t PGA1_INT_SW_bf; // Bit access for PGA1_INT_SW register
    };
    __IO uint32_t RESERVED2[3];
    union {
        __IO uint32_t PGA1_TST_SW; // Switch configuration for testpad connectivity
        __IO csr_pga1_tst_sw_t PGA1_TST_SW_bf; // Bit access for PGA1_TST_SW register
    };
    __IO uint32_t RESERVED3[7];
    union {
        __IO uint32_t PGA1_OC1; // Offset compensation values for OPAMP1
        __IO csr_pga1_oc1_t PGA1_OC1_bf; // Bit access for PGA1_OC1 register
    };
    union {
        __IO uint32_t PGA1_OC2; // Offset compensation values for OPAMP2
        __IO csr_pga1_oc2_t PGA1_OC2_bf; // Bit access for PGA1_OC2 register
    };
    __IO uint32_t RESERVED4[2];
    union {
        __IO uint32_t PGA1_GAIN1; // Gain for first amplifier stage
        __IO csr_pga1_gain1_t PGA1_GAIN1_bf; // Bit access for PGA1_GAIN1 register
    };
    __IO uint32_t RESERVED5[3];
    union {
        __IO uint32_t PGA1_GAIN2_1; // Gain for second amplifier stage, P path
        __IO csr_pga1_gain2_1_t PGA1_GAIN2_1_bf; // Bit access for PGA1_GAIN2_1 register
    };
    union {
        __IO uint32_t PGA1_GAIN2_2; // Gain for second amplifier stage, N path
        __IO csr_pga1_gain2_2_t PGA1_GAIN2_2_bf; // Bit access for PGA1_GAIN2_2 register
    };
    __IO uint32_t RESERVED6[38];
    union {
        __IO uint32_t PGA2_CONTROL; // Control register.
        __IO csr_pga2_control_t PGA2_CONTROL_bf; // Bit access for PGA2_CONTROL register
    };
    __IO uint32_t RESERVED7[3];
    union {
        __IO uint32_t PGA2_INT_SW; // Switch configuration for internal connectivity
        __IO csr_pga2_int_sw_t PGA2_INT_SW_bf; // Bit access for PGA2_INT_SW register
    };
    __IO uint32_t RESERVED8[3];
    union {
        __IO uint32_t PGA2_TST_SW; // Switch configuration for testpad connectivity
        __IO csr_pga2_tst_sw_t PGA2_TST_SW_bf; // Bit access for PGA2_TST_SW register
    };
    __IO uint32_t RESERVED9[7];
    union {
        __IO uint32_t PGA2_OC1; // Offset compensation values for OPAMP1
        __IO csr_pga2_oc1_t PGA2_OC1_bf; // Bit access for PGA2_OC1 register
    };
    union {
        __IO uint32_t PGA2_OC2; // Offset compensation values for OPAMP2
        __IO csr_pga2_oc2_t PGA2_OC2_bf; // Bit access for PGA2_OC2 register
    };
    __IO uint32_t RESERVED10[2];
    union {
        __IO uint32_t PGA2_GAIN1; // Gain for first amplifier stage
        __IO csr_pga2_gain1_t PGA2_GAIN1_bf; // Bit access for PGA2_GAIN1 register
    };
    __IO uint32_t RESERVED11[3];
    union {
        __IO uint32_t PGA2_GAIN2_1; // Gain for second amplifier stage, P path
        __IO csr_pga2_gain2_1_t PGA2_GAIN2_1_bf; // Bit access for PGA2_GAIN2_1 register
    };
    union {
        __IO uint32_t PGA2_GAIN2_2; // Gain for second amplifier stage, N path
        __IO csr_pga2_gain2_2_t PGA2_GAIN2_2_bf; // Bit access for PGA2_GAIN2_2 register
    };
    __IO uint32_t RESERVED12[6];
    union {
        __IO uint32_t TI_CONTROL; // Transimpedance control register
        __IO csr_ti_control_t TI_CONTROL_bf; // Bit access for TI_CONTROL register
    };
    union {
        __IO uint32_t TI_GAIN; // Transimpedance gain
        __IO csr_ti_gain_t TI_GAIN_bf; // Bit access for TI_GAIN register
    };
    union {
        __IO uint32_t TI_SW; // Transimpedance switch configuration
        __IO csr_ti_sw_t TI_SW_bf; // Bit access for TI_SW register
    };
    __IO uint32_t RESERVED13[29];
    union {
        __IO uint32_t ADC1_CONTROL; // Control register
        __IO csr_adc1_control_t ADC1_CONTROL_bf; // Bit access for ADC1_CONTROL register
    };
    __IO uint32_t RESERVED14[3];
    union {
        __IO uint32_t ADC1_DELAY; // delay settings
        __IO csr_adc1_delay_t ADC1_DELAY_bf; // Bit access for ADC1_DELAY register
    };
    __IO uint32_t RESERVED15[27];
    union {
        __I uint32_t ADC1_OUT; // ADC output value
        __I csr_adc1_out_t ADC1_OUT_bf; // Bit access for ADC1_OUT register
    };
    __IO uint32_t RESERVED16[31];
    union {
        __IO uint32_t ADC2_CONTROL; // Control register
        __IO csr_adc2_control_t ADC2_CONTROL_bf; // Bit access for ADC2_CONTROL register
    };
    __IO uint32_t RESERVED17[3];
    union {
        __IO uint32_t ADC2_DELAY; // delay settings
        __IO csr_adc2_delay_t ADC2_DELAY_bf; // Bit access for ADC2_DELAY register
    };
    __IO uint32_t RESERVED18[27];
    union {
        __I uint32_t ADC2_OUT; // ADC output value
        __I csr_adc2_out_t ADC2_OUT_bf; // Bit access for ADC2_OUT register
    };
    __IO uint32_t RESERVED19[31];
    union {
        __IO uint32_t DAC1_CONTROL; // Control register
        __IO csr_dac1_control_t DAC1_CONTROL_bf; // Bit access for DAC1_CONTROL register
    };
    __IO uint32_t RESERVED20[3];
    union {
        __IO uint32_t DAC1_TST_SW; // Switch register
        __IO csr_dac1_tst_sw_t DAC1_TST_SW_bf; // Bit access for DAC1_TST_SW register
    };
    __IO uint32_t RESERVED21[3];
    union {
        __IO uint32_t DAC1_GAIN; // analog gain selection
        __IO csr_dac1_gain_t DAC1_GAIN_bf; // Bit access for DAC1_GAIN register
    };
    __IO uint32_t RESERVED22[3];
    union {
        __IO uint32_t DAC1_ROUT; // output resistance selection
        __IO csr_dac1_rout_t DAC1_ROUT_bf; // Bit access for DAC1_ROUT register
    };
    __IO uint32_t RESERVED23[51];
    union {
        __IO uint32_t DAC2_CONTROL; // Control register
        __IO csr_dac2_control_t DAC2_CONTROL_bf; // Bit access for DAC2_CONTROL register
    };
    __IO uint32_t RESERVED24[3];
    union {
        __IO uint32_t DAC2_TST_SW; // Switch register
        __IO csr_dac2_tst_sw_t DAC2_TST_SW_bf; // Bit access for DAC2_TST_SW register
    };
    __IO uint32_t RESERVED25[3];
    union {
        __IO uint32_t DAC2_GAIN; // analog gain selection
        __IO csr_dac2_gain_t DAC2_GAIN_bf; // Bit access for DAC2_GAIN register
    };
    __IO uint32_t RESERVED26[3];
    union {
        __IO uint32_t DAC2_ROUT; // output resistance selection
        __IO csr_dac2_rout_t DAC2_ROUT_bf; // Bit access for DAC2_ROUT register
    };
    __IO uint32_t RESERVED27[55];
    union {
        __IO uint32_t SINE_LUT_STEP; // step size selection
        __IO csr_sine_lut_step_t SINE_LUT_STEP_bf; // Bit access for SINE_LUT_STEP register
    };
    __IO uint32_t RESERVED28[27];
    union {
        __I uint32_t SINE_LUT_OUT0; // current sine at 0° tap
        __I csr_sine_lut_out0_t SINE_LUT_OUT0_bf; // Bit access for SINE_LUT_OUT0 register
    };
    union {
        __I uint32_t SINE_LUT_OUT90; // current sine at 90° tap
        __I csr_sine_lut_out90_t SINE_LUT_OUT90_bf; // Bit access for SINE_LUT_OUT90 register
    };
    __IO uint32_t RESERVED29[30];
    union {
        __IO uint32_t LOCKIN_PLACEHOLDER; // TBD
        __IO csr_lockin_placeholder_t LOCKIN_PLACEHOLDER_bf; // Bit access for LOCKIN_PLACEHOLDER register
    };
} csr_t;

#define CSR ((csr_t*)(CSR_BASE_ADDR))

#ifdef __cplusplus
}
#endif

#endif /* __REGS_H */