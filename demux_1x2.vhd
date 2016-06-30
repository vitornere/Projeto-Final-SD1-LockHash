----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 16:37:37
-- Design Name: 
-- Module Name: demux_1x2 - Demux1x2
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

entity demux_1x2 is
    Port ( A : in STD_LOGIC;
           Sel : in STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC);
end demux_1x2;

architecture Demux1x2 of demux_1x2 is

signal s1_wire, s2_wire : std_logic;

begin

    process(Sel, A) begin
        if Sel = '0' then
            s1_wire <= A;
            s2_wire <= '0';
        elsif Sel = '1' then
            s1_wire <= '0';
            s2_wire <= A;
        else
        end if;
    end process;
    
    S1 <= s1_wire;
    S2 <= s2_wire;
end Demux1x2;
