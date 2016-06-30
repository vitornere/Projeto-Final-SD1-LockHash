----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.06.2016 01:32:55
-- Design Name: 
-- Module Name: comparador_128bits - Behavioral
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

entity comparador_128bits is
    Port ( canIDoSomething : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (127 downto 0);
           B : in STD_LOGIC_VECTOR (127 downto 0);
           S : out STD_LOGIC);
end comparador_128bits;

architecture Behavioral of comparador_128bits is

    signal s_wire : std_logic;

begin

    process(canIDoSomething, A) begin
        if canIDoSomething = '1' then
            if A = B then
                s_wire <= '0';
            else
                s_wire <= '0';
            end if;
        else
            s_wire <= '0';
        end if;
    end process;
    
    S <= s_wire;
end Behavioral;
