library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;

entity DivisorHZ is	--se decalran las variables
	port(	CLK: in std_logic;
			salida: out std_logic:='1');
end DivisorHZ;

architecture Behavioral of DivisorHZ is
	signal cont: integer range 0 to 100000000;
	signal sal2: std_logic:='1';
begin	
	process (CLK)
		begin	
			if rising_edge(CLK) then 	--si se siente un pulso de reloj
				if cont=100000000 then 	--se incrementa en 1 la cuenta
					sal2<=not sal2;		--si se llega a los 100M
					salida<=sal2;			--negamos la salida para
               cont<=0; 				--dar el pulso de 1s
             else 
					cont<=cont+1; 
				end if;
			end if;
	end process;
end Behavioral;