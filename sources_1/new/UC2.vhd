----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/02/2024 02:42:24 PM
-- Design Name: 
-- Module Name: UC2 - Behavioral
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

entity UC2 is
  Port (
  clk:in std_logic;
  rst:in std_logic;
  start:in std_logic;
  loadA:out std_logic;
  rstA:out std_logic;
  loadQ:out std_logic;
  rstQ:out std_logic;
  shrAQ:out std_logic;
  loadX:out std_logic_vector(8 downto 0);
  rstX:out std_logic_vector(8 downto 0);
  muxInit:out std_logic;
  term:out std_logic
   );
end UC2;

architecture Behavioral of UC2 is
type stare is (idle,init,init2X,init3X,init4X,init5X,init6X,init7X,init8X,init9X,add,sft,testC,stop);
signal state:stare:=idle;
signal step_cnt:std_logic_vector(2 downto 0):="000";

begin

stari:process(clk)
begin
    if rst = '1' then
        state<=idle;
    else
        if (rising_edge(clk)) then
            case state is
                when idle=>
                        if start = '1' then
                            state <= init;
                        else 
                            state<=idle;
                        end if;
                        step_cnt<="100"; --4    
                when init=>
                        state<=init2X;
                when init2X=>
                        state<=init3X;
                when init3X=>
                        state<=init4X;
                when init4X=>
                        state<=init5X;
                when init5X=>
                        state<=init6X;
                when init6X=>
                        state<=init7X;
                when init7X=>
                        state<=init8X;
                when init8X=>
                        state<=init9X;
                when init9X=>
                        state<=add;
                when add=>
                        state<=sft;
                when sft=>
                        state<=testC;
                        step_cnt<=step_cnt-1;
                when testC=>
                         if step_cnt > 0 then
                            state<=add;
                         else   
                            state<=stop;
                         end if;
                when others=>
                            state<=stop;  
          end case;
          end if;
          end if;                                                                                                                      
end process;

iesiri: process(state)
begin

case state is
    when idle=>
        loadA<='0';
        rstA<='1';
        loadQ<='0';
        rstQ<='1';
        shrAQ<='0';
        muxInit<='0';
        loadX<="000000001";
        rstX<="111111110";
        term<='0';
        
     when init=>
        loadA<='1';
        rstA<='0';
        loadQ<='1';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000000000";
        rstX<="000000000";
        term<='0';
        
     when init2X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000000010";
        rstX<="000000000";
        term<='0';
        
      when init3X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000000100";
        rstX<="000000000";
        term<='0';
        
       when init4X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000001000";
        rstX<="000000000";
        term<='0';   
        
       when init5X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000010000";
        rstX<="000000000";
        term<='0';
        
       when init6X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="000100000";
        rstX<="000000000";
        term<='0'; 
        
       when init7X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="001000000";
        rstX<="000000000";
        term<='0'; 
        
       when init8X=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="010000000";
        rstX<="000000000";
        term<='0';   
        
       when init9X=>
        loadA<='0';
        rstA<='1';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='1';
        loadX<="100000000";
        rstX<="000000000";
        term<='0';
        
       when add=>
        loadA<='1';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='0';
        loadX<="000000000";
        rstX<="000000000";
        term<='0';
        
       when sft=>
        loadA<='0';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='1';
        muxInit<='0';
        loadX<="000000000";
        rstX<="000000000";
        term<='0'; 
        
       when testC=>
        loadA<='0';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='0';
        loadX<="000000000";
        rstX<="000000000";
        term<='0'; 
       
       when stop=>
        loadA<='0';
        rstA<='0';
        loadQ<='0';
        rstQ<='0';
        shrAQ<='0';
        muxInit<='0';
        loadX<="100000000";
        rstX<="000000000";
        term<='1'; 
        
    end case;    
end process;
end Behavioral;
