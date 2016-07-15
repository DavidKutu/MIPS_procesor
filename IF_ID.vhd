library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity IF_ID is
    Port (  clk : in std_logic;
				reset : in std_logic;
            InstMemOutIn : in  STD_LOGIC_VECTOR (31 downto 0);
            InstMemOutOut : out  STD_LOGIC_VECTOR (31 downto 0));
end IF_ID;

architecture Behavioral of IF_ID is
begin
process (clk, reset)
begin
	if rising_edge(clk) then
		if reset='1' then
			InstMemOutOut<="00000000000000000000000000000000";
		else
			InstMemOutOut<=InstMemOutIn;
		end if;
	end if;
end process;
end Behavioral;