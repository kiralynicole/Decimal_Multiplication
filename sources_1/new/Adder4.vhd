----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 03:26:18 PM
-- Design Name: 
-- Module Name: Adder4bits - Behavioral
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder4 is
  Port (
  x: in std_logic_vector(3 downto 0);
  y: in std_logic_vector(3 downto 0);
  tin:in std_logic;
  s:out std_logic_vector(3 downto 0);
  tout:out std_logic
   );
end Adder4;

architecture Behavioral of Adder4 is
signal t1,t2,t3: std_logic;
signal p,g :std_logic_vector(3 downto 0);

begin

process(x,y)
begin
for i in 0 to 3 loop
p(i) <= x(i) or y(i);
g(i) <= x(i) and y(i);
end loop;
end process;

t1 <= g(0) or (p(0) and tin);
t2 <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and tin);
t3 <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and tin);

s(0) <= x(0) xor y(0) xor tin;
s(1) <= x(1) xor y(1) xor t1;
s(2) <= x(2) xor y(2) xor t2;
s(3) <= x(3) xor y(3) xor t3;

tout<= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and tin);




end Behavioral;
