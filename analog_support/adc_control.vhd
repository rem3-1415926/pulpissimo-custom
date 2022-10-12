
-- SAR_ADC_Digital (adc_digital)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity adc_control is
    port (
        -- Global Signals
        clk_i    : in std_logic;
        reset_i  : in std_logic;

        -- Outputs
        ADC_Data_o      : out std_logic_vector(9 downto 0);
        Interrupt_o     : out std_logic;
        Sample_Switch_o : out std_logic;
        B0Switch_o      : out std_logic_vector(1 downto 0);
        B1Switch_o      : out std_logic_vector(1 downto 0);
        B2Switch_o      : out std_logic_vector(1 downto 0);
        B3Switch_o      : out std_logic_vector(1 downto 0);
        B4Switch_o      : out std_logic_vector(1 downto 0);
        B5Switch_o      : out std_logic_vector(1 downto 0);
        B6Switch_o      : out std_logic_vector(1 downto 0);
        B7Switch_o      : out std_logic_vector(1 downto 0);
        B8Switch_o      : out std_logic_vector(1 downto 0);


        -- Debug Outputs (Comment after debuging)
        dOut_NS : out unsigned(3 downto 0);
        dOut_PS : out unsigned(3 downto 0);
        dOut_valid : out std_logic_vector(9 downto 0);

        -- Inputs
        Comparator_i  : in std_logic;
        SampleClock_i : in std_logic;  -- synchronisation signal, NOT an actual clock
        DelayConfig_i : in std_logic_vector(12 downto 0); -- Split up in different signals
        Config_i      : in std_logic_vector(2 downto 0)
        
    );
end entity;

architecture rtl of adc_control is
    -- Signals and states of the main state machine
    type MAIN_Type is (init, WSC, OSS, Di, Ei, Si, WD, RS, RSS, CSS, Dm1);
    signal PS, NS : MAIN_Type;

    -- internal Signals
    signal adc_next_out : std_logic_vector(9 downto 0); -- Evaluatet Bits
    signal adc_next_out_valid : std_logic_vector(9 downto 0);
    signal sc_old : std_logic; -- Old Value of the Sampleclock for flank dedection

    signal bit_count : integer range 0 to 9; -- currently evaluated bit
    signal delay_counter : unsigned(6 downto 0); -- Counter for Delay

    -- Config Signals
    signal th_sh : std_logic; -- 0 = Track&Hold; 1 = Sample&Hold
    signal enable : std_logic; -- 1 = Enable; 0 = Disable
    signal in_en : std_logic; -- 1 = Interrupt Enable; 0 = Interrupt Disable
    --Delay Configs
    signal d_M1 : unsigned(4 downto 0); -- Delay for seatlling Sampled signals

    type delArr is array (9 downto 0) of unsigned(3 downto 0);
    signal d_i : delArr;
    
        
begin

-----------------------------------------------------------------------------------------
-- Debug Outputs
-----------------------------------------------------------------------------------------
dOut_valid <= adc_next_out_valid;

-----------------------------------------------------------------------------------------
-- STATE REGISTER
-----------------------------------------------------------------------------------------
State_Register : process(clk_i, reset_i)
begin
    -- Asynchronus Reset
    if reset_i = '1' then
        PS <= init;
    elsif rising_edge(clk_i) then
        PS <= NS;
    end if;
   
end process;


-----------------------------------------------------------------------------------------
-- NEXT STATE LOGIC
-----------------------------------------------------------------------------------------
next_state_logic : process (PS, SampleClock_i, th_sh, clk_i, delay_counter, bit_count)
begin
    NS <= init; -- Default next state

    case PS is
        when init =>
            sc_old <= SampleClock_i;
            if enable = '1' then
                NS <= WSC;
            else
                NS <= init;
            end if;
        when WSC =>
            if enable = '1' then
                if sc_old = '0' and SampleClock_i = '1' then
                    if th_sh = '0' then -- Track and Hold
                        NS <= OSS;
                    else -- Sample and Hold
                        NS <= CSS;
                    end if;
                else
                    NS <= WSC;
                end if;
                sc_old <= SampleClock_i;
            else
                NS <= init;
            end if;
        when CSS =>
            --delay_counter <= (others => '0');
            delay_counter <= to_unsigned(1,7);
            if d_i(9-bit_count) > 0 then
                NS <= Dm1;
            else
                NS <= OSS;
            end if;
            
        when Dm1 =>
            if delay_counter >= d_M1 then
                NS <= OSS;
            elsif rising_edge(clk_i) then
                delay_counter <= delay_counter + 1;
                NS <= Dm1;
            else
                delay_counter <= delay_counter;
                NS <= Dm1;
            end if;
        when OSS =>
            --delay_counter <= (others => '0');
            delay_counter <= to_unsigned(1,7);
            bit_count <= 0;
            if d_i(9-bit_count) > 0 then
                NS <= Di;
            else
                NS <= Ei;
            end if;
        when Di =>
            if delay_counter >= d_i(9-bit_count) then
                NS <= Ei;
            elsif rising_edge(clk_i) then
                delay_counter <= delay_counter + 1;
                NS <= Di;
            else
                delay_counter <= delay_counter;
                NS <= Di;
            end if;
        when Ei =>
            --delay_counter <= (others => '0');
            delay_counter <= to_unsigned(1,7);
            if bit_count >= 9 then
                NS <= WD;
            else
                NS <= Si;
            end if;
        when Si =>
            if rising_edge(clk_i) then
                bit_count <= bit_count + 1;
            end if;
            if d_i(9-bit_count) > 0 then
                NS <= Di;
            else
                NS <= Ei;
            end if;
            
        when WD =>
            NS <= RS;
        when RS =>
            if (th_sh = '0') then
                NS <= RSS;
            else
                if enable = '1' then
                    NS <= WSC;
                else
                    NS <= init;
                end if;
                sc_old <= SampleClock_i;
            end if;
        when RSS =>
            if enable = '1' then
                NS <= WSC;
            else
                NS <= init;
            end if;
            sc_old <= SampleClock_i;
        when others =>
        NS <= init; 
    end case;
    
end process;

-----------------------------------------------------------------------------------------
-- OUTPUT LOGIC
-----------------------------------------------------------------------------------------
output_logic : process (PS, th_sh, adc_next_out_valid, adc_next_out, SampleClock_i, Comparator_i, clk_i)
begin
    -- Default Values !!! Should be over written in every state !!!
    Interrupt_o <= '0';
    Sample_Switch_o <= '0';
    B0Switch_o <= "00";
    B1Switch_o <= "00";
    B2Switch_o <= "00";
    B3Switch_o <= "00";
    B4Switch_o <= "00";
    B5Switch_o <= "00";
    B6Switch_o <= "00";
    B7Switch_o <= "00";
    B8Switch_o <= "00";

    case PS is
        when init | WSC =>
            adc_next_out_valid <= (others => '0');
            adc_next_out <= (others => '0');
            Interrupt_o <= '0';
            if th_sh = '0' then
                Sample_Switch_o <= '1';
            else
                Sample_Switch_o <= '0';
            end if;
            B0Switch_o <= "11";
            B1Switch_o <= "11";
            B2Switch_o <= "11";
            B3Switch_o <= "11";
            B4Switch_o <= "11";
            B5Switch_o <= "11";
            B6Switch_o <= "11";
            B7Switch_o <= "11";
            B8Switch_o <= "11";
            if PS = init then
                ADC_Data_o <= (others => '0');
            end if;

        when CSS | Dm1 | RSS =>
            adc_next_out <= (others => '0');
            Interrupt_o <= '0';
            Sample_Switch_o <= '1';
            B0Switch_o <= "11";
            B1Switch_o <= "11";
            B2Switch_o <= "11";
            B3Switch_o <= "11";
            B4Switch_o <= "11";
            B5Switch_o <= "11";
            B6Switch_o <= "11";
            B7Switch_o <= "11";
            B8Switch_o <= "11";
        
        when OSS | RS =>
            adc_next_out <= (others => '0');
            Interrupt_o <= '0';
            Sample_Switch_o <= '0';
            B0Switch_o <= "11";
            B1Switch_o <= "11";
            B2Switch_o <= "11";
            B3Switch_o <= "11";
            B4Switch_o <= "11";
            B5Switch_o <= "11";
            B6Switch_o <= "11";
            B7Switch_o <= "11";
            B8Switch_o <= "11";
            adc_next_out_valid <= (others => '0');

        when Di | Ei | Si | WD =>
            Interrupt_o <= '0';
            Sample_Switch_o <= '0';

            if adc_next_out_valid(1) = '1' then
                if adc_next_out(1) = '1' then
                    B0Switch_o <= "10";
                else
                    B0Switch_o <= "01";
                end if;
            else
                B0Switch_o <= "11";
            end if;

            if adc_next_out_valid(2) = '1' then
                if adc_next_out(2) = '1' then
                    B1Switch_o <= "10";
                else
                    B1Switch_o <= "01";
                end if;
            else
                B1Switch_o <= "11";
            end if;

            if adc_next_out_valid(3) = '1' then
                if adc_next_out(3) = '1' then
                    B2Switch_o <= "10";
                else
                    B2Switch_o <= "01";
                end if;
            else
                B2Switch_o <= "11";
            end if;

            if adc_next_out_valid(4) = '1' then
                if adc_next_out(4) = '1' then
                    B3Switch_o <= "10";
                else
                    B3Switch_o <= "01";
                end if;
            else
                B3Switch_o <= "11";
            end if;

            if adc_next_out_valid(5) = '1' then
                if adc_next_out(5) = '1' then
                    B4Switch_o <= "10";
                else
                    B4Switch_o <= "01";
                end if;
            else
                B4Switch_o <= "11";
            end if;

            if adc_next_out_valid(6) = '1' then
                if adc_next_out(6) = '1' then
                    B5Switch_o <= "10";
                else
                    B5Switch_o <= "01";
                end if;
            else
                B5Switch_o <= "11";
            end if;

            if adc_next_out_valid(7) = '1' then
                if adc_next_out(7) = '1' then
                    B6Switch_o <= "10";
                else
                    B6Switch_o <= "01";
                end if;
            else
                B6Switch_o <= "11";
            end if;

            if adc_next_out_valid(8) = '1' then
                if adc_next_out(8) = '1' then
                    B7Switch_o <= "10";
                else
                    B7Switch_o <= "01";
                end if;
            else
                B7Switch_o <= "11";
            end if;

            if adc_next_out_valid(9) = '1' then
                if adc_next_out(9) = '1' then
                    B8Switch_o <= "01";
                else
                    B8Switch_o <= "10";
                end if;
            else
                B8Switch_o <= "11";
            end if;
            
            if PS = Ei then
                if rising_edge(clk_i) then
                    if Comparator_i = '1' then
                        if bit_count = 0 then
                            adc_next_out(9-bit_count) <= '0';
                        else
                            adc_next_out(9-bit_count) <= '1';
                        end if;
                    else
                        if bit_count = 0 then
                            adc_next_out(9-bit_count) <= '1';
                        else
                            adc_next_out(9-bit_count) <= '0';
                        end if;
                    end if;
                    adc_next_out_valid(9-bit_count) <= '1';
                end if;
            end if;
            if PS = WD then
                ADC_Data_o <= adc_next_out;
                Interrupt_o <= '1';
                B0Switch_o <= "00";
                B1Switch_o <= "00";
                B2Switch_o <= "00";
                B3Switch_o <= "00";
                B4Switch_o <= "00";
                B5Switch_o <= "00";
                B6Switch_o <= "00";
                B7Switch_o <= "00";
                B8Switch_o <= "00";
            end if;
        when others =>
        NULL;
    end case;

end process;

-----------------------------------------------------------------------------------------
-- CONFIG LOGIC
-----------------------------------------------------------------------------------------
config_logic : process (DelayConfig_i, Config_i)
begin
    -- TODO the address of these Registers are not defined
    th_sh <= Config_i(1); -- Track&Hold / Sample&Hold
    enable <= Config_i(0);


    d_M1   <= unsigned(DelayConfig_i( 4 downto  0));
    -- d_i(0) <= (1 downto 0 => unsigned(DelayConfig_i(12 downto 11)), others => '0');
    -- d_i(1) <= (1 downto 0 => unsigned(DelayConfig_i(12 downto 11)), others => '0');
    -- d_i(2) <= (1 downto 0 => unsigned(DelayConfig_i(12 downto 11)), others => '0');
    -- d_i(3) <= (1 downto 0 => unsigned(DelayConfig_i(12 downto 11)), others => '0');
    -- d_i(4) <= (1 downto 0 => unsigned(DelayConfig_i(10 downto  9)), others => '0');
    -- d_i(5) <= (1 downto 0 => unsigned(DelayConfig_i(10 downto  9)), others => '0');
    -- d_i(6) <= (1 downto 0 => unsigned(DelayConfig_i(10 downto  9)), others => '0');
    -- d_i(7) <= (3 downto 0 => unsigned(DelayConfig_i( 8 downto  5)), others => '0');
    -- d_i(8) <= (3 downto 0 => unsigned(DelayConfig_i( 8 downto  5)), others => '0');
    -- d_i(9) <= (3 downto 0 => unsigned(DelayConfig_i( 8 downto  5)), others => '0');

    d_i(0) <= resize(unsigned(DelayConfig_i(12 downto 11)), 4);
    d_i(1) <= resize(unsigned(DelayConfig_i(12 downto 11)), 4);
    d_i(2) <= resize(unsigned(DelayConfig_i(12 downto 11)), 4);
    d_i(3) <= resize(unsigned(DelayConfig_i(12 downto 11)), 4);
    d_i(4) <= resize(unsigned(DelayConfig_i(10 downto  9)), 4);
    d_i(5) <= resize(unsigned(DelayConfig_i(10 downto  9)), 4);
    d_i(6) <= resize(unsigned(DelayConfig_i(10 downto  9)), 4);
    d_i(7) <= resize(unsigned(DelayConfig_i( 8 downto  5)), 4);
    d_i(8) <= resize(unsigned(DelayConfig_i( 8 downto  5)), 4);
    d_i(9) <= resize(unsigned(DelayConfig_i( 8 downto  5)), 4);

end process;


debug_logic : process(PS, NS)
begin
    case NS is
        when init =>
            dOut_NS <= to_unsigned(1,4);
        when WSC =>
            dOut_NS <= to_unsigned(2,4);
        when OSS =>
            dOut_NS <= to_unsigned(3,4);
        when Di =>
            dOut_NS <= to_unsigned(4,4);
        when Ei =>
            dOut_NS <= to_unsigned(5,4);
        when Si =>
            dOut_NS <= to_unsigned(6,4);
        when WD =>
            dOut_NS <= to_unsigned(7,4);
        when RS =>
            dOut_NS <= to_unsigned(8,4);
        when RSS =>
            dOut_NS <= to_unsigned(9,4);
        when CSS =>
            dOut_NS <= to_unsigned(10,4);
        when Dm1 =>
            dOut_NS <= to_unsigned(11,4);
        when others =>
            dOut_NS <= to_unsigned(0,4);
    end case;

    case PS is
        when init =>
            dOut_PS <= to_unsigned(1,4);
        when WSC =>
            dOut_PS <= to_unsigned(2,4);
        when OSS =>
            dOut_PS <= to_unsigned(3,4);
        when Di =>
            dOut_PS <= to_unsigned(4,4);
        when Ei =>
            dOut_PS <= to_unsigned(5,4);
        when Si =>
            dOut_PS <= to_unsigned(6,4);
        when WD =>
            dOut_PS <= to_unsigned(7,4);
        when RS =>
            dOut_PS <= to_unsigned(8,4);
        when RSS =>
            dOut_PS <= to_unsigned(9,4);
        when CSS =>
            dOut_PS <= to_unsigned(10,4);
        when Dm1 =>
            dOut_PS <= to_unsigned(11,4);
        when others =>
            dOut_PS <= to_unsigned(0,4);
    end case;
end process;
end architecture;