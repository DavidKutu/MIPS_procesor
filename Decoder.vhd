library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
    Port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           RegWrite : in  STD_LOGIC;
           EN : out  STD_LOGIC_VECTOR (4 downto 0));
end Decoder;

architecture Behavioral of Decoder is
begin
	process(RegWrite, WriteReg)
	begin
		if RegWrite='1' then --si el enable se activa, mandamos
			EN<=WriteReg;		--la direccion a la mamoria
		end if;
	end process;
end Behavioral;

