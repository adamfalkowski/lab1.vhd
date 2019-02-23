----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2019 10:17:41 AM
-- Design Name: 
-- Module Name: clk_divider - clk_divider_arc
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divider is
    Port ( CLK: in std_logic;
          DIV: out std_logic   );

end clk_divider;

architecture clk_divider_arc of clk_divider is
signal counts : unsigned(25 downto 0) :=(others => '0'); --need 26 bits to represent 62.5Mhz, aggragate assignement declares the default value of count as all zeros
begin
    process(CLK)
    begin
        if rising_edge(CLK)then
            if (counts < 62500000) then
                counts <= counts + 1;
                DIV <= '0';
            else if (counts = 62500000) then
                counts <= (others => '0');
                DIV <= '1';
            end if;
            end if;
            end if;
    end process;

            
             
            
            
                       


end clk_divider_arc;
