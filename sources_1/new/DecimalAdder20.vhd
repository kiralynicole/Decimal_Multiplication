----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 02:24:38 PM
-- Design Name: 
-- Module Name: DecimalAdder20 - Behavioral
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

entity DecimalAdder20 is
  Port (
  x:in std_logic_vector(19 downto 0);
  y:in std_logic_vector(19 downto 0);
  tin:in std_logic;
  s:out std_logic_vector(19 downto 0);
  tout:out std_logic
   );
end DecimalAdder20;

architecture Behavioral of DecimalAdder20 is
signal t1,t2,t3,t4:std_logic;
begin

unitati: entity WORK.DecimalAdder port map(
x=>x(3 downto 0),
y => y(3 downto 0),
tin=>tin,
s=>s(3 downto 0),
tout=>t1
);

zeci: entity WORK.DecimalAdder port map(
x=>x(7 downto 4),
y => y(7 downto 4),
tin=>t1,
s=>s(7 downto 4),
tout=>t2
);

sute: entity WORK.DecimalAdder port map(
x=>x(11 downto 8),
y => y(11 downto 8),
tin=>t2,
s=>s(11 downto 8),
tout=>t3
);

mii: entity WORK.DecimalAdder port map(
x=>x(15 downto 12),
y => y(15 downto 12),
tin=>t3,
s=>s(15 downto 12),
tout=>t4
);

zeci_mii: entity WORK.DecimalAdder port map(
x=>x(19 downto 16),
y => y(19 downto 16),
tin=>t4,
s=>s(19 downto 16),
tout=>tout
);

end Behavioral;
