

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.finish;

entity analog_regs_top_tb is
end;

architecture bench of analog_regs_top_tb is

	-- generated
	type addr_array_t is array(0 to 2) of std_logic_vector(31 downto 0);
	constant addr_array : addr_array_t := ( 
		x"00000110",
		x"00000120",
		x"00000200"
		-- etc.
	);
	type chess_t is array(0 to 2) of std_logic_vector(31 downto 0);
	constant chess1_array : chess_t := ( 
		x"00000015",
		x"00000155",
		x"00000005"
		-- etc.
	);
	constant chess2_array : chess_t := ( 
		x"0000002A",
		x"000002AA",
		x"00000002"
		-- etc.
	);

	-- /generated

	constant chess1_12b : std_logic_vector(11 downto 0) := x"222";
	constant chess2_12b : std_logic_vector(11 downto 0) := x"CCC";

	constant chess1_10b : std_logic_vector( 9 downto 0) := "11" & x"22";
	constant chess2_10b : std_logic_vector( 9 downto 0) := "00" & x"CC";

	constant ADDR_WIDTH : integer := 32;
	constant DATA_WIDTH : integer := 32;

	-- rm
	-- component spi_slave
	-- 	generic (
	-- 		N : integer;
	-- 		CPOL : std_logic
	-- 	);
	-- 		port (
	-- 		o_busy : out std_logic;
	-- 		i_data_parallel : in std_logic_vector(N-1 downto 0);
	-- 		o_data_parallel : out std_logic_vector(N-1 downto 0);
	-- 		i_sck : in std_logic;
	-- 		i_csn : in std_logic;
	-- 		i_mosi : in std_logic;
	-- 		o_miso : out std_logic
	-- 	);
	-- end component;
	  

	component analog_regs_top
		generic (
			ADDR_WIDTH : integer;
			DATA_WIDTH : integer
		);
		port (
			clk : in std_logic;
			rst : in std_logic;
			spi_en : in std_logic;
			sck_in : in std_logic;
			csn_in : in std_logic;
			mosi_in : in std_logic;
			miso_out : out std_logic;
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
			csr_lockin_placeholder_tbd_out : out std_logic_vector(7 downto 0)
		);
	end component;

	-- Clock period
	constant clk_period : time := 20 ns;

	-- Ports
	signal clk : std_logic;
	signal rst : std_logic;
	signal spi_en : std_logic;
	signal sck_in : std_logic;
	signal csn_in : std_logic;
	signal mosi_in : std_logic;
	signal miso_out : std_logic;
	signal CORE_PCLK : std_logic;
	signal CORE_PRESETn : std_logic;
	signal CORE_PADDR : std_logic_vector(ADDR_WIDTH -1 downto 0);
	signal CORE_PPROT : std_logic_vector(2 downto 0);
	signal CORE_PSEL : std_logic;
	signal CORE_PENABLE : std_logic;
	signal CORE_PWRITE : std_logic;
	signal CORE_PWDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal CORE_PSTRB : std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
	signal CORE_PREADY : std_logic;
	signal CORE_PRDATA : std_logic_vector(DATA_WIDTH -1 downto 0);
	signal CORE_PSLVERR : std_logic;
	signal csr_i_bias_control_power_down_out : std_logic_vector(2 downto 0);
	signal csr_i_bias_sw_source_sel_out : std_logic_vector(1 downto 0);
	signal csr_pga1_control_power_down_out : std_logic_vector(2 downto 0);
	signal csr_pga1_int_sw_offset_compensation_out : std_logic_vector(5 downto 0);
	signal csr_pga1_int_sw_se_out : std_logic_vector(1 downto 0);
	signal csr_pga1_int_sw_sm_out : std_logic_vector(1 downto 0);
	signal csr_pga1_int_sw_sc_out : std_logic_vector(1 downto 0);
	signal csr_pga1_tst_sw_si_out : std_logic_vector(5 downto 0);
	signal csr_pga1_tst_sw_so_out : std_logic_vector(3 downto 0);
	signal csr_pga1_oc1_oc1_p_out : std_logic_vector(7 downto 0);
	signal csr_pga1_oc1_oc1_n_out : std_logic_vector(7 downto 0);
	signal csr_pga1_oc2_oc1_p_out : std_logic_vector(7 downto 0);
	signal csr_pga1_oc2_oc1_n_out : std_logic_vector(7 downto 0);
	signal csr_pga1_gain1_gain_out : std_logic_vector(6 downto 0);
	signal csr_pga1_gain2_1_gain_out : std_logic_vector(2 downto 0);
	signal csr_pga1_gain2_2_gain_out : std_logic_vector(2 downto 0);
	signal csr_pga2_control_power_down_out : std_logic_vector(2 downto 0);
	signal csr_pga2_int_sw_offset_compensation_out : std_logic_vector(5 downto 0);
	signal csr_pga2_int_sw_se_out : std_logic_vector(1 downto 0);
	signal csr_pga2_int_sw_sm_out : std_logic_vector(1 downto 0);
	signal csr_pga2_int_sw_sc_out : std_logic_vector(1 downto 0);
	signal csr_pga2_tst_sw_si_out : std_logic_vector(5 downto 0);
	signal csr_pga2_tst_sw_so_out : std_logic_vector(3 downto 0);
	signal csr_pga2_oc1_oc1_p_out : std_logic_vector(7 downto 0);
	signal csr_pga2_oc1_oc1_n_out : std_logic_vector(7 downto 0);
	signal csr_pga2_oc2_oc1_p_out : std_logic_vector(7 downto 0);
	signal csr_pga2_oc2_oc1_n_out : std_logic_vector(7 downto 0);
	signal csr_pga2_gain1_gain_out : std_logic_vector(6 downto 0);
	signal csr_pga2_gain2_1_gain_out : std_logic_vector(2 downto 0);
	signal csr_pga2_gain2_2_gain_out : std_logic_vector(2 downto 0);
	signal csr_ti_control_pd_out : std_logic;
	signal csr_ti_gain_res_out : std_logic_vector(2 downto 0);
	signal csr_ti_sw_tp_switch_out : std_logic;
	signal csr_adc1_control_en_out : std_logic;
	signal csr_adc1_control_holdtype_out : std_logic;
	signal csr_adc1_delay_hold_time_out : std_logic_vector(4 downto 0);
	signal csr_adc1_delay_high_bits_delay_out : std_logic_vector(3 downto 0);
	signal csr_adc1_delay_mid_bits_delay_out : std_logic_vector(1 downto 0);
	signal csr_adc1_delay_low_bits_delay_out : std_logic_vector(1 downto 0);
	signal csr_adc1_out_output_value_in : std_logic_vector(11 downto 0);
	signal csr_adc2_control_en_out : std_logic;
	signal csr_adc2_control_holdtype_out : std_logic;
	signal csr_adc2_delay_hold_time_out : std_logic_vector(4 downto 0);
	signal csr_adc2_delay_high_bits_delay_out : std_logic_vector(3 downto 0);
	signal csr_adc2_delay_mid_bits_delay_out : std_logic_vector(1 downto 0);
	signal csr_adc2_delay_low_bits_delay_out : std_logic_vector(1 downto 0);
	signal csr_adc2_out_output_value_in : std_logic_vector(11 downto 0);
	signal csr_dac1_control_pd_out : std_logic;
	signal csr_dac1_tst_sw_switch_position_out : std_logic;
	signal csr_dac1_gain_gain_out : std_logic_vector(1 downto 0);
	signal csr_dac1_rout_rout_out : std_logic_vector(2 downto 0);
	signal csr_dac2_control_pd_out : std_logic;
	signal csr_dac2_tst_sw_switch_position_out : std_logic;
	signal csr_dac2_gain_gain_out : std_logic_vector(1 downto 0);
	signal csr_dac2_rout_rout_out : std_logic_vector(2 downto 0);
	signal csr_sine_lut_step_step_size_out : std_logic_vector(9 downto 0);
	signal csr_sine_lut_out0_out0_in : std_logic_vector(9 downto 0);
	signal csr_sine_lut_out90_out90_in : std_logic_vector(9 downto 0);
	signal csr_lockin_placeholder_tbd_out : std_logic_vector(7 downto 0);

	signal spi_data_out : std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
	procedure send_spi (
		constant data_in  : in  std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
		signal data_out : out std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
		constant clk_period : in time;
		signal sck  : out std_logic;
		signal csn  : out std_logic;
		signal mosi : out std_logic;
		signal miso : in std_logic
	) is
		constant max_i : integer := ADDR_WIDTH+DATA_WIDTH -1;
		variable shiftreg : std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
	begin
		csn <= '0';
		wait for clk_period / 2;
		for i in 0 to max_i loop
			sck <= '0';
			mosi <= data_in(max_i - i);
			wait for clk_period / 2;
			sck <= '1';
			wait for clk_period / 2;
			shiftreg := shiftreg(max_i -1 downto 0) & miso;
		end loop;
		sck <= '0';
		data_out <= shiftreg;
		wait for clk_period / 2;
		csn <= '1';
		wait for 0 ns;
	end procedure;


	signal clk_fwd_en : std_logic := '0';
	procedure send_apb (
		constant addr : in std_logic_vector(ADDR_WIDTH -1 downto 0); 
		constant data : in std_logic_vector(DATA_WIDTH -1 downto 0);
		signal clk  : in std_logic;
		constant clk_period : in time;
		signal clk_fwd_en : out std_logic;

		-- PCLK : out std_logic; bypass via separate clock gate, controlled by clk_fwd_en
		-- PRESETn : out std_logic; bypass directly to rst
		signal PADDR : out std_logic_vector(ADDR_WIDTH -1 downto 0);
		signal PPROT : out std_logic_vector(2 downto 0);
		signal PSEL : out std_logic;
		signal PENABLE : out std_logic;
		signal PWRITE : out std_logic;
		signal PWDATA : out std_logic_vector(DATA_WIDTH -1 downto 0);
		signal PSTRB : out std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
		signal PREADY : in std_logic;
		signal PRDATA : in std_logic_vector(DATA_WIDTH -1 downto 0);
		signal PSLVERR : in std_logic
		) 
	is begin
		PPROT <= "010";
		PSTRB <= (others => '1');

		PADDR <= addr;
		PWRITE <= '1';
		PSEL <= '1';
		PENABLE <= '0';
		PWDATA <= data;
		clk_fwd_en <= '1';
		wait for 0 ns;

		wait until rising_edge(clk);
		wait for 0.1 * clk_period;
		PENABLE <= '1';

		if not PREADY = '1' then 
			wait until PREADY = '1';
		end if; 
		wait until rising_edge(clk);

		PWRITE <= '0';
		PSEL <= '0';
		PENABLE <= '0';
		clk_fwd_en <= '0';
		wait for 0 ns;
	end procedure;

	-- impure function set_chess12 (foo : std_logic) return std_logic is
	-- begin
	-- 	csr_adc1_out_output_value_in <= chess1_12b;
	-- 	csr_adc2_out_output_value_in <= chess2_12b;
	-- 	csr_sine_lut_out0_out0_in   <= chess1_10b;
	-- 	csr_sine_lut_out90_out90_in <= chess2_10b;
	-- 	return '1';
	-- end function;

	-- impure function set_chess21 (foo : std_logic) return std_logic is
	-- begin
	-- 	csr_adc1_out_output_value_in <= chess2_12b;
	-- 	csr_adc2_out_output_value_in <= chess1_12b;
	-- 	csr_sine_lut_out0_out0_in   <= chess2_10b;
	-- 	csr_sine_lut_out90_out90_in <= chess1_10b;
	-- 	return '1';
	-- end function;

	--rm
	-- signal o_miso : std_logic;
	-- signal o_busy : std_logic;
	-- signal o_data_parallel : std_logic_vector(63 downto 0);

begin

	CORE_PCLK <= clk when clk_fwd_en = '1' else '0';
	CORE_PRESETn <= rst;

	main_p : process 
		variable dump : std_logic;
	begin
		rst <= '1';
		spi_en <= '0';
		sck_in <= '0';
		csn_in <= '0';
		csr_adc1_out_output_value_in <= chess1_12b;
		csr_adc2_out_output_value_in <= chess2_12b;
		csr_sine_lut_out0_out0_in   <= chess1_10b;
		csr_sine_lut_out90_out90_in <= chess2_10b;
		wait until rising_edge(clk); wait for 0.1*clk_period;
		rst <= '0';

		for i in 0 to addr_array_t'length -1 loop
			send_apb( 
				addr => addr_array(i),
				data => chess1_array(i),
				clk  => clk,
				clk_period => clk_period,
				clk_fwd_en => clk_fwd_en,
				PADDR   => CORE_PADDR,
				PPROT   => CORE_PPROT,
				PSEL    => CORE_PSEL,
				PENABLE => CORE_PENABLE,
				PWRITE  => CORE_PWRITE,
				PWDATA  => CORE_PWDATA,
				PSTRB   => CORE_PSTRB,
				PREADY  => CORE_PREADY,
				PRDATA  => CORE_PRDATA,
				PSLVERR => CORE_PSLVERR
			);
		end loop;
		wait for clk_period;

		
		--x"0000002A",
		--x"000002AA",
		--x"00000002"
		spi_en <= '1';
		send_spi(
			--                  addr    & data
			data_in  => x"0000"&x"0110" & x"0000"&x"002A",
			data_out => spi_data_out,
			clk_period => clk_period * 1.4,
			sck  => sck_in,
			csn  => csn_in,
			mosi => mosi_in,
			miso => miso_out
		);
		send_spi(
			--                  addr    & data
			data_in  => x"8000"&x"0120" & x"0000"&x"02AA",
			data_out => spi_data_out,
			clk_period => clk_period * 1.4,
			sck  => sck_in,
			csn  => csn_in,
			mosi => mosi_in,
			miso => miso_out
		);
		send_spi(
			--                  addr    & data
			data_in  => x"0000"&x"0200" & x"0000"&x"0002",
			data_out => spi_data_out,
			clk_period => clk_period * 1.4,
			sck  => sck_in,
			csn  => csn_in,
			mosi => mosi_in,
			miso => miso_out
		);

		finish;
	end process; 

	-- rm
	-- spi_slave_inst : spi_slave
	-- 	generic map (
	-- 		N => 64,
	-- 		CPOL => '1'
	-- 	)
	-- 	port map (
	-- 		o_busy => o_busy,
	-- 		i_data_parallel => x"1330"&x"0200" & x"0000"&x"0331",
	-- 		o_data_parallel => o_data_parallel,
	-- 		i_sck => sck_in,
	-- 		i_csn => csn_in,
	-- 		i_mosi => mosi_in,
	-- 		o_miso => o_miso
	-- 	);
	

	analog_regs_top_inst : analog_regs_top
	generic map (
		ADDR_WIDTH => ADDR_WIDTH,
		DATA_WIDTH => DATA_WIDTH
	)
	port map (
		clk => clk,
		rst => rst,
		spi_en => spi_en,
		sck_in => sck_in,
		csn_in => csn_in,
		mosi_in => mosi_in,
		miso_out => miso_out,
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
		csr_lockin_placeholder_tbd_out => csr_lockin_placeholder_tbd_out
	);

  clk_process : process
  begin
  clk <= '1';
  wait for clk_period/2;
  clk <= '0';
  wait for clk_period/2;
  end process clk_process;

end;
