-- # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
-- #                                                                     #
-- # Hardware description by Lukas Leuenberger lukas.leuenberger@ost.ch  #
-- #                                                                     #
-- #                            Created: 03.11.2020                      #
-- #                        Last modified: 25.01.2021                    #
-- #                                                                     #
-- #          Copyright by Hochschule fuer Technik in Rapperswil         #
-- #                                                                     #
-- #                                                                     #
-- # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

--------------------------------------------------------------------------
-- Library declarations for entity
--------------------------------------------------------------------------
-- Standard library ieee	
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides arithmetic functions for real values.	
use ieee.math_real.all;

--------------------------------------------------------------------------
-- The block **spi** implements the SPI interface. One SPI transaction typically consists of **DATA_WIDTH_G** bits. Up to **NO_OF_SPI_SLAVES_G** blocks can be cascaded.
--
-- During the first transaction, this block counts the number of edges on **sck_in**. This is done to determine the number of slaves in the chain. As in the first run it is not known when the data in the shiftregister is valid, the data is evaluated on the first edge of the second transaction. For all other runs the data is evaluated on the last edge of the transaction. An answer is loaded into the shiftregister on the second edge of a transaction.
--
-- As soon as there is valid data in the shiftregister, the port **datavalid_out** is set and the port **datareceive_out** contains the valid data. The port **datasend_in** contains the answer to the received data and is loaded into the shiftregister on the second edge of a transaction.
--
-- The data is read in from **mosi_in** on the rising edge of **sck_in** and is written out on **miso_out** on the falling edge of the clock **sck_in**. The SPI interface is active if the port **csn_in** is reset.
--
-- One testbench exists for this block. The testbench can be found in **spi_sim_tb.vhd**. This testbench tests the general functionality of this block.
--------------------------------------------------------------------------
entity spi_4_reg is
    generic(
        data_width_g       : integer range 1 to 64  := 16; -- Width of the shift register
        no_of_spi_slaves_g : integer range 1 to 128 := 8 -- Maximum number of SPI Slaves which can be chained into one large shiftregister

    );
    port(
        -- Clk
        sck_in          : in  std_logic; -- Input clock
        -- SPI Interface
        csn_in          : in  std_logic; -- SPI slave select
        mosi_in         : in  std_logic; -- SPI data input
        miso_out        : out std_logic; -- SPI data output
        -- Asynchronous negative reset
        aresetn_in      : in  std_logic; -- Asynchronous negative reset
        -- Received Data
        datareceive_out : out std_logic_vector(data_width_g - 1 downto 0); -- Contains the received data
--        datareceive_out : out std_logic_vector(15 downto 0); -- Contains the received data
        datavalid_out   : out std_logic; -- Is set if there is valid data on the port **datareceive_out**
        -- Data which shall be sent
        datasend_in     : in  std_logic_vector(data_width_g - 1 downto 0); -- Contains data which shall be sent as answer 
--        datasend_in     : in  std_logic_vector(15 downto 0); -- Contains data which shall be sent as answer 
        -- Number of counted edges
        maxEdge_out     : out unsigned(integer(ceil(log2(real(data_width_g * no_of_spi_slaves_g)))) - 1 downto 0) -- Contains the number of counted edges
--        maxEdge_out     : out unsigned(7 downto 0) -- Contains the number of counted edges
    );
end spi_4_reg;

--------------------------------------------------------------------------
-- This is the behavioral architecture of the **spi** block. This architecture implements the whole functionality.
--------------------------------------------------------------------------
architecture behavioral of spi_4_reg is
    ----------------------------------------------------------------------
    -- Signal declaration
    ----------------------------------------------------------------------

    -- Signal for the shiftregister
    signal shiftregister : std_logic_vector(data_width_g - 1 downto 0);

    -- Signal for the output flipflop which is driven on the falling edge
    signal ffOut : std_logic;

    -- Counter which is used to count the number of edges from the beginning of the transmission
    signal countEdge : unsigned(integer(ceil(log2(real(data_width_g * no_of_spi_slaves_g)))) - 1 downto 0);

    -- Signal to save the count value which determines the number of edges until the data is read in
    signal maxEdge : unsigned(integer(ceil(log2(real(data_width_g * no_of_spi_slaves_g)))) - 1 downto 0);

    -- Signal which signalizes if this is the first run after reset and if we need to count the number of edges
    signal firstRun : std_logic;

    -- Signal which is set when the first edge arrives
    signal firstEdge     : std_logic;
    -- Signal which is set when the first edge arrives
    signal firstEdgeFall : std_logic;

    -- Signal which is used to generate the valid signal
    signal validFirstTransmission         : std_logic;
    -- Signal which is used to generate the valid signal
    signal validSecondAndElseTransmission : std_logic;

begin
    ----------------------------------------------------------------------
    -- The signal **firstEdge** is set when the SPI interface is reset which signalizes that a new transaction starts.
    -- This is one out of two flipflops which has a reset triggered on **csn_in**. This flipflop is triggered on the rising edge of **sck_in**.
    ----------------------------------------------------------------------
    getFirstEdge : process(aresetn_in, sck_in, csn_in)
    begin
        -- Check if there is a reset or if the slave is not selected
        if ((aresetn_in = '0') or (csn_in = '1')) then
            -- Set the signal
            firstEdge <= '1';

        -- Check if we have an rising edge on the clock
        elsif (rising_edge(sck_in)) then
            -- First edge appeared, clear the signal
            firstEdge <= '0';
        end if;
    end process;

    ----------------------------------------------------------------------
    -- The signal **firstEdgeFall** is set when the SPI interface is reset which signalizes signalizes that a new transaction starts.
    -- This is one out of two flipflops which has a reset triggered on **csn_in**. This flipflop is triggered on the falling edge of **sck_in**.
    ----------------------------------------------------------------------
    getFirstEdgeFall : process(aresetn_in, sck_in, csn_in)
    begin
        -- Check if there is a reset or if the slave is not selected
        if ((aresetn_in = '0') or (csn_in = '1')) then
            -- Set the signal
            firstEdgeFall <= '1';

        -- Check if we have an rising edge on the clock
        elsif (falling_edge(sck_in)) then
            -- First edge appeared, clear the signal
            firstEdgeFall <= '0';
        end if;
    end process;

    ---------------------------------------------------------------------
    -- The signal **firstRun* is set when this is the first run and is reset as soon as the the first run is over.
    -- The Signal is introduced such that the **maxEdge** register can be clocked with the signal **sck_in** instead of rising_edge(**csn_in**).
    ----------------------------------------------------------------------
    getFirstRun : process(aresetn_in, sck_in)
    begin
        -- Check if there is a reset
        if (aresetn_in = '0') then
            firstRun <= '1';

        -- Check if we have an rising edge on the clock
        elsif (rising_edge(sck_in)) then
            -- Check if the transmission just started
            if (firstEdge = '1') then
                -- Check that we have no value yet
                if (maxEdge = 0) then
                    firstRun <= '1';
                else
                    firstRun <= '0';
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------
    -- This is a counter which counts the number of current observed edges of the spi clock.
    ----------------------------------------------------------------------
    edgeCounter : process(sck_in, aresetn_in)
    begin
        -- Check if there is a reset
        if (aresetn_in = '0') then
            -- Reset the counter
            countEdge <= (others => '0');

        -- Check if we have an rising edge on the clock
        elsif (rising_edge(sck_in)) then
            -- Check if this is the first edge
            if (firstEdge = '1') then
                -- Reset the counter
                countEdge <= to_unsigned(1, countEdge'length);
            else
                -- Increment the counter
                countEdge <= countEdge + 1;
            end if;
        end if;
    end process;
	

    ----------------------------------------------------------------------
    -- This register is set at the end of the first transmission and stores the total number of edges which must be observed before the received data is valid.
    ----------------------------------------------------------------------
    getMaxEdge : process(aresetn_in, sck_in)
    begin
        -- Check if there is a reset
        if (aresetn_in = '0') then
            maxEdge <= (others => '0');

        -- Check if we have an rising edge on the clock
        elsif (rising_edge(sck_in)) then
            -- Check if this is the first run
            if ((firstRun = '1') and (firstEdge = '0')) then
                -- Save the current counter value
                maxEdge <= countEdge;
            else
                -- Keep the current value
                maxEdge <= maxEdge;
            end if;
        end if;
    end process;

    -- Output the max edge register
    maxEdge_out <= maxEdge;

    ----------------------------------------------------------------------
    -- This process models the shiftregister of the SPI interface.
    ----------------------------------------------------------------------
    shiftReg : process(sck_in, aresetn_in)
    begin
        -- Check for reset
        if (aresetn_in = '0') then
            shiftregister <= (others => '0');

        -- Check if we have a rising edge
        elsif (rising_edge(sck_in)) then
            -- Check if we need to load the data, Edge 2 is chosen because of the very first transfer which is handled in the second transfer of the first edge
            if (countEdge = 1) then
                -- Load the data
                shiftregister <= datasend_in(data_width_g - 3 downto 0) & shiftregister(0) & mosi_in;
            else
                -- Shift the data
                shiftregister <= shiftregister(data_width_g - 2 downto 0) & mosi_in;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------
    -- This is the output flipflop of the SPI interface. This register is clocked with the falling edge of **sck_in**. The output signal is half a clock period earlier such that the setup and hold time is not violated.
    ----------------------------------------------------------------------
    outputFF : process(sck_in, aresetn_in)
    begin
        -- Check for reset
        if (aresetn_in = '0') then
            ffOut <= '0';

        -- Check if we have a falling edge
        elsif (falling_edge(sck_in)) then
            if (countEdge = 1) then
                ffOut <= datasend_in(data_width_g - 2); -- Set the second bit of the datasend_vector

            else
                -- Shift the data
                ffOut <= shiftregister(data_width_g - 1);
            end if;
        end if;
    end process;

    ----------------------------------------------------------------------
    -- Generate the valid signals
    ----------------------------------------------------------------------
    -- Check for maxedge instead of countedge because there is a problem when the maximum number of slaves are attached
    validFirstTransmission         <= '1' when ((firstEdge = '1') and (firstRun = '1') and (maxEdge /= 0)) else '0'; -- Handling of very first access needs to be done during second access
    validSecondAndElseTransmission <= '1' when ((firstEdge = '0') and (firstRun = '0') and (countEdge = maxEdge)) else '0'; -- Normal case

    ----------------------------------------------------------------------
    -- Output logic which sets the datavalid_out signal
    ----------------------------------------------------------------------
    datavalid_out <= validFirstTransmission or validSecondAndElseTransmission;

    ----------------------------------------------------------------------
    -- Output stage
    ----------------------------------------------------------------------
    -- Received data
    datareceive_out <= shiftregister(data_width_g - 1 downto 0) when (validFirstTransmission = '1') else -- Handling of very first access needs to be done during second access
                       shiftregister(data_width_g - 2 downto 0) & mosi_in; -- Normal case 	
	                   

    miso_out <= datasend_in(data_width_g - 1) when (firstEdgeFall = '1') else ffOut; -- Set the first bit of the datasend_vector (must be set already on the last edge of the previous transmission), should be a constant
    -- firstEdgeFall is required to fulfill hold time requirement of  first clock edge
end behavioral;
