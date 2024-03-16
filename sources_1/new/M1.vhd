----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2023 03:53:45 PM
-- Design Name: 
-- Module Name: M1 - Behavioral
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

entity M1 is
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
end M1;

architecture Behavioral of M1 is
signal loadB, loadA,loadQ:std_logic;
signal rstA,rstB,rstQ:std_logic;
signal outB:std_logic_vector(15 downto 0):=x"0000";
signal D_ac:std_logic_vector(19 downto 0):="00000000000000000000";
signal shrAQ:std_logic;
signal SumOut:std_logic_vector(19 downto 0);
signal SumTout:std_logic;
signal xAux:std_logic_vector(19 downto 0);
signal AccOut:std_logic_vector(19 downto 0);
signal Qout:std_logic_vector (15 downto 0);
begin

xAux <= "0000" & outB;
sign <= signx xor signy;
D_ac <= SumOut;

regX: entity WORK.bistabilN generic map(n=>16) port map(
D=>x,
CE=>loadB,
clk=>clk,
rst=>rstB,
q=>outB
);

SumZec:entity Work.DecimalAdder20 port map(
x=>xAux,
y=>AccOut,
tin=>'0',
s=>SumOut,
tout=>SumTout
);

Acumulator:entity Work.SRRN generic map(n=>20) port map(
clk=>clk,
D=>D_ac,
SRI=>"0000",
Rst=>rstA,
CE=>shrAQ,
Load=>loadA,
Q=>AccOut
);

Q:entity Work.SRRN generic map (n=>16) port map(
clk=>clk,
D=>Y,
SRI=>AccOut(3 downto 0),
Rst=>rstQ,
CE=>shrAQ,
Load=>loadQ,
Q=>Qout
);

UC:entity Work.UC1 port map (
clk=>clk,
rst=>rst,
start=>start,
q0=>Qout(3 downto 0),
loadB=>loadB,
rstA=>rstA,
rstB=>rstB,
rstQ=>rstQ,
loadA=>loadA,
loadQ=>loadQ,
shrAQ=>shrAQ,
term=>term
);

p<=AccOut(15 downto 0) & Qout(15 downto 0);

end Behavioral;
