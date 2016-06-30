----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.06.2016 16:27:54
-- Design Name: 
-- Module Name: lock_and_open_password - Behavioral
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

entity lock_and_open_password is
    Port ( digito : in STD_LOGIC_VECTOR (3 downto 0);
           enter : in STD_LOGIC;
           liberar_trocar : in STD_LOGIC;
           change : in STD_LOGIC; -- Botão Direito
           start : in STD_LOGIC; -- Botão do Meio
           stop : in STD_LOGIC; --  Botão Esquerdo
           start_on_off : out STD_LOGIC;
           aberto_fechado : out STD_LOGIC);
end lock_and_open_password;

architecture Porta of lock_and_open_password is

    component fp_d is
    Port ( canIDoSomething : in STD_LOGIC;
           D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;
    
    component fp_d4x is
    Port ( hasDone : in STD_LOGIC;
           canIDoSomething : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component fp_d16x is
        Port ( hasDone : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (15 downto 0);
               clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component fp_d128x is
        Port ( hasDone : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (127 downto 0);
               clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (127 downto 0));
    end component;
    
    component demux_1x2 is
        Port ( A : in STD_LOGIC;
               Sel : in STD_LOGIC;
               S1 : out STD_LOGIC;
               S2 : out STD_LOGIC);
    end component;
    
    component demux_1x2_128bits is
            Port ( hasDone : in STD_LOGIC;
                   A : in STD_LOGIC_VECTOR (127 downto 0);
                   Sel : in STD_LOGIC;
                   eUmaNovaSenha : in STD_LOGIC;
                   S1 : out STD_LOGIC_VECTOR (127 downto 0);
                   S2 : out STD_LOGIC_VECTOR (127 downto 0);
                   clkOut : out STD_LOGIC;
                   liberarParaGravarSenha : out STD_LOGIC);
    end component;

    component read_password4x16 is
    Port ( hasDone : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0);
           clkOut : out STD_LOGIC);
    end component;
    
    component salt is
        Port ( hasDone : in STD_LOGIC;
               canIDoSomething : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (15 downto 0);
               S : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component hash is
        Port ( hasDone : in STD_LOGIC;
               canIDoSomething : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (31 downto 0);
               S : out STD_LOGIC_VECTOR (127 downto 0));
    end component;
    
    component comparador_128bits is
        Port ( canIDoSomething : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (127 downto 0);
               B : in STD_LOGIC_VECTOR (127 downto 0);
               S : out STD_LOGIC);
    end component;
    
    component registrador_128bits is
        Port ( canIDoSomething : in STD_LOGIC;
               pegarNovaSenha : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (127 downto 0);
               S : out STD_LOGIC_VECTOR (127 downto 0));
    end component;

    signal start_wire : std_logic;
    signal liberar_trocar_wire : std_logic;
    signal liberar_wire : std_logic;
    signal trocar_wire : std_logic;

    signal entradaDigito_wire : std_logic_vector (3 downto 0);
    signal readPassword_wire, inSalt_wire : std_logic_vector (15 downto 0); 
    signal finishedReadPassword_wire : std_logic;
   
    signal salt_wire : std_logic_vector (31 downto 0);
    signal hash_wire : std_logic_vector (127 downto 0);
    
    signal registradorIn_wire, registradorGate_wire, comparadorIn_wire, comparadorGate_wire : std_logic_vector(127 downto 0); 
    signal clkOutDemux_wire, clkOutLiberarHash, hashNovoParaGravaPronto_wire : std_logic;
    signal comparadorOut_wire, pedirNovaSenha_wire, liberarFechadura_wire : std_logic;
    
    signal hasDone_wire : std_logic;
    
    signal ignoring : std_logic_vector (127 downto 0); 
    
    signal registradorOut_wire : std_logic_vector (127 downto 0);
begin

-- Inicia uma operação de liberar ou trocar senha
iniciar_operacao: fp_d port map(start_wire, liberar_trocar, change, liberar_trocar_wire);
--liberar_ou_troca: demux_1x2 port map('1', liberar_trocar, liberar_wire, trocar_wire);

-- Leitura da senha
entrada_digito: fp_d4x port map(hasDone_wire, start_wire, digito, enter, entradaDigito_wire);
reading_password: read_password4x16 port map(hasDone_wire, entradaDigito_wire, enter, readPassword_wire, 
                                             finishedReadPassword_wire);

-- Processo de hashing com salt
wating_to_salting: fp_d16x port map(hasDone_wire, readPassword_wire, finishedReadPassword_wire, inSalt_wire);
salting: salt port map(hasDone_wire, start_wire, inSalt_wire, salt_wire);
hashing: hash port map(hasDone_wire, start_wire, salt_wire, hash_wire);

-- Libera os bits do hash para gravação ou comparação
redicionando_liberar_trocar_hash: demux_1x2_128bits port map(hasDone_wire, hash_wire, liberar_trocar_wire, 
                                                             pedirNovaSenha_wire, registradorGate_wire, comparadorGate_wire, 
                                                             clkOutDemux_wire, hashNovoParaGravaPronto_wire);

-- Comparar HASH
redireciona_somente_quando_liberar: demux_1x2_128bits port map(hasDone_wire, comparadorGate_wire, clkOutDemux_wire, 
                                                               pedirNovaSenha_wire, comparadorIn_wire, ignoring, 
                                                               clkOutLiberarHash);
comparador: comparador_128bits port map(start_wire, comparadorIn_wire, registradorOut_wire, comparadorOut_wire);
redireciona_liberar_trocar: demux_1x2 port map(comparadorOut_wire, liberar_trocar_wire, liberarFechadura_wire, 
                                               pedirNovaSenha_wire);

-- Pega novo HASH
pegar_novo_hash: registrador_128bits port map(start_wire, hashNovoParaGravaPronto_wire and clkOutLiberarHash and pedirNovaSenha_wire, 
                                              registradorGate_wire, registradorOut_wire);

-- Liberar para gravar
liberar_para_gravar: fp_d128x port map(hasDone_wire, registradorGate_wire, clkOutDemux_wire, registradorIn_wire);

    process(start, stop) begin
        if rising_edge(stop) then
            start_wire <= '0';
            hasDone_wire <= '1';
        else
        end if;
        
        if rising_edge(start) then
            start_wire <= '1';
        else
        end if;
    end process;

start_on_off <= start_wire;
aberto_fechado <= liberarFechadura_wire;
end Porta;
