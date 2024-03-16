----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2023 08:45:35 AM
-- Design Name: 
-- Module Name: btc_mpg - Behavioral
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

entity Debouncer is
    Port ( clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           btn : in STD_LOGIC;
           en : out STD_LOGIC);
end Debouncer;

architecture Behavioral of Debouncer is
signal counter: std_logic_vector(31 downto 0) := x"00000000";
signal Q1,Q2,Q3 :std_logic;
begin

en<= Q1 and Q2 and (not(Q3));

process(clk)
begin
if rising_edge(clk) then
if rst = '1' then
Q1<= '0';
Q2<='0';
Q3<='0';
else
Q1<=btn;
Q2<=Q1;
Q3<=Q2;
end if;
end if;
end process;

end Behavioral;
