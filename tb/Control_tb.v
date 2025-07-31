`timescale 1ns/1ps
module Control_tb ();
	reg [31:26]OP_code;
	reg [5:0]Function_field;
	wire [1:0] RegDst_2,MemtoReg_2,Branch_2,Jump_2,SL_sel;
	wire ALUSrc,RegWrite,MemRead,MemWrite,Sign;
	wire [2:0] ALUOP;
Control DUT(
	.OP_code(OP_code),
	.Function_field(Function_field),
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
initial
begin
	OP_code=6'd0;
	Function_field=6'd8;
	#10;
	OP_code=6'd0;
	Function_field=6'd32;
	#10;
	OP_code=6'd2;
	Function_field=6'dx;
	#10;
	OP_code=6'd3;
	Function_field=6'dx;
	#10;
	OP_code=6'd4;
	Function_field=6'dx;
	#10;
	OP_code=6'd5;
	Function_field=6'dx;
	#10;
	OP_code=6'd8;
	Function_field=6'dx;
	#10;
	OP_code=6'd10;
	Function_field=6'dx;
	#10;
	OP_code=6'd12;
	Function_field=6'dx;
	#10;
	OP_code=6'd13;
	Function_field=6'dx;
	#10;
	OP_code=6'd14;
	Function_field=6'dx;
	#10;
	OP_code=6'd15;
	Function_field=6'dx;
	#10;
	OP_code=6'd35;
	Function_field=6'dx;
	#10;
	OP_code=6'd43;
	Function_field=6'dx;
	#10;
end	
endmodule