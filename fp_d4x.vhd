----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 17:46:19
-- Design Name: 
-- Module Name: fp_d4x - FlipflopD4x
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

entity fp_d4x is
    Port ( hasDone : in STD_LOGIC;
           canIDoSomething : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end fp_d4x;

architecture FlipflopD4x of fp_d4x is

signal q_wire : std_logic_vector (3 downto 0);

begin

    process(D, clk, canIDoSomething, hasDone) begin
        if rising_edge(hasDone) then
            q_wire(3 downto 0) <= (others => '0');
        else
        end if;
        
        if rising_edge(clk) and canIDoSomething = '1' then
            q_wire <= D;
        else
        end if;
    end process;
        
    Q <= q_wire;
end FlipflopD4x;
