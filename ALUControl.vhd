library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUControl is
    Port ( Instruction : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Cntrl : out  STD_LOGIC_VECTOR (2 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is
begin
	process(ALUOp, Instruction)
	begin
		case ALUOp is
			when "00" => Cntrl <= "010";					--forza una suma
			when "01" => Cntrl <= "110";					--forza una resta
			when "10" =>										--checa la instruccion
				case Instruction is
					when "100000" => Cntrl <= "010";		--suma
					when "100010" => Cntrl <= "110";		--resta
					when "100100" => Cntrl <= "000";		--and
					when "100101" => Cntrl <= "001";		--or
					when "101010" => Cntrl <= "111";		--slt
					when others => Cntrl <= "XXX";
				end case;
			when others => Cntrl <="XXX";
		end case;
	end process;
end Behavioral;