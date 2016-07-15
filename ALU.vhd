library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Cntrl : in  STD_LOGIC_VECTOR (2 downto 0);
           Cout : out  STD_LOGIC;
           Zero : out  STD_LOGIC;
           Overflow : out  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

signal Res : STD_LOGIC_VECTOR (31 downto 0);
signal Sum : STD_LOGIC_VECTOR (32 downto 0);

begin
	process (Res)
	begin
		if Res="00000000000000000000000000000000" then
			Zero<='1';
		else
			Zero<='0';
		end if;
	end process;
	
	process (Cntrl, A, B, Sum)
	begin
		case Cntrl is
			when "000" => 
				Res<=A and B;
			when "001" => 
				Res<=A or B;
			when "010" => 
				Sum<=('0'&A)+('0'&B);
				Res<=Sum(31 downto 0);
				Overflow<=Sum(32);
				Cout<=Sum(32);
			when "011" => 
				Res<=A;
			when "110" => 
				Res<=A-B;
			when "111" => --"111" set on less than
				Res(31 downto 1)<="0000000000000000000000000000000";
				if unsigned(A)<unsigned(B) then 
					Res(0)<='1';
				else
					Res(0)<='0';
				end if;
			when others => Res<="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		end case;
	end process;
	Result<=Res;
end Behavioral;

