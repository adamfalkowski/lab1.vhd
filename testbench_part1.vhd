
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


------------------------------------------------
entity clock_divider_tb is
end clock_divider_tb;
------------------------------------------------
architecture test_bench of clock_divider_tb is
    signal testbench_clk : std_logic := '0';
    signal testbench_div :std_logic := '0';
   
    
component part_1_crk is
    Port ( CLK: in std_logic;
          led0: out std_logic
           );  
end component; 
begin
clk_gen_proc: process
    begin
    
        wait for 4 ns;
        testbench_clk <= '1';
        
        wait for 4 ns;
        testbench_clk <= '0';
        
end process clk_gen_proc;   

dut : part_1_crk
         port map (
    
        CLK  => testbench_CLK,
        led0 => testbench_div
        
        );



end test_bench;    
         
         
          
