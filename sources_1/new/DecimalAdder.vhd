----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2024 07:52:33 PM
-- Design Name: 
-- Module Name: DecimalAdder - Behavioral
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

entity DecimalAdder is
  Port (
  x: in std_logic_vector(3 downto 0);
  y: in std_logic_vector(3 downto 0);
  tin: in std_logic;
  s:out std_logic_vector(3 downto 0);
  tout:out std_logic
  );
end DecimalAdder;

architecture Behavioral of DecimalAdder is

signal tout_aux:std_logic;
signal tout_sum:std_logic;
signal tout_sum2:std_logic;
signal sum_aux:std_logic_vector(3 downto 0);
signal x_aux: std_logic_vector(3 downto 0);

begin

sum1: entity WORK.Adder4 port map(
x=>x,
y=>y,
tin=>tin,
s=> sum_aux ,
tout=> tout_sum );

tout_aux <= tout_sum or (sum_aux(3) and sum_aux(2)) or (sum_aux(3) and sum_aux(1));
tout <= tout_aux;

x_aux <= "0110" when tout_aux ='1' else "0000";

sum2: entity WORK.Adder4 port map(
x=>x_aux,
y=>sum_aux,
tin=>'0',
s=> s ,
tout=> tout_sum2 );

end Behavioral;
