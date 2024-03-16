----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/09/2024 10:02:21 AM
-- Design Name: 
-- Module Name: mainUC - Behavioral
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

entity mainUC is
  Port (
  error:in std_logic;
  clk:in std_logic;
  rst:in std_logic;
  step:in std_logic;
  opTerm:in std_logic;
  chooseState:out std_logic_vector(7 downto 0)
   );
end mainUC;

architecture Behavioral of mainUC is
type stare is(idle, selMet, intrSignX, intrSignY, intrX,intrY,calc,stop);
signal state:stare:=idle;
begin

process(clk)
begin

if(rst = '1') then
    state<=idle;
else 
if error = '1' then
    state<=stop;
else
if(rising_edge(clk)) then
    case state is
    when idle=>
                if (step = '1') then
                    state<=selMet;
                else 
                    state<=idle;
                end if;
                
    when selMet=>
                if (step = '1') then
                    state<=intrSignX;
                else                        
                    state<=selMet;
                end if;
    when intrSignX=>
                if(step = '1') then
                    state<=intrX;
                else
                    state<=intrSignX;
                end if;
    when intrX=>
                if(step = '1') then
                    state<=intrSignY;
                else
                    state<=intrX;
                end if;
    when intrSignY=>
                if (step = '1') then
                    state<=intrY;
                else
                    state<=intrSignY;
                end if;
    when intrY=>    
                if(step = '1') then
                    state<=calc;
                else
                    state<=intrY;
                end if;
   when calc=>
                if(opTerm = '1') then
                    state<=stop;
                else
                    state<=calc;
                end if;
  when others=>   state<=stop;
  end case;
  end if;
  end if;
  end if;
                
end process;

process(state)
begin

case state is 
    when idle=>chooseState<="10000000";
    when selMet=>chooseState<="01000000";
    when intrSignX=>chooseState<="00100000";
    when intrX=>chooseState<="00010000";
    when intrSignY=>chooseState<="00001000";
    when intrY=>chooseState<="00000100";
    when calc=>chooseState<="00000010";
    when stop=>chooseState<="00000001";  
    when others=>chooseState <= "11111111";
end case; 

end process;

end Behavioral;
