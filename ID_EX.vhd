library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ID_EX is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  RegDstIN : in  STD_LOGIC;
           BranchIN : in  STD_LOGIC;
           JumpIN : in  STD_LOGIC;
           MemReadIN : in  STD_LOGIC;
           MemtoRegIN : in  STD_LOGIC;
           ALUOpIN : in  STD_LOGIC_VECTOR (1 downto 0);
           MemWriteIN : in  STD_LOGIC;
           ALUSrcIN : in  STD_LOGIC;
           RegWriteIN : in  STD_LOGIC;
			  RegDstOUT : out  STD_LOGIC;
           BranchOUT : out  STD_LOGIC;
           JumpOUT : out  STD_LOGIC;
           MemReadOUT : out  STD_LOGIC;
           MemtoRegOUT : out  STD_LOGIC;
           ALUOpOUT : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWriteOUT : out  STD_LOGIC;
           ALUSrcOUT : out  STD_LOGIC;
           RegWriteOUT : out  STD_LOGIC;
			  ReadData1IN : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2IN : in  STD_LOGIC_VECTOR (31 downto 0);
			  ReadData1OUT : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2OUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  SignExtendOutIN : in  STD_LOGIC_VECTOR (31 downto 0);
			  SignExtendOutOUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  InstMemOut20_16IN : in STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut20_16OUT : out STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut15_11IN : in STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut15_11OUT : out STD_LOGIC_VECTOR (4 downto 0);
			  Jump_dirIN : in STD_LOGIC_VECTOR (25 downto 0);
			  Jump_dirOUT : out STD_LOGIC_VECTOR (25 downto 0));
end ID_EX;

architecture Behavioral of ID_EX is
begin
process (clk, reset)
begin
	if rising_edge(clk) then
		if reset='1' then
				RegDstOUT <= '0';
				BranchOUT <= '0';
				JumpOUT <= '0';
				MemReadOUT <= '0';
				MemtoRegOUT <= '0';
				ALUOpOUT <= "00";
				MemWriteOUT <= '0';
				ALUSrcOUT <= '0';
				RegWriteOUT <= '0';
				ReadData1OUT <= "00000000000000000000000000000000";
				ReadData2OUT <= "00000000000000000000000000000000";
				SignExtendOutOUT <= "00000000000000000000000000000000";
				InstMemOut20_16OUT <= "00000";
				InstMemOut15_11OUT <= "00000";
				Jump_dirOUT <= "00000000000000000000000000";
		else
				RegDstOUT <= RegDstIN;
				BranchOUT <= BranchIN;
				JumpOUT <= JumpIN;
				MemReadOUT <= MemReadIN;
				MemtoRegOUT <= MemtoRegIN;
				ALUOpOUT <= ALUOpIN;
				MemWriteOUT <= MemWriteIN;
				ALUSrcOUT <= ALUSrcIN;
				RegWriteOUT <= RegWriteIN;
				ReadData1OUT <= ReadData1IN;
				ReadData2OUT <= ReadData2IN;
				SignExtendOutOUT <= SignExtendOutIN;
				InstMemOut20_16OUT <= InstMemOut20_16IN;
				InstMemOut15_11OUT <= InstMemOut15_11IN;
				Jump_dirOUT <= Jump_dirIN;
		end if;
	end if;
end process;
end Behavioral;