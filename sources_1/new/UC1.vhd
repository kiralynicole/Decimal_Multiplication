----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 02:59:50 PM
-- Design Name: 
-- Module Name: UC1 - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC1 is
  Port (
  clk:in std_logic;
  rst:in std_logic;
  start:in std_logic;
  q0:in std_logic_vector(3 downto 0); --ultima cifra a inmultitorului/nr de adunari
  loadB:out std_logic;
  rstA:out std_logic;
  rstB:out std_logic;
  rstQ:out std_logic;
  loadA:out std_logic;
  loadQ:out std_Logic;
  shrAQ:out std_logic;
  term:out std_logic
   );
end UC1;

architecture Behavioral of UC1 is
type stare is (idle,init,initC,testCifra,opProdPartial,sft,testC,stop);
signal state:stare:=idle;
signal digit_cnt:std_logic_vector(3 downto 0):="0000";
signal step_cnt:std_logic_vector(2 downto 0):="000";
begin

stari: process(clk)
begin
if(rst = '1') then
    state<=idle;
elsif (rising_edge(clk)) then
    case state is 
        when idle=>if(start = '1') then    
                    state <= init;
                   else state<=idle;
                   end if;
                   step_cnt<="100"; --4 cifre bcd
        when init=>state<=initC;
        when initC=>digit_cnt<= q0;
                    state<=testCifra;
        when testCifra => if (digit_cnt > 0) then 
                            state <= opProdPartial;
                            digit_cnt <= digit_cnt - 1;
                            else
                               state <= sft;
                               step_cnt <= step_cnt - 1;
                               digit_cnt <= q0;
                           end if;
        when opProdPartial => state <= testCifra;
        when sft => state <= testC;                       
        when testC => if (step_cnt > 0) then
                        state <= initc;
                      else
                        state <= stop;
                      end if;
        when stop => state<= stop;              
                   
     end case; 
end if;                   
end process stari;

iesiri: process(state)
begin
case state is
when idle => loadA <= '0';
             loadB <= '0';
             loadQ<='0';
             rstA <='1';
             rstB <= '1';
             rstQ <= '1';
             shrAQ <= '0';
             term <= '0';
when init => loadA <= '1';
             loadB <= '1';
             loadQ<='1';
             rstA <='0';
             rstB <= '0';
             rstQ <= '0';
             shrAQ <= '0';
             term <= '0';
              
when initC => loadA <= '0';
              loadB <= '0';
              loadQ<='0';
              rstA <='0';
              rstB <= '0';
              rstQ <= '0';
              shrAQ <= '0';
              term <= '0'; 
              
when testCifra =>  loadA <= '0';
                   loadB <= '0';
                   loadQ<='0';
                   rstA <='0';
                   rstB <= '0';
                   rstQ <= '0';
                   shrAQ <= '0';
                   term <= '0';
                   
when opProdPartial=>loadA <= '1';
                    loadB <= '0';
                    loadQ<='0';
                    rstA <='0';
                    rstB <= '0';
                    rstQ <= '0';
                    shrAQ <= '0';
                    term <= '0';
                    
when sft=>   loadA <= '0';
             loadB <= '0';
             loadQ<='0';
             rstA <='0';
             rstB <= '0';
             rstQ <= '0';
             shrAQ <= '1';
             term <= '0';  
              
when testC=> loadA <= '0';
             loadB <= '0';
             loadQ<='0';
             rstA <='0';
             rstB <= '0';
             rstQ <= '0';
             shrAQ <= '0';
             term <= '0';  
              
when stop => loadA <= '0';
             loadB <= '0';
             loadQ<='0';
             rstA <='0';
             rstB <= '0';
             rstQ <= '0';
             shrAQ <= '0';
             term <= '1';                                                       
                      

end case;             
 
end process iesiri;


end Behavioral;
