library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.ALL; 

entity InstructionMemory is
	port( addr : in std_logic_vector (31 downto 0); 
			inst : out std_logic_vector (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
		subtype word is std_logic_vector(31 downto 0); 
		type mem_array is array(natural range <>) of word; 
		shared variable memory: mem_array(0 to 31):=(
		b"000000_00000_00000_01000_00000_100000", 	--add r8, r0, r0
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"100011_00000_00001_0000000000000000",		--lw r1, 0x0(r0) 
		b"100011_00000_00010_0000000000000001",		--lw r2, 0x1(r0) 
		b"100011_00000_00011_0000000000000010",		--lw r3, 0x2(r0)
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"000000_00010_00001_00011_00000_100000",		--add r3, r2, r1 
		b"000000_00010_00001_00100_00000_100101",		--or r4, r2, r1 
		b"000000_00010_00001_00101_00000_100010",		--sub r5, r2, r1 
		b"000000_00010_00001_00110_00000_100100",		--and r6, r2, r1 
		b"000010_00000000000000000000001111",			--j L1
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"001000_01000_01000_0000000000000001",		--L2: addi r8, r8, 0x1 
		b"000000_00000_01000_00111_00000_101010",		--L1: slt r7, r0, r8
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"000100_01000_00111_0000000000001110",		--beq r7, r8, L2
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"000000_00000_00000_00000_00000_100000",		--nop
		b"101011_00000_01000_0000000000000010",		--sw r8, 0x2(r0)
		b"100011_00000_01001_0000000000000010",		--lw r9, 0x2(r0) 
		others=>(others=>'0'));
begin
	 process(addr)
	 begin  
		 inst <= memory(conv_integer(addr(5 downto 0))); 
		 --inst <= memory(conv_integer(addr)); 
	 end process; 
end Behavioral;

