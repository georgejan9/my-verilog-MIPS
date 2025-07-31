`timescale 1ns/1ps
module Instruction_memory_tb();
	reg [31:2] ReadAddress,WriteAddress;
	reg [31:0] writeDataINS;
	wire [31:0] Instruction;
	reg writeINS,clk;
	parameter clk_prd=100;
	always # (clk_prd/2)clk=~clk;
Instruction_memory DUT(
	.ReadAddress(ReadAddress),
	.Instruction(Instruction),
	.WriteAddress(WriteAddress),
	.writeINS(writeINS),
	.clk(clk),
	.writeDataINS(writeDataINS)
);
	initial
	begin
	writeINS=1'b0;
	ReadAddress=30'd0;
	#10;
	ReadAddress=30'd1;
	#10;
	ReadAddress=30'd2;
	#10;
	ReadAddress=30'd3;
	#10;
	ReadAddress=30'd4;
	#10;
	ReadAddress=30'd5;
	#10;
	ReadAddress=30'd6;
	#10;
	ReadAddress=30'd7;
	#10;
	ReadAddress=30'd8;
	#10;
	ReadAddress=30'd9;
	#10;
	ReadAddress=30'd10;
	#10;
	ReadAddress=30'd11;
	#10;
	end
endmodule
