module MIPS_processor (
	input clk,
	output negative,Zero,Cout,overflow

);
wire [31:0]Instruction,Read_data1,Read_data2,PC_4,
OUT_shift_32,OUT_adder,PCSrc_OUT,Read_data;
wire [27:0]OUT_shift28;
wire [1:0] RegDst_2,MemtoReg_2,Branch_2,Jump_2,SL_sel;
wire ALUSrc,RegWrite,MemRead,MemWrite,Sign,PCSrc;
wire [2:0] ALUOP;
wire [3:0] ALU_sel;
wire [31:0] PC_IN,Readaddress_PC;
wire [4:0] Write_register;
wire [31:0] OUT_extend,ALU_B,ALU_result,
JumpAddress,Write_data_reg;

//////////////////////////////
PC PC(
	.clk(clk),
	.IN(PC_IN),
	.OUT(Readaddress_PC)
);
//////////////////////////////
Instruction_memory Instruction_memory(
	.ReadAddress(Readaddress_PC[31:2]),
	.Instruction(Instruction),
	.WriteAddress(),
	.writeINS(1'b0),
	.clk(clk),
	.writeDataINS()
);
//////////////////////////////
Control Control_unit (
	.OP_code(Instruction[31:26]),
	.Function_field(Instruction[5:0]),
	.RegDst_2(RegDst_2),
	.MemtoReg_2(MemtoReg_2),
	.Branch_2(Branch_2),
	.Jump_2(Jump_2),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.MemRead(MemRead),
	.MemWrite(MemWrite),
	.Sign(Sign),
	.ALUOP(ALUOP),
	.SL_sel(SL_sel)	
);
//////////////////////////////
MUX_4_1 #(.N(5)) MUX0(
	.A(Instruction[20:16]),
	.B(Instruction[15:11]),
	.C(5'd31),
	.D(5'dx),
	.sel(RegDst_2),
	.Z(Write_register)
);
//////////////////////////////
Registers Registers(
	.Read_register1(Instruction[25:21]),
	.Read_register2(Instruction[20:16]),
	.Write_register(Write_register),
	.Read_data1(Read_data1),
	.Read_data2(Read_data2),
	.Write_data(Write_data_reg),
	.clk(clk),
	.RegWrite(RegWrite)
	);
//////////////////////////////
extend_unit extend_unit(
	.IN(Instruction[15:0]),
	.Sign(Sign),
	.OUT(OUT_extend)
);
//////////////////////////////
assign ALU_B=ALUSrc?OUT_extend:Read_data2;
//////////////////////////////
ALU_control ALU_control(
	.ALUOP(ALUOP),
	.Funct(Instruction[5:0]),
	.ALU_sel(ALU_sel)
);
//////////////////////////////
ALU #(.n(32)) ALU (
	.sel(ALU_sel),
	.A(Read_data1),
	.B(ALU_B),
	.Shamt(Instruction[10:6]),
	.OUT(ALU_result),
	.negative(negative),
	.Zero(Zero),
	.Cout(Cout),
	.overflow(overflow)
);
//////////////////////////////
Data_memory Data_memory(
	.clk(clk),
	.MemWrite(MemWrite),
	.Address(ALU_result[31:2]),
	.Write_data(Read_data2),
	.Read_data(Read_data),
	.sel(SL_sel),
	.byte_addr(ALU_result[1:0])
);
//////////////////////////////
add_4 #(.n(32)) add_4(
	.PC(Readaddress_PC),
	.PC_4(PC_4)
);
//////////////////////////////
shift_left_2_32_32 shift_32(
	.IN(OUT_extend),
	.OUT(OUT_shift_32)
);
//////////////////////////////
adder #(.n(32)) adder (
	.A(PC_4),
	.B(OUT_shift_32),
	.OUT(OUT_adder)
);
//////////////////////////////
shift_left_2_26_28 shift_26(
	.IN(Instruction[25:0]),
	.OUT(OUT_shift28)
);
//////////////////////////////
concatenation_unit concatenation_unit(
	.IN(OUT_shift28),
	.PC_in(PC_4[31:28]),
	.JumpAddress(JumpAddress)
);
//////////////////////////////
Branch_control Branch_control(
	.Branch(Branch_2),//bne beq
	.Zero(Zero),
	.OUT(PCSrc)
);
//////////////////////////////
assign PCSrc_OUT=PCSrc?OUT_adder:PC_4;
//////////////////////////////
MUX_4_1 #(.N(32)) MUX1(
	.A(PCSrc_OUT),
	.B(JumpAddress),
	.C(Read_data1),
	.D(Read_data),
	.sel(Jump_2),
	.Z(PC_IN)
);
//////////////////////////////
MUX_4_1 #(.N(32)) MUX2(
	.A(ALU_result),
	.B(Read_data),
	.C(PC_4),
	.D(32'bx),
	.sel(MemtoReg_2),
	.Z(Write_data_reg)
);
//////////////////////////////
endmodule