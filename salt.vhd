----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 22:20:57
-- Design Name: 
-- Module Name: salt - Behavioral
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

entity salt is
    Port ( hasDone : in STD_LOGIC;
           canIDoSomething : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           S : out STD_LOGIC_VECTOR (31 downto 0));
end salt;

architecture Behavioral of salt is

signal s_wire : std_logic_vector (31 downto 0);

begin

    process(A, canIDoSomething, hasDone) begin
        if rising_edge(hasDone) then
            s_wire(31 downto 0) <= (others => '0');
        else
        end if;
        
        if canIDoSomething = '1' then
            s_wire <= A & "1000000000000000";
        else
        end if;
    end process;

S <= s_wire;
end Behavioral;
