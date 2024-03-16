----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 12:20:23 PM
-- Design Name: 
-- Module Name: M1_TB - Behavioral
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

entity M1_TB is
--  Port ( );
end M1_TB;

architecture Behavioral of M1_TB is
component M1 is
  Port ( 
  clk:in std_logic;
  x:in std_logic_vector(15 downto 0);
  y:in std_logic_vector(15 downto 0);
  signx:in std_logic;
  signy: in std_logic;
  rst:in std_logic;
  start:in std_logic;
  term: out std_logic;
  sign:out std_logic;
  p:out std_logic_vector(31 downto 0)
  );
  end component M1;
  
  signal  clk: std_logic:='0';
  signal x: std_logic_vector(15 downto 0);
  signal y: std_logic_vector(15 downto 0);
  signal signx: std_logic:='1';
  signal signy:  std_logic:='1';
  signal rst: std_logic;
  signal start: std_logic;
  signal term:  std_logic;
  signal sign: std_logic;
  signal p: std_logic_vector(31 downto 0):=x"00000000";

begin

DUT:entity WORK.M1 port map (
clk=>clk,
x=>x,
y=>y,
signx=>signx,
signy=>signy,
rst=>rst,
start=>start,
term=>term,
sign=>sign,
p=>p
);

clk<=not clk after 5ns;

process
begin
rst<='1';
wait for 10ns;

start<='1';
rst<='0';
x<=x"9999";
y<=x"9999";
wait for 5000ns;

end process;


end Behavioral;
