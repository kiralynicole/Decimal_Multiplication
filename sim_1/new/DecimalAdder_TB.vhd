----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/01/2024 08:51:17 PM
-- Design Name: 
-- Module Name: DecimalAdder_TB - Behavioral
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

entity DecimalAdder_TB is
--  Port ( );
end DecimalAdder_TB;

architecture Behavioral of DecimalAdder_TB is
component DecimalAdder is
  Port (
  x: in std_logic_vector(3 downto 0);
  y: in std_logic_vector(3 downto 0);
  tin: in std_logic;
  s:out std_logic_vector(3 downto 0);
  tout:out std_logic
  );
end component DecimalAdder;

 signal x:  std_logic_vector(3 downto 0);
 signal y:  std_logic_vector(3 downto 0);
 signal tin:  std_logic;
 signal s: std_logic_vector(3 downto 0);
 signal tout: std_logic;
begin

DUT: entity WORK.DecimalAdder port map(
x=>x,
y=>y,
tin=>tin,
s=>s,
tout=>tout
);

gen_vect_test: process
variable xVar: STD_LOGIC_VECTOR(3 downto 0);
variable yVar: STD_LOGIC_VECTOR(3 downto 0);
variable TrIn: STD_LOGIC;
begin
    xVar:="0000";
    TrIn:='0';
    for i in 0 to 9 loop
        yVar:="0000";
        for j in 0 to 9 loop
            x <= xVar;
            y <= yVar;
            tin <= TrIn;
            wait for 10 ns;
            yVar:=yVar + 1;
        end loop;
        xVar:=xVar + 1;
    end loop;
end process;

end Behavioral;
