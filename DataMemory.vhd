library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.ALL;

entity DataMemory is
	port(	address : in std_logic_vector (31 downto 0); 
			write_data : in std_logic_vector (31 downto 0); 
			read_enable : in std_logic; -- from address 
			write_enable : in std_logic; 
			read_data : out std_logic_vector (31 downto 0)); 
end DataMemory;

architecture Behavioral of DataMemory is
	subtype word is std_logic_vector(31 downto 0); 
	type mem_array is array(natural range <>) of word; 
	shared variable memory: mem_array(0 to 31) := (others=>(others=>'0'));
begin
	 process(address, write_enable, read_enable, write_data)  
		 --variable word_addr : natural := conv_integer(address(5 downto 0)); -- byte addr/4
	 begin
			if write_enable='1' then
				memory(conv_integer(address(5 downto 0))) := write_data;
			end if;
			if read_enable='1' then 
				read_data <= memory(conv_integer(address(5 downto 0))); 
			else 
				read_data <= "00000000000000000000000000000000"; 
			end if;
	 end process; 
end Behavioral;

