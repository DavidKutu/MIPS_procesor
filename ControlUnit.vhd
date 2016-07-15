
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           Jump : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
	process (instruction)
	begin
		case instruction is
			when "000000" => -- tipo R
				RegDst <= '1';
				Branch <= '0';
				Jump <= '0';
				MemRead <= '0';
				MemtoReg <= '0';
				ALUOp <= "10";
				MemWrite <= '0';
				ALUSrc <= '0';
				RegWrite <= '1';
			when "100011" => --load word
				RegDst <= '0';
				Branch <= '0';
				Jump <= '0';
				MemRead <= '1';
				MemtoReg <= '1';
				ALUOp <= "00";
				MemWrite <= '0';
				ALUSrc <= '1';
				RegWrite <= '1';
			when "101011" => --store word
				RegDst <= '0';	--era X
				Branch <= '0';
				Jump <= '0';
				MemRead <= '0';
				MemtoReg <= '0';	--era X
				ALUOp <= "00";
				MemWrite <= '1';
				ALUSrc <= '1';
				RegWrite <= '0';
			when "000100" => -- branch
				RegDst <= '0';		--era X
				Branch <= '1';
				Jump <= '0';
				MemRead <= '0';
				MemtoReg <= '0';	--era X
				ALUOp <= "01";
				MemWrite <= '0';
				ALUSrc <= '0';
				RegWrite <= '0';
			when "000010" => -- jump
				RegDst <= '0'; --era X
				Branch <= '0'; --era X
				Jump <= '1';
				MemRead <= '0';
				MemtoReg <= '0';--era X
				ALUOp <= "00"; --era XX
				MemWrite <= '0';
				ALUSrc <= '0'; --era X
				RegWrite <= '0';
			when others => -- "001000" esto es addi
				RegDst <= '0';
				Branch <= '0';
				Jump <= '0';
				MemRead <= '0';
				MemtoReg <= '0';
				ALUOp <= "00";
				MemWrite <= '0';
				ALUSrc <= '1';
				RegWrite <= '1';
		end case;
	end process;
end Behavioral;