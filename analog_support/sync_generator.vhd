

library ieee;							
use ieee.std_logic_1164.all;		
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clock_divider is
	generic (
		N : integer := 12
	);
	port (
		clk_i   : in  std_logic;
		rst     : in  std_logic;
		divider : in  std_logic_vector(N -1 downto 0);
		sync_o  : out std_logic
	);
end entity;

architecture rtl of clock_divider is
	signal      count : unsigned(N -1 downto 0);
	signal next_count : unsigned(N -1 downto 0);

	signal sync : boolean;

	signal div : unsigned(N -1 downto 0);
begin
	div <= unsigned(divider);

	----

	sync <= (count = to_unsigned(0, N));

	next_count <= div when sync else count-1;

	sync_o <= '1' when sync else '0';
	
	counter_p : process (clk_i, rst)
	begin
		if rst then 
			count <= div;
		else  -- not rst
			if falling_edge(clk_i) then 
				count <= next_count;
			end if;
		end if;
	end process;	

end architecture;