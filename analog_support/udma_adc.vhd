
library ieee;							
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use ieee.math_real.all;

entity udma_adc is
	generic (
		L2_AWIDTH_NOAL : integer := 12;  -- available L2 address space
		TRANS_SIZE     : integer := 16;  -- max. transmission size in Byte
		ADC_WIDTH      : integer := 12
	);
	port (
		-- vitals
		sys_clk_i    : in std_logic;
		periph_clk_i : in std_logic;  -- ignore
		rstn_i       : in std_logic;

		-- ADC interface
		adc_input    : in std_logic_vector(ADC_WIDTH -1 downto 0);  -- adc value
		adc_update   : in std_logic;  -- adc update flag

		-- configuration bus input
		cfg_data_i  : in  std_logic_vector(31 downto 0);
		cfg_addr_i  : in  std_logic_vector(3 downto 0);
		cfg_valid_i : in  std_logic;
		cfg_rwn_i   : in  std_logic;  -- read=1, write=0
		cfg_ready_o : out std_logic;
		cfg_data_o  : out std_logic_vector(31 downto 0);

		-- RX data configuration -> UDMA core
		cfg_rx_startaddr_o  : out std_logic_vector(L2_AWIDTH_NOAL -1 downto 0);
		cfg_rx_size_o       : out std_logic_vector(TRANS_SIZE -1 downto 0);
		--cfg_rx_datasize_o   : out std_logic_vector(1 downto 0);
		cfg_rx_continuous_o : out std_logic;
		cfg_rx_en_o         : out std_logic;
		cfg_rx_clr_o        : out std_logic;
		cfg_rx_en_i         : in  std_logic;
		cfg_rx_pending_i    : in  std_logic;
		cfg_rx_curr_addr_i  : in  std_logic_vector(L2_AWIDTH_NOAL -1 downto 0);
		cfg_rx_bytes_left_i : in  std_logic_vector(TRANS_SIZE -1 downto 0);

		-- RX data transmission -> UDMA core
		data_rx_datasize_o : out std_logic_vector( 1 downto 0);
		data_rx_o          : out std_logic_vector(31 downto 0);
		data_rx_valid_o    : out std_logic;
		data_rx_ready_i    : in  std_logic;

		-- interrupts
		adc_done_event      : out std_logic  -- on each new ADC value (reasonable?)
		-- block_written_event : out std_logic   -- on assigned DMA block full (done by core?)

		-- TX data <- UDMA core reader
		-- (ADC cannot send)
		-- output logic [L2_AWIDTH_NOAL-1:0] cfg_tx_startaddr_o,
		-- output logic     [TRANS_SIZE-1:0] cfg_tx_size_o,
		-- output logic                [1:0] cfg_tx_datasize_o,
		-- output logic                      cfg_tx_continuous_o,
		-- output logic                      cfg_tx_en_o,
		-- output logic                      cfg_tx_clr_o,
		-- input  logic                      cfg_tx_en_i,
		-- input  logic                      cfg_tx_pending_i,
		-- input  logic [L2_AWIDTH_NOAL-1:0] cfg_tx_curr_addr_i,
		-- input  logic     [TRANS_SIZE-1:0] cfg_tx_bytes_left_i,

		-- TX data handshake
		-- (ADC cannot send)
		-- output logic                      data_tx_req_o,
		-- input  logic                      data_tx_gnt_i,
		-- output logic                [1:0] data_tx_datasize_o,
		-- input  logic               [31:0] data_tx_i,
		-- input  logic                      data_tx_valid_i,
		-- output logic                      data_tx_ready_o,	
	);
end entity;

architecture rtl of udma_adc is

	signal adc_status : std_logic_vector(1 downto 0);
	signal data_rx : std_logic_vector(ADC_WIDTH -1 downto 0);
	signal cfg_rx_clr : std_logic;  -- config register clear flag

	signal adc_data_valid : std_logic;
	signal adc_data_in    : std_logic_vector(ADC_WIDTH -1 downto 0);
	signal adc_data_ready : std_logic;
	signal adc_has_overrun : std_logic;  -- set when FIFO did not read ADC value in time. removed by writing cfg_rx_clr

	component udma_adc_reg_if
		generic (
			L2_AWIDTH_NOAL : integer := 12;
			TRANS_SIZE :  integer := 16
		);
		port (
			clk_i : in std_logic;
			rstn_i : in std_logic;
			cfg_data_i : in std_logic_vector (31 downto 0);
			cfg_addr_i : in std_logic_vector (4 downto 0);
			cfg_valid_i : in std_logic;
			cfg_rwn_i : in std_logic;
			cfg_data_o : out std_logic_vector (31 downto 0);
			cfg_ready_o : out std_logic;
			cfg_rx_startaddr_o : out std_logic_vector (L2_AWIDTH_NOAL-1 downto 0);
			cfg_rx_size_o : out std_logic_vector (TRANS_SIZE-1 downto 0);
			cfg_rx_continuous_o : out std_logic;
			cfg_rx_en_o : out std_logic;
			cfg_rx_clr_o : out std_logic;
			cfg_rx_en_i : in std_logic;
			cfg_rx_pending_i : in std_logic;
			cfg_rx_curr_addr_i : in std_logic_vector (L2_AWIDTH_NOAL-1 downto 0);
			cfg_rx_bytes_left_i : in std_logic_vector (TRANS_SIZE-1 downto 0);
			status_i : in std_logic_vector (1 downto 0)
		);
	end component;

	component io_generic_fifo
		generic (
			DATA_WIDTH : integer:= 32;
			BUFFER_DEPTH : integer:= 2;
			LOG_BUFFER_DEPTH : integer
		);
		port (
			clk_i : in std_logic;
			rstn_i : in std_logic;
			clr_i : in std_logic;
			elements_o : out std_logic_vector (LOG_BUFFER_DEPTH downto 0);
			data_o : out std_logic_vector (DATA_WIDTH-1  downto  0);
			valid_o : out std_logic;
			ready_i : in std_logic;
			valid_i : in std_logic;
			data_i : in std_logic_vector (DATA_WIDTH-1  downto  0);
			ready_o : out std_logic
		);
	  end component;
	  

begin

	data_rx_datasize_o <= "01";
	--cfg_rx_datasize_o  <= "01";

	adc_status <= adc_has_overrun & '0';

	adc_done_event <= adc_update;

	-- data_rx_o(ADC_WIDTH -1 downto 0) <= data_rx;

	udma_adc_reg_if_inst : udma_adc_reg_if
		generic map (
			L2_AWIDTH_NOAL => L2_AWIDTH_NOAL,
			TRANS_SIZE => TRANS_SIZE
		)
		port map (
			clk_i => sys_clk_i,
			rstn_i => rstn_i,
			cfg_data_i => cfg_data_i,
			cfg_addr_i => cfg_addr_i,
			cfg_valid_i => cfg_valid_i,
			cfg_rwn_i => cfg_rwn_i,
			cfg_data_o => cfg_data_o,
			cfg_ready_o => cfg_ready_o,
			cfg_rx_startaddr_o => cfg_rx_startaddr_o,
			cfg_rx_size_o => cfg_rx_size_o,
			cfg_rx_continuous_o => cfg_rx_continuous_o,
			cfg_rx_en_o => cfg_rx_en_o,
			cfg_rx_clr_o => cfg_rx_clr,
			cfg_rx_en_i => cfg_rx_en_i,
			cfg_rx_pending_i => cfg_rx_pending_i,
			cfg_rx_curr_addr_i => cfg_rx_curr_addr_i,
			cfg_rx_bytes_left_i => cfg_rx_bytes_left_i,
			status_i => adc_status
		);	
		cfg_rx_clr_o <= cfg_rx_clr;
	
	io_generic_fifo_inst : io_generic_fifo
		generic map (
			DATA_WIDTH => 12,
			BUFFER_DEPTH => 4,     -- only powers of 2 allowed
			LOG_BUFFER_DEPTH => 2  -- warning: derived from BUFFER_DEPTH
		)
		port map (
		  clk_i => sys_clk_i,
		  rstn_i => rstn_i,
		  clr_i => '0',
		  -- elements_o => elements_o,
		  data_o  => data_rx_o(ADC_WIDTH -1 downto 0),     
		  valid_o => data_rx_valid_o,    
		  ready_i => data_rx_ready_i,   
		  valid_i => adc_data_valid,
		  data_i  => adc_data_in,
		  ready_o => adc_data_ready
		);
		data_rx_o(31 downto ADC_WIDTH) <= (others => '0');

	adc_handling_p : process (sys_clk_i)
	begin
		if rising_edge(sys_clk_i) then 
			if rstn_i then
				if adc_update = '1' then 
					adc_data_in <= adc_input;
					adc_data_valid <= '1';
					if adc_data_valid = '1' then
						adc_has_overrun <= '1';  -- proper function requires adc_update to be no longer than 1 clk cycle
					end if;
				end if;
				if adc_data_ready = '1' then 
					adc_data_valid <= '0';
				end if;

				if cfg_rx_clr = '1' then 
					adc_has_overrun <= '0';
				end if;

			else  -- rst
				adc_data_in <= (others => '0');
				adc_data_valid <= '0';
				adc_has_overrun <= '0';
			end if;
		end if;  --sys_clk_i
	end process;
	  

end architecture;