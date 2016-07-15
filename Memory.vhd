library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Memory is
    Port ( WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           DecoderIn : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
			  RegWrite: in STD_LOGIC;
           Reg0 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg3 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg4 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg5 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg6 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg7 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg8 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg9 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg10 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg11 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg12 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg13 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg14 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg15 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg16 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg17 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg18 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg19 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg20 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg21 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg22 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg23 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg24 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg25 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg26 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg27 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg28 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg29 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg30 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Reg31 : out  STD_LOGIC_VECTOR (31 downto 0));
end Memory;

architecture Behavioral of Memory is

	subtype sector is std_logic_vector(31 downto 0);
		type arreglo is array(natural range <>) of sector;		--se crea la memoria y se 
			signal memoria:arreglo(0 to 31):=(others=>(others=>'0'));--llena con ceros 
begin
		Reg0<=memoria(0);
		Reg1<=memoria(1);
		Reg2<=memoria(2);
		Reg3<=memoria(3);				--estos registros se conectan a los muxes
		Reg4<=memoria(4);
		Reg5<=memoria(5);
		Reg6<=memoria(6);
		Reg7<=memoria(7);
		Reg8<=memoria(8);
		Reg9<=memoria(9);
		Reg10<=memoria(10);
		Reg11<=memoria(11);
		Reg12<=memoria(12);
		Reg13<=memoria(13);
		Reg14<=memoria(14);
		Reg15<=memoria(15);
		Reg16<=memoria(16);
		Reg17<=memoria(17);
		Reg18<=memoria(18);
		Reg19<=memoria(19);
		Reg20<=memoria(20);
		Reg21<=memoria(21);
		Reg22<=memoria(22);
		Reg23<=memoria(23);
		Reg24<=memoria(24);
		Reg25<=memoria(25);
		Reg26<=memoria(26);
		Reg27<=memoria(27);
		Reg28<=memoria(28);
		Reg29<=memoria(29);
		Reg30<=memoria(30);
		Reg31<=memoria(31);
		
	process(CLK, DecoderIn, WriteData, RegWrite)
	begin
		if rising_edge(CLK) and RegWrite='1' then		--con cada pulso de reloj, asignamos el valor introducido
			memoria(conv_integer(DecoderIn))<=WriteData;--a la memoria con la direccion del decoder
		end if;
	end process;
end Behavioral;

