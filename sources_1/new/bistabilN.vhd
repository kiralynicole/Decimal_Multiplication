----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2023 03:55:19 PM
-- Design Name: 
-- Module Name: bistabilN - Behavioral
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

entity bistabilN is
generic(n:integer);
 Port (
 D:in std_logic_vector(n-1 downto 0);
 CE: in std_logic;
 clk:in std_logic;
 rst:in std_logic;
 q:out std_logic_vector(n-1 downto 0)
  );
end bistabilN;

architecture Behavioral of bistabilN is

begin

process(clk)
begin
if(rising_edge(clk)) then
if (rst = '1') then
    q<=(others=>'0');
else 
    if CE = '1' then
        q <= D;
end if;
end if;
end if;
    

end process;


end Behavioral;
