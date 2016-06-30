----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.06.2016 17:38:03
-- Design Name: 
-- Module Name: fp_d128x - Behavioral
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

entity fp_d128x is
    Port ( hasDone : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (127 downto 0));
end fp_d128x;

architecture Behavioral of fp_d128x is

signal q_wire : std_logic_vector (127 downto 0);

begin

    process(clk, hasDone) begin
        if rising_edge(hasDone) then
            q_wire(127 downto 0) <= (others => '0');
        else
        end if;
        
        if rising_edge(clk) then
            q_wire <= D;
        else
        end if;
    end process;
        
    Q <= q_wire;
end Behavioral;
