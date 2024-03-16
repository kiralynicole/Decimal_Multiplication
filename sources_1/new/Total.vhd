----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/09/2024 08:51:50 AM
-- Design Name: 
-- Module Name: Total - Behavioral
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

entity Total is
 Port (
 clk:in std_logic;
 start:in std_logic;
 rst:in std_logic;
 sw:in std_logic_vector(15 downto 0);
 an:out std_logic_vector(7 downto 0);
 cat:out std_logic_vector(7 downto 0);
 term:out std_logic
  );
end Total;

architecture Behavioral of Total is

signal stepStart:std_logic;
signal x: std_logic_vector(15 downto 0);
signal y: std_logic_vector(15 downto 0);
signal signX: std_logic;
signal signY: std_logic;
signal p1: std_logic_vector(31 downto 0);
signal p2: std_logic_vector(31 downto 0);
signal sign1: std_logic;
signal sign2: std_logic;
signal p: std_logic_vector(31 downto 0);
signal data:std_logic_vector(31 downto 0);
signal sign:std_logic;
signal opTerm:std_logic;
signal met:std_logic;
signal start1:std_logic;
signal start2:std_logic;
signal term1:std_logic;
signal term2:std_logic;
signal chooseState:std_logic_vector(7 downto 0);
signal enableMet:std_logic;
signal enableSignX:std_logic;
signal enableSignY:std_logic;
signal enableX:std_logic;
signal enableY:std_logic;
signal error:std_logic :='0';
signal errorX:std_logic:='0';
signal errorY:std_logic:='0';


begin

opTerm<= term1 or term2;

--error
error<= errorX or errorY;
errorX<='1' when x(15 downto 12) > "1101" or x(11 downto 8) > "1001" or x(3 downto 0) > "1001" else '0';
errorY<='1' when y(15 downto 12) > "1101" or y(11 downto 8) > "1001" or y(3 downto 0) > "1001" else '0';


term<=chooseState(0);
sign <= sign1 or sign2;
enableSignX<=chooseState(5) and stepStart;
enableSignY<=chooseState(3) and stepStart;
enableX<=chooseState(4) and stepStart;
enableY<=chooseState(2) and stepStart;
enableMet<=chooseState(6) and stepStart;

deb: entity WORK.Debouncer port map(
clk=>clk,
rst=>rst,
btn=>start,
en=>stepStart
);

UC: entity WORK.mainUC port map(
error=>error,
clk=>clk,
rst=>rst,
step=>stepStart,
opTerm=>opTerm,
chooseState=>chooseState
);

regX:entity WORK.bistabilN generic map (n=>16) port map(
D=> sw,
CE => enableX,
clk=>clk,
rst=>rst,
q=>x
);

regY:entity WORK.bistabilN generic map (n=>16) port map(
D=> sw,
CE => enableY,
clk=>clk,
rst=>rst,
q=>y
);

semnRegX:entity WORK.bistabil  port map(
D=> sw(15),
CE => enableSignX,
clk=>clk,
rst=>rst,
q=>signX
);

semnRegY:entity WORK.bistabil  port map(
D=> sw(15),
CE => enableSignY,
clk=>clk,
rst=>rst,
q=>signY
);

Metoda:entity WORK.bistabil port map(
D=> sw(15),
CE => enableMet,
clk=>clk,
rst=>rst,
q=>met
);

Cir1: entity WORK.M1 port map(
clk=>clk,
  x=>x,
  y=>y,
  signx=>signX,
  signy=>signY,
  rst=>rst,
  start=>start1,
  term=>term1,
  sign=>sign1,
  p=>p1
);

Cir2: entity WORK.M2 port map(
clk=>clk,
  x=>x,
  y=>y,
  signx=>signX,
  signy=>signY,
  rst=>rst,
  start=>start2,
  term=>term2,
  sign=>sign2,
  p=>p2
);


process(clk)
begin
if(rising_edge(clk)) then
    if(chooseState(2) = '1') then
        if(stepStart = '1') then
            case met is 
                when '0'=>start1 <= '1';
                          start2 <='0';
                when '1'=>start2<='1';
                          start1<='0';
                when others=>start1<='0';
                             start2<='0';
           end case;
           end if;
           end if;                 
end if;
end process;

ssd1: entity WORK.SSD port map(
clk=>clk,
  rst=>rst,
  data=>data,
  an=>an,
  cat=>cat
);

p<=p1 when met = '0' else p2 when met = '1' else x"00000000";

process(clk)
begin
if(error = '1') then
    data<=X"EEEEEEEE";
else
if(chooseState(0) = '1') then
    if(sw(0) = '0') then
        data<= p;
    else   
        data<= x & y;
    end if;
else
    case chooseState is
        when "00010000"=>data<=sw&y;
        when "00000100"=>data<=sw&x;
        when others=>data<=x&y;
    end case;
    end if;   
    end if;
end process;

end Behavioral;
