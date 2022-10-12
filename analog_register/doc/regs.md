# Register map

Created with [Corsair](https://github.com/esynr3z/corsair) v1.0.2.

## Conventions

| Access mode | Description               |
| :---------- | :------------------------ |
| rw          | Read and Write            |
| rw1c        | Read and Write 1 to Clear |
| rw1s        | Read and Write 1 to Set   |
| ro          | Read Only                 |
| roc         | Read Only to Clear        |
| roll        | Read Only / Latch Low     |
| rolh        | Read Only / Latch High    |
| wo          | Write only                |
| wosc        | Write Only / Self Clear   |

## Register map summary

Base address: 0x1a110000

| Name                     | Address    | Description |
| :---                     | :---       | :---        |
| [I_BIAS_CONTROL](#i_bias_control) | 0x00000000 | Control register. |
| [I_BIAS_SW](#i_bias_sw)  | 0x00000004 | Switch configuration |
| [PGA1_CONTROL](#pga1_control) | 0x00000100 | Control register. |
| [PGA1_INT_SW](#pga1_int_sw) | 0x00000110 | Switch configuration for internal connectivity |
| [PGA1_TST_SW](#pga1_tst_sw) | 0x00000120 | Switch configuration for testpad connectivity |
| [PGA1_OC1](#pga1_oc1)    | 0x00000140 | Offset compensation values for OPAMP1 |
| [PGA1_OC2](#pga1_oc2)    | 0x00000144 | Offset compensation values for OPAMP2 |
| [PGA1_GAIN1](#pga1_gain1) | 0x00000150 | Gain for first amplifier stage |
| [PGA1_GAIN2_1](#pga1_gain2_1) | 0x00000160 | Gain for second amplifier stage, P path |
| [PGA1_GAIN2_2](#pga1_gain2_2) | 0x00000164 | Gain for second amplifier stage, N path |
| [PGA2_CONTROL](#pga2_control) | 0x00000200 | Control register. |
| [PGA2_INT_SW](#pga2_int_sw) | 0x00000210 | Switch configuration for internal connectivity |
| [PGA2_TST_SW](#pga2_tst_sw) | 0x00000220 | Switch configuration for testpad connectivity |
| [PGA2_OC1](#pga2_oc1)    | 0x00000240 | Offset compensation values for OPAMP1 |
| [PGA2_OC2](#pga2_oc2)    | 0x00000244 | Offset compensation values for OPAMP2 |
| [PGA2_GAIN1](#pga2_gain1) | 0x00000250 | Gain for first amplifier stage |
| [PGA2_GAIN2_1](#pga2_gain2_1) | 0x00000260 | Gain for second amplifier stage, P path |
| [PGA2_GAIN2_2](#pga2_gain2_2) | 0x00000264 | Gain for second amplifier stage, N path |
| [TI_CONTROL](#ti_control) | 0x00000280 | Transimpedance control register |
| [TI_GAIN](#ti_gain)      | 0x00000284 | Transimpedance gain |
| [TI_SW](#ti_sw)          | 0x00000288 | Transimpedance switch configuration |
| [ADC1_CONTROL](#adc1_control) | 0x00000300 | Control register |
| [ADC1_DELAY](#adc1_delay) | 0x00000310 | delay settings |
| [ADC1_OUT](#adc1_out)    | 0x00000380 | ADC output value |
| [ADC2_CONTROL](#adc2_control) | 0x00000400 | Control register |
| [ADC2_DELAY](#adc2_delay) | 0x00000410 | delay settings |
| [ADC2_OUT](#adc2_out)    | 0x00000480 | ADC output value |
| [DAC1_CONTROL](#dac1_control) | 0x00000500 | Control register |
| [DAC1_TST_SW](#dac1_tst_sw) | 0x00000510 | Switch register |
| [DAC1_GAIN](#dac1_gain)  | 0x00000520 | analog gain selection |
| [DAC1_ROUT](#dac1_rout)  | 0x00000530 | output resistance selection |
| [DAC2_CONTROL](#dac2_control) | 0x00000600 | Control register |
| [DAC2_TST_SW](#dac2_tst_sw) | 0x00000610 | Switch register |
| [DAC2_GAIN](#dac2_gain)  | 0x00000620 | analog gain selection |
| [DAC2_ROUT](#dac2_rout)  | 0x00000630 | output resistance selection |
| [SINE_LUT_STEP](#sine_lut_step) | 0x00000710 | step size selection |
| [SINE_LUT_OUT0](#sine_lut_out0) | 0x00000780 | current sine at 0° tap |
| [SINE_LUT_OUT90](#sine_lut_out90) | 0x00000784 | current sine at 90° tap |
| [LOCKIN_PLACEHOLDER](#lockin_placeholder) | 0x00000800 | TBD |

## I_BIAS_CONTROL

Control register.

Address offset: 0x00000000

Reset value: 0x00000000

![i_bias_control](md_img/i_bias_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| power_down       | 2:0    | rw              | 0x0        | Selection of devices to power down |

Enumerated values for I_BIAS_CONTROL.power_down.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| COMMON           | 0x1    | power down general Vref |
| ADC1             | 0x2    | power down ADC1 Vref |
| ADC2             | 0x4    | power down ADC2 Vref |
| ALL              | 0x7    | power down all 3 Vref |

Back to [Register map](#register-map-summary).

## I_BIAS_SW

Switch configuration

Address offset: 0x00000004

Reset value: 0x00000003

![i_bias_sw](md_img/i_bias_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:2   | -               | 0x0000000  | Reserved |
| source_sel       | 1:0    | rw              | 0x3        | Selection of Vref source |

Enumerated values for I_BIAS_SW.source_sel.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| int              | 0x1    | activate internal resistive voltage divider |
| ext              | 0x2    | connect external Vref pad |

Back to [Register map](#register-map-summary).

## PGA1_CONTROL

Control register.

Address offset: 0x00000100

Reset value: 0x00000000

![pga1_control](md_img/pga1_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| power_down       | 2:0    | rw              | 0x0        | Selection of devices to power down |

Enumerated values for PGA1_CONTROL.power_down.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| OP1              | 0x1    | power down OPAMP1 |
| OP2              | 0x2    | power down OPAMP2 |
| DIFFAMP          | 0x4    | power down DIFFAMP |
| ALL              | 0x7    | power down all 3 opamps |

Back to [Register map](#register-map-summary).

## PGA1_INT_SW

Switch configuration for internal connectivity

Address offset: 0x00000110

Reset value: 0x00003f00

![pga1_int_sw](md_img/pga1_int_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:14  | -               | 0x0000     | Reserved |
| sc               | 13:12  | rw              | 0x3        | LNA feedback cap switch |
| sm               | 11:10  | rw              | 0x3        | diffamp input connection switch |
| se               | 9:8    | rw              | 0x3        | LNA input connection switch |
| -                | 7:6    | -               | 0x0        | Reserved |
| offset_compensation | 5:0    | rw              | 0x0        | Selection of switches that are to be put into offset compensation mode |

Enumerated values for PGA1_INT_SW.offset_compensation.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| OC_OP1           | 0x7    | configuration for OP1 |
| OC_OP2           | 0x38   | configuration for OP2 |

Enumerated values for PGA1_INT_SW.se.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Enumerated values for PGA1_INT_SW.sm.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Enumerated values for PGA1_INT_SW.sc.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Back to [Register map](#register-map-summary).

## PGA1_TST_SW

Switch configuration for testpad connectivity

Address offset: 0x00000120

Reset value: 0x000000f1

![pga1_tst_sw](md_img/pga1_tst_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:10  | -               | 0x00000    | Reserved |
| so               | 9:6    | rw              | 0x3        | SO switches that are connected to testpads |
| si               | 5:0    | rw              | 0x31       | SI switches that are connected to testpads |

Enumerated values for PGA1_TST_SW.si.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x0    | configuration for normal operation |

Enumerated values for PGA1_TST_SW.so.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x0    | configuration for normal operation |

Back to [Register map](#register-map-summary).

## PGA1_OC1

Offset compensation values for OPAMP1

Address offset: 0x00000140

Reset value: 0x00000000

![pga1_oc1](md_img/pga1_oc1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:16  | -               | 0x0000     | Reserved |
| OC1_N            | 15:8   | rw              | 0x00       | N side |
| OC1_P            | 7:0    | rw              | 0x00       | P side |

Back to [Register map](#register-map-summary).

## PGA1_OC2

Offset compensation values for OPAMP2

Address offset: 0x00000144

Reset value: 0x00000000

![pga1_oc2](md_img/pga1_oc2.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:16  | -               | 0x0000     | Reserved |
| OC1_N            | 15:8   | rw              | 0x00       | N side |
| OC1_P            | 7:0    | rw              | 0x00       | P side |

Back to [Register map](#register-map-summary).

## PGA1_GAIN1

Gain for first amplifier stage

Address offset: 0x00000150

Reset value: 0x00000001

![pga1_gain1](md_img/pga1_gain1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:7   | -               | 0x000000   | Reserved |
| gain             | 6:0    | rw              | 0x1        | gain; linear between 1 and 128 |

Enumerated values for PGA1_GAIN1.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| min              | 0x0    | gain = 1 |
| max              | 0x7f   | gain = 128 |

Back to [Register map](#register-map-summary).

## PGA1_GAIN2_1

Gain for second amplifier stage, P path

Address offset: 0x00000160

Reset value: 0x00000001

![pga1_gain2_1](md_img/pga1_gain2_1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| gain             | 2:0    | rw              | 0x1        | gain; linear between 0.5 and 4 |

Enumerated values for PGA1_GAIN2_1.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple diffamp input from LNA output |
| min              | 0x1    | gain = 0.5 |
| max              | 0x7    | gain = 3.5 |

Back to [Register map](#register-map-summary).

## PGA1_GAIN2_2

Gain for second amplifier stage, N path

Address offset: 0x00000164

Reset value: 0x00000001

![pga1_gain2_2](md_img/pga1_gain2_2.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| gain             | 2:0    | rw              | 0x1        | gain; linear between 0.5 and 3.5 |

Enumerated values for PGA1_GAIN2_2.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple diffamp input from LNA output |
| min              | 0x1    | gain = 0.5 |
| max              | 0x7    | gain = 3.5 |

Back to [Register map](#register-map-summary).

## PGA2_CONTROL

Control register.

Address offset: 0x00000200

Reset value: 0x00000000

![pga2_control](md_img/pga2_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| power_down       | 2:0    | rw              | 0x0        | Selection of devices to power down |

Enumerated values for PGA2_CONTROL.power_down.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| OP1              | 0x1    | power down OPAMP1 |
| OP2              | 0x2    | power down OPAMP2 |
| DIFFAMP          | 0x4    | power down DIFFAMP |
| ALL              | 0x7    | power down all 3 opamps |

Back to [Register map](#register-map-summary).

## PGA2_INT_SW

Switch configuration for internal connectivity

Address offset: 0x00000210

Reset value: 0x00003f00

![pga2_int_sw](md_img/pga2_int_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:14  | -               | 0x0000     | Reserved |
| sc               | 13:12  | rw              | 0x3        | LNA feedback cap switch |
| sm               | 11:10  | rw              | 0x3        | diffamp input connection switch |
| se               | 9:8    | rw              | 0x3        | LNA input connection switch |
| -                | 7:6    | -               | 0x0        | Reserved |
| offset_compensation | 5:0    | rw              | 0x0        | Selection of switches that are to be put into offset compensation mode |

Enumerated values for PGA2_INT_SW.offset_compensation.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| OC_OP1           | 0x7    | configuration for OP1 |
| OC_OP2           | 0x38   | configuration for OP2 |

Enumerated values for PGA2_INT_SW.se.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Enumerated values for PGA2_INT_SW.sm.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Enumerated values for PGA2_INT_SW.sc.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x3    | configuration for normal operation |

Back to [Register map](#register-map-summary).

## PGA2_TST_SW

Switch configuration for testpad connectivity

Address offset: 0x00000220

Reset value: 0x000000f1

![pga2_tst_sw](md_img/pga2_tst_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:10  | -               | 0x00000    | Reserved |
| so               | 9:6    | rw              | 0x3        | SO switches that are connected to testpads |
| si               | 5:0    | rw              | 0x31       | SI switches that are connected to testpads |

Enumerated values for PGA2_TST_SW.si.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x0    | configuration for normal operation |

Enumerated values for PGA2_TST_SW.so.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x0    | configuration for normal operation |

Back to [Register map](#register-map-summary).

## PGA2_OC1

Offset compensation values for OPAMP1

Address offset: 0x00000240

Reset value: 0x00000000

![pga2_oc1](md_img/pga2_oc1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:16  | -               | 0x0000     | Reserved |
| OC1_N            | 15:8   | rw              | 0x00       | N side |
| OC1_P            | 7:0    | rw              | 0x00       | P side |

Back to [Register map](#register-map-summary).

## PGA2_OC2

Offset compensation values for OPAMP2

Address offset: 0x00000244

Reset value: 0x00000000

![pga2_oc2](md_img/pga2_oc2.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:16  | -               | 0x0000     | Reserved |
| OC1_N            | 15:8   | rw              | 0x00       | N side |
| OC1_P            | 7:0    | rw              | 0x00       | P side |

Back to [Register map](#register-map-summary).

## PGA2_GAIN1

Gain for first amplifier stage

Address offset: 0x00000250

Reset value: 0x00000013

![pga2_gain1](md_img/pga2_gain1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:7   | -               | 0x000000   | Reserved |
| gain             | 6:0    | rw              | 0x13       | gain; linear between 1 and 128 |

Enumerated values for PGA2_GAIN1.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| min              | 0x0    | gain = 1 |
| max              | 0x7f   | gain = 128 |

Back to [Register map](#register-map-summary).

## PGA2_GAIN2_1

Gain for second amplifier stage, P path

Address offset: 0x00000260

Reset value: 0x00000004

![pga2_gain2_1](md_img/pga2_gain2_1.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| gain             | 2:0    | rw              | 0x4        | gain; linear between 0.5 and 3.5 |

Enumerated values for PGA2_GAIN2_1.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple diffamp input from LNA output |
| min              | 0x1    | gain = 0.5 |
| max              | 0x7    | gain = 4 |

Back to [Register map](#register-map-summary).

## PGA2_GAIN2_2

Gain for second amplifier stage, N path

Address offset: 0x00000264

Reset value: 0x00000004

![pga2_gain2_2](md_img/pga2_gain2_2.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| gain             | 2:0    | rw              | 0x4        | gain; linear between 0.5 and 3.5 |

Enumerated values for PGA2_GAIN2_2.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple diffamp input from LNA output |
| min              | 0x1    | gain = 0.5 |
| max              | 0x7    | gain = 3.5 |

Back to [Register map](#register-map-summary).

## TI_CONTROL

Transimpedance control register

Address offset: 0x00000280

Reset value: 0x00000000

![ti_control](md_img/ti_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| pd               | 0      | rw              | 0x0        | power_down |

Enumerated values for TI_CONTROL.pd.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| opamp_on         | 0x0    | opamp running |
| opamp_off        | 0x1    | opamp power down |

Back to [Register map](#register-map-summary).

## TI_GAIN

Transimpedance gain

Address offset: 0x00000284

Reset value: 0x00000000

![ti_gain](md_img/ti_gain.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| res              | 2:0    | rw              | 0x0        | resistor selection |

Back to [Register map](#register-map-summary).

## TI_SW

Transimpedance switch configuration

Address offset: 0x00000288

Reset value: 0x00000001

![ti_sw](md_img/ti_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| tp_switch        | 0      | rw              | 0x1        | testpad on/off |

Enumerated values for TI_SW.tp_switch.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| operation        | 0x0    | value during normal operation |

Back to [Register map](#register-map-summary).

## ADC1_CONTROL

Control register

Address offset: 0x00000300

Reset value: 0x00000001

![adc1_control](md_img/adc1_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:2   | -               | 0x0000000  | Reserved |
| holdtype         | 1      | rw              | 0x0        | hold type |
| en               | 0      | rw              | 0x1        | enable |

Enumerated values for ADC1_CONTROL.en.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| ADC_off          | 0x0    | ADC off |
| ADC_on           | 0x1    | ADC running |

Enumerated values for ADC1_CONTROL.holdtype.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| th               | 0x0    | track&hold |
| sh               | 0x1    | sample&hold |

Back to [Register map](#register-map-summary).

## ADC1_DELAY

delay settings

Address offset: 0x00000310

Reset value: 0x00000c82

![adc1_delay](md_img/adc1_delay.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:13  | -               | 0x0000     | Reserved |
| low_bits_delay   | 12:11  | rw              | 0x1        | number of clock cycles to wait after switching bits 3..0 |
| mid_bits_delay   | 10:9   | rw              | 0x2        | number of clock cycles to wait after switching bits 6..4 |
| high_bits_delay  | 8:5    | rw              | 0x4        | number of clock cycles to wait after switching bits 9..7 |
| hold_time        | 4:0    | rw              | 0x2        | number of clock cycles to hold before sampling. Ignored in track&hold. |

Back to [Register map](#register-map-summary).

## ADC1_OUT

ADC output value

Address offset: 0x00000380

Reset value: 0x00000000

![adc1_out](md_img/adc1_out.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:12  | -               | 0x00000    | Reserved |
| output_value     | 11:0   | ro              | 0x000      | AD converted value |

Back to [Register map](#register-map-summary).

## ADC2_CONTROL

Control register

Address offset: 0x00000400

Reset value: 0x00000001

![adc2_control](md_img/adc2_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:2   | -               | 0x0000000  | Reserved |
| holdtype         | 1      | rw              | 0x0        | hold type |
| en               | 0      | rw              | 0x1        | enable |

Enumerated values for ADC2_CONTROL.en.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| ADC_off          | 0x0    | ADC off |
| ADC_on           | 0x1    | ADC running |

Enumerated values for ADC2_CONTROL.holdtype.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| th               | 0x0    | track&hold |
| sh               | 0x1    | sample&hold |

Back to [Register map](#register-map-summary).

## ADC2_DELAY

delay settings

Address offset: 0x00000410

Reset value: 0x00000c82

![adc2_delay](md_img/adc2_delay.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:13  | -               | 0x0000     | Reserved |
| low_bits_delay   | 12:11  | rw              | 0x1        | number of clock cycles to wait after switching bits 3..0 |
| mid_bits_delay   | 10:9   | rw              | 0x2        | number of clock cycles to wait after switching bits 6..4 |
| high_bits_delay  | 8:5    | rw              | 0x4        | number of clock cycles to wait after switching bits 9..7 |
| hold_time        | 4:0    | rw              | 0x2        | number of clock cycles to hold before sampling. Ignored in track&hold. |

Back to [Register map](#register-map-summary).

## ADC2_OUT

ADC output value

Address offset: 0x00000480

Reset value: 0x00000000

![adc2_out](md_img/adc2_out.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:12  | -               | 0x00000    | Reserved |
| output_value     | 11:0   | ro              | 0x000      | AD converted value |

Back to [Register map](#register-map-summary).

## DAC1_CONTROL

Control register

Address offset: 0x00000500

Reset value: 0x00000000

![dac1_control](md_img/dac1_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| pd               | 0      | rw              | 0x0        | power down |

Enumerated values for DAC1_CONTROL.pd.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| DAC_on           | 0x0    | ADC running |
| DAC_off          | 0x1    | ADC off |

Back to [Register map](#register-map-summary).

## DAC1_TST_SW

Switch register

Address offset: 0x00000510

Reset value: 0x00000000

![dac1_tst_sw](md_img/dac1_tst_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| switch_position  | 0      | rw              | 0x0        | testpad switch position |

Enumerated values for DAC1_TST_SW.switch_position.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| TP_off           | 0x0    | testpad disconnected |
| TP_on            | 0x1    | testpad connected |

Back to [Register map](#register-map-summary).

## DAC1_GAIN

analog gain selection

Address offset: 0x00000520

Reset value: 0x00000001

![dac1_gain](md_img/dac1_gain.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:2   | -               | 0x0000000  | Reserved |
| gain             | 1:0    | rw              | 0x1        | gain selection (0.8, 1, 1.8) |

Enumerated values for DAC1_GAIN.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple output buffer from DAC output |
| min              | 0x1    | gain = 0.8 |
| one              | 0x2    | gain = 1 |
| max              | 0x3    | gain = 1.8 - above saturation when using sine LUT |

Back to [Register map](#register-map-summary).

## DAC1_ROUT

output resistance selection

Address offset: 0x00000530

Reset value: 0x00000003

![dac1_rout](md_img/dac1_rout.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| Rout             | 2:0    | rw              | 0x3        | output resistance selection (100k, 25k, 6.4k) |

Back to [Register map](#register-map-summary).

## DAC2_CONTROL

Control register

Address offset: 0x00000600

Reset value: 0x00000000

![dac2_control](md_img/dac2_control.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| pd               | 0      | rw              | 0x0        | power down |

Enumerated values for DAC2_CONTROL.pd.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| DAC_on           | 0x0    | ADC running |
| DAC_off          | 0x1    | ADC off |

Back to [Register map](#register-map-summary).

## DAC2_TST_SW

Switch register

Address offset: 0x00000610

Reset value: 0x00000000

![dac2_tst_sw](md_img/dac2_tst_sw.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:1   | -               | 0x0000000  | Reserved |
| switch_position  | 0      | rw              | 0x0        | testpad switch position |

Enumerated values for DAC2_TST_SW.switch_position.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| TP_off           | 0x0    | testpad disconnected |
| TP_on            | 0x1    | testpad connected |

Back to [Register map](#register-map-summary).

## DAC2_GAIN

analog gain selection

Address offset: 0x00000620

Reset value: 0x00000001

![dac2_gain](md_img/dac2_gain.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:2   | -               | 0x0000000  | Reserved |
| gain             | 1:0    | rw              | 0x1        | gain selection (0.8, 1, 1.8) |

Enumerated values for DAC2_GAIN.gain.

| Name             | Value   | Description |
| :---             | :---    | :---        |
| break            | 0x0    | decouple output buffer from DAC output |
| min              | 0x1    | gain = 0.8 |
| one              | 0x2    | gain = 1 |
| max              | 0x3    | gain = 1.8 - above saturation when using sine LUT |

Back to [Register map](#register-map-summary).

## DAC2_ROUT

output resistance selection

Address offset: 0x00000630

Reset value: 0x00000003

![dac2_rout](md_img/dac2_rout.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:3   | -               | 0x0000000  | Reserved |
| Rout             | 2:0    | rw              | 0x3        | output resistance selection (100k, 25k, 6.4k) |

Back to [Register map](#register-map-summary).

## SINE_LUT_STEP

step size selection

Address offset: 0x00000710

Reset value: 0x00000001

![sine_lut_step](md_img/sine_lut_step.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:10  | -               | 0x00000    | Reserved |
| step_size        | 9:0    | rw              | 0x01       | step size selection (in 1 / 1024 per rotation) |

Back to [Register map](#register-map-summary).

## SINE_LUT_OUT0

current sine at 0° tap

Address offset: 0x00000780

Reset value: 0x00000000

![sine_lut_out0](md_img/sine_lut_out0.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:10  | -               | 0x00000    | Reserved |
| out0             | 9:0    | ro              | 0x00       | current sine at 0° tap |

Back to [Register map](#register-map-summary).

## SINE_LUT_OUT90

current sine at 90° tap

Address offset: 0x00000784

Reset value: 0x00000000

![sine_lut_out90](md_img/sine_lut_out90.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:10  | -               | 0x00000    | Reserved |
| out0             | 9:0    | ro              | 0x00       | current sine at 90° tap |

Back to [Register map](#register-map-summary).

## LOCKIN_PLACEHOLDER

TBD

Address offset: 0x00000800

Reset value: 0x00000000

![lockin_placeholder](md_img/lockin_placeholder.svg)

| Name             | Bits   | Mode            | Reset      | Description |
| :---             | :---   | :---            | :---       | :---        |
| -                | 31:8   | -               | 0x000000   | Reserved |
| TBD              | 7:0    | rw              | 0x00       | TBD |

Back to [Register map](#register-map-summary).
