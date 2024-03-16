----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 07:22:29 PM
-- Design Name: 
-- Module Name: M2 - Behavioral
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

entity M2 is
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
end M2;

architecture Behavioral of M2 is

signal regX:std_logic_vector (19 downto 0);

signal reg1X:std_logic_vector (19 downto 0);
signal reg2X:std_logic_vector (19 downto 0);
signal reg3X:std_logic_vector (19 downto 0);
signal reg4X:std_logic_vector (19 downto 0);
signal reg5X:std_logic_vector (19 downto 0);
signal reg6X:std_logic_vector (19 downto 0);
signal reg7X:std_logic_vector (19 downto 0);
signal reg8X:std_logic_vector (19 downto 0);
signal reg9X:std_logic_vector (19 downto 0);

signal loadA:std_logic;
signal rstA:std_logic;
signal loadQ:std_logic;
signal shrAQ:std_logic;
signal muxInit:std_logic;
signal rstQ:std_logic;
signal loadX:std_logic_vector(8 downto 0);
signal rstX:std_logic_vector(8 downto 0);

signal SumOut:std_logic_vector(19 downto 0);
signal SumTout:std_logic;
signal AccOut:std_logic_vector(19 downto 0);
signal QOut:std_logic_vector(15 downto 0);
signal xAux:std_logic_vector(19 downto 0);
signal compOut:std_logic_vector(9 downto 0);
signal Q0:std_logic_vector(3 downto 0);
signal chooseReg:std_logic_vector(19 downto 0);

begin

sign<=signX xor signY;
regX <= "0000" & x;
Q0<=QOut(3 downto 0);

UC:entity WORK.UC2 port map(
clk=>clk,
rst=>rst,
start=>start,
loadA=>loadA,
rstA=>rstA,
rstQ=>rstQ,
loadQ=>loadQ,
shrAQ=>shrAQ,
muxInit=>muxInit,
loadX=>loadX,
rstX=>rstX,
term=>term
);

Reg1: entity WORK.bistabilN generic map(n=>20) port map (
D=>regX,
CE=>loadX(0),
clk=>clk,
rst=>rstX(0),
q=>reg1X
);

Reg2: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(1),
clk=>clk,
rst=>rstX(1),
q=>reg2X
);

Reg3: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(2),
clk=>clk,
rst=>rstX(2),
q=>reg3X
);

Reg4: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(3),
clk=>clk,
rst=>rstX(3),
q=>reg4X
);

Reg5: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(4),
clk=>clk,
rst=>rstX(4),
q=>reg5X
);

Reg6: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(5),
clk=>clk,
rst=>rstX(5),
q=>reg6X
);

Reg7: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(6),
clk=>clk,
rst=>rstX(6),
q=>reg7X
);

Reg8: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(7),
clk=>clk,
rst=>rstX(7),
q=>reg8X
);

Reg9: entity WORK.bistabilN generic map(n=>20) port map (
D=>SumOut,
CE=>loadX(8),
clk=>clk,
rst=>rstX(8),
q=>reg9X
);

Ac:entity WORK.SRRN generic map (n=>20) port map(
clk=>clk,
D=>SumOut,
SRI=>"0000",
rst=>rstA,
CE=>shrAQ,
load=>loadA,
q=>AccOut
);

regQ: entity WORK.SRRN generic map(n=>16) port map(
clk=>clk,
D=>y,
SRI=>AccOut(3 downto 0),
rst=>rstQ,
CE=>shrAQ,
load=>loadQ,
q=>QOut
);

xAux<=reg1X when muxInit = '1' else chooseReg;
SumZec:entity WORK.DecimalAdder20 port map(
x=>xAux,
y=>AccOut,
tin=>'0',
s=>SumOut,
tout=>SumTout
);

process(Q0)
begin

case Q0 is
    when "0000"=>compOut<="0000000001";
    when "0001"=>compOut<="0000000010";
    when "0010"=>compOut<="0000000100";
    when "0011"=>compOut<="0000001000";
    when "0100"=>compOut<="0000010000";
    when "0101"=>compOut<="0000100000";
    when "0110"=>compOut<="0001000000";
    when "0111"=>compOut<="0010000000";
    when "1000"=>compOut<="0100000000";
    when "1001"=>compOut<="1000000000";
    when others=>compOut<="0000000000";
end case;    
end process;

process(clk,compOut)
begin

case compOut is
    when "0000000001"=>chooseReg<=x"00000";
    when "0000000010"=>chooseReg<=reg1X;
    when "0000000100"=>chooseReg<=reg2X;
    when "0000001000"=>chooseReg<=reg3X;
    when "0000010000"=>chooseReg<=reg4X;
    when "0000100000"=>chooseReg<=reg5X;
    when "0001000000"=>chooseReg<=reg6X;
    when "0010000000"=>chooseReg<=reg7X;
    when "0100000000"=>chooseReg<=reg8X;
    when "1000000000"=>chooseReg<=reg9X;
    when others=>chooseReg<=x"00000";
    
    end case;
end process;

p<=AccOut(15 downto 0) & QOut;
end Behavioral;
