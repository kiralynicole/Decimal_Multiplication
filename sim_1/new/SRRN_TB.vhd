----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 11:24:36 AM
-- Design Name: 
-- Module Name: SRRN_TB - Behavioral
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

entity SRRN_TB is
--  Port ( );
end SRRN_TB;

architecture Behavioral of SRRN_TB is
component SRRN is
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
end component SRRN;

 signal clk: std_logic:='0';
 signal D:  std_logic_vector(15 downto 0):=x"0000";
 signal SRI: std_logic_vector(3 downto 0):="0000";
 signal Rst: std_logic;
 signal CE: std_logic:='0';
 signal Load: std_logic:='0';
 signal Q:  std_logic_vector(15 downto 0);
begin

DUT:entity WORK.SRRN generic map (n=>16) port map (
clk=>clk,
D=>D,
SRI=>SRI,
Rst=>Rst,
CE=>CE,
Load=>Load,
Q=>Q
);

clk<=not clk after 5 ns;

process
begin

Rst<='1';
wait for 10 ns;

Rst<='0';
D<=x"2345";
Load<='1';
wait for 10 ns;

Load<='0';
SRI<=x"5";
CE<='1';
wait for 10 ns;

Rst<='1';
wait for 10ns;

Rst<='0';
SRI<=x"4";
wait for 10ns;

SRI<=x"3";
wait for 10 ns;

SRI<=x"2";
wait for 10 ns;

SRI<=x"1";
wait for 10 ns;


end process;


end Behavioral;
