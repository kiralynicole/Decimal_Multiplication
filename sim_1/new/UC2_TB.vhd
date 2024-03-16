----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 06:19:25 PM
-- Design Name: 
-- Module Name: UC2_TB - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC2_TB is
--  Port ( );
end UC2_TB;

architecture Behavioral of UC2_TB is
component UC2 is
  Port (
  clk:in std_logic;
  rst:in std_logic;
  start:in std_logic;
  loadA:out std_logic;
  rstA:out std_logic;
  loadQ:out std_logic;
  rstQ:out std_logic;
  shrAQ:out std_logic;
  loadX:out std_logic_vector(8 downto 0);
  rstX:out std_logic_vector(8 downto 0);
  muxInit:out std_logic;
  term:out std_logic
   );
end component UC2;

signal clk: std_logic:='0';
signal  rst: std_logic;
 signal  start: std_logic;
 signal loadA: std_logic;
 signal rstA: std_logic;
 signal loadQ: std_logic;
 signal rstQ: std_logic;
 signal shrAQ: std_logic;
 signal loadX: std_logic_vector(8 downto 0);
 signal rstX: std_logic_vector(8 downto 0);
 signal muxInit: std_logic;
 signal term: std_logic;
 constant CLK_PERIOD:TIME:=10ns;
begin

clk<=not clk after (CLK_PERIOD/2);

DUT:entity WORK.UC2 port map(
clk=>clk,
rst=>rst,
start=>start,
loadA=>loadA,
rstA=>rstA,
loadQ=>loadQ,
rstQ=>rstQ,
shrAQ=>shrAQ,
loadX=>loadX,
term=>term
);

process
begin

rst<='1';
wait for (CLK_PERIOD/2);

rst<='0';
start<='1';
wait for 50*(CLK_PERIOD/2);

end process;



end Behavioral;
