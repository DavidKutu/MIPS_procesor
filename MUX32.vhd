library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32 is
    Port ( 	IN0 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN1 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN2 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN3 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN4 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN5 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN6 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN7 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN8 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN9 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN10 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN11 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN12 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN13 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN14 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN15 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN16 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN17 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN18 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN19 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN20 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN21 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN22 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN23 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN24 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN25 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN26 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN27 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN28 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN29 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN30 : in STD_LOGIC_VECTOR (31 downto 0);
				 IN31 : in STD_LOGIC_VECTOR (31 downto 0);
				ReadReg : in  STD_LOGIC_VECTOR (4 downto 0);
				ReadData : out STD_LOGIC_VECTOR (31 downto 0));
end MUX32;

architecture Behavioral of MUX32 is
begin
	process(ReadReg, IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8, IN9, IN10, IN11, IN12, IN13, 
	IN14, IN15, IN16, IN17, IN18, IN19, IN20, IN21, IN22, IN23, IN24, IN25, IN26, IN27, IN28, IN29, IN30,IN31)
	begin
		case ReadReg is		--estos casos asignan a la salida el registro
				when "00000" => ReadData <= IN0;--pedido de memoria
				when "00001" => ReadData <= IN1;
				when "00010" => ReadData <= IN2;
				when "00011" => ReadData <= IN3;
				when "00100" => ReadData <= IN4;
				when "00101" => ReadData <= IN5;
				when "00110" => ReadData <= IN6;
				when "00111" => ReadData <= IN7;
				when "01000" => ReadData <= IN8;
				when "01001" => ReadData <= IN9;
				when "01010" => ReadData <= IN10;
				when "01011" => ReadData <= IN11;
				when "01100" => ReadData <= IN12;
				when "01101" => ReadData <= IN13;
				when "01110" => ReadData <= IN14;
				when "01111" => ReadData <= IN15;
				when "10000" => ReadData <= IN16;
				when "10001" => ReadData <= IN17;
				when "10010" => ReadData <= IN18;
				when "10011" => ReadData <= IN19;
				when "10100" => ReadData <= IN20;
				when "10101" => ReadData <= IN21;
				when "10110" => ReadData <= IN22;
				when "10111" => ReadData <= IN23;
				when "11000" => ReadData <= IN24;
				when "11001" => ReadData <= IN25;
				when "11010" => ReadData <= IN26;
				when "11011" => ReadData <= IN27;
				when "11100" => ReadData <= IN28;
				when "11101" => ReadData <= IN29;
				when "11110" => ReadData <= IN30;
				when "11111" => ReadData <= IN31;
				when others => ReadData <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
			end case;
	end process;
end Behavioral;

