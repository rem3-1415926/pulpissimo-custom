
library ieee;							
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use ieee.math_real.all;


entity APB_MUX is
	generic (
		ADDR_WIDTH : integer := 32;
		DATA_WIDTH : integer := 32
	);
	port (
		use_spi : in std_logic;

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

		-- APB SPI
		SPI_PCLK    : in std_logic;
		SPI_PRESETn : in std_logic;
		SPI_PADDR   : in std_logic_vector(ADDR_WIDTH -1 downto 0);
		SPI_PPROT   : in std_logic_vector(2 downto 0);
		SPI_PSEL    : in std_logic;
		SPI_PENABLE : in std_logic;
		SPI_PWRITE  : in std_logic;
		SPI_PWDATA  : in std_logic_vector(DATA_WIDTH -1 downto 0);
		SPI_PSTRB   : in std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
		SPI_PREADY  : out std_logic;
		SPI_PRDATA  : out std_logic_vector(DATA_WIDTH -1 downto 0);
		SPI_PSLVERR : out std_logic;

		-- APB out
		Q_PCLK    : out std_logic;
		Q_PRESETn : out std_logic;
		Q_PADDR   : out std_logic_vector(ADDR_WIDTH -1 downto 0);
		Q_PPROT   : out std_logic_vector(2 downto 0);
		Q_PSEL    : out std_logic;
		Q_PENABLE : out std_logic;
		Q_PWRITE  : out std_logic;
		Q_PWDATA  : out std_logic_vector(DATA_WIDTH -1 downto 0);
		Q_PSTRB   : out std_logic_vector((DATA_WIDTH+7) / 8 -1 downto 0);
		Q_PREADY  : in std_logic;
		Q_PRDATA  : in std_logic_vector(DATA_WIDTH -1 downto 0);
		Q_PSLVERR : in std_logic
		
	);
end entity;

architecture rtl of APB_MUX is

begin
	process(
		use_spi,
		Q_PREADY,
		Q_PRDATA,
		Q_PSLVERR,
		SPI_PCLK, 
		SPI_PRESETn, 
		SPI_PADDR, 
		SPI_PPROT,
		SPI_PSEL,
		SPI_PENABLE,
		SPI_PWRITE,
		SPI_PWDATA,
		SPI_PSTRB,
		CORE_PCLK, 
		CORE_PRESETn, 
		CORE_PADDR, 
		CORE_PPROT,
		CORE_PSEL,
		CORE_PENABLE,
		CORE_PWRITE,
		CORE_PWDATA,
		CORE_PSTRB
	)
	begin
		if use_spi = '1' then 
			Q_PCLK    <= SPI_PCLK   ;
			Q_PRESETn <= SPI_PRESETn;
			Q_PADDR   <= SPI_PADDR  ;
			Q_PPROT   <= SPI_PPROT  ;
			Q_PSEL    <= SPI_PSEL   ;
			Q_PENABLE <= SPI_PENABLE;
			Q_PWRITE  <= SPI_PWRITE ;
			Q_PWDATA  <= SPI_PWDATA ;
			Q_PSTRB   <= SPI_PSTRB  ;

			SPI_PREADY  <= Q_PREADY ;
			SPI_PRDATA  <= Q_PRDATA ;
			SPI_PSLVERR <= Q_PSLVERR;

			CORE_PREADY  <= '1';  -- don't lockup bus
			CORE_PRDATA  <= (others => '0');
			CORE_PSLVERR <= '1';  -- always OKAY
		else
			Q_PCLK    <= CORE_PCLK   ;
			Q_PRESETn <= CORE_PRESETn;
			Q_PADDR   <= x"000" & CORE_PADDR(ADDR_WIDTH-12 -1 downto 0);  -- remove global base address
			Q_PPROT   <= CORE_PPROT  ;
			Q_PSEL    <= CORE_PSEL   ;
			Q_PENABLE <= CORE_PENABLE;
			Q_PWRITE  <= CORE_PWRITE ;
			Q_PWDATA  <= CORE_PWDATA ;
			Q_PSTRB   <= CORE_PSTRB  ;

			CORE_PREADY  <= Q_PREADY ;
			CORE_PRDATA  <= Q_PRDATA ;
			CORE_PSLVERR <= Q_PSLVERR;

			SPI_PREADY  <= '1';  -- don't lockup bus
			SPI_PRDATA  <= (others => '0');
			SPI_PSLVERR <= '1';  -- always OKAY
		end if;
	end process;
end architecture;