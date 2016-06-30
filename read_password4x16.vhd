----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 18:25:26
-- Design Name: 
-- Module Name: read_password4x16 - Behavioral
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

entity read_password4x16 is
    Port ( hasDone : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           clkOut : out STD_LOGIC);
end read_password4x16;

architecture ReadPassword of read_password4x16 is

signal s_wire : std_logic_vector (15 downto 0);
signal clkOut_wire : std_logic;

begin

    process(A, clk, hasDone)
        variable CONT : integer range 0 to 4 := 0;
        begin
        
        if rising_edge(hasDone) then
            CONT := 0;
            clkOut_wire <= '0';
            s_wire(15 downto 0) <= (others => '0');
        else
        end if;
        
        if rising_edge(clk) then
            if CONT = 0 then
                CONT := CONT + 1;
                clkOut_wire <= '0';
                s_wire(0) <= A(0);
                s_wire(1) <= A(1);
                s_wire(2) <= A(2);
                s_wire(3) <= A(3);
            elsif CONT = 1 then
                CONT := CONT + 1;
                clkOut_wire <= '0';
                s_wire(4) <= A(0);
                s_wire(5) <= A(1);
                s_wire(6) <= A(2);
                s_wire(7) <= A(3);
            elsif CONT = 2 then
                CONT := CONT + 1;
                clkOut_wire <= '0';
                s_wire(8) <= A(0);
                s_wire(9) <= A(1);
                s_wire(10) <= A(2);
                s_wire(11) <= A(3);
            elsif CONT = 3 then
                CONT := 0;
                clkOut_wire <= '1';
                s_wire(12) <= A(0);
                s_wire(13) <= A(1);
                s_wire(14) <= A(2);
                s_wire(15) <= A(3);
            else
            end if;
        else
        end if;
    end process;

    S <= s_wire;
    clkOut <= clkOut_wire;
end ReadPassword;
