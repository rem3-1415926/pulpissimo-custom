

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_slave is
	generic(
		N    : integer   := 64;       -- number of bit to serialize
		CPOL : std_logic := '0';
		insert_point : integer := 8  -- nr of clock cycles in at which send data gets updated again
	);  -- clock polarity
 	port (
		o_busy          : out std_logic;  -- receiving data if '1'
		i_data_parallel : in  std_logic_vector(N-1 downto 0);  -- data to sent
		o_data_parallel : out std_logic_vector(N-1 downto 0);  -- received data
		i_sck           : in  std_logic;
		i_csn           : in  std_logic;
		i_mosi          : in  std_logic;
		o_miso          : out std_logic
	);
end spi_slave;

architecture rtl of spi_slave is

	signal r_shift_ena : std_logic;
	signal r_tx_data   : std_logic_vector(N-2 downto 0);  -- data to sent
	signal r_rx_data   : std_logic_vector(N-1 downto 0);  -- received data

	signal insert_counter : std_logic_vector(insert_point -1 downto 0);

begin
	o_data_parallel  <= r_rx_data;
	o_busy           <= r_shift_ena;

	p_spi_slave_input : process(i_sck)
	begin
	if(i_sck'event and i_sck=CPOL) then -- CPOL='0' => falling edge; CPOL='1' => risinge edge
		if(i_csn='0') then
		r_rx_data              <= r_rx_data(N-2 downto 0)&i_mosi;
		end if;
	end if;
	end process p_spi_slave_input;

	p_spi_slave_output : process(i_sck,i_csn)
	begin
		if(i_csn='1') then
			r_shift_ena <= '0';

			insert_counter <= (others => '0');

		elsif(i_sck'event and i_sck= not CPOL) then -- CPOL='0' => falling edge; CPOL='1' => risinge edge
				r_shift_ena <= '1';

			if(r_shift_ena='0') then
				o_miso    <= i_data_parallel(N-1);
				r_tx_data <= i_data_parallel(N-2 downto 0);

				insert_counter(insert_point -1) <= '1';
				
			else
				o_miso    <= r_tx_data(N-2);
				r_tx_data <= r_tx_data(N-3 downto 0) & '0';

				insert_counter <= '0' & insert_counter(insert_point -1 downto 1);

				if insert_counter(0) = '1' then 
					insert_counter <= (others => '0');
					r_tx_data <= i_data_parallel(N-2-insert_point downto 0) & std_logic_vector(to_unsigned(0, insert_point));

				end if;  -- insert_counter
			end if;  -- shift_ena='0'
		end if; -- csn
	end process p_spi_slave_output;

end rtl;