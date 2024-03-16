----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2024 09:17:19 PM
-- Design Name: 
-- Module Name: bistN_TB - Behavioral
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

entity bistN_TB is
--  Port ( );
end bistN_TB;

architecture Behavioral of bistN_TB is
component bistabilN is
generic(n:integer);
 Port (
 D:in std_logic_vector(n-1 downto 0);
 CE: in std_logic;
 clk:in std_logic;
 rst:in std_logic;
 q:out std_logic_vector(n-1 downto 0)
  );
end component bistabilN;

signal D: std_logic_vector(15 downto 0);
signal CE:  std_logic:='1';
signal clk: std_logic:='0';
signal rst: std_logic;
signal q: std_logic_vector(15 downto 0);
signal CLK_PERIOD:TIME:=10ns;
begin

clk<=not clk after (CLK_PERIOD/2);

DUT:entity WORK.bistabilN generic map(n=>16) port map(
D=>D,
CE=>CE,
clk=>clk,
rst=>rst,
q=>q
);


process
begin
rst<='1';
wait for 10 ns;

rst<='0';
wait for 5 ns;

D<=x"1234";
wait for 5 ns;

CE<='0';
D<=x"9876";
wait for 5 ns;

CE<='1';
wait for 5 ns;
end process;


end Behavioral;
