library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

--entity declaration for clk_divider-------------------------------------------------------
entity clk_divider is
    Port ( CLK: in std_logic;
          DIV: out std_logic := '0' );

end clk_divider;
--architecture for clk divider-------------------------------------------------------------
architecture clk_divider_arc of clk_divider is
signal counts : std_logic_vector(26 downto 0) :=(others => '0'); --need 26 bits to represent 62.5Mhz, aggragate assignement declares the default value of count as all zeros
signal toggle : std_logic := '0';
begin
    process(CLK)
    begin
        if rising_edge(CLK)then
            if (unsigned(counts) < 125000000) then
                counts <= std_logic_vector(unsigned(counts) + 1);
            else 
                counts <= (others => '0');
            end if; 
              
            if (unsigned(counts) < 62500000) then
                DIV <= toggle;
            else 
                DIV <= NOT toggle;
            end if;
            end if;
    end process;
                  
end clk_divider_arc;
