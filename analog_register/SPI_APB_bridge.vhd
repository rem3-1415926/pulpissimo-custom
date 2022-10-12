
-- function:
-- Requires SPI slave that deserialises input.
-- 
-- > write spi transaction with (address|data) as content
-- > read value is (address|data) as well
-- > register is read back regardless of write enable
-- > MSB of address is write enable, otherwise read only access
-- > actual register access happens on next spi transmission
--
-- => register access therefore requires one more spi transaction at the end
-- => read values are always from previously accessed address, but with current value
-- => address space is limited to lower half of what would be possible in 2^ADDR_WIDTH


library ieee;							
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use ieee.math_real.all;


entity SPI_APB_bridge is
	generic(
		ADDR_WIDTH : integer := 32;
		DATA_WIDTH : integer := 32
	);
	port (
		rst : in std_logic;
		
		-- SPI
		spi_clk : in std_logic;
		update_in : in std_logic;
		spi_in  : in std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);
		spi_out : out std_logic_vector(ADDR_WIDTH+DATA_WIDTH -1 downto 0);

		-- APB
		PCLK    : out std_logic;
		PRESETn : out std_logic;
		PADDR   : out std_logic_vector(ADDR_WIDTH -1 downto 0);
		PPROT   : out std_logic_vector(2 downto 0);
		PSEL    : out std_logic;
		PENABLE : out std_logic;
		PWRITE  : out std_logic;
		PWDATA  : out std_logic_vector(DATA_WIDTH -1 downto 0);
		PSTRB   : out std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
		PREADY  : in std_logic;
		PRDATA  : in std_logic_vector(DATA_WIDTH -1 downto 0);
		PSLVERR : in std_logic  -- ignored
	);
end entity;

architecture rtl of SPI_APB_bridge is
	type state_type is (idle, write1, write2, transient, read1, read2);
	signal state : state_type;

	signal address : std_logic_vector(ADDR_WIDTH -2 downto 0);
	-- signal last_address : std_logic_vector(ADDR_WIDTH -1 downto 0);
	signal w_en_in : std_logic;
	signal spi_data_in : std_logic_vector(DATA_WIDTH -1 downto 0);
	-- signal spi_data_out : std_logic_vector(DATA_WIDTH -1 downto 0);

begin
	-- aliases
	address     <= spi_in(ADDR_WIDTH+DATA_WIDTH -2 downto DATA_WIDTH);
	w_en_in     <= spi_in(ADDR_WIDTH+DATA_WIDTH -1);
	spi_data_in <= spi_in(DATA_WIDTH -1 downto 0);

	-- spi_out <= last_address(last_address'length -2 downto 0) & spi_data_out & '0';
	-- shifted output: workaround to deal with spi clock of limited availability

	PCLK <= spi_clk;

	-- const APB signals
	PPROT <= (others => '0');
	PSEL <= '1';
	PSTRB <= (others => '1');

	-- main 
	main_p : process(spi_clk, rst) is begin 
		PRESETn <= not rst;
		if rst = '1' then 
			state <= idle;
			PWRITE <= '0';
		else  -- not reset
			if rising_edge(spi_clk) then 
				if state = idle and update_in = '1' then -- FSM
					PADDR <= '0' & address;
					-- last_address <= '0' & address;
					spi_out(ADDR_WIDTH+DATA_WIDTH -1 downto DATA_WIDTH +1) <= address;  -- immediately write address to spi
					PENABLE <= '0';
					PWDATA <= spi_data_in;
					if w_en_in = '1' then 
						PWRITE <= '1';
						state <= write1;
					else 
						PWRITE <= '0';
						state <= read1;
					end if;
				
				elsif state = write1 then
					PENABLE <= '1';
					state <= write2;

				elsif state = write2 and PREADY = '1' then
					PWRITE <= '0';
					PENABLE <= '0';
					-- state <= transient;
					state <= read1;
				
				-- elsif state = transient then 
				-- 	PENABLE <= '1';
				-- 	state <= read1;
				
				elsif state = read1 then
					PENABLE <= '1';
					state <= read2;
				
				elsif state = read2 and PREADY = '1' then 
					-- spi_data_out <= PRDATA;
					spi_out(DATA_WIDTH downto 0) <= PRDATA & '0';
					PENABLE <= '0';
					state <= idle;

				end if;  -- FSM

			end if;  -- clk
		end if;  -- rst

	end process;
	

end architecture;