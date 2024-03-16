----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/09/2024 04:55:14 PM
-- Design Name: 
-- Module Name: bistabil - Behavioral
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

entity bistabil is
  Port (
 D:in std_logic;
 CE: in std_logic;
 clk:in std_logic;
 rst:in std_logic;
 q:out std_logic
 );
end bistabil;

architecture Behavioral of bistabil is

begin


process(clk)
begin
if(rising_edge(clk)) then
if (rst = '1') then
    q<='0';
else 
    if CE = '1' then
        q <= D;
end if;
end if;
end if;
    

end process;


end Behavioral;
