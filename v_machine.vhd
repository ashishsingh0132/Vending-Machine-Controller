----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 04:47:36 PM
-- Design Name: 
-- Module Name: vm - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity v_machine is
    Port ( rst : in STD_LOGIC;
           clk : in STD_LOGIC;
           n_in : in STD_LOGIC;
           d_in : in STD_LOGIC;
           q_in : in STD_LOGIC;
           candy_out : out STD_LOGIC;
           n_out: out std_logic;
           d_out: out std_logic);
           
end v_machine;

 architecture Behavioral of v_machine is
type state is (s0,s5,s10,s15,s20,s25,s30,s35,s40,s45);
signal p_state,n_state:state;

begin
process(rst,clk)
begin
if (rst='1') then
p_state<=s0;
elsif(clk'event and clk='1')then
p_state<=n_state;
end if;
end process;
process(p_state,n_in,d_in,q_in)
begin
case p_state is

when s0=>
candy_out<='0';
n_out<='0';
d_out<='0';
if (n_in='1')then
n_state<=s5;
elsif(d_in='1')then
n_state<=s10;
elsif(q_in='1')then
n_state<=s25;

else n_state<=p_state;
end if;

when s5=>
candy_out<='0';
n_out<='0';
d_out<='0';
if (n_in='1')then
n_state<=s10;
elsif(d_in='1')then
n_state<=s15;
elsif(q_in='1')then
n_state<=s30;
else n_state<=p_state;
end if;

when s10=>
candy_out<='0';
n_out<='0';
d_out<='0';
if (n_in='1')then
n_state<=s15;
elsif(d_in='1')then
n_state<=s20;
elsif(q_in='1')then
n_state<=s35;
else n_state<=p_state;
end if;

when s15=>
candy_out<='0';
n_out<='0';
d_out<='0';
if (n_in='1')then
n_state<=s20;
elsif(d_in='1')then
n_state<=s25;
elsif(q_in='1')then
n_state<=s40;
else n_state<=p_state;
end if;

when s20=>
candy_out<='0';
n_out<='0';
d_out<='0';
if (n_in='1')then
n_state<=s25;
elsif(d_in='1')then
n_state<=s30;
elsif(q_in='1')then
n_state<=s45;
else n_state<=p_state;
end if;

when s25=>
candy_out<='1';
n_out<='0';
d_out<='0';
n_state<=s0;

when s30=>
candy_out<='1';
n_out<='1';
d_out<='0';
n_state<=s0;

when s35=>
candy_out<='1';
n_out<='0';
d_out<='1';
n_state<=s0;

when s40 =>
candy_out<='0';
n_out<='1';
d_out<='0';
n_state<=s35;

when s45=>
candy_out<='1';
n_out<='0';
d_out<='1';
n_state<=s35;

end case;
end process;
end Behavioral;
