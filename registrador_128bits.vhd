----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.06.2016 16:50:13
-- Design Name: 
-- Module Name: registrador_128bits - Behavioral
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

entity registrador_128bits is
    Port ( canIDoSomething : in STD_LOGIC;
           pegarNovaSenha : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (127 downto 0);
           S : out STD_LOGIC_VECTOR (127 downto 0));
end registrador_128bits;

architecture Behavioral of registrador_128bits is

    signal s_wire : std_logic_vector (127 downto 0) := "00000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

begin

    process(canIDoSomething, A, pegarNovaSenha) begin
        if canIDoSomething = '1' and pegarNovaSenha = '1' then
            s_wire <= A;
        else
        end if;
    end process;
    
    S <= s_wire;
end Behavioral;
