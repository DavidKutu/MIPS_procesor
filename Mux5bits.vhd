library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Mux5bits is
    Port ( A : in  STD_LOGIC_VECTOR (4 downto 0);
           B : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux5bits;

architecture Behavioral of Mux5bits is
begin
	process (A, B, sel) is
	begin
		if sel='0' then
			Result<=A;
		else
			Result<=B;
		end if;
	end process;
end Behavioral;

