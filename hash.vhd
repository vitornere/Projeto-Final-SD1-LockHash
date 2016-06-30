----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 22:33:12
-- Design Name: 
-- Module Name: hash - Behavioral
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

entity hash is
    Port ( hasDone : in STD_LOGIC;
           canIDoSomething : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (31 downto 0);
           S : out STD_LOGIC_VECTOR (127 downto 0));
end hash;

architecture Behavioral of hash is

signal s_wire : std_logic_vector (127 downto 0);

begin

    process(A, canIDoSomething, hasDone) begin
        if rising_edge(hasDone) then
            s_wire(127 downto 0) <= (others => '0');
        else
        end if;
        
        if canIDoSomething = '1' then
            s_wire(127 downto 96) <= A;
            s_wire(95 downto 0) <= (others => '0');
        else
        end if;
    end process;

S <= s_wire;
end Behavioral;
