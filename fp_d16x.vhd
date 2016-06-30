----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 18:58:48
-- Design Name: 
-- Module Name: fp_d16x - Behavioral
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

entity fp_d16x is
    Port ( hasDone : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end fp_d16x;

architecture FlipFlopD16x of fp_d16x is

signal q_wire : std_logic_vector (15 downto 0) := "0000000000000000";

begin

    process(D, clk, hasDone) begin
        if rising_edge(hasDone) then
            q_wire(15 downto 0) <= (others => '0');
        else
        end if;
        
        if rising_edge(clk) then
            q_wire <= D;
        else
        end if;
    end process;
        
    Q <= q_wire;
end FlipFlopD16x;
