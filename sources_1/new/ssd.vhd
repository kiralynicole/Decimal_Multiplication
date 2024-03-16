----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 02:14:42 PM
-- Design Name: 
-- Module Name: SSD - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssd is
  Port (
  clk:in std_logic;
  rst:in std_logic;
  data:in std_logic_vector(31 downto 0);
  an : out std_logic_vector(7 downto 0); --anod activ
  cat: out std_logic_vector(7 downto 0)--catozi activi
   );
end ssd;

architecture Behavioral of ssd is
CONSTANT NEW_COUNTER:integer:=2**20;
signal new_counterV:integer range 0 to NEW_COUNTER-1:=0;
signal counter:std_logic_vector(19 downto 0);
signal sel:std_logic_vector(2 downto 0):=(others=>'0');
signal hex:std_logic_vector(3 downto 0):=(others=>'0');

begin

process(clk)
begin

if(rising_edge(clk)) then
    if(rst = '1')then
        new_counterV<=0;
    elsif(new_counterV = new_counter-1) then
        new_counterV<=0;
    else
        new_counterV <= new_counterV+1;   
     end if;
     end if;    
end process;

--process(clk)
--begin
--if clk = '1' and clk'event then
--counter <= counter+1;
--end if;
--end process;

counter<=CONV_STD_LOGIC_VECTOR(new_counterV,20);

sel <= counter(19 downto 17);

--selectam anod
process(sel)
begin
case sel is
when "000" => an <= "11111110";
when "001" => an <= "11111101";
when "010" => an <= "11111011";
when "011" => an <= "11110111";
when "100" => an <= "11101111";
when "101" => an <= "11011111";
when "110" => an <= "10111111";
when others => an <= "01111111";
end case;
end process;


--selectam data
process(sel,hex)
begin
case sel is 
when "000" => hex <= data(3 downto 0);
when "001" => hex <= data(7 downto 4);
when "010" => hex <= data(11 downto 8);
when "011" => hex <= data(15 downto 12);
when "100" => hex <= data(19 downto 16);
when "101" => hex <= data(23 downto 20);
when "110" => hex <= data(27 downto 24);
when others => hex <= data(31 downto 28);
end case;
end process;

--selectam catod 
process(hex)
begin
case hex is 
when "0000" => cat <= "11000000";
when "0001" => cat <= "11111001";
when "0010" => cat <= "10100100";
when "0011" => cat <= "10110000";
when "0100" => cat <= "10011001";
when "0101" => cat <= "10010010";
when "0110" => cat <= "10000010";
when "0111" => cat <= "11111000";
when "1000" => cat <= "10000000";
when "1001" => cat <= "10010000";
when "1010" => cat <= "10001000";
when "1011" => cat <= "10000011";
when "1100" => cat <= "11000110";
when "1101" => cat <= "10100001";
when "1110" => cat <= "10000110";
when others => cat <= "10001110";
end case;
end process;



end Behavioral;
