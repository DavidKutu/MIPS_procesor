library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity EX_MEM is
    Port ( 	clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				JumpIN : in std_logic;
				RegWriteIN : in std_logic;
				MemtoRegIN : in std_logic;
				BranchIN : in std_logic;
				MemReadIN : in std_logic;
				MemWriteIN : in std_logic;
				SignExtendOutIN : in std_logic_vector(31 downto 0);
				ZeroIN : in std_logic;
				ALUResIN : in std_logic_vector(31 downto 0);
				ReadData2IN : in std_logic_vector(31 downto 0);
				Mux5bitsIN : in std_logic_vector(4 downto 0);
				JumpOUT : out std_logic;
				RegWriteOUT : out std_logic;
				MemtoRegOUT : out std_logic;
				BranchOUT : out std_logic;
				MemReadOUT : out std_logic;
				MemWriteOUT : out std_logic;
				SignExtendOutOUT : out std_logic_vector(31 downto 0);
				ZeroOUT : out std_logic;
				ALUResOUT : out std_logic_vector(31 downto 0);
				ReadData2OUT : out std_logic_vector(31 downto 0);
				Mux5bitsOUT : out std_logic_vector(4 downto 0);
				Jump_dirIN : in STD_LOGIC_VECTOR (25 downto 0);
			   Jump_dirOUT : out STD_LOGIC_VECTOR (25 downto 0));
end EX_MEM;

architecture Behavioral of EX_MEM is
begin
process (clk, reset)
begin
	if rising_edge(clk) then
		if reset='1' then
				JumpOUT <= '0';
				RegWriteOUT <= '0';
				MemtoRegOUT <= '0';
				BranchOUT <= '0';
				MemReadOUT <= '0';
				MemWriteOUT <= '0';
				SignExtendOutOUT <= "00000000000000000000000000000000";
				ZeroOUT <= '0';
				ALUResOUT <= "00000000000000000000000000000000";
				ReadData2OUT <= "00000000000000000000000000000000";
				Mux5bitsOUT <= "00000";
				Jump_dirOUT <= "00000000000000000000000000";
		else
				JumpOUT <= JumpIN;
				RegWriteOUT <= RegWriteIN;
				MemtoRegOUT <= MemtoRegIN;
				BranchOUT <= BranchIN;
				MemReadOUT <= MemReadIN;
				MemWriteOUT <= MemWriteIN;
				SignExtendOutOUT <= SignExtendOutIN;
				ZeroOUT <= ZeroIN;
				ALUResOUT <= ALUResIN;
				ReadData2OUT <= ReadData2IN;
				Mux5bitsOUT <= Mux5bitsIN;
				Jump_dirOUT <= Jump_dirIN;
		end if;
	end if;
end process;
end Behavioral;

