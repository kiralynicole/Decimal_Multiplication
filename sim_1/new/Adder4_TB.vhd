----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2023 05:00:16 PM
-- Design Name: 
-- Module Name: Adder4bits_TB - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder4_TB is
--  Port ( );
end Adder4_TB;

architecture Behavioral of Adder4_TB is
  signal x: std_logic_vector(3 downto 0);
 signal  y:  std_logic_vector(3 downto 0);
  signal tin: std_logic;
 signal s: std_logic_vector(3 downto 0);
 signal tout: std_logic;

begin

DUT: entity WORK.Adder4 port map(
x=> x,
y=> y,
tin=> tin,
s => s,
tout=>tout
);

gen_test: process
variable Var_x:std_logic_vector(3 downto 0);
variable Var_y:std_logic_vector(3 downto 0);
variable TrIn:std_logic;

begin

TrIn:='0';
Var_x:="0000";
for i in 0 to 15 loop
    Var_y :="0000";
    for j in 0 to 15 loop
    x<= Var_x;
    y<= Var_y;
    tin <= TrIn;
    wait for 10ns;
    Var_y := Var_y + 1;
    end loop;
    Var_x:=Var_x+1;
end loop;
end process;


end Behavioral;