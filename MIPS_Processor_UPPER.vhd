library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS_Processor_UPPER is
    Port ( 	clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				ALUResp : out std_logic_vector(31 downto 0));
end MIPS_Processor_UPPER;

architecture Behavioral of MIPS_Processor_UPPER is

component DivisorHZ
	port(	CLK: in std_logic;
			salida: out std_logic:='1');
end component;

component ProgCounter
	port(	D :IN std_logic_vector(31 downto 0);
			Q :OUT std_logic_vector(31 downto 0);
			CLK :IN std_logic;
			reset :IN std_logic);
end component;

component Add
	port(	A : in  STD_LOGIC_VECTOR (31 downto 0);
         B : in  STD_LOGIC_VECTOR (31 downto 0);
         Res : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component InstructionMemory
	port(	addr : in std_logic_vector (31 downto 0); 
			inst : out std_logic_vector (31 downto 0));
end component;

component ShiftLeft2
	port(	entrada : in  STD_LOGIC_VECTOR (25 downto 0);
         salida : out  STD_LOGIC_VECTOR (27 downto 0));
end component;

component ControlUnit
	port(	instruction : in  STD_LOGIC_VECTOR (5 downto 0);
         RegDst : out  STD_LOGIC;
         Branch : out  STD_LOGIC;
         Jump : out  STD_LOGIC;
         MemRead : out  STD_LOGIC;
         MemtoReg : out  STD_LOGIC;
         ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
         MemWrite : out  STD_LOGIC;
         ALUSrc : out  STD_LOGIC;
         RegWrite : out  STD_LOGIC);
end component;

component UPPER --Register File
	port(	CLK : in  STD_LOGIC;
         DecoderEnable : in  STD_LOGIC;
         WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
         WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
         ReadReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
         ReadReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
         ReadData1 : out  STD_LOGIC_VECTOR (31 downto 0);
         ReadData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Sign_Extend
	port(	A : in  STD_LOGIC_VECTOR (15 downto 0);
         B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU
	port(	A : in  STD_LOGIC_VECTOR (31 downto 0);
         B : in  STD_LOGIC_VECTOR (31 downto 0);
         Cntrl : in  STD_LOGIC_VECTOR (2 downto 0);
         Cout : out  STD_LOGIC;
         Zero : out  STD_LOGIC;
         Overflow : out  STD_LOGIC;
         Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALUControl
	port(	Instruction : in  STD_LOGIC_VECTOR (5 downto 0);
         ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
         Cntrl : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component DataMemory
	port(	address : in std_logic_vector (31 downto 0); 
			write_data : in std_logic_vector (31 downto 0); 
			read_enable : in std_logic; -- from address 
			write_enable : in std_logic; 
			read_data : out std_logic_vector (31 downto 0));
end component;

component Mux32bits
	port(	A : in  STD_LOGIC_VECTOR (31 downto 0);
         B : in  STD_LOGIC_VECTOR (31 downto 0);
         sel : in  STD_LOGIC;
         Result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux5bits
	port(	A : in  STD_LOGIC_VECTOR (4 downto 0);
         B : in  STD_LOGIC_VECTOR (4 downto 0);
         sel : in  STD_LOGIC;
         Result : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component IF_ID
	Port (  clk : in std_logic;
			  reset : in std_logic;
           InstMemOutIn : in  STD_LOGIC_VECTOR (31 downto 0);
           InstMemOutOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ID_EX
	Port (  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  RegDstIN : in  STD_LOGIC;
           BranchIN : in  STD_LOGIC;
           JumpIN : in  STD_LOGIC;
           MemReadIN : in  STD_LOGIC;
           MemtoRegIN : in  STD_LOGIC;
           ALUOpIN : in  STD_LOGIC_VECTOR (1 downto 0);
           MemWriteIN : in  STD_LOGIC;
           ALUSrcIN : in  STD_LOGIC;
           RegWriteIN : in  STD_LOGIC;
			  RegDstOUT : out  STD_LOGIC;
           BranchOUT : out  STD_LOGIC;
           JumpOUT : out  STD_LOGIC;
           MemReadOUT : out  STD_LOGIC;
           MemtoRegOUT : out  STD_LOGIC;
           ALUOpOUT : out  STD_LOGIC_VECTOR (1 downto 0);
           MemWriteOUT : out  STD_LOGIC;
           ALUSrcOUT : out  STD_LOGIC;
           RegWriteOUT : out  STD_LOGIC;
			  ReadData1IN : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2IN : in  STD_LOGIC_VECTOR (31 downto 0);
			  ReadData1OUT : out  STD_LOGIC_VECTOR (31 downto 0);
           ReadData2OUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  SignExtendOutIN : in  STD_LOGIC_VECTOR (31 downto 0);
			  SignExtendOutOUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  InstMemOut20_16IN : in STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut20_16OUT : out STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut15_11IN : in STD_LOGIC_VECTOR (4 downto 0);
			  InstMemOut15_11OUT : out STD_LOGIC_VECTOR (4 downto 0);
			  Jump_dirIN : in STD_LOGIC_VECTOR (25 downto 0);
			  Jump_dirOUT : out STD_LOGIC_VECTOR (25 downto 0));
end component;

component EX_MEM
	Port ( 	clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				JumpIN : in std_logic;
				RegWriteIN : in std_logic;
				MemtoRegIN : in std_logic;
				BranchIN : in std_logic;
				MemReadIN : in std_logic;
				MemWriteIN : in std_logic;
				SignExtendOutIN : in std_logic_vector(31 downto 0);
				ZeroIN : in std_logic;
				ALUResIN : in std_logic_vector(31 downto 0);
				ReadData2IN : in std_logic_vector(31 downto 0);
				Mux5bitsIN : in std_logic_vector(4 downto 0);
				JumpOUT : out std_logic;
				RegWriteOUT : out std_logic;
				MemtoRegOUT : out std_logic;
				BranchOUT : out std_logic;
				MemReadOUT : out std_logic;
				MemWriteOUT : out std_logic;
				SignExtendOutOUT : out std_logic_vector(31 downto 0);
				ZeroOUT : out std_logic;
				ALUResOUT : out std_logic_vector(31 downto 0);
				ReadData2OUT : out std_logic_vector(31 downto 0);
				Mux5bitsOUT : out std_logic_vector(4 downto 0);
				Jump_dirIN : in STD_LOGIC_VECTOR (25 downto 0);
			  Jump_dirOUT : out STD_LOGIC_VECTOR (25 downto 0));
end component;

component MEM_WB
	Port ( 	clk : in  STD_LOGIC;
				reset : in  STD_LOGIC;
				RegWriteIN : in std_logic;
				MemtoRegIN : in std_logic;
				ReadDataIN : in std_logic_vector(31 downto 0);
				ALUResIN : in std_logic_vector(31 downto 0);
				Mux5bitsIN : in std_logic_vector(4 downto 0);
				RegWriteOUT : out std_logic;
				MemtoRegOUT : out std_logic;
				ReadDataOUT : out std_logic_vector(31 downto 0);
				ALUResOUT : out std_logic_vector(31 downto 0);
				Mux5bitsOUT : out std_logic_vector(4 downto 0));
end component;

--signal frecDividida : std_logic;

--------------Sennales de IF-------------------------
signal Branch_dir : std_logic_vector(31 downto 0);
signal PC_plus4 : std_logic_vector(31 downto 0);
signal Branch_Cntrl : std_logic;
signal BranchOrPC : std_logic_vector(31 downto 0);
signal Jump_dir : std_logic_vector(31 downto 0);
signal Jump_MEM : std_logic;
signal PCin : std_logic_vector(31 downto 0);
signal PCout : std_logic_vector(31 downto 0);
signal IMout : std_logic_vector(31 downto 0);

--------------Sennales de ID-------------------------
signal IF_Out : std_logic_vector(31 downto 0);
signal RegDst_ID : std_logic;
signal Branch_ID : std_logic;
signal Jump_ID : std_logic;
signal MemRead_ID : std_logic;
signal MemtoReg_ID : std_logic;
signal ALUOp_ID : std_logic_vector(1 downto 0);
signal MemWrite_ID : std_logic;
signal ALUSrc_ID : std_logic;
signal RegWrite_ID : std_logic;
signal RegDst_EX : std_logic;
signal Branch_EX : std_logic;
signal Jump_EX : std_logic;
signal MemRead_EX : std_logic;
signal MemtoReg_EX : std_logic;
signal ALUOp_EX : std_logic_vector(1 downto 0);
signal MemWrite_EX : std_logic;
signal ALUSrc_EX : std_logic;
signal RegWrite_EX : std_logic;
signal RegWrite_WB : std_logic;
signal WriteReg : std_logic_vector(4 downto 0);
signal WriteData : std_logic_vector(31 downto 0);
signal ReadData1 : std_logic_vector(31 downto 0);
signal ReadData2 : std_logic_vector(31 downto 0);
signal SE_out : std_logic_vector(31 downto 0);
signal ALUin1 : std_logic_vector(31 downto 0);
signal ID_out1 : std_logic_vector(31 downto 0);
signal ALUin2 : std_logic_vector(31 downto 0);
signal ID_out2 : std_logic_vector(31 downto 0);
signal ID_out3 : std_logic_vector(4 downto 0);
signal ID_out4 : std_logic_vector(4 downto 0);

---------------Sennales de EX------------------------
signal EX_in : std_logic_vector(4 downto 0);
signal Control : std_logic_vector(2 downto 0);
signal Cout : std_logic;
signal Zero : std_logic;
signal Overflow : std_logic;
signal ALURes : std_logic_vector(31 downto 0);
signal EX_zero : std_logic;
signal EX_ALURes : std_logic_vector(31 downto 0);
signal EX_ReadData2 : std_logic_vector(31 downto 0);
signal EX_Mux5bits : std_logic_vector(4 downto 0);
--signal Jump_MEM : std_logic;
signal RegWrite_MEM : std_logic;
signal MemtoReg_MEM : std_logic;
signal Branch_MEM : std_logic;
signal MemRead_MEM : std_logic;
signal MemWrite_MEM : std_logic;

----------------Sennales de MEM-----------------------
signal ReadDataDM : std_logic_vector(31 downto 0);
signal MemtoReg_WB : std_logic;
signal Mem_ReadDataDM : std_logic_vector(31 downto 0);
signal Mem_ALURes : std_logic_vector(31 downto 0);

signal ID_Jump : std_logic_vector(25 downto 0);
signal EX_Jump : std_logic_vector(25 downto 0);

begin
ALUResp <= Mem_ReadDataDM;
--DividirFrec: DivisorHZ port map (clk, frecDividida);

----------------Comienza IF---------------------------
IF_Branch_MUX: Mux32bits port map (PC_plus4, Branch_dir, Branch_Cntrl, BranchOrPC);

Jump_dir <= "000000"&EX_Jump;

IF_JUMP_MUX: Mux32bits port map (BranchOrPC, Jump_dir, Jump_MEM, PCin);

IF_PC: ProgCounter port map (PCin, PCout, clk, reset);

IF_Add: Add port map (PCout, "00000000000000000000000000000001", PC_plus4);

IF_IM: InstructionMemory port map (PCout, IMout);

Pipe_IF_ID: IF_ID port map (clk, reset, IMout, IF_Out);

----------------Comienza ID---------------------------
ID_CU: ControlUnit port map (IF_Out(31 downto 26), RegDst_ID, Branch_ID, Jump_ID, MemRead_ID, MemtoReg_ID, ALUOp_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID);

ID_RegFile: UPPER port map (clk, RegWrite_WB, WriteReg, WriteData, IF_Out(25 downto 21), IF_Out(20 downto 16), ReadData1, ReadData2);

ID_SE: Sign_Extend port map (IF_Out(15 downto 0), SE_out);

Pipe_ID_EX: ID_EX port map (clk, reset, RegDst_ID, Branch_ID, Jump_ID, MemRead_ID, MemtoReg_ID, ALUOp_ID, MemWrite_ID, ALUSrc_ID, RegWrite_ID, 
													RegDst_EX, Branch_EX, Jump_EX, MemRead_EX, MemtoReg_EX, ALUOp_EX, MemWrite_EX, ALUSrc_EX, RegWrite_EX,
													ReadData1, ReadData2, ALUin1, ID_out1, SE_out, ID_out2, IF_Out(20 downto 16), ID_out3, IF_Out(15 downto 11), ID_out4,
													IF_Out(25 downto 0), ID_Jump);

----------------Comienza EX---------------------------
EX_ALU_MUX: Mux32bits port map (ID_out1, ID_out2, ALUSrc_EX, ALUin2);

EX_Reg_MUX: Mux5bits port map (ID_out3, ID_out4, RegDst_EX, EX_in);

EX_ALU_Cntrl: ALUControl port map (ID_out2(5 downto 0), ALUOp_EX, Control);

EX_ALU: ALU port map (ALUin1, ALUin2, Control, Cout, Zero, Overflow, ALURes);

Pipe_EX_MEM: EX_MEM port map (clk, reset, Jump_EX, RegWrite_EX, MemtoReg_EX, Branch_EX, MemRead_EX, MemWrite_EX, ID_out2, Zero, ALURes, ID_out1, EX_in,
										Jump_MEM, RegWrite_MEM, MemtoReg_MEM, Branch_MEM, MemRead_MEM, MemWrite_MEM, Branch_dir, EX_zero, EX_ALURes, EX_ReadData2, EX_Mux5bits,
										ID_Jump, EX_Jump);

-----------------Comienza MEM-------------------------
Branch_Cntrl <= Branch_MEM and EX_zero;

MEM_DM: DataMemory port map (EX_ALURes, EX_ReadData2, MemRead_MEM, MemWrite_MEM, ReadDataDM);

Pipe_MEM_WB: MEM_WB port map (clk, reset, RegWrite_MEM, MemtoReg_MEM, ReadDataDM, EX_ALURes, EX_Mux5bits, RegWrite_WB, MemtoReg_WB, Mem_ReadDataDM, Mem_ALURes, WriteReg);

-----------------Comienza WB--------------------------
WB_MUX: Mux32bits port map (Mem_ALURes, Mem_ReadDataDM, MemtoReg_WB, WriteData);

end Behavioral;