library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity ShiftLeft2 is
    Port ( entrada : in  STD_LOGIC_VECTOR (25 downto 0);
           salida : out  STD_LOGIC_VECTOR (27 downto 0));
end ShiftLeft2;

architecture Behavioral of ShiftLeft2 is
begin
	salida<=entrada&"00";

end Behavioral;

