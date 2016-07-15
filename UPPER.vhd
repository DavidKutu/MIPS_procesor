library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UPPER is
    Port ( CLK : in  STD_LOGIC;
           DecoderEnable : in  STD_LOGIC;
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end UPPER;

architecture Behavioral of UPPER is

component Decoder
	Port ( WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
          RegWrite : in  STD_LOGIC;
          EN : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component Memory
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
end component;

component Mux32
	Port( IN0 : in STD_LOGIC_VECTOR (31 downto 0);
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
end component;

signal DecoderData : STD_LOGIC_VECTOR (4 downto 0);
signal MemReg0 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg1 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg2 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg3 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg4 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg5 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg6 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg7 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg8 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg9 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg10 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg11 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg12 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg13 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg14 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg15 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg16 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg17 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg18 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg19 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg20 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg21 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg22 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg23 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg24 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg25 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg26 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg27 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg28 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg29 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg30 : STD_LOGIC_VECTOR (31 downto 0);
signal MemReg31 : STD_LOGIC_VECTOR (31 downto 0);

begin
parte1: Decoder port map(WriteReg, DecoderEnable, DecoderData);

parte2: Memory port map(WriteData, DecoderData, CLK, DecoderEnable, 	
								MemReg0, MemReg1, MemReg2, MemReg3, MemReg4, MemReg5, MemReg6, MemReg7, 
								MemReg8, MemReg9, MemReg10, MemReg11, MemReg12, MemReg13, MemReg14, MemReg15,
								MemReg16, MemReg17, MemReg18, MemReg19, MemReg20, MemReg21, MemReg22, MemReg23,
								MemReg24, MemReg25, MemReg26, MemReg27, MemReg28, MemReg29, MemReg30, MemReg31);
					
parte3: Mux32 port map (MemReg0, MemReg1, MemReg2, MemReg3, MemReg4, MemReg5, MemReg6, MemReg7, 
								MemReg8, MemReg9, MemReg10, MemReg11, MemReg12, MemReg13, MemReg14, MemReg15,
								MemReg16, MemReg17, MemReg18, MemReg19, MemReg20, MemReg21, MemReg22, MemReg23,
								MemReg24, MemReg25, MemReg26, MemReg27, MemReg28, MemReg29, MemReg30, MemReg31,
								ReadReg1, ReadData1);
					
parte4: Mux32 port map (MemReg0, MemReg1, MemReg2, MemReg3, MemReg4, MemReg5, MemReg6, MemReg7, 
								MemReg8, MemReg9, MemReg10, MemReg11, MemReg12, MemReg13, MemReg14, MemReg15,
								MemReg16, MemReg17, MemReg18, MemReg19, MemReg20, MemReg21, MemReg22, MemReg23,
								MemReg24, MemReg25, MemReg26, MemReg27, MemReg28, MemReg29, MemReg30, MemReg31,
								ReadReg2, ReadData2);
end Behavioral;

