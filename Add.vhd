library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--use IEEE.NUMERIC_STD.ALL;

entity Add is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Res : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture Behavioral of Add is
begin
	Res<=A+B;

end Behavioral;

