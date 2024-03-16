----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2024 07:00:40 PM
-- Design Name: 
-- Module Name: UC1_TB - Behavioral
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

entity UC1_TB is
--  Port ( );
end UC1_TB;

architecture Behavioral of UC1_TB is

component UC1 is
  Port (
  clk:in std_logic;
  rst:in std_logic;
  start:in std_logic;
  q0:in std_logic_vector(3 downto 0); --ultima cifra a inmultitorului/nr de adunari
  loadB:out std_logic;
  rstA:out std_logic;
  rstB:out std_logic;
  rstQ:out std_logic;
  loadA:out std_logic;
  loadQ:out std_Logic;
  shrAQ:out std_logic;
  term:out std_logic
   );
end component UC1;

 signal clk: std_logic:='0';
 signal rst: std_logic;
 signal start: std_logic;
 signal q0: std_logic_vector(3 downto 0); --ultima cifra a inmultitorului/nr de adunari
 signal loadB: std_logic;
 signal rstA: std_logic;
 signal rstB: std_logic;
 signal rstQ: std_logic;
 signal loadA: std_logic;
 signal loadQ: std_Logic;
 signal shrAQ: std_logic;
 signal term: std_logic;
 signal CLK_PERIOD:TIME:=10ns;
begin

DUT: entity WORK.UC1 port map(
clk=>clk,
rst=>rst,
start=>start,
q0=>q0,
loadB=>loadB,
rstA=>rstA,
rstB=>rstB,
rstQ=>rstQ,
loadA=>loadA,
loadQ=>loadQ,
shrAQ=>shrAQ,
term=>term
);

clk<=not clk after (CLK_PERIOD/2);

process
begin
rst<='0';
wait for (CLK_PERIOD/2);

rst<='0';
start<='1';
q0<="0101";
wait for (CLK_PERIOD/2)*12;

end process;


end Behavioral;
