library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Sign_Extend is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin
	process (A)
	begin
		if A(15)='0' then
			B<="0000000000000000"&A;
		else
			B<="1111111111111111"&A;
		end if;
	end process;
end Behavioral;

