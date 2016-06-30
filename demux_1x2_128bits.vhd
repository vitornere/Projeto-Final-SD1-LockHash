----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 16:46:39
-- Design Name: 
-- Module Name: demux_1x2_128bits - Demux1x2s128bits
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

entity demux_1x2_128bits is
    Port ( hasDone : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (127 downto 0);
           Sel : in STD_LOGIC;
           eUmaNovaSenha : in STD_LOGIC;
           S1 : out STD_LOGIC_VECTOR (127 downto 0);
           S2 : out STD_LOGIC_VECTOR (127 downto 0);
           clkOut : out STD_LOGIC;
           liberarParaGravarSenha : out STD_LOGIC);
end demux_1x2_128bits;

architecture Demux1x2s128bits of demux_1x2_128bits is

signal s1_wire, s2_wire : std_logic_vector (127 downto 0);
signal clkOut_wire : std_logic := '0';
signal liberarParaGravarSenha_wire : std_logic := '0';

begin

        process(Sel, A, hasDone) begin
        if rising_edge(hasDone) then
            s1_wire(127 downto 0) <= (others => '0');
            s2_wire(127 downto 0) <= (others => '0');
            clkOut_wire <= '0';
            liberarParaGravarSenha_wire <= '0';
        else
        end if;
        
        if Sel = '0' then
            s1_wire <= A;
            s2_wire(127 downto 0) <= (others => '0');
            clkOut_wire <= '1';
        elsif Sel = '1' then
            s1_wire(127 downto 0) <= (others => '0');
            s2_wire <= A;
            clkOut_wire <= '1';
            liberarParaGravarSenha_wire <= '1';
        else
        end if;
    end process;
    
    S1 <= s1_wire;
    S2 <= s2_wire;
    clkOut <= clkOut_wire;
    liberarParaGravarSenha <= liberarParaGravarSenha_wire;

end Demux1x2s128bits;
