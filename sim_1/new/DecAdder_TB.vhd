----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2024 06:05:42 PM
-- Design Name: 
-- Module Name: DecAdder_TB - Behavioral
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

entity DecAdder_TB is
--  Port ( );
end DecAdder_TB;

architecture Behavioral of DecAdder_TB is
component DecAdder is
  Port (
  x: in std_logic_vector(3 downto 0);
  y: in std_logic_vector(3 downto 0);
  tin: in std_logic;
  s:out std_logic_vector(3 downto 0);
  tout:out std_logic
  );
end component DecAdder;

signal x: std_logic_vector(3 downto 0);
signal  y: std_logic_vector(3 downto 0);
signal  tin: std_logic;
signal  s:  std_logic_vector(3 downto 0);
signal  tout:  std_logic;

begin

DUT:entity WORK.DecAdder port map(
x=>x,
y=>y,
tin=>tin,
s=>s,
tout=>tout
);

process
variable varX:std_logic_vector(3 downto 0);
variable varY:std_logic_vector(3 downto 0);
variable trIn:std_logic;
begin
    varX:="0000";
    trIn:='0';
    for i in 0 to 9 loop
        varY:="0000";
        for j in 0 to 9 loop
            x<=varX;
            y<=varY;
            tin <= trIn;
            wait for 10ns;
            varY:=varY+1;
        end loop;
        varX:=varX+1;
    end loop;
end process;            
    

end Behavioral;
