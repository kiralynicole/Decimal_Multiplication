----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 04:19:36 PM
-- Design Name: 
-- Module Name: SRRN - Behavioral
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

--registru de deplasare la dreapta de n biti cu resetare sincrona
entity SRRN is
generic(n:integer);
  Port (
  clk:in std_logic;
  D: in std_logic_vector(n-1 downto 0);
  SRI:in std_logic_vector(3 downto 0);
  Rst:in std_logic;
  CE:in std_logic;
  Load:in std_logic;
  Q: out std_logic_vector(n-1 downto 0)
   );
end SRRN;

architecture Behavioral of SRRN is
signal tmp : std_logic_vector(n-1 downto 0):=(others=> '0');
begin

process(clk)
begin
if clk = '1' and clk'event then 
if rst = '1' then
tmp <=(others => '0');
else
if Load = '1' then
tmp <= D;
else 
if CE ='1' then
tmp <= SRI & tmp (n-1 downto 4);
end if;
end if;
end if;
end if;
end process;

Q<= tmp;

end Behavioral;
