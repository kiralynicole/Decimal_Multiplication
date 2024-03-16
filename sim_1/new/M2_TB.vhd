----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2024 10:32:07 AM
-- Design Name: 
-- Module Name: M2_TB - Behavioral
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

entity M2_TB is
--  Port ( );
end M2_TB;

architecture Behavioral of M2_TB is
component M2 is
  Port ( 
  clk:in std_logic;
  signX:in std_logic;
  x:in std_logic_vector(15 downto 0);
  signY:in std_logic;
  y:in std_logic_vector(15 downto 0);
  rst:in std_logic;
  start:in std_logic;
  p:out std_logic_vector(31 downto 0);
  sign:out std_logic;
  term:out std_logic
  );
end component M2;

signal  clk: std_logic:='0';
signal  signX: std_logic;
signal  x: std_logic_vector(15 downto 0);
signal  signY: std_logic;
signal  y: std_logic_vector(15 downto 0);
signal  rst: std_logic;
signal  start: std_logic;
signal  p: std_logic_vector(31 downto 0);
signal  sign: std_logic;
signal  term: std_logic;

begin

clk<=not clk after 5ns;

DUT:entity WORK.M2 port map(
clk=>clk,
signX=>signX,
x=>x,
signY=>signY,
y=>y,
rst=>rst,
start=>start,
p=>p,
sign=>sign,
term=>term
);

process
begin

rst<='1';
wait for 10ns;

rst<='0';
start<='1';
x<=x"0099";
y<=x"0012";
wait for 5000ns;

end process;

end Behavioral;
