

-- Created with Corsair v1.0.2
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity analog_regs is
generic(
    ADDR_W : integer := 32;
    DATA_W : integer := 32;
    STRB_W : integer := 4
);
port(
    clk    : in std_logic;
    rst    : in std_logic;
    -- I_BIAS_CONTROL.power_down
    csr_i_bias_control_power_down_out : out std_logic_vector(2 downto 0);

    -- I_BIAS_SW.source_sel
    csr_i_bias_sw_source_sel_out : out std_logic_vector(1 downto 0);

    -- PGA1_CONTROL.power_down
    csr_pga1_control_power_down_out : out std_logic_vector(2 downto 0);

    -- PGA1_INT_SW.offset_compensation
    csr_pga1_int_sw_offset_compensation_out : out std_logic_vector(5 downto 0);
    -- PGA1_INT_SW.se
    csr_pga1_int_sw_se_out : out std_logic_vector(1 downto 0);
    -- PGA1_INT_SW.sm
    csr_pga1_int_sw_sm_out : out std_logic_vector(1 downto 0);
    -- PGA1_INT_SW.sc
    csr_pga1_int_sw_sc_out : out std_logic_vector(1 downto 0);

    -- PGA1_TST_SW.si
    csr_pga1_tst_sw_si_out : out std_logic_vector(5 downto 0);
    -- PGA1_TST_SW.so
    csr_pga1_tst_sw_so_out : out std_logic_vector(3 downto 0);

    -- PGA1_OC1.OC1_P
    csr_pga1_oc1_oc1_p_out : out std_logic_vector(7 downto 0);
    -- PGA1_OC1.OC1_N
    csr_pga1_oc1_oc1_n_out : out std_logic_vector(7 downto 0);

    -- PGA1_OC2.OC1_P
    csr_pga1_oc2_oc1_p_out : out std_logic_vector(7 downto 0);
    -- PGA1_OC2.OC1_N
    csr_pga1_oc2_oc1_n_out : out std_logic_vector(7 downto 0);

    -- PGA1_GAIN1.gain
    csr_pga1_gain1_gain_out : out std_logic_vector(6 downto 0);

    -- PGA1_GAIN2_1.gain
    csr_pga1_gain2_1_gain_out : out std_logic_vector(2 downto 0);

    -- PGA1_GAIN2_2.gain
    csr_pga1_gain2_2_gain_out : out std_logic_vector(2 downto 0);

    -- PGA2_CONTROL.power_down
    csr_pga2_control_power_down_out : out std_logic_vector(2 downto 0);

    -- PGA2_INT_SW.offset_compensation
    csr_pga2_int_sw_offset_compensation_out : out std_logic_vector(5 downto 0);
    -- PGA2_INT_SW.se
    csr_pga2_int_sw_se_out : out std_logic_vector(1 downto 0);
    -- PGA2_INT_SW.sm
    csr_pga2_int_sw_sm_out : out std_logic_vector(1 downto 0);
    -- PGA2_INT_SW.sc
    csr_pga2_int_sw_sc_out : out std_logic_vector(1 downto 0);

    -- PGA2_TST_SW.si
    csr_pga2_tst_sw_si_out : out std_logic_vector(5 downto 0);
    -- PGA2_TST_SW.so
    csr_pga2_tst_sw_so_out : out std_logic_vector(3 downto 0);

    -- PGA2_OC1.OC1_P
    csr_pga2_oc1_oc1_p_out : out std_logic_vector(7 downto 0);
    -- PGA2_OC1.OC1_N
    csr_pga2_oc1_oc1_n_out : out std_logic_vector(7 downto 0);

    -- PGA2_OC2.OC1_P
    csr_pga2_oc2_oc1_p_out : out std_logic_vector(7 downto 0);
    -- PGA2_OC2.OC1_N
    csr_pga2_oc2_oc1_n_out : out std_logic_vector(7 downto 0);

    -- PGA2_GAIN1.gain
    csr_pga2_gain1_gain_out : out std_logic_vector(6 downto 0);

    -- PGA2_GAIN2_1.gain
    csr_pga2_gain2_1_gain_out : out std_logic_vector(2 downto 0);

    -- PGA2_GAIN2_2.gain
    csr_pga2_gain2_2_gain_out : out std_logic_vector(2 downto 0);

    -- TI_CONTROL.pd
    csr_ti_control_pd_out : out std_logic;

    -- TI_GAIN.res
    csr_ti_gain_res_out : out std_logic_vector(2 downto 0);

    -- TI_SW.tp_switch
    csr_ti_sw_tp_switch_out : out std_logic;

    -- ADC1_CONTROL.en
    csr_adc1_control_en_out : out std_logic;
    -- ADC1_CONTROL.holdtype
    csr_adc1_control_holdtype_out : out std_logic;

    -- ADC1_DELAY.hold_time
    csr_adc1_delay_hold_time_out : out std_logic_vector(4 downto 0);
    -- ADC1_DELAY.high_bits_delay
    csr_adc1_delay_high_bits_delay_out : out std_logic_vector(3 downto 0);
    -- ADC1_DELAY.mid_bits_delay
    csr_adc1_delay_mid_bits_delay_out : out std_logic_vector(1 downto 0);
    -- ADC1_DELAY.low_bits_delay
    csr_adc1_delay_low_bits_delay_out : out std_logic_vector(1 downto 0);

    -- ADC1_OUT.output_value
    csr_adc1_out_output_value_in : in std_logic_vector(11 downto 0);

    -- ADC2_CONTROL.en
    csr_adc2_control_en_out : out std_logic;
    -- ADC2_CONTROL.holdtype
    csr_adc2_control_holdtype_out : out std_logic;

    -- ADC2_DELAY.hold_time
    csr_adc2_delay_hold_time_out : out std_logic_vector(4 downto 0);
    -- ADC2_DELAY.high_bits_delay
    csr_adc2_delay_high_bits_delay_out : out std_logic_vector(3 downto 0);
    -- ADC2_DELAY.mid_bits_delay
    csr_adc2_delay_mid_bits_delay_out : out std_logic_vector(1 downto 0);
    -- ADC2_DELAY.low_bits_delay
    csr_adc2_delay_low_bits_delay_out : out std_logic_vector(1 downto 0);

    -- ADC2_OUT.output_value
    csr_adc2_out_output_value_in : in std_logic_vector(11 downto 0);

    -- DAC1_CONTROL.pd
    csr_dac1_control_pd_out : out std_logic;

    -- DAC1_TST_SW.switch_position
    csr_dac1_tst_sw_switch_position_out : out std_logic;

    -- DAC1_GAIN.gain
    csr_dac1_gain_gain_out : out std_logic_vector(1 downto 0);

    -- DAC1_ROUT.Rout
    csr_dac1_rout_rout_out : out std_logic_vector(2 downto 0);

    -- DAC2_CONTROL.pd
    csr_dac2_control_pd_out : out std_logic;

    -- DAC2_TST_SW.switch_position
    csr_dac2_tst_sw_switch_position_out : out std_logic;

    -- DAC2_GAIN.gain
    csr_dac2_gain_gain_out : out std_logic_vector(1 downto 0);

    -- DAC2_ROUT.Rout
    csr_dac2_rout_rout_out : out std_logic_vector(2 downto 0);

    -- SINE_LUT_STEP.step_size
    csr_sine_lut_step_step_size_out : out std_logic_vector(9 downto 0);

    -- SINE_LUT_OUT0.out0
    csr_sine_lut_out0_out0_in : in std_logic_vector(9 downto 0);

    -- SINE_LUT_OUT90.out0
    csr_sine_lut_out90_out90_in : in std_logic_vector(9 downto 0);

    -- LOCKIN_PLACEHOLDER.TBD
    csr_lockin_placeholder_tbd_out : out std_logic_vector(7 downto 0);

    -- APB
    psel    : in  std_logic;
    paddr   : in  std_logic_vector(ADDR_W-1 downto 0);
    penable : in  std_logic;
    pwrite  : in  std_logic;
    pwdata  : in  std_logic_vector(DATA_W-1 downto 0);
    pstrb   : in  std_logic_vector(STRB_W-1 downto 0);
    prdata  : out std_logic_vector(DATA_W-1 downto 0);
    pready  : out std_logic;
    pslverr : out std_logic

);
end entity;

architecture rtl of analog_regs is
subtype ADDR_T is std_logic_vector(31 downto 0);

signal wready : std_logic;
signal waddr  : std_logic_vector(ADDR_W-1 downto 0);
signal wdata  : std_logic_vector(DATA_W-1 downto 0);
signal wen    : std_logic;
signal wstrb  : std_logic_vector(STRB_W-1 downto 0);
signal rdata  : std_logic_vector(DATA_W-1 downto 0);
signal rvalid : std_logic;
signal raddr  : std_logic_vector(ADDR_W-1 downto 0);
signal ren    : std_logic;

signal csr_i_bias_control_rdata : std_logic_vector(31 downto 0);
signal csr_i_bias_control_wen : std_logic;
signal csr_i_bias_control_ren : std_logic;
signal csr_i_bias_control_ren_ff : std_logic;
signal csr_i_bias_control_power_down_ff : std_logic_vector(2 downto 0);

signal csr_i_bias_sw_rdata : std_logic_vector(31 downto 0);
signal csr_i_bias_sw_wen : std_logic;
signal csr_i_bias_sw_ren : std_logic;
signal csr_i_bias_sw_ren_ff : std_logic;
signal csr_i_bias_sw_source_sel_ff : std_logic_vector(1 downto 0);

signal csr_pga1_control_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_control_wen : std_logic;
signal csr_pga1_control_ren : std_logic;
signal csr_pga1_control_ren_ff : std_logic;
signal csr_pga1_control_power_down_ff : std_logic_vector(2 downto 0);

signal csr_pga1_int_sw_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_int_sw_wen : std_logic;
signal csr_pga1_int_sw_ren : std_logic;
signal csr_pga1_int_sw_ren_ff : std_logic;
signal csr_pga1_int_sw_offset_compensation_ff : std_logic_vector(5 downto 0);
signal csr_pga1_int_sw_se_ff : std_logic_vector(1 downto 0);
signal csr_pga1_int_sw_sm_ff : std_logic_vector(1 downto 0);
signal csr_pga1_int_sw_sc_ff : std_logic_vector(1 downto 0);

signal csr_pga1_tst_sw_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_tst_sw_wen : std_logic;
signal csr_pga1_tst_sw_ren : std_logic;
signal csr_pga1_tst_sw_ren_ff : std_logic;
signal csr_pga1_tst_sw_si_ff : std_logic_vector(5 downto 0);
signal csr_pga1_tst_sw_so_ff : std_logic_vector(3 downto 0);

signal csr_pga1_oc1_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_oc1_wen : std_logic;
signal csr_pga1_oc1_ren : std_logic;
signal csr_pga1_oc1_ren_ff : std_logic;
signal csr_pga1_oc1_oc1_p_ff : std_logic_vector(7 downto 0);
signal csr_pga1_oc1_oc1_n_ff : std_logic_vector(7 downto 0);

signal csr_pga1_oc2_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_oc2_wen : std_logic;
signal csr_pga1_oc2_ren : std_logic;
signal csr_pga1_oc2_ren_ff : std_logic;
signal csr_pga1_oc2_oc1_p_ff : std_logic_vector(7 downto 0);
signal csr_pga1_oc2_oc1_n_ff : std_logic_vector(7 downto 0);

signal csr_pga1_gain1_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_gain1_wen : std_logic;
signal csr_pga1_gain1_ren : std_logic;
signal csr_pga1_gain1_ren_ff : std_logic;
signal csr_pga1_gain1_gain_ff : std_logic_vector(6 downto 0);

signal csr_pga1_gain2_1_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_gain2_1_wen : std_logic;
signal csr_pga1_gain2_1_ren : std_logic;
signal csr_pga1_gain2_1_ren_ff : std_logic;
signal csr_pga1_gain2_1_gain_ff : std_logic_vector(2 downto 0);

signal csr_pga1_gain2_2_rdata : std_logic_vector(31 downto 0);
signal csr_pga1_gain2_2_wen : std_logic;
signal csr_pga1_gain2_2_ren : std_logic;
signal csr_pga1_gain2_2_ren_ff : std_logic;
signal csr_pga1_gain2_2_gain_ff : std_logic_vector(2 downto 0);

signal csr_pga2_control_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_control_wen : std_logic;
signal csr_pga2_control_ren : std_logic;
signal csr_pga2_control_ren_ff : std_logic;
signal csr_pga2_control_power_down_ff : std_logic_vector(2 downto 0);

signal csr_pga2_int_sw_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_int_sw_wen : std_logic;
signal csr_pga2_int_sw_ren : std_logic;
signal csr_pga2_int_sw_ren_ff : std_logic;
signal csr_pga2_int_sw_offset_compensation_ff : std_logic_vector(5 downto 0);
signal csr_pga2_int_sw_se_ff : std_logic_vector(1 downto 0);
signal csr_pga2_int_sw_sm_ff : std_logic_vector(1 downto 0);
signal csr_pga2_int_sw_sc_ff : std_logic_vector(1 downto 0);

signal csr_pga2_tst_sw_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_tst_sw_wen : std_logic;
signal csr_pga2_tst_sw_ren : std_logic;
signal csr_pga2_tst_sw_ren_ff : std_logic;
signal csr_pga2_tst_sw_si_ff : std_logic_vector(5 downto 0);
signal csr_pga2_tst_sw_so_ff : std_logic_vector(3 downto 0);

signal csr_pga2_oc1_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_oc1_wen : std_logic;
signal csr_pga2_oc1_ren : std_logic;
signal csr_pga2_oc1_ren_ff : std_logic;
signal csr_pga2_oc1_oc1_p_ff : std_logic_vector(7 downto 0);
signal csr_pga2_oc1_oc1_n_ff : std_logic_vector(7 downto 0);

signal csr_pga2_oc2_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_oc2_wen : std_logic;
signal csr_pga2_oc2_ren : std_logic;
signal csr_pga2_oc2_ren_ff : std_logic;
signal csr_pga2_oc2_oc1_p_ff : std_logic_vector(7 downto 0);
signal csr_pga2_oc2_oc1_n_ff : std_logic_vector(7 downto 0);

signal csr_pga2_gain1_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_gain1_wen : std_logic;
signal csr_pga2_gain1_ren : std_logic;
signal csr_pga2_gain1_ren_ff : std_logic;
signal csr_pga2_gain1_gain_ff : std_logic_vector(6 downto 0);

signal csr_pga2_gain2_1_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_gain2_1_wen : std_logic;
signal csr_pga2_gain2_1_ren : std_logic;
signal csr_pga2_gain2_1_ren_ff : std_logic;
signal csr_pga2_gain2_1_gain_ff : std_logic_vector(2 downto 0);

signal csr_pga2_gain2_2_rdata : std_logic_vector(31 downto 0);
signal csr_pga2_gain2_2_wen : std_logic;
signal csr_pga2_gain2_2_ren : std_logic;
signal csr_pga2_gain2_2_ren_ff : std_logic;
signal csr_pga2_gain2_2_gain_ff : std_logic_vector(2 downto 0);

signal csr_ti_control_rdata : std_logic_vector(31 downto 0);
signal csr_ti_control_wen : std_logic;
signal csr_ti_control_ren : std_logic;
signal csr_ti_control_ren_ff : std_logic;
signal csr_ti_control_pd_ff : std_logic;

signal csr_ti_gain_rdata : std_logic_vector(31 downto 0);
signal csr_ti_gain_wen : std_logic;
signal csr_ti_gain_ren : std_logic;
signal csr_ti_gain_ren_ff : std_logic;
signal csr_ti_gain_res_ff : std_logic_vector(2 downto 0);

signal csr_ti_sw_rdata : std_logic_vector(31 downto 0);
signal csr_ti_sw_wen : std_logic;
signal csr_ti_sw_ren : std_logic;
signal csr_ti_sw_ren_ff : std_logic;
signal csr_ti_sw_tp_switch_ff : std_logic;

signal csr_adc1_control_rdata : std_logic_vector(31 downto 0);
signal csr_adc1_control_wen : std_logic;
signal csr_adc1_control_ren : std_logic;
signal csr_adc1_control_ren_ff : std_logic;
signal csr_adc1_control_en_ff : std_logic;
signal csr_adc1_control_holdtype_ff : std_logic;

signal csr_adc1_delay_rdata : std_logic_vector(31 downto 0);
signal csr_adc1_delay_wen : std_logic;
signal csr_adc1_delay_ren : std_logic;
signal csr_adc1_delay_ren_ff : std_logic;
signal csr_adc1_delay_hold_time_ff : std_logic_vector(4 downto 0);
signal csr_adc1_delay_high_bits_delay_ff : std_logic_vector(3 downto 0);
signal csr_adc1_delay_mid_bits_delay_ff : std_logic_vector(1 downto 0);
signal csr_adc1_delay_low_bits_delay_ff : std_logic_vector(1 downto 0);

signal csr_adc1_out_rdata : std_logic_vector(31 downto 0);
signal csr_adc1_out_ren : std_logic;
signal csr_adc1_out_ren_ff : std_logic;
signal csr_adc1_out_output_value_ff : std_logic_vector(11 downto 0);

signal csr_adc2_control_rdata : std_logic_vector(31 downto 0);
signal csr_adc2_control_wen : std_logic;
signal csr_adc2_control_ren : std_logic;
signal csr_adc2_control_ren_ff : std_logic;
signal csr_adc2_control_en_ff : std_logic;
signal csr_adc2_control_holdtype_ff : std_logic;

signal csr_adc2_delay_rdata : std_logic_vector(31 downto 0);
signal csr_adc2_delay_wen : std_logic;
signal csr_adc2_delay_ren : std_logic;
signal csr_adc2_delay_ren_ff : std_logic;
signal csr_adc2_delay_hold_time_ff : std_logic_vector(4 downto 0);
signal csr_adc2_delay_high_bits_delay_ff : std_logic_vector(3 downto 0);
signal csr_adc2_delay_mid_bits_delay_ff : std_logic_vector(1 downto 0);
signal csr_adc2_delay_low_bits_delay_ff : std_logic_vector(1 downto 0);

signal csr_adc2_out_rdata : std_logic_vector(31 downto 0);
signal csr_adc2_out_ren : std_logic;
signal csr_adc2_out_ren_ff : std_logic;
signal csr_adc2_out_output_value_ff : std_logic_vector(11 downto 0);

signal csr_dac1_control_rdata : std_logic_vector(31 downto 0);
signal csr_dac1_control_wen : std_logic;
signal csr_dac1_control_ren : std_logic;
signal csr_dac1_control_ren_ff : std_logic;
signal csr_dac1_control_pd_ff : std_logic;

signal csr_dac1_tst_sw_rdata : std_logic_vector(31 downto 0);
signal csr_dac1_tst_sw_wen : std_logic;
signal csr_dac1_tst_sw_ren : std_logic;
signal csr_dac1_tst_sw_ren_ff : std_logic;
signal csr_dac1_tst_sw_switch_position_ff : std_logic;

signal csr_dac1_gain_rdata : std_logic_vector(31 downto 0);
signal csr_dac1_gain_wen : std_logic;
signal csr_dac1_gain_ren : std_logic;
signal csr_dac1_gain_ren_ff : std_logic;
signal csr_dac1_gain_gain_ff : std_logic_vector(1 downto 0);

signal csr_dac1_rout_rdata : std_logic_vector(31 downto 0);
signal csr_dac1_rout_wen : std_logic;
signal csr_dac1_rout_ren : std_logic;
signal csr_dac1_rout_ren_ff : std_logic;
signal csr_dac1_rout_rout_ff : std_logic_vector(2 downto 0);

signal csr_dac2_control_rdata : std_logic_vector(31 downto 0);
signal csr_dac2_control_wen : std_logic;
signal csr_dac2_control_ren : std_logic;
signal csr_dac2_control_ren_ff : std_logic;
signal csr_dac2_control_pd_ff : std_logic;

signal csr_dac2_tst_sw_rdata : std_logic_vector(31 downto 0);
signal csr_dac2_tst_sw_wen : std_logic;
signal csr_dac2_tst_sw_ren : std_logic;
signal csr_dac2_tst_sw_ren_ff : std_logic;
signal csr_dac2_tst_sw_switch_position_ff : std_logic;

signal csr_dac2_gain_rdata : std_logic_vector(31 downto 0);
signal csr_dac2_gain_wen : std_logic;
signal csr_dac2_gain_ren : std_logic;
signal csr_dac2_gain_ren_ff : std_logic;
signal csr_dac2_gain_gain_ff : std_logic_vector(1 downto 0);

signal csr_dac2_rout_rdata : std_logic_vector(31 downto 0);
signal csr_dac2_rout_wen : std_logic;
signal csr_dac2_rout_ren : std_logic;
signal csr_dac2_rout_ren_ff : std_logic;
signal csr_dac2_rout_rout_ff : std_logic_vector(2 downto 0);

signal csr_sine_lut_step_rdata : std_logic_vector(31 downto 0);
signal csr_sine_lut_step_wen : std_logic;
signal csr_sine_lut_step_ren : std_logic;
signal csr_sine_lut_step_ren_ff : std_logic;
signal csr_sine_lut_step_step_size_ff : std_logic_vector(9 downto 0);

signal csr_sine_lut_out0_rdata : std_logic_vector(31 downto 0);
signal csr_sine_lut_out0_ren : std_logic;
signal csr_sine_lut_out0_ren_ff : std_logic;
signal csr_sine_lut_out0_out0_ff : std_logic_vector(9 downto 0);

signal csr_sine_lut_out90_rdata : std_logic_vector(31 downto 0);
signal csr_sine_lut_out90_ren : std_logic;
signal csr_sine_lut_out90_ren_ff : std_logic;
signal csr_sine_lut_out90_out90_ff : std_logic_vector(9 downto 0);

signal csr_lockin_placeholder_rdata : std_logic_vector(31 downto 0);
signal csr_lockin_placeholder_wen : std_logic;
signal csr_lockin_placeholder_ren : std_logic;
signal csr_lockin_placeholder_ren_ff : std_logic;
signal csr_lockin_placeholder_tbd_ff : std_logic_vector(7 downto 0);

signal rdata_ff : std_logic_vector(31 downto 0);
signal rvalid_ff : std_logic;
begin

-- APB interface
prdata  <= rdata;
pslverr <= '1'; -- always OKAY
pready  <= wready when (psel='1' and penable='1' and pwrite='1') else
           rvalid when (psel='1' and pwrite='0' and penable='1') else
           '1';

-- Local Bus interface
waddr <= paddr;
wdata <= pwdata;
wstrb <= pstrb;
wen   <= psel and penable and pwrite;

raddr <= paddr;
ren   <= psel and (not pwrite);

--------------------------------------------------------------------------------
-- CSR:
-- [0x0] - I_BIAS_CONTROL - Control register.
--------------------------------------------------------------------------------
csr_i_bias_control_rdata(31 downto 3) <= (others => '0');

csr_i_bias_control_wen <= wen when (waddr = "00000000000000000000000000000000") else '0'; -- 0x0

csr_i_bias_control_ren <= ren when (raddr = "00000000000000000000000000000000") else '0'; -- 0x0
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_i_bias_control_ren_ff <= '0'; -- 0x0
else
        csr_i_bias_control_ren_ff <= csr_i_bias_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- I_BIAS_CONTROL(2 downto 0) - power_down - Selection of devices to power down
-- access: rw, hardware: o
-----------------------

csr_i_bias_control_rdata(2 downto 0) <= csr_i_bias_control_power_down_ff;

csr_i_bias_control_power_down_out <= csr_i_bias_control_power_down_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_i_bias_control_power_down_ff <= "000"; -- 0x0
else
        if (csr_i_bias_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_i_bias_control_power_down_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_i_bias_control_power_down_ff <= csr_i_bias_control_power_down_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x4] - I_BIAS_SW - Switch configuration
--------------------------------------------------------------------------------
csr_i_bias_sw_rdata(31 downto 2) <= (others => '0');

csr_i_bias_sw_wen <= wen when (waddr = "00000000000000000000000000000100") else '0'; -- 0x4

csr_i_bias_sw_ren <= ren when (raddr = "00000000000000000000000000000100") else '0'; -- 0x4
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_i_bias_sw_ren_ff <= '0'; -- 0x0
else
        csr_i_bias_sw_ren_ff <= csr_i_bias_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- I_BIAS_SW(1 downto 0) - source_sel - Selection of Vref source
-- access: rw, hardware: o
-----------------------

csr_i_bias_sw_rdata(1 downto 0) <= csr_i_bias_sw_source_sel_ff;

csr_i_bias_sw_source_sel_out <= csr_i_bias_sw_source_sel_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_i_bias_sw_source_sel_ff <= "11"; -- 0x3
else
        if (csr_i_bias_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_i_bias_sw_source_sel_ff(1 downto 0) <= wdata(1 downto 0);
            end if;
        else
            csr_i_bias_sw_source_sel_ff <= csr_i_bias_sw_source_sel_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x100] - PGA1_CONTROL - Control register.
--------------------------------------------------------------------------------
csr_pga1_control_rdata(31 downto 3) <= (others => '0');

csr_pga1_control_wen <= wen when (waddr = "00000000000000000000000100000000") else '0'; -- 0x100

csr_pga1_control_ren <= ren when (raddr = "00000000000000000000000100000000") else '0'; -- 0x100
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_control_ren_ff <= '0'; -- 0x0
else
        csr_pga1_control_ren_ff <= csr_pga1_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_CONTROL(2 downto 0) - power_down - Selection of devices to power down
-- access: rw, hardware: o
-----------------------

csr_pga1_control_rdata(2 downto 0) <= csr_pga1_control_power_down_ff;

csr_pga1_control_power_down_out <= csr_pga1_control_power_down_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_control_power_down_ff <= "000"; -- 0x0
else
        if (csr_pga1_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_control_power_down_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga1_control_power_down_ff <= csr_pga1_control_power_down_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x110] - PGA1_INT_SW - Switch configuration for internal connectivity
--------------------------------------------------------------------------------
csr_pga1_int_sw_rdata(7 downto 6) <= (others => '0');
csr_pga1_int_sw_rdata(31 downto 14) <= (others => '0');

csr_pga1_int_sw_wen <= wen when (waddr = "00000000000000000000000100010000") else '0'; -- 0x110

csr_pga1_int_sw_ren <= ren when (raddr = "00000000000000000000000100010000") else '0'; -- 0x110
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_int_sw_ren_ff <= '0'; -- 0x0
else
        csr_pga1_int_sw_ren_ff <= csr_pga1_int_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_INT_SW(5 downto 0) - offset_compensation - Selection of switches that are to be put into offset compensation mode
-- access: rw, hardware: o
-----------------------

csr_pga1_int_sw_rdata(5 downto 0) <= csr_pga1_int_sw_offset_compensation_ff;

csr_pga1_int_sw_offset_compensation_out <= csr_pga1_int_sw_offset_compensation_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_int_sw_offset_compensation_ff <= "000000"; -- 0x0
else
        if (csr_pga1_int_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_int_sw_offset_compensation_ff(5 downto 0) <= wdata(5 downto 0);
            end if;
        else
            csr_pga1_int_sw_offset_compensation_ff <= csr_pga1_int_sw_offset_compensation_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_INT_SW(9 downto 8) - se - LNA input connection switch
-- access: rw, hardware: o
-----------------------

csr_pga1_int_sw_rdata(9 downto 8) <= csr_pga1_int_sw_se_ff;

csr_pga1_int_sw_se_out <= csr_pga1_int_sw_se_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_int_sw_se_ff <= "11"; -- 0x3
else
        if (csr_pga1_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga1_int_sw_se_ff(1 downto 0) <= wdata(9 downto 8);
            end if;
        else
            csr_pga1_int_sw_se_ff <= csr_pga1_int_sw_se_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_INT_SW(11 downto 10) - sm - diffamp input connection switch
-- access: rw, hardware: o
-----------------------

csr_pga1_int_sw_rdata(11 downto 10) <= csr_pga1_int_sw_sm_ff;

csr_pga1_int_sw_sm_out <= csr_pga1_int_sw_sm_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_int_sw_sm_ff <= "11"; -- 0x3
else
        if (csr_pga1_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga1_int_sw_sm_ff(1 downto 0) <= wdata(11 downto 10);
            end if;
        else
            csr_pga1_int_sw_sm_ff <= csr_pga1_int_sw_sm_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_INT_SW(13 downto 12) - sc - LNA feedback cap switch
-- access: rw, hardware: o
-----------------------

csr_pga1_int_sw_rdata(13 downto 12) <= csr_pga1_int_sw_sc_ff;

csr_pga1_int_sw_sc_out <= csr_pga1_int_sw_sc_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_int_sw_sc_ff <= "11"; -- 0x3
else
        if (csr_pga1_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga1_int_sw_sc_ff(1 downto 0) <= wdata(13 downto 12);
            end if;
        else
            csr_pga1_int_sw_sc_ff <= csr_pga1_int_sw_sc_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x120] - PGA1_TST_SW - Switch configuration for testpad connectivity
--------------------------------------------------------------------------------
csr_pga1_tst_sw_rdata(31 downto 10) <= (others => '0');

csr_pga1_tst_sw_wen <= wen when (waddr = "00000000000000000000000100100000") else '0'; -- 0x120

csr_pga1_tst_sw_ren <= ren when (raddr = "00000000000000000000000100100000") else '0'; -- 0x120
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_tst_sw_ren_ff <= '0'; -- 0x0
else
        csr_pga1_tst_sw_ren_ff <= csr_pga1_tst_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_TST_SW(5 downto 0) - si - SI switches that are connected to testpads
-- access: rw, hardware: o
-----------------------

csr_pga1_tst_sw_rdata(5 downto 0) <= csr_pga1_tst_sw_si_ff;

csr_pga1_tst_sw_si_out <= csr_pga1_tst_sw_si_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_tst_sw_si_ff <= "110001"; -- 0x31
else
        if (csr_pga1_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_tst_sw_si_ff(5 downto 0) <= wdata(5 downto 0);
            end if;
        else
            csr_pga1_tst_sw_si_ff <= csr_pga1_tst_sw_si_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_TST_SW(9 downto 6) - so - SO switches that are connected to testpads
-- access: rw, hardware: o
-----------------------

csr_pga1_tst_sw_rdata(9 downto 6) <= csr_pga1_tst_sw_so_ff;

csr_pga1_tst_sw_so_out <= csr_pga1_tst_sw_so_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_tst_sw_so_ff <= "0011"; -- 0x3
else
        if (csr_pga1_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_tst_sw_so_ff(1 downto 0) <= wdata(7 downto 6);
            end if;
            if (wstrb(1) = '1') then
                csr_pga1_tst_sw_so_ff(3 downto 2) <= wdata(9 downto 8);
            end if;
        else
            csr_pga1_tst_sw_so_ff <= csr_pga1_tst_sw_so_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x140] - PGA1_OC1 - Offset compensation values for OPAMP1
--------------------------------------------------------------------------------
csr_pga1_oc1_rdata(31 downto 16) <= (others => '0');

csr_pga1_oc1_wen <= wen when (waddr = "00000000000000000000000101000000") else '0'; -- 0x140

csr_pga1_oc1_ren <= ren when (raddr = "00000000000000000000000101000000") else '0'; -- 0x140
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc1_ren_ff <= '0'; -- 0x0
else
        csr_pga1_oc1_ren_ff <= csr_pga1_oc1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_OC1(7 downto 0) - OC1_P - P side
-- access: rw, hardware: o
-----------------------

csr_pga1_oc1_rdata(7 downto 0) <= csr_pga1_oc1_oc1_p_ff;

csr_pga1_oc1_oc1_p_out <= csr_pga1_oc1_oc1_p_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc1_oc1_p_ff <= "00000000"; -- 0x0
else
        if (csr_pga1_oc1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_oc1_oc1_p_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
        else
            csr_pga1_oc1_oc1_p_ff <= csr_pga1_oc1_oc1_p_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_OC1(15 downto 8) - OC1_N - N side
-- access: rw, hardware: o
-----------------------

csr_pga1_oc1_rdata(15 downto 8) <= csr_pga1_oc1_oc1_n_ff;

csr_pga1_oc1_oc1_n_out <= csr_pga1_oc1_oc1_n_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc1_oc1_n_ff <= "00000000"; -- 0x0
else
        if (csr_pga1_oc1_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga1_oc1_oc1_n_ff(7 downto 0) <= wdata(15 downto 8);
            end if;
        else
            csr_pga1_oc1_oc1_n_ff <= csr_pga1_oc1_oc1_n_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x144] - PGA1_OC2 - Offset compensation values for OPAMP2
--------------------------------------------------------------------------------
csr_pga1_oc2_rdata(31 downto 16) <= (others => '0');

csr_pga1_oc2_wen <= wen when (waddr = "00000000000000000000000101000100") else '0'; -- 0x144

csr_pga1_oc2_ren <= ren when (raddr = "00000000000000000000000101000100") else '0'; -- 0x144
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc2_ren_ff <= '0'; -- 0x0
else
        csr_pga1_oc2_ren_ff <= csr_pga1_oc2_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_OC2(7 downto 0) - OC1_P - P side
-- access: rw, hardware: o
-----------------------

csr_pga1_oc2_rdata(7 downto 0) <= csr_pga1_oc2_oc1_p_ff;

csr_pga1_oc2_oc1_p_out <= csr_pga1_oc2_oc1_p_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc2_oc1_p_ff <= "00000000"; -- 0x0
else
        if (csr_pga1_oc2_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_oc2_oc1_p_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
        else
            csr_pga1_oc2_oc1_p_ff <= csr_pga1_oc2_oc1_p_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA1_OC2(15 downto 8) - OC1_N - N side
-- access: rw, hardware: o
-----------------------

csr_pga1_oc2_rdata(15 downto 8) <= csr_pga1_oc2_oc1_n_ff;

csr_pga1_oc2_oc1_n_out <= csr_pga1_oc2_oc1_n_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_oc2_oc1_n_ff <= "00000000"; -- 0x0
else
        if (csr_pga1_oc2_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga1_oc2_oc1_n_ff(7 downto 0) <= wdata(15 downto 8);
            end if;
        else
            csr_pga1_oc2_oc1_n_ff <= csr_pga1_oc2_oc1_n_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x150] - PGA1_GAIN1 - Gain for first amplifier stage
--------------------------------------------------------------------------------
csr_pga1_gain1_rdata(31 downto 7) <= (others => '0');

csr_pga1_gain1_wen <= wen when (waddr = "00000000000000000000000101010000") else '0'; -- 0x150

csr_pga1_gain1_ren <= ren when (raddr = "00000000000000000000000101010000") else '0'; -- 0x150
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain1_ren_ff <= '0'; -- 0x0
else
        csr_pga1_gain1_ren_ff <= csr_pga1_gain1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_GAIN1(6 downto 0) - gain - gain; linear between 1 and 128
-- access: rw, hardware: o
-----------------------

csr_pga1_gain1_rdata(6 downto 0) <= csr_pga1_gain1_gain_ff;

csr_pga1_gain1_gain_out <= csr_pga1_gain1_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain1_gain_ff <= "0000001"; -- 0x1
else
        if (csr_pga1_gain1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_gain1_gain_ff(6 downto 0) <= wdata(6 downto 0);
            end if;
        else
            csr_pga1_gain1_gain_ff <= csr_pga1_gain1_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x160] - PGA1_GAIN2_1 - Gain for second amplifier stage, P path
--------------------------------------------------------------------------------
csr_pga1_gain2_1_rdata(31 downto 3) <= (others => '0');

csr_pga1_gain2_1_wen <= wen when (waddr = "00000000000000000000000101100000") else '0'; -- 0x160

csr_pga1_gain2_1_ren <= ren when (raddr = "00000000000000000000000101100000") else '0'; -- 0x160
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain2_1_ren_ff <= '0'; -- 0x0
else
        csr_pga1_gain2_1_ren_ff <= csr_pga1_gain2_1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_GAIN2_1(2 downto 0) - gain - gain; linear between 0.5 and 4
-- access: rw, hardware: o
-----------------------

csr_pga1_gain2_1_rdata(2 downto 0) <= csr_pga1_gain2_1_gain_ff;

csr_pga1_gain2_1_gain_out <= csr_pga1_gain2_1_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain2_1_gain_ff <= "001"; -- 0x1
else
        if (csr_pga1_gain2_1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_gain2_1_gain_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga1_gain2_1_gain_ff <= csr_pga1_gain2_1_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x164] - PGA1_GAIN2_2 - Gain for second amplifier stage, N path
--------------------------------------------------------------------------------
csr_pga1_gain2_2_rdata(31 downto 3) <= (others => '0');

csr_pga1_gain2_2_wen <= wen when (waddr = "00000000000000000000000101100100") else '0'; -- 0x164

csr_pga1_gain2_2_ren <= ren when (raddr = "00000000000000000000000101100100") else '0'; -- 0x164
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain2_2_ren_ff <= '0'; -- 0x0
else
        csr_pga1_gain2_2_ren_ff <= csr_pga1_gain2_2_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA1_GAIN2_2(2 downto 0) - gain - gain; linear between 0.5 and 3.5
-- access: rw, hardware: o
-----------------------

csr_pga1_gain2_2_rdata(2 downto 0) <= csr_pga1_gain2_2_gain_ff;

csr_pga1_gain2_2_gain_out <= csr_pga1_gain2_2_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga1_gain2_2_gain_ff <= "001"; -- 0x1
else
        if (csr_pga1_gain2_2_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga1_gain2_2_gain_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga1_gain2_2_gain_ff <= csr_pga1_gain2_2_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x200] - PGA2_CONTROL - Control register.
--------------------------------------------------------------------------------
csr_pga2_control_rdata(31 downto 3) <= (others => '0');

csr_pga2_control_wen <= wen when (waddr = "00000000000000000000001000000000") else '0'; -- 0x200

csr_pga2_control_ren <= ren when (raddr = "00000000000000000000001000000000") else '0'; -- 0x200
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_control_ren_ff <= '0'; -- 0x0
else
        csr_pga2_control_ren_ff <= csr_pga2_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_CONTROL(2 downto 0) - power_down - Selection of devices to power down
-- access: rw, hardware: o
-----------------------

csr_pga2_control_rdata(2 downto 0) <= csr_pga2_control_power_down_ff;

csr_pga2_control_power_down_out <= csr_pga2_control_power_down_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_control_power_down_ff <= "000"; -- 0x0
else
        if (csr_pga2_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_control_power_down_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga2_control_power_down_ff <= csr_pga2_control_power_down_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x210] - PGA2_INT_SW - Switch configuration for internal connectivity
--------------------------------------------------------------------------------
csr_pga2_int_sw_rdata(7 downto 6) <= (others => '0');
csr_pga2_int_sw_rdata(31 downto 14) <= (others => '0');

csr_pga2_int_sw_wen <= wen when (waddr = "00000000000000000000001000010000") else '0'; -- 0x210

csr_pga2_int_sw_ren <= ren when (raddr = "00000000000000000000001000010000") else '0'; -- 0x210
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_int_sw_ren_ff <= '0'; -- 0x0
else
        csr_pga2_int_sw_ren_ff <= csr_pga2_int_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_INT_SW(5 downto 0) - offset_compensation - Selection of switches that are to be put into offset compensation mode
-- access: rw, hardware: o
-----------------------

csr_pga2_int_sw_rdata(5 downto 0) <= csr_pga2_int_sw_offset_compensation_ff;

csr_pga2_int_sw_offset_compensation_out <= csr_pga2_int_sw_offset_compensation_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_int_sw_offset_compensation_ff <= "000000"; -- 0x0
else
        if (csr_pga2_int_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_int_sw_offset_compensation_ff(5 downto 0) <= wdata(5 downto 0);
            end if;
        else
            csr_pga2_int_sw_offset_compensation_ff <= csr_pga2_int_sw_offset_compensation_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_INT_SW(9 downto 8) - se - LNA input connection switch
-- access: rw, hardware: o
-----------------------

csr_pga2_int_sw_rdata(9 downto 8) <= csr_pga2_int_sw_se_ff;

csr_pga2_int_sw_se_out <= csr_pga2_int_sw_se_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_int_sw_se_ff <= "11"; -- 0x3
else
        if (csr_pga2_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga2_int_sw_se_ff(1 downto 0) <= wdata(9 downto 8);
            end if;
        else
            csr_pga2_int_sw_se_ff <= csr_pga2_int_sw_se_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_INT_SW(11 downto 10) - sm - diffamp input connection switch
-- access: rw, hardware: o
-----------------------

csr_pga2_int_sw_rdata(11 downto 10) <= csr_pga2_int_sw_sm_ff;

csr_pga2_int_sw_sm_out <= csr_pga2_int_sw_sm_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_int_sw_sm_ff <= "11"; -- 0x3
else
        if (csr_pga2_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga2_int_sw_sm_ff(1 downto 0) <= wdata(11 downto 10);
            end if;
        else
            csr_pga2_int_sw_sm_ff <= csr_pga2_int_sw_sm_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_INT_SW(13 downto 12) - sc - LNA feedback cap switch
-- access: rw, hardware: o
-----------------------

csr_pga2_int_sw_rdata(13 downto 12) <= csr_pga2_int_sw_sc_ff;

csr_pga2_int_sw_sc_out <= csr_pga2_int_sw_sc_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_int_sw_sc_ff <= "11"; -- 0x3
else
        if (csr_pga2_int_sw_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga2_int_sw_sc_ff(1 downto 0) <= wdata(13 downto 12);
            end if;
        else
            csr_pga2_int_sw_sc_ff <= csr_pga2_int_sw_sc_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x220] - PGA2_TST_SW - Switch configuration for testpad connectivity
--------------------------------------------------------------------------------
csr_pga2_tst_sw_rdata(31 downto 10) <= (others => '0');

csr_pga2_tst_sw_wen <= wen when (waddr = "00000000000000000000001000100000") else '0'; -- 0x220

csr_pga2_tst_sw_ren <= ren when (raddr = "00000000000000000000001000100000") else '0'; -- 0x220
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_tst_sw_ren_ff <= '0'; -- 0x0
else
        csr_pga2_tst_sw_ren_ff <= csr_pga2_tst_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_TST_SW(5 downto 0) - si - SI switches that are connected to testpads
-- access: rw, hardware: o
-----------------------

csr_pga2_tst_sw_rdata(5 downto 0) <= csr_pga2_tst_sw_si_ff;

csr_pga2_tst_sw_si_out <= csr_pga2_tst_sw_si_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_tst_sw_si_ff <= "110001"; -- 0x31
else
        if (csr_pga2_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_tst_sw_si_ff(5 downto 0) <= wdata(5 downto 0);
            end if;
        else
            csr_pga2_tst_sw_si_ff <= csr_pga2_tst_sw_si_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_TST_SW(9 downto 6) - so - SO switches that are connected to testpads
-- access: rw, hardware: o
-----------------------

csr_pga2_tst_sw_rdata(9 downto 6) <= csr_pga2_tst_sw_so_ff;

csr_pga2_tst_sw_so_out <= csr_pga2_tst_sw_so_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_tst_sw_so_ff <= "0011"; -- 0x3
else
        if (csr_pga2_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_tst_sw_so_ff(1 downto 0) <= wdata(7 downto 6);
            end if;
            if (wstrb(1) = '1') then
                csr_pga2_tst_sw_so_ff(3 downto 2) <= wdata(9 downto 8);
            end if;
        else
            csr_pga2_tst_sw_so_ff <= csr_pga2_tst_sw_so_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x240] - PGA2_OC1 - Offset compensation values for OPAMP1
--------------------------------------------------------------------------------
csr_pga2_oc1_rdata(31 downto 16) <= (others => '0');

csr_pga2_oc1_wen <= wen when (waddr = "00000000000000000000001001000000") else '0'; -- 0x240

csr_pga2_oc1_ren <= ren when (raddr = "00000000000000000000001001000000") else '0'; -- 0x240
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc1_ren_ff <= '0'; -- 0x0
else
        csr_pga2_oc1_ren_ff <= csr_pga2_oc1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_OC1(7 downto 0) - OC1_P - P side
-- access: rw, hardware: o
-----------------------

csr_pga2_oc1_rdata(7 downto 0) <= csr_pga2_oc1_oc1_p_ff;

csr_pga2_oc1_oc1_p_out <= csr_pga2_oc1_oc1_p_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc1_oc1_p_ff <= "00000000"; -- 0x0
else
        if (csr_pga2_oc1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_oc1_oc1_p_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
        else
            csr_pga2_oc1_oc1_p_ff <= csr_pga2_oc1_oc1_p_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_OC1(15 downto 8) - OC1_N - N side
-- access: rw, hardware: o
-----------------------

csr_pga2_oc1_rdata(15 downto 8) <= csr_pga2_oc1_oc1_n_ff;

csr_pga2_oc1_oc1_n_out <= csr_pga2_oc1_oc1_n_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc1_oc1_n_ff <= "00000000"; -- 0x0
else
        if (csr_pga2_oc1_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga2_oc1_oc1_n_ff(7 downto 0) <= wdata(15 downto 8);
            end if;
        else
            csr_pga2_oc1_oc1_n_ff <= csr_pga2_oc1_oc1_n_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x244] - PGA2_OC2 - Offset compensation values for OPAMP2
--------------------------------------------------------------------------------
csr_pga2_oc2_rdata(31 downto 16) <= (others => '0');

csr_pga2_oc2_wen <= wen when (waddr = "00000000000000000000001001000100") else '0'; -- 0x244

csr_pga2_oc2_ren <= ren when (raddr = "00000000000000000000001001000100") else '0'; -- 0x244
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc2_ren_ff <= '0'; -- 0x0
else
        csr_pga2_oc2_ren_ff <= csr_pga2_oc2_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_OC2(7 downto 0) - OC1_P - P side
-- access: rw, hardware: o
-----------------------

csr_pga2_oc2_rdata(7 downto 0) <= csr_pga2_oc2_oc1_p_ff;

csr_pga2_oc2_oc1_p_out <= csr_pga2_oc2_oc1_p_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc2_oc1_p_ff <= "00000000"; -- 0x0
else
        if (csr_pga2_oc2_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_oc2_oc1_p_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
        else
            csr_pga2_oc2_oc1_p_ff <= csr_pga2_oc2_oc1_p_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- PGA2_OC2(15 downto 8) - OC1_N - N side
-- access: rw, hardware: o
-----------------------

csr_pga2_oc2_rdata(15 downto 8) <= csr_pga2_oc2_oc1_n_ff;

csr_pga2_oc2_oc1_n_out <= csr_pga2_oc2_oc1_n_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_oc2_oc1_n_ff <= "00000000"; -- 0x0
else
        if (csr_pga2_oc2_wen = '1') then
            if (wstrb(1) = '1') then
                csr_pga2_oc2_oc1_n_ff(7 downto 0) <= wdata(15 downto 8);
            end if;
        else
            csr_pga2_oc2_oc1_n_ff <= csr_pga2_oc2_oc1_n_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x250] - PGA2_GAIN1 - Gain for first amplifier stage
--------------------------------------------------------------------------------
csr_pga2_gain1_rdata(31 downto 7) <= (others => '0');

csr_pga2_gain1_wen <= wen when (waddr = "00000000000000000000001001010000") else '0'; -- 0x250

csr_pga2_gain1_ren <= ren when (raddr = "00000000000000000000001001010000") else '0'; -- 0x250
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain1_ren_ff <= '0'; -- 0x0
else
        csr_pga2_gain1_ren_ff <= csr_pga2_gain1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_GAIN1(6 downto 0) - gain - gain; linear between 1 and 128
-- access: rw, hardware: o
-----------------------

csr_pga2_gain1_rdata(6 downto 0) <= csr_pga2_gain1_gain_ff;

csr_pga2_gain1_gain_out <= csr_pga2_gain1_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain1_gain_ff <= "0010011"; -- 0x13
else
        if (csr_pga2_gain1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_gain1_gain_ff(6 downto 0) <= wdata(6 downto 0);
            end if;
        else
            csr_pga2_gain1_gain_ff <= csr_pga2_gain1_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x260] - PGA2_GAIN2_1 - Gain for second amplifier stage, P path
--------------------------------------------------------------------------------
csr_pga2_gain2_1_rdata(31 downto 3) <= (others => '0');

csr_pga2_gain2_1_wen <= wen when (waddr = "00000000000000000000001001100000") else '0'; -- 0x260

csr_pga2_gain2_1_ren <= ren when (raddr = "00000000000000000000001001100000") else '0'; -- 0x260
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain2_1_ren_ff <= '0'; -- 0x0
else
        csr_pga2_gain2_1_ren_ff <= csr_pga2_gain2_1_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_GAIN2_1(2 downto 0) - gain - gain; linear between 0.5 and 3.5
-- access: rw, hardware: o
-----------------------

csr_pga2_gain2_1_rdata(2 downto 0) <= csr_pga2_gain2_1_gain_ff;

csr_pga2_gain2_1_gain_out <= csr_pga2_gain2_1_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain2_1_gain_ff <= "100"; -- 0x4
else
        if (csr_pga2_gain2_1_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_gain2_1_gain_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga2_gain2_1_gain_ff <= csr_pga2_gain2_1_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x264] - PGA2_GAIN2_2 - Gain for second amplifier stage, N path
--------------------------------------------------------------------------------
csr_pga2_gain2_2_rdata(31 downto 3) <= (others => '0');

csr_pga2_gain2_2_wen <= wen when (waddr = "00000000000000000000001001100100") else '0'; -- 0x264

csr_pga2_gain2_2_ren <= ren when (raddr = "00000000000000000000001001100100") else '0'; -- 0x264
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain2_2_ren_ff <= '0'; -- 0x0
else
        csr_pga2_gain2_2_ren_ff <= csr_pga2_gain2_2_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- PGA2_GAIN2_2(2 downto 0) - gain - gain; linear between 0.5 and 3.5
-- access: rw, hardware: o
-----------------------

csr_pga2_gain2_2_rdata(2 downto 0) <= csr_pga2_gain2_2_gain_ff;

csr_pga2_gain2_2_gain_out <= csr_pga2_gain2_2_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_pga2_gain2_2_gain_ff <= "100"; -- 0x4
else
        if (csr_pga2_gain2_2_wen = '1') then
            if (wstrb(0) = '1') then
                csr_pga2_gain2_2_gain_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_pga2_gain2_2_gain_ff <= csr_pga2_gain2_2_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x280] - TI_CONTROL - Transimpedance control register
--------------------------------------------------------------------------------
csr_ti_control_rdata(31 downto 1) <= (others => '0');

csr_ti_control_wen <= wen when (waddr = "00000000000000000000001010000000") else '0'; -- 0x280

csr_ti_control_ren <= ren when (raddr = "00000000000000000000001010000000") else '0'; -- 0x280
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_control_ren_ff <= '0'; -- 0x0
else
        csr_ti_control_ren_ff <= csr_ti_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- TI_CONTROL(0) - pd - power_down
-- access: rw, hardware: o
-----------------------

csr_ti_control_rdata(0) <= csr_ti_control_pd_ff;

csr_ti_control_pd_out <= csr_ti_control_pd_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_control_pd_ff <= '0'; -- 0x0
else
        if (csr_ti_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_ti_control_pd_ff <= wdata(0);
            end if;
        else
            csr_ti_control_pd_ff <= csr_ti_control_pd_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x284] - TI_GAIN - Transimpedance gain
--------------------------------------------------------------------------------
csr_ti_gain_rdata(31 downto 3) <= (others => '0');

csr_ti_gain_wen <= wen when (waddr = "00000000000000000000001010000100") else '0'; -- 0x284

csr_ti_gain_ren <= ren when (raddr = "00000000000000000000001010000100") else '0'; -- 0x284
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_gain_ren_ff <= '0'; -- 0x0
else
        csr_ti_gain_ren_ff <= csr_ti_gain_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- TI_GAIN(2 downto 0) - res - resistor selection
-- access: rw, hardware: o
-----------------------

csr_ti_gain_rdata(2 downto 0) <= csr_ti_gain_res_ff;

csr_ti_gain_res_out <= csr_ti_gain_res_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_gain_res_ff <= "000"; -- 0x0
else
        if (csr_ti_gain_wen = '1') then
            if (wstrb(0) = '1') then
                csr_ti_gain_res_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_ti_gain_res_ff <= csr_ti_gain_res_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x288] - TI_SW - Transimpedance switch configuration
--------------------------------------------------------------------------------
csr_ti_sw_rdata(31 downto 1) <= (others => '0');

csr_ti_sw_wen <= wen when (waddr = "00000000000000000000001010001000") else '0'; -- 0x288

csr_ti_sw_ren <= ren when (raddr = "00000000000000000000001010001000") else '0'; -- 0x288
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_sw_ren_ff <= '0'; -- 0x0
else
        csr_ti_sw_ren_ff <= csr_ti_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- TI_SW(0) - tp_switch - testpad on/off
-- access: rw, hardware: o
-----------------------

csr_ti_sw_rdata(0) <= csr_ti_sw_tp_switch_ff;

csr_ti_sw_tp_switch_out <= csr_ti_sw_tp_switch_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_ti_sw_tp_switch_ff <= '1'; -- 0x1
else
        if (csr_ti_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_ti_sw_tp_switch_ff <= wdata(0);
            end if;
        else
            csr_ti_sw_tp_switch_ff <= csr_ti_sw_tp_switch_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x300] - ADC1_CONTROL - Control register
--------------------------------------------------------------------------------
csr_adc1_control_rdata(31 downto 2) <= (others => '0');

csr_adc1_control_wen <= wen when (waddr = "00000000000000000000001100000000") else '0'; -- 0x300

csr_adc1_control_ren <= ren when (raddr = "00000000000000000000001100000000") else '0'; -- 0x300
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_control_ren_ff <= '0'; -- 0x0
else
        csr_adc1_control_ren_ff <= csr_adc1_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC1_CONTROL(0) - en - enable
-- access: rw, hardware: o
-----------------------

csr_adc1_control_rdata(0) <= csr_adc1_control_en_ff;

csr_adc1_control_en_out <= csr_adc1_control_en_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_control_en_ff <= '1'; -- 0x1
else
        if (csr_adc1_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc1_control_en_ff <= wdata(0);
            end if;
        else
            csr_adc1_control_en_ff <= csr_adc1_control_en_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC1_CONTROL(1) - holdtype - hold type
-- access: rw, hardware: o
-----------------------

csr_adc1_control_rdata(1) <= csr_adc1_control_holdtype_ff;

csr_adc1_control_holdtype_out <= csr_adc1_control_holdtype_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_control_holdtype_ff <= '0'; -- 0x0
else
        if (csr_adc1_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc1_control_holdtype_ff <= wdata(1);
            end if;
        else
            csr_adc1_control_holdtype_ff <= csr_adc1_control_holdtype_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x310] - ADC1_DELAY - delay settings
--------------------------------------------------------------------------------
csr_adc1_delay_rdata(31 downto 13) <= (others => '0');

csr_adc1_delay_wen <= wen when (waddr = "00000000000000000000001100010000") else '0'; -- 0x310

csr_adc1_delay_ren <= ren when (raddr = "00000000000000000000001100010000") else '0'; -- 0x310
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_delay_ren_ff <= '0'; -- 0x0
else
        csr_adc1_delay_ren_ff <= csr_adc1_delay_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC1_DELAY(4 downto 0) - hold_time - number of clock cycles to hold before sampling. Ignored in track&hold.
-- access: rw, hardware: o
-----------------------

csr_adc1_delay_rdata(4 downto 0) <= csr_adc1_delay_hold_time_ff;

csr_adc1_delay_hold_time_out <= csr_adc1_delay_hold_time_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_delay_hold_time_ff <= "00010"; -- 0x2
else
        if (csr_adc1_delay_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc1_delay_hold_time_ff(4 downto 0) <= wdata(4 downto 0);
            end if;
        else
            csr_adc1_delay_hold_time_ff <= csr_adc1_delay_hold_time_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC1_DELAY(8 downto 5) - high_bits_delay - number of clock cycles to wait after switching bits 9..7
-- access: rw, hardware: o
-----------------------

csr_adc1_delay_rdata(8 downto 5) <= csr_adc1_delay_high_bits_delay_ff;

csr_adc1_delay_high_bits_delay_out <= csr_adc1_delay_high_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_delay_high_bits_delay_ff <= "0100"; -- 0x4
else
        if (csr_adc1_delay_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc1_delay_high_bits_delay_ff(2 downto 0) <= wdata(7 downto 5);
            end if;
            if (wstrb(1) = '1') then
                csr_adc1_delay_high_bits_delay_ff(3) <= wdata(8);
            end if;
        else
            csr_adc1_delay_high_bits_delay_ff <= csr_adc1_delay_high_bits_delay_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC1_DELAY(10 downto 9) - mid_bits_delay - number of clock cycles to wait after switching bits 6..4
-- access: rw, hardware: o
-----------------------

csr_adc1_delay_rdata(10 downto 9) <= csr_adc1_delay_mid_bits_delay_ff;

csr_adc1_delay_mid_bits_delay_out <= csr_adc1_delay_mid_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_delay_mid_bits_delay_ff <= "10"; -- 0x2
else
        if (csr_adc1_delay_wen = '1') then
            if (wstrb(1) = '1') then
                csr_adc1_delay_mid_bits_delay_ff(1 downto 0) <= wdata(10 downto 9);
            end if;
        else
            csr_adc1_delay_mid_bits_delay_ff <= csr_adc1_delay_mid_bits_delay_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC1_DELAY(12 downto 11) - low_bits_delay - number of clock cycles to wait after switching bits 3..0
-- access: rw, hardware: o
-----------------------

csr_adc1_delay_rdata(12 downto 11) <= csr_adc1_delay_low_bits_delay_ff;

csr_adc1_delay_low_bits_delay_out <= csr_adc1_delay_low_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_delay_low_bits_delay_ff <= "01"; -- 0x1
else
        if (csr_adc1_delay_wen = '1') then
            if (wstrb(1) = '1') then
                csr_adc1_delay_low_bits_delay_ff(1 downto 0) <= wdata(12 downto 11);
            end if;
        else
            csr_adc1_delay_low_bits_delay_ff <= csr_adc1_delay_low_bits_delay_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x380] - ADC1_OUT - ADC output value
--------------------------------------------------------------------------------
csr_adc1_out_rdata(31 downto 12) <= (others => '0');


csr_adc1_out_ren <= ren when (raddr = "00000000000000000000001110000000") else '0'; -- 0x380
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_out_ren_ff <= '0'; -- 0x0
else
        csr_adc1_out_ren_ff <= csr_adc1_out_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC1_OUT(11 downto 0) - output_value - AD converted value
-- access: ro, hardware: i
-----------------------

csr_adc1_out_rdata(11 downto 0) <= csr_adc1_out_output_value_ff;


process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc1_out_output_value_ff <= "000000000000"; -- 0x0
else
            csr_adc1_out_output_value_ff <= csr_adc1_out_output_value_in;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x400] - ADC2_CONTROL - Control register
--------------------------------------------------------------------------------
csr_adc2_control_rdata(31 downto 2) <= (others => '0');

csr_adc2_control_wen <= wen when (waddr = "00000000000000000000010000000000") else '0'; -- 0x400

csr_adc2_control_ren <= ren when (raddr = "00000000000000000000010000000000") else '0'; -- 0x400
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_control_ren_ff <= '0'; -- 0x0
else
        csr_adc2_control_ren_ff <= csr_adc2_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC2_CONTROL(0) - en - enable
-- access: rw, hardware: o
-----------------------

csr_adc2_control_rdata(0) <= csr_adc2_control_en_ff;

csr_adc2_control_en_out <= csr_adc2_control_en_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_control_en_ff <= '1'; -- 0x1
else
        if (csr_adc2_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc2_control_en_ff <= wdata(0);
            end if;
        else
            csr_adc2_control_en_ff <= csr_adc2_control_en_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC2_CONTROL(1) - holdtype - hold type
-- access: rw, hardware: o
-----------------------

csr_adc2_control_rdata(1) <= csr_adc2_control_holdtype_ff;

csr_adc2_control_holdtype_out <= csr_adc2_control_holdtype_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_control_holdtype_ff <= '0'; -- 0x0
else
        if (csr_adc2_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc2_control_holdtype_ff <= wdata(1);
            end if;
        else
            csr_adc2_control_holdtype_ff <= csr_adc2_control_holdtype_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x410] - ADC2_DELAY - delay settings
--------------------------------------------------------------------------------
csr_adc2_delay_rdata(31 downto 13) <= (others => '0');

csr_adc2_delay_wen <= wen when (waddr = "00000000000000000000010000010000") else '0'; -- 0x410

csr_adc2_delay_ren <= ren when (raddr = "00000000000000000000010000010000") else '0'; -- 0x410
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_delay_ren_ff <= '0'; -- 0x0
else
        csr_adc2_delay_ren_ff <= csr_adc2_delay_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC2_DELAY(4 downto 0) - hold_time - number of clock cycles to hold before sampling. Ignored in track&hold.
-- access: rw, hardware: o
-----------------------

csr_adc2_delay_rdata(4 downto 0) <= csr_adc2_delay_hold_time_ff;

csr_adc2_delay_hold_time_out <= csr_adc2_delay_hold_time_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_delay_hold_time_ff <= "00010"; -- 0x2
else
        if (csr_adc2_delay_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc2_delay_hold_time_ff(4 downto 0) <= wdata(4 downto 0);
            end if;
        else
            csr_adc2_delay_hold_time_ff <= csr_adc2_delay_hold_time_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC2_DELAY(8 downto 5) - high_bits_delay - number of clock cycles to wait after switching bits 9..7
-- access: rw, hardware: o
-----------------------

csr_adc2_delay_rdata(8 downto 5) <= csr_adc2_delay_high_bits_delay_ff;

csr_adc2_delay_high_bits_delay_out <= csr_adc2_delay_high_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_delay_high_bits_delay_ff <= "0100"; -- 0x4
else
        if (csr_adc2_delay_wen = '1') then
            if (wstrb(0) = '1') then
                csr_adc2_delay_high_bits_delay_ff(2 downto 0) <= wdata(7 downto 5);
            end if;
            if (wstrb(1) = '1') then
                csr_adc2_delay_high_bits_delay_ff(3) <= wdata(8);
            end if;
        else
            csr_adc2_delay_high_bits_delay_ff <= csr_adc2_delay_high_bits_delay_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC2_DELAY(10 downto 9) - mid_bits_delay - number of clock cycles to wait after switching bits 6..4
-- access: rw, hardware: o
-----------------------

csr_adc2_delay_rdata(10 downto 9) <= csr_adc2_delay_mid_bits_delay_ff;

csr_adc2_delay_mid_bits_delay_out <= csr_adc2_delay_mid_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_delay_mid_bits_delay_ff <= "10"; -- 0x2
else
        if (csr_adc2_delay_wen = '1') then
            if (wstrb(1) = '1') then
                csr_adc2_delay_mid_bits_delay_ff(1 downto 0) <= wdata(10 downto 9);
            end if;
        else
            csr_adc2_delay_mid_bits_delay_ff <= csr_adc2_delay_mid_bits_delay_ff;
        end if;
end if;
end if;
end process;



-----------------------
-- Bit field:
-- ADC2_DELAY(12 downto 11) - low_bits_delay - number of clock cycles to wait after switching bits 3..0
-- access: rw, hardware: o
-----------------------

csr_adc2_delay_rdata(12 downto 11) <= csr_adc2_delay_low_bits_delay_ff;

csr_adc2_delay_low_bits_delay_out <= csr_adc2_delay_low_bits_delay_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_delay_low_bits_delay_ff <= "01"; -- 0x1
else
        if (csr_adc2_delay_wen = '1') then
            if (wstrb(1) = '1') then
                csr_adc2_delay_low_bits_delay_ff(1 downto 0) <= wdata(12 downto 11);
            end if;
        else
            csr_adc2_delay_low_bits_delay_ff <= csr_adc2_delay_low_bits_delay_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x480] - ADC2_OUT - ADC output value
--------------------------------------------------------------------------------
csr_adc2_out_rdata(31 downto 12) <= (others => '0');


csr_adc2_out_ren <= ren when (raddr = "00000000000000000000010010000000") else '0'; -- 0x480
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_out_ren_ff <= '0'; -- 0x0
else
        csr_adc2_out_ren_ff <= csr_adc2_out_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- ADC2_OUT(11 downto 0) - output_value - AD converted value
-- access: ro, hardware: i
-----------------------

csr_adc2_out_rdata(11 downto 0) <= csr_adc2_out_output_value_ff;


process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_adc2_out_output_value_ff <= "000000000000"; -- 0x0
else
            csr_adc2_out_output_value_ff <= csr_adc2_out_output_value_in;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x500] - DAC1_CONTROL - Control register
--------------------------------------------------------------------------------
csr_dac1_control_rdata(31 downto 1) <= (others => '0');

csr_dac1_control_wen <= wen when (waddr = "00000000000000000000010100000000") else '0'; -- 0x500

csr_dac1_control_ren <= ren when (raddr = "00000000000000000000010100000000") else '0'; -- 0x500
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_control_ren_ff <= '0'; -- 0x0
else
        csr_dac1_control_ren_ff <= csr_dac1_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC1_CONTROL(0) - pd - power down
-- access: rw, hardware: o
-----------------------

csr_dac1_control_rdata(0) <= csr_dac1_control_pd_ff;

csr_dac1_control_pd_out <= csr_dac1_control_pd_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_control_pd_ff <= '0'; -- 0x0
else
        if (csr_dac1_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac1_control_pd_ff <= wdata(0);
            end if;
        else
            csr_dac1_control_pd_ff <= csr_dac1_control_pd_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x510] - DAC1_TST_SW - Switch register
--------------------------------------------------------------------------------
csr_dac1_tst_sw_rdata(31 downto 1) <= (others => '0');

csr_dac1_tst_sw_wen <= wen when (waddr = "00000000000000000000010100010000") else '0'; -- 0x510

csr_dac1_tst_sw_ren <= ren when (raddr = "00000000000000000000010100010000") else '0'; -- 0x510
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_tst_sw_ren_ff <= '0'; -- 0x0
else
        csr_dac1_tst_sw_ren_ff <= csr_dac1_tst_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC1_TST_SW(0) - switch_position - testpad switch position
-- access: rw, hardware: o
-----------------------

csr_dac1_tst_sw_rdata(0) <= csr_dac1_tst_sw_switch_position_ff;

csr_dac1_tst_sw_switch_position_out <= csr_dac1_tst_sw_switch_position_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_tst_sw_switch_position_ff <= '0'; -- 0x0
else
        if (csr_dac1_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac1_tst_sw_switch_position_ff <= wdata(0);
            end if;
        else
            csr_dac1_tst_sw_switch_position_ff <= csr_dac1_tst_sw_switch_position_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x520] - DAC1_GAIN - analog gain selection
--------------------------------------------------------------------------------
csr_dac1_gain_rdata(31 downto 2) <= (others => '0');

csr_dac1_gain_wen <= wen when (waddr = "00000000000000000000010100100000") else '0'; -- 0x520

csr_dac1_gain_ren <= ren when (raddr = "00000000000000000000010100100000") else '0'; -- 0x520
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_gain_ren_ff <= '0'; -- 0x0
else
        csr_dac1_gain_ren_ff <= csr_dac1_gain_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC1_GAIN(1 downto 0) - gain - gain selection (0.8, 1, 1.8)
-- access: rw, hardware: o
-----------------------

csr_dac1_gain_rdata(1 downto 0) <= csr_dac1_gain_gain_ff;

csr_dac1_gain_gain_out <= csr_dac1_gain_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_gain_gain_ff <= "01"; -- 0x1
else
        if (csr_dac1_gain_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac1_gain_gain_ff(1 downto 0) <= wdata(1 downto 0);
            end if;
        else
            csr_dac1_gain_gain_ff <= csr_dac1_gain_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x530] - DAC1_ROUT - output resistance selection
--------------------------------------------------------------------------------
csr_dac1_rout_rdata(31 downto 3) <= (others => '0');

csr_dac1_rout_wen <= wen when (waddr = "00000000000000000000010100110000") else '0'; -- 0x530

csr_dac1_rout_ren <= ren when (raddr = "00000000000000000000010100110000") else '0'; -- 0x530
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_rout_ren_ff <= '0'; -- 0x0
else
        csr_dac1_rout_ren_ff <= csr_dac1_rout_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC1_ROUT(2 downto 0) - Rout - output resistance selection (100k, 25k, 6.4k)
-- access: rw, hardware: o
-----------------------

csr_dac1_rout_rdata(2 downto 0) <= csr_dac1_rout_rout_ff;

csr_dac1_rout_rout_out <= csr_dac1_rout_rout_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac1_rout_rout_ff <= "011"; -- 0x3
else
        if (csr_dac1_rout_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac1_rout_rout_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_dac1_rout_rout_ff <= csr_dac1_rout_rout_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x600] - DAC2_CONTROL - Control register
--------------------------------------------------------------------------------
csr_dac2_control_rdata(31 downto 1) <= (others => '0');

csr_dac2_control_wen <= wen when (waddr = "00000000000000000000011000000000") else '0'; -- 0x600

csr_dac2_control_ren <= ren when (raddr = "00000000000000000000011000000000") else '0'; -- 0x600
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_control_ren_ff <= '0'; -- 0x0
else
        csr_dac2_control_ren_ff <= csr_dac2_control_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC2_CONTROL(0) - pd - power down
-- access: rw, hardware: o
-----------------------

csr_dac2_control_rdata(0) <= csr_dac2_control_pd_ff;

csr_dac2_control_pd_out <= csr_dac2_control_pd_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_control_pd_ff <= '0'; -- 0x0
else
        if (csr_dac2_control_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac2_control_pd_ff <= wdata(0);
            end if;
        else
            csr_dac2_control_pd_ff <= csr_dac2_control_pd_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x610] - DAC2_TST_SW - Switch register
--------------------------------------------------------------------------------
csr_dac2_tst_sw_rdata(31 downto 1) <= (others => '0');

csr_dac2_tst_sw_wen <= wen when (waddr = "00000000000000000000011000010000") else '0'; -- 0x610

csr_dac2_tst_sw_ren <= ren when (raddr = "00000000000000000000011000010000") else '0'; -- 0x610
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_tst_sw_ren_ff <= '0'; -- 0x0
else
        csr_dac2_tst_sw_ren_ff <= csr_dac2_tst_sw_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC2_TST_SW(0) - switch_position - testpad switch position
-- access: rw, hardware: o
-----------------------

csr_dac2_tst_sw_rdata(0) <= csr_dac2_tst_sw_switch_position_ff;

csr_dac2_tst_sw_switch_position_out <= csr_dac2_tst_sw_switch_position_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_tst_sw_switch_position_ff <= '0'; -- 0x0
else
        if (csr_dac2_tst_sw_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac2_tst_sw_switch_position_ff <= wdata(0);
            end if;
        else
            csr_dac2_tst_sw_switch_position_ff <= csr_dac2_tst_sw_switch_position_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x620] - DAC2_GAIN - analog gain selection
--------------------------------------------------------------------------------
csr_dac2_gain_rdata(31 downto 2) <= (others => '0');

csr_dac2_gain_wen <= wen when (waddr = "00000000000000000000011000100000") else '0'; -- 0x620

csr_dac2_gain_ren <= ren when (raddr = "00000000000000000000011000100000") else '0'; -- 0x620
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_gain_ren_ff <= '0'; -- 0x0
else
        csr_dac2_gain_ren_ff <= csr_dac2_gain_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC2_GAIN(1 downto 0) - gain - gain selection (0.8, 1, 1.8)
-- access: rw, hardware: o
-----------------------

csr_dac2_gain_rdata(1 downto 0) <= csr_dac2_gain_gain_ff;

csr_dac2_gain_gain_out <= csr_dac2_gain_gain_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_gain_gain_ff <= "01"; -- 0x1
else
        if (csr_dac2_gain_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac2_gain_gain_ff(1 downto 0) <= wdata(1 downto 0);
            end if;
        else
            csr_dac2_gain_gain_ff <= csr_dac2_gain_gain_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x630] - DAC2_ROUT - output resistance selection
--------------------------------------------------------------------------------
csr_dac2_rout_rdata(31 downto 3) <= (others => '0');

csr_dac2_rout_wen <= wen when (waddr = "00000000000000000000011000110000") else '0'; -- 0x630

csr_dac2_rout_ren <= ren when (raddr = "00000000000000000000011000110000") else '0'; -- 0x630
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_rout_ren_ff <= '0'; -- 0x0
else
        csr_dac2_rout_ren_ff <= csr_dac2_rout_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- DAC2_ROUT(2 downto 0) - Rout - output resistance selection (100k, 25k, 6.4k)
-- access: rw, hardware: o
-----------------------

csr_dac2_rout_rdata(2 downto 0) <= csr_dac2_rout_rout_ff;

csr_dac2_rout_rout_out <= csr_dac2_rout_rout_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_dac2_rout_rout_ff <= "011"; -- 0x3
else
        if (csr_dac2_rout_wen = '1') then
            if (wstrb(0) = '1') then
                csr_dac2_rout_rout_ff(2 downto 0) <= wdata(2 downto 0);
            end if;
        else
            csr_dac2_rout_rout_ff <= csr_dac2_rout_rout_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x710] - SINE_LUT_STEP - step size selection
--------------------------------------------------------------------------------
csr_sine_lut_step_rdata(31 downto 10) <= (others => '0');

csr_sine_lut_step_wen <= wen when (waddr = "00000000000000000000011100010000") else '0'; -- 0x710

csr_sine_lut_step_ren <= ren when (raddr = "00000000000000000000011100010000") else '0'; -- 0x710
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_step_ren_ff <= '0'; -- 0x0
else
        csr_sine_lut_step_ren_ff <= csr_sine_lut_step_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- SINE_LUT_STEP(9 downto 0) - step_size - step size selection (in 1 / 1024 per rotation)
-- access: rw, hardware: o
-----------------------

csr_sine_lut_step_rdata(9 downto 0) <= csr_sine_lut_step_step_size_ff;

csr_sine_lut_step_step_size_out <= csr_sine_lut_step_step_size_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_step_step_size_ff <= "0000000001"; -- 0x1
else
        if (csr_sine_lut_step_wen = '1') then
            if (wstrb(0) = '1') then
                csr_sine_lut_step_step_size_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
            if (wstrb(1) = '1') then
                csr_sine_lut_step_step_size_ff(9 downto 8) <= wdata(9 downto 8);
            end if;
        else
            csr_sine_lut_step_step_size_ff <= csr_sine_lut_step_step_size_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x780] - SINE_LUT_OUT0 - current sine at 0° tap
--------------------------------------------------------------------------------
csr_sine_lut_out0_rdata(31 downto 10) <= (others => '0');


csr_sine_lut_out0_ren <= ren when (raddr = "00000000000000000000011110000000") else '0'; -- 0x780
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_out0_ren_ff <= '0'; -- 0x0
else
        csr_sine_lut_out0_ren_ff <= csr_sine_lut_out0_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- SINE_LUT_OUT0(9 downto 0) - out0 - current sine at 0° tap
-- access: ro, hardware: i
-----------------------

csr_sine_lut_out0_rdata(9 downto 0) <= csr_sine_lut_out0_out0_ff;


process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_out0_out0_ff <= "0000000000"; -- 0x0
else
            csr_sine_lut_out0_out0_ff <= csr_sine_lut_out0_out0_in;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x784] - SINE_LUT_OUT90 - current sine at 90° tap
--------------------------------------------------------------------------------
csr_sine_lut_out90_rdata(31 downto 10) <= (others => '0');


csr_sine_lut_out90_ren <= ren when (raddr = "00000000000000000000011110000100") else '0'; -- 0x784
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_out90_ren_ff <= '0'; -- 0x0
else
        csr_sine_lut_out90_ren_ff <= csr_sine_lut_out90_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- SINE_LUT_OUT90(9 downto 0) - out0 - current sine at 90° tap
-- access: ro, hardware: i
-----------------------

csr_sine_lut_out90_rdata(9 downto 0) <= csr_sine_lut_out90_out90_ff;


process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_sine_lut_out90_out90_ff <= "0000000000"; -- 0x0
else
            csr_sine_lut_out90_out90_ff <= csr_sine_lut_out90_out90_in;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- CSR:
-- [0x800] - LOCKIN_PLACEHOLDER - TBD
--------------------------------------------------------------------------------
csr_lockin_placeholder_rdata(31 downto 8) <= (others => '0');

csr_lockin_placeholder_wen <= wen when (waddr = "00000000000000000000100000000000") else '0'; -- 0x800

csr_lockin_placeholder_ren <= ren when (raddr = "00000000000000000000100000000000") else '0'; -- 0x800
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_lockin_placeholder_ren_ff <= '0'; -- 0x0
else
        csr_lockin_placeholder_ren_ff <= csr_lockin_placeholder_ren;
end if;
end if;
end process;

-----------------------
-- Bit field:
-- LOCKIN_PLACEHOLDER(7 downto 0) - TBD - TBD
-- access: rw, hardware: o
-----------------------

csr_lockin_placeholder_rdata(7 downto 0) <= csr_lockin_placeholder_tbd_ff;

csr_lockin_placeholder_tbd_out <= csr_lockin_placeholder_tbd_ff;

process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    csr_lockin_placeholder_tbd_ff <= "00000000"; -- 0x0
else
        if (csr_lockin_placeholder_wen = '1') then
            if (wstrb(0) = '1') then
                csr_lockin_placeholder_tbd_ff(7 downto 0) <= wdata(7 downto 0);
            end if;
        else
            csr_lockin_placeholder_tbd_ff <= csr_lockin_placeholder_tbd_ff;
        end if;
end if;
end if;
end process;



--------------------------------------------------------------------------------
-- Write ready
--------------------------------------------------------------------------------
wready <= '1';

--------------------------------------------------------------------------------
-- Read address decoder
--------------------------------------------------------------------------------
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    rdata_ff <= "00000000000000000000000000000000"; -- 0x0
else
    if (ren = '1') then
        case ADDR_T'(raddr) is
            when "00000000000000000000000000000000" => rdata_ff <= csr_i_bias_control_rdata; -- 0x0
            when "00000000000000000000000000000100" => rdata_ff <= csr_i_bias_sw_rdata; -- 0x4
            when "00000000000000000000000100000000" => rdata_ff <= csr_pga1_control_rdata; -- 0x100
            when "00000000000000000000000100010000" => rdata_ff <= csr_pga1_int_sw_rdata; -- 0x110
            when "00000000000000000000000100100000" => rdata_ff <= csr_pga1_tst_sw_rdata; -- 0x120
            when "00000000000000000000000101000000" => rdata_ff <= csr_pga1_oc1_rdata; -- 0x140
            when "00000000000000000000000101000100" => rdata_ff <= csr_pga1_oc2_rdata; -- 0x144
            when "00000000000000000000000101010000" => rdata_ff <= csr_pga1_gain1_rdata; -- 0x150
            when "00000000000000000000000101100000" => rdata_ff <= csr_pga1_gain2_1_rdata; -- 0x160
            when "00000000000000000000000101100100" => rdata_ff <= csr_pga1_gain2_2_rdata; -- 0x164
            when "00000000000000000000001000000000" => rdata_ff <= csr_pga2_control_rdata; -- 0x200
            when "00000000000000000000001000010000" => rdata_ff <= csr_pga2_int_sw_rdata; -- 0x210
            when "00000000000000000000001000100000" => rdata_ff <= csr_pga2_tst_sw_rdata; -- 0x220
            when "00000000000000000000001001000000" => rdata_ff <= csr_pga2_oc1_rdata; -- 0x240
            when "00000000000000000000001001000100" => rdata_ff <= csr_pga2_oc2_rdata; -- 0x244
            when "00000000000000000000001001010000" => rdata_ff <= csr_pga2_gain1_rdata; -- 0x250
            when "00000000000000000000001001100000" => rdata_ff <= csr_pga2_gain2_1_rdata; -- 0x260
            when "00000000000000000000001001100100" => rdata_ff <= csr_pga2_gain2_2_rdata; -- 0x264
            when "00000000000000000000001010000000" => rdata_ff <= csr_ti_control_rdata; -- 0x280
            when "00000000000000000000001010000100" => rdata_ff <= csr_ti_gain_rdata; -- 0x284
            when "00000000000000000000001010001000" => rdata_ff <= csr_ti_sw_rdata; -- 0x288
            when "00000000000000000000001100000000" => rdata_ff <= csr_adc1_control_rdata; -- 0x300
            when "00000000000000000000001100010000" => rdata_ff <= csr_adc1_delay_rdata; -- 0x310
            when "00000000000000000000001110000000" => rdata_ff <= csr_adc1_out_rdata; -- 0x380
            when "00000000000000000000010000000000" => rdata_ff <= csr_adc2_control_rdata; -- 0x400
            when "00000000000000000000010000010000" => rdata_ff <= csr_adc2_delay_rdata; -- 0x410
            when "00000000000000000000010010000000" => rdata_ff <= csr_adc2_out_rdata; -- 0x480
            when "00000000000000000000010100000000" => rdata_ff <= csr_dac1_control_rdata; -- 0x500
            when "00000000000000000000010100010000" => rdata_ff <= csr_dac1_tst_sw_rdata; -- 0x510
            when "00000000000000000000010100100000" => rdata_ff <= csr_dac1_gain_rdata; -- 0x520
            when "00000000000000000000010100110000" => rdata_ff <= csr_dac1_rout_rdata; -- 0x530
            when "00000000000000000000011000000000" => rdata_ff <= csr_dac2_control_rdata; -- 0x600
            when "00000000000000000000011000010000" => rdata_ff <= csr_dac2_tst_sw_rdata; -- 0x610
            when "00000000000000000000011000100000" => rdata_ff <= csr_dac2_gain_rdata; -- 0x620
            when "00000000000000000000011000110000" => rdata_ff <= csr_dac2_rout_rdata; -- 0x630
            when "00000000000000000000011100010000" => rdata_ff <= csr_sine_lut_step_rdata; -- 0x710
            when "00000000000000000000011110000000" => rdata_ff <= csr_sine_lut_out0_rdata; -- 0x780
            when "00000000000000000000011110000100" => rdata_ff <= csr_sine_lut_out90_rdata; -- 0x784
            when "00000000000000000000100000000000" => rdata_ff <= csr_lockin_placeholder_rdata; -- 0x800
            when others => rdata_ff <= "00000000000000000000000000000000"; -- 0x0
        end case;
    else
        rdata_ff <= "00000000000000000000000000000000"; -- 0x0
    end if;
end if;
end if;
end process;

rdata <= rdata_ff;

--------------------------------------------------------------------------------
-- Read data valid
--------------------------------------------------------------------------------
process (clk) begin
if rising_edge(clk) then
if (rst = '1') then
    rvalid_ff <= '0'; -- 0x0
else
    if ((ren = '1') and (rvalid = '1')) then
        rvalid_ff <= '0';
    elsif (ren = '1') then
        rvalid_ff <= '1';
    end if;
end if;
end if;
end process;


rvalid <= rvalid_ff;

end architecture;