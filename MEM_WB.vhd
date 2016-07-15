library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity MEM_WB is
    Port ( 	clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				RegWriteIN : in std_logic;
				MemtoRegIN : in std_logic;
				ReadDataIN : in std_logic_vector(31 downto 0);
				ALUResIN : in std_logic_vector(31 downto 0);
				Mux5bitsIN : in std_logic_vector(4 downto 0);
				RegWriteOUT : out std_logic;
				MemtoRegOUT : out std_logic;
				ReadDataOUT : out std_logic_vector(31 downto 0);
				ALUResOUT : out std_logic_vector(31 downto 0);
				Mux5bitsOUT : out std_logic_vector(4 downto 0));
end MEM_WB;

architecture Behavioral of MEM_WB is
begin
process (clk, reset)
begin
	if rising_edge(clk) then
		if reset='1' then
				RegWriteOUT <= '0';
				MemtoRegOUT <= '0';
				ReadDataOUT <= "00000000000000000000000000000000";
				ALUResOUT <= "00000000000000000000000000000000";
				Mux5bitsOUT <= "00000";
		else
				RegWriteOUT <= RegWriteIN;
				MemtoRegOUT <= MemtoRegIN;
				ReadDataOUT <= ReadDataIN;
				ALUResOUT <= ALUResIN;
				Mux5bitsOUT <= Mux5bitsIN;
		end if;
	end if;
end process;
end Behavioral;

