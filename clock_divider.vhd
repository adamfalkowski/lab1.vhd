library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

--entity declaration for clk_divider-------------------------------------------------------
entity clk_divider is
    Port ( CLK: in std_logic;   
          DIV: out std_logic := '0');

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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--entity declaration RTL_reg----------------------------------------------------------
entity RTL_reg is
    port(
            C,CE,D : in std_logic;
            q : out std_logic := '0'
            );
end RTL_reg;
--architecture declaration for RTL_reg--------------------------------------------------
architecture RTL_reg_arc of RTL_reg is
begin
    process(C)
    begin
        if rising_edge(C) then
            if (CE = '1') then
                q <= D;
            end if;
        end if;
    end process;
end RTL_reg_arc;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--entity declaration for inverter-------------------------------------------------------
entity inverter is
    port (
        inv_input : in std_logic;
        inv_output : out std_logic
        );
end inverter;

--architecture declaration for inverter--------------------------------------------------
architecture inverter_arc of inverter is
begin
    inv_output <= (NOT inv_input);
end inverter_arc;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--entity declaration for entire circuit--------------------------------------------------
entity part_1_crk is
    port(
            CLK: in std_logic;
            led0: out std_logic 
            );
end part_1_crk;
--architecture declaration for part_1_crk-------------------------------------------------
architecture part_1_crk_arc of part_1_crk is

     component clk_divider
        Port ( CLK: in std_logic;
          DIV: out std_logic  
          );
     end component;
     
     component RTL_reg
        port(
            C,CE,D : in std_logic;
            q : out std_logic 
            );
     end component;
     
     component inverter 
            port (
        inv_input : in std_logic;
        inv_output : out std_logic
        );
     end component;
     --intermediete signal announcements
     signal clk_div_result : std_logic;
     signal reg_result : std_logic ;
     signal inverter_result :std_logic;
     begin
        U1: clk_divider
                        port map (
                                    CLK => CLK,
                                    DIV => clk_div_result
                                    );
        led_reg: RTL_reg
                        port map (
                                    C => CLK,
                                    CE => clk_div_result,
                                    D => inverter_result,
                                    q => reg_result
                                   
                                    );
                                    
         led0_i: inverter
                        port map (
                                    inv_input => reg_result,
                                    inv_output => inverter_result
                                    );
led0 <= reg_result;
 end part_1_crk_arc;
