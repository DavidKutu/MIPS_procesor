library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ProgCounter is
	PORT(	D :IN std_logic_vector(31 downto 0);
			Q :OUT std_logic_vector(31 downto 0);
			CLK :IN std_logic;
			reset :IN std_logic);
end ProgCounter;

architecture Behavioral of ProgCounter is
begin
	process (CLK, reset, D)
	begin
		if rising_edge(CLK) then
			if reset='1' then
				Q<="00000000000000000000000000000000";
			else
				Q<=D;
			end if;
		end if;
	end process;
end Behavioral;

