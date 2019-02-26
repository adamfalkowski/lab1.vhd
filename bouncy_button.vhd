

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity debounce is
    Port ( 
            btn, CLK : in std_logic;
            dbnc: out std_logic
                 );
end debounce;

architecture debounce_arc of debounce is
    signal shift_reg : std_logic_vector (1 downto 0) := "00";
    
begin
    process(CLK)
    begin
     if (rising_edge(CLK)) then
         shift_reg(0) <= btn;
         shift_reg(1) <= shift_reg(0);
     end if;
     
     
         

end debounce_arc;
