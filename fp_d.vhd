----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 16:31:51
-- Design Name: 
-- Module Name: fp_d - FlipflopD
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

entity fp_d is
    Port ( canIDoSomething : in STD_LOGIC;
           D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end fp_d;

architecture FlipflopD of fp_d is

signal q_wire : std_logic;

begin

    process(D, clk, canIDoSomething) begin
        if rising_edge(clk) and canIDoSomething = '1' then
            q_wire <= D;
        else
        end if;
    end process;
        
    Q <= q_wire;
end FlipflopD;
