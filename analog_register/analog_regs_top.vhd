

library ieee;							
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use ieee.math_real.all;


entity analog_regs_top is
	generic(
		ADDR_WIDTH : integer := 32;
		DATA_WIDTH : integer := 32
	);
	port (
		clk : in std_logic;
		rst : in std_logic;

		-- SPI
		spi_en   : in  std_logic; -- use SPI
        sck_in   : in  std_logic; -- Input clock
        csn_in   : in  std_logic; -- SPI slave select
        mosi_in  : in  std_logic; -- SPI data input
        miso_out : out std_logic; -- SPI data output

		-- APB core
		CORE_PCLK    : in std_logic;
		CORE_PRESETn : in std_logic;
		CORE_PADDR   : in std_logic_vector(ADDR_WIDTH -1 downto 0);
		CORE_PPROT   : in std_logic_vector(2 downto 0);
		CORE_PSEL    : in std_logic;
		CORE_PENABLE : in std_logic;
		CORE_PWRITE  : in std_logic;
		CORE_PWDATA  : in std_logic_vector(DATA_WIDTH -1 downto 0);
		CORE_PSTRB   : in std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
		CORE_PREADY  : out std_logic;
		CORE_PRDATA  : out std_logic_vector(DATA_WIDTH -1 downto 0);
		CORE_PSLVERR : out std_logic;

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
	
		-- SINE_LUT_OUT90.out90
		csr_sine_lut_out90_out90_in : in std_logic_vector(9 downto 0);
	
		-- LOCKIN_PLACEHOLDER.TBD
		csr_lockin_placeholder_tbd_out : out std_logic_vector(7 downto 0)
	);
end entity;


architecture structural of analog_regs_top is

	-- component spi_4_reg
	-- 	generic (
	-- 		data_width_g : integer range 1 to 64;
	-- 		no_of_spi_slaves_g : integer range 1 to 128
	-- 	);
	-- 		port (
	-- 		sck_in : in std_logic;
	-- 		csn_in : in std_logic;
	-- 		mosi_in : in std_logic;
	-- 		miso_out : out std_logic;
	-- 		aresetn_in : in std_logic;
	-- 		datareceive_out : out std_logic_vector(data_width_g - 1 downto 0);
	-- 		datavalid_out : out std_logic;
	-- 		datasend_in : in std_logic_vector(data_width_g - 1 downto 0);
	-- 		maxEdge_out : out unsigned(integer(ceil(log2(real(data_width_g * no_of_spi_slaves_g)))) - 1 downto 0)
	-- 	);
	-- end component;
	component spi_slave
		generic (
			N : integer;
			CPOL : std_logic;
			insert_point : integer
		);
			port (
			o_busy : out std_logic;
			i_data_parallel : in std_logic_vector(N-1 downto 0);
			o_data_parallel : out std_logic_vector(N-1 downto 0);
			i_sck : in std_logic;
			i_csn : in std_logic;
			i_mosi : in std_logic;
			o_miso : out std_logic
		);
	end component;

	signal datareceive_out : std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
	signal o_busy : std_logic;
	signal datavalid_out : std_logic;
	signal datasend_in : std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);  
	
	component SPI_APB_bridge
		generic (
			ADDR_WIDTH : integer;
			DATA_WIDTH : integer
		);
		port (
			rst : in std_logic;
			spi_clk : in std_logic;
			spi_in : in std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
			update_in : in std_logic;
			spi_out : out std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
			PCLK : out std_logic;
			PRESETn : out std_logic;
			PADDR : out std_logic_vector(ADDR_WIDTH -1 downto 0);
			PPROT : out std_logic_vector(2 downto 0);
			PSEL : out std_logic;
			PENABLE : out std_logic;
			PWRITE : out std_logic;
			PWDATA : out std_logic_vector(DATA_WIDTH -1 downto 0);
			PSTRB : out std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
			PREADY : in std_logic;
			PRDATA : in std_logic_vector(DATA_WIDTH -1 downto 0);
			PSLVERR : in std_logic
		);
	end component;  

	signal SPI_PCLK : std_logic;
	signal SPI_PRESETn : std_logic;
	signal SPI_PADDR : std_logic_vector(ADDR_WIDTH -1 downto 0);
	signal SPI_PPROT : std_logic_vector(2 downto 0);
	signal SPI_PSEL : std_logic;
	signal SPI_PENABLE : std_logic;
	signal SPI_PWRITE : std_logic;
	signal SPI_PWDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal SPI_PSTRB : std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
	signal SPI_PREADY : std_logic;
	signal SPI_PRDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal SPI_PSLVERR : std_logic;

	component APB_MUX
		generic (
			ADDR_WIDTH : integer;
			DATA_WIDTH : integer
		);
			port (
			use_spi : in std_logic;
			CORE_PCLK : in std_logic;
			CORE_PRESETn : in std_logic;
			CORE_PADDR : in std_logic_vector(ADDR_WIDTH -1 downto 0);
			CORE_PPROT : in std_logic_vector(2 downto 0);
			CORE_PSEL : in std_logic;
			CORE_PENABLE : in std_logic;
			CORE_PWRITE : in std_logic;
			CORE_PWDATA : in std_logic_vector(DATA_WIDTH -1 downto 0);
			CORE_PSTRB : in std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
			CORE_PREADY : out std_logic;
			CORE_PRDATA : out std_logic_vector(DATA_WIDTH -1 downto 0);
			CORE_PSLVERR : out std_logic;
			SPI_PCLK : in std_logic;
			SPI_PRESETn : in std_logic;
			SPI_PADDR : in std_logic_vector(ADDR_WIDTH -1 downto 0);
			SPI_PPROT : in std_logic_vector(2 downto 0);
			SPI_PSEL : in std_logic;
			SPI_PENABLE : in std_logic;
			SPI_PWRITE : in std_logic;
			SPI_PWDATA : in std_logic_vector(DATA_WIDTH -1 downto 0);
			SPI_PSTRB : in std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
			SPI_PREADY : out std_logic;
			SPI_PRDATA : out std_logic_vector(DATA_WIDTH -1 downto 0);
			SPI_PSLVERR : out std_logic;
			Q_PCLK : out std_logic;
			Q_PRESETn : out std_logic;
			Q_PADDR : out std_logic_vector(ADDR_WIDTH -1 downto 0);
			Q_PPROT : out std_logic_vector(2 downto 0);
			Q_PSEL : out std_logic;
			Q_PENABLE : out std_logic;
			Q_PWRITE : out std_logic;
			Q_PWDATA : out std_logic_vector(DATA_WIDTH -1 downto 0);
			Q_PSTRB : out std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
			Q_PREADY : in std_logic;
			Q_PRDATA : in std_logic_vector(DATA_WIDTH -1 downto 0);
			Q_PSLVERR : in std_logic
		);
	end component;
	
	signal Q_PCLK : std_logic;
	signal Q_PRESETn : std_logic;                               -- not used
	signal Q_PADDR : std_logic_vector(ADDR_WIDTH -1 downto 0);
	signal Q_PPROT : std_logic_vector(2 downto 0);              -- not used
	signal Q_PSEL : std_logic;
	signal Q_PENABLE : std_logic;
	signal Q_PWRITE : std_logic;
	signal Q_PWDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal Q_PSTRB : std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
	signal Q_PREADY : std_logic;
	signal Q_PRDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal Q_PSLVERR : std_logic;

	component analog_regs
		generic (
			ADDR_W : integer;
			DATA_W : integer;
			STRB_W : integer
		);
			port (
			clk : in std_logic;
			rst : in std_logic;
			csr_i_bias_control_power_down_out : out std_logic_vector(2 downto 0);
			csr_i_bias_sw_source_sel_out : out std_logic_vector(1 downto 0);
			csr_pga1_control_power_down_out : out std_logic_vector(2 downto 0);
			csr_pga1_int_sw_offset_compensation_out : out std_logic_vector(5 downto 0);
			csr_pga1_int_sw_se_out : out std_logic_vector(1 downto 0);
			csr_pga1_int_sw_sm_out : out std_logic_vector(1 downto 0);
			csr_pga1_int_sw_sc_out : out std_logic_vector(1 downto 0);
			csr_pga1_tst_sw_si_out : out std_logic_vector(5 downto 0);
			csr_pga1_tst_sw_so_out : out std_logic_vector(3 downto 0);
			csr_pga1_oc1_oc1_p_out : out std_logic_vector(7 downto 0);
			csr_pga1_oc1_oc1_n_out : out std_logic_vector(7 downto 0);
			csr_pga1_oc2_oc1_p_out : out std_logic_vector(7 downto 0);
			csr_pga1_oc2_oc1_n_out : out std_logic_vector(7 downto 0);
			csr_pga1_gain1_gain_out : out std_logic_vector(6 downto 0);
			csr_pga1_gain2_1_gain_out : out std_logic_vector(2 downto 0);
			csr_pga1_gain2_2_gain_out : out std_logic_vector(2 downto 0);
			csr_pga2_control_power_down_out : out std_logic_vector(2 downto 0);
			csr_pga2_int_sw_offset_compensation_out : out std_logic_vector(5 downto 0);
			csr_pga2_int_sw_se_out : out std_logic_vector(1 downto 0);
			csr_pga2_int_sw_sm_out : out std_logic_vector(1 downto 0);
			csr_pga2_int_sw_sc_out : out std_logic_vector(1 downto 0);
			csr_pga2_tst_sw_si_out : out std_logic_vector(5 downto 0);
			csr_pga2_tst_sw_so_out : out std_logic_vector(3 downto 0);
			csr_pga2_oc1_oc1_p_out : out std_logic_vector(7 downto 0);
			csr_pga2_oc1_oc1_n_out : out std_logic_vector(7 downto 0);
			csr_pga2_oc2_oc1_p_out : out std_logic_vector(7 downto 0);
			csr_pga2_oc2_oc1_n_out : out std_logic_vector(7 downto 0);
			csr_pga2_gain1_gain_out : out std_logic_vector(6 downto 0);
			csr_pga2_gain2_1_gain_out : out std_logic_vector(2 downto 0);
			csr_pga2_gain2_2_gain_out : out std_logic_vector(2 downto 0);
			csr_ti_control_pd_out : out std_logic;
			csr_ti_gain_res_out : out std_logic_vector(2 downto 0);
			csr_ti_sw_tp_switch_out : out std_logic;
			csr_adc1_control_en_out : out std_logic;
			csr_adc1_control_holdtype_out : out std_logic;
			csr_adc1_delay_hold_time_out : out std_logic_vector(4 downto 0);
			csr_adc1_delay_high_bits_delay_out : out std_logic_vector(3 downto 0);
			csr_adc1_delay_mid_bits_delay_out : out std_logic_vector(1 downto 0);
			csr_adc1_delay_low_bits_delay_out : out std_logic_vector(1 downto 0);
			csr_adc1_out_output_value_in : in std_logic_vector(11 downto 0);
			csr_adc2_control_en_out : out std_logic;
			csr_adc2_control_holdtype_out : out std_logic;
			csr_adc2_delay_hold_time_out : out std_logic_vector(4 downto 0);
			csr_adc2_delay_high_bits_delay_out : out std_logic_vector(3 downto 0);
			csr_adc2_delay_mid_bits_delay_out : out std_logic_vector(1 downto 0);
			csr_adc2_delay_low_bits_delay_out : out std_logic_vector(1 downto 0);
			csr_adc2_out_output_value_in : in std_logic_vector(11 downto 0);
			csr_dac1_control_pd_out : out std_logic;
			csr_dac1_tst_sw_switch_position_out : out std_logic;
			csr_dac1_gain_gain_out : out std_logic_vector(1 downto 0);
			csr_dac1_rout_rout_out : out std_logic_vector(2 downto 0);
			csr_dac2_control_pd_out : out std_logic;
			csr_dac2_tst_sw_switch_position_out : out std_logic;
			csr_dac2_gain_gain_out : out std_logic_vector(1 downto 0);
			csr_dac2_rout_rout_out : out std_logic_vector(2 downto 0);
			csr_sine_lut_step_step_size_out : out std_logic_vector(9 downto 0);
			csr_sine_lut_out0_out0_in : in std_logic_vector(9 downto 0);
			csr_sine_lut_out90_out90_in : in std_logic_vector(9 downto 0);
			csr_lockin_placeholder_tbd_out : out std_logic_vector(7 downto 0);
			psel : in std_logic;
			paddr : in std_logic_vector(ADDR_W-1 downto 0);
			penable : in std_logic;
			pwrite : in std_logic;
			pwdata : in std_logic_vector(DATA_W-1 downto 0);
			pstrb : in std_logic_vector(STRB_W-1 downto 0);
			prdata : out std_logic_vector(DATA_W-1 downto 0);
			pready : out std_logic;
			pslverr : out std_logic
		);
	end component;

begin
	-- spi_4_reg_inst : spi_4_reg
	-- generic map (
	-- 	data_width_g => ADDR_WIDTH+DATA_WIDTH,
	-- 	no_of_spi_slaves_g => 1
	-- )
	-- port map (
	-- 	sck_in => sck_in,
	-- 	csn_in => csn_in,
	-- 	mosi_in => mosi_in,
	-- 	miso_out => miso_out,
	-- 	aresetn_in => not rst,
	-- 	datareceive_out => datareceive_out,
	-- 	datavalid_out => datavalid_out,
	-- 	datasend_in => datasend_in
	-- 	-- maxEdge_out => maxEdge_out
	-- );
	spi_slave_inst : spi_slave
		generic map (
			N => ADDR_WIDTH+DATA_WIDTH,
			CPOL => '1',
			insert_point => 6  -- nr of clock cycles in at which send data gets updated again
		)
		port map (
			o_busy => o_busy,
			i_data_parallel => datasend_in,
			o_data_parallel => datareceive_out,
			i_sck => sck_in,
			i_csn => csn_in,
			i_mosi => mosi_in,
			o_miso => miso_out
		);
		datavalid_out <= not o_busy;

	SPI_APB_bridge_inst : SPI_APB_bridge
	generic map (
		ADDR_WIDTH => ADDR_WIDTH,
		DATA_WIDTH => DATA_WIDTH
	)
	port map (
		spi_clk => sck_in,
		rst => rst,
		spi_in => datareceive_out,
		update_in => datavalid_out,
		spi_out => datasend_in,
		PCLK    => SPI_PCLK,
		PRESETn => SPI_PRESETn,
		PADDR   => SPI_PADDR,
		PPROT   => SPI_PPROT,
		PSEL    => SPI_PSEL,
		PENABLE => SPI_PENABLE,
		PWRITE  => SPI_PWRITE,
		PWDATA  => SPI_PWDATA,
		PSTRB   => SPI_PSTRB,
		PREADY  => SPI_PREADY,
		PRDATA  => SPI_PRDATA,
		PSLVERR => SPI_PSLVERR
	);

	APB_MUX_inst : APB_MUX
	generic map (
		ADDR_WIDTH => ADDR_WIDTH,
		DATA_WIDTH => DATA_WIDTH
	)
	port map (
		use_spi => spi_en,
		CORE_PCLK => CORE_PCLK,
		CORE_PRESETn => CORE_PRESETn,
		CORE_PADDR => CORE_PADDR,
		CORE_PPROT => CORE_PPROT,
		CORE_PSEL => CORE_PSEL,
		CORE_PENABLE => CORE_PENABLE,
		CORE_PWRITE => CORE_PWRITE,
		CORE_PWDATA => CORE_PWDATA,
		CORE_PSTRB => CORE_PSTRB,
		CORE_PREADY => CORE_PREADY,
		CORE_PRDATA => CORE_PRDATA,
		CORE_PSLVERR => CORE_PSLVERR,
		SPI_PCLK => SPI_PCLK,
		SPI_PRESETn => SPI_PRESETn,
		SPI_PADDR => SPI_PADDR,
		SPI_PPROT => SPI_PPROT,
		SPI_PSEL => SPI_PSEL,
		SPI_PENABLE => SPI_PENABLE,
		SPI_PWRITE => SPI_PWRITE,
		SPI_PWDATA => SPI_PWDATA,
		SPI_PSTRB => SPI_PSTRB,
		SPI_PREADY => SPI_PREADY,
		SPI_PRDATA => SPI_PRDATA,
		SPI_PSLVERR => SPI_PSLVERR,
		Q_PCLK => Q_PCLK,
		Q_PRESETn => Q_PRESETn,
		Q_PADDR => Q_PADDR,
		Q_PPROT => Q_PPROT,
		Q_PSEL => Q_PSEL,
		Q_PENABLE => Q_PENABLE,
		Q_PWRITE => Q_PWRITE,
		Q_PWDATA => Q_PWDATA,
		Q_PSTRB => Q_PSTRB,
		Q_PREADY => Q_PREADY,
		Q_PRDATA => Q_PRDATA,
		Q_PSLVERR => Q_PSLVERR
	);

	analog_regs_inst : analog_regs
	generic map (
		ADDR_W => 32,
		DATA_W => 32,
		STRB_W => 4
	)
	port map (
		clk => Q_PCLK,
		rst => rst,
		csr_i_bias_control_power_down_out => csr_i_bias_control_power_down_out,
		csr_i_bias_sw_source_sel_out => csr_i_bias_sw_source_sel_out,
		csr_pga1_control_power_down_out => csr_pga1_control_power_down_out,
		csr_pga1_int_sw_offset_compensation_out => csr_pga1_int_sw_offset_compensation_out,
		csr_pga1_int_sw_se_out => csr_pga1_int_sw_se_out,
		csr_pga1_int_sw_sm_out => csr_pga1_int_sw_sm_out,
		csr_pga1_int_sw_sc_out => csr_pga1_int_sw_sc_out,
		csr_pga1_tst_sw_si_out => csr_pga1_tst_sw_si_out,
		csr_pga1_tst_sw_so_out => csr_pga1_tst_sw_so_out,
		csr_pga1_oc1_oc1_p_out => csr_pga1_oc1_oc1_p_out,
		csr_pga1_oc1_oc1_n_out => csr_pga1_oc1_oc1_n_out,
		csr_pga1_oc2_oc1_p_out => csr_pga1_oc2_oc1_p_out,
		csr_pga1_oc2_oc1_n_out => csr_pga1_oc2_oc1_n_out,
		csr_pga1_gain1_gain_out => csr_pga1_gain1_gain_out,
		csr_pga1_gain2_1_gain_out => csr_pga1_gain2_1_gain_out,
		csr_pga1_gain2_2_gain_out => csr_pga1_gain2_2_gain_out,
		csr_pga2_control_power_down_out => csr_pga2_control_power_down_out,
		csr_pga2_int_sw_offset_compensation_out => csr_pga2_int_sw_offset_compensation_out,
		csr_pga2_int_sw_se_out => csr_pga2_int_sw_se_out,
		csr_pga2_int_sw_sm_out => csr_pga2_int_sw_sm_out,
		csr_pga2_int_sw_sc_out => csr_pga2_int_sw_sc_out,
		csr_pga2_tst_sw_si_out => csr_pga2_tst_sw_si_out,
		csr_pga2_tst_sw_so_out => csr_pga2_tst_sw_so_out,
		csr_pga2_oc1_oc1_p_out => csr_pga2_oc1_oc1_p_out,
		csr_pga2_oc1_oc1_n_out => csr_pga2_oc1_oc1_n_out,
		csr_pga2_oc2_oc1_p_out => csr_pga2_oc2_oc1_p_out,
		csr_pga2_oc2_oc1_n_out => csr_pga2_oc2_oc1_n_out,
		csr_pga2_gain1_gain_out => csr_pga2_gain1_gain_out,
		csr_pga2_gain2_1_gain_out => csr_pga2_gain2_1_gain_out,
		csr_pga2_gain2_2_gain_out => csr_pga2_gain2_2_gain_out,
		csr_ti_control_pd_out => csr_ti_control_pd_out,
		csr_ti_gain_res_out => csr_ti_gain_res_out,
		csr_ti_sw_tp_switch_out => csr_ti_sw_tp_switch_out,
		csr_adc1_control_en_out => csr_adc1_control_en_out,
		csr_adc1_control_holdtype_out => csr_adc1_control_holdtype_out,
		csr_adc1_delay_hold_time_out => csr_adc1_delay_hold_time_out,
		csr_adc1_delay_high_bits_delay_out => csr_adc1_delay_high_bits_delay_out,
		csr_adc1_delay_mid_bits_delay_out => csr_adc1_delay_mid_bits_delay_out,
		csr_adc1_delay_low_bits_delay_out => csr_adc1_delay_low_bits_delay_out,
		csr_adc1_out_output_value_in => csr_adc1_out_output_value_in,
		csr_adc2_control_en_out => csr_adc2_control_en_out,
		csr_adc2_control_holdtype_out => csr_adc2_control_holdtype_out,
		csr_adc2_delay_hold_time_out => csr_adc2_delay_hold_time_out,
		csr_adc2_delay_high_bits_delay_out => csr_adc2_delay_high_bits_delay_out,
		csr_adc2_delay_mid_bits_delay_out => csr_adc2_delay_mid_bits_delay_out,
		csr_adc2_delay_low_bits_delay_out => csr_adc2_delay_low_bits_delay_out,
		csr_adc2_out_output_value_in => csr_adc2_out_output_value_in,
		csr_dac1_control_pd_out => csr_dac1_control_pd_out,
		csr_dac1_tst_sw_switch_position_out => csr_dac1_tst_sw_switch_position_out,
		csr_dac1_gain_gain_out => csr_dac1_gain_gain_out,
		csr_dac1_rout_rout_out => csr_dac1_rout_rout_out,
		csr_dac2_control_pd_out => csr_dac2_control_pd_out,
		csr_dac2_tst_sw_switch_position_out => csr_dac2_tst_sw_switch_position_out,
		csr_dac2_gain_gain_out => csr_dac2_gain_gain_out,
		csr_dac2_rout_rout_out => csr_dac2_rout_rout_out,
		csr_sine_lut_step_step_size_out => csr_sine_lut_step_step_size_out,
		csr_sine_lut_out0_out0_in => csr_sine_lut_out0_out0_in,
		csr_sine_lut_out90_out90_in => csr_sine_lut_out90_out90_in,
		csr_lockin_placeholder_tbd_out => csr_lockin_placeholder_tbd_out,
		psel    => Q_PSEL,
		paddr   => Q_PADDR,
		penable => Q_PENABLE,
		pwrite  => Q_PWRITE,
		pwdata  => Q_PWDATA,
		pstrb   => Q_PSTRB,
		prdata  => Q_PRDATA,
		pready  => Q_PREADY,
		pslverr => Q_PSLVERR
	);
end architecture;