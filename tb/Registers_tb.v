`timescale 1ns/1ps
module Registers_tb ();
	reg [4:0]Read_register1,Read_register2;
	reg [4:0]Write_register;
	wire [31:0]Read_data1,Read_data2;
	reg [31:0] Write_data;
	reg clk=0,RegWrite;
	parameter clk_prd=100;
	always # (clk_prd/2) clk=~clk;
Registers DUT(
	.Read_register1(Read_register1),
	.Read_register2(Read_register2),
	.Write_register(Write_register),
	.Read_data1(Read_data1),
	.Read_data2(Read_data2),
	.Write_data(Write_data),
	.clk(clk),
	.RegWrite(RegWrite)
	);
initial
begin
	Write_register=5'd1;
	Read_register1=5'd1;
	Read_register2=5'd2;
	Write_data=32'hfffaff;
	RegWrite=1'b1;
	#70;
	Write_register=5'd2;
	Read_register1=5'd1;
	Read_register2=5'd2;
	Write_data=32'habcdef;
	RegWrite=1'b1;
	#100;
	Write_register=5'd3;
	Read_register1=5'd2;
	Read_register2=5'd3;
	Write_data=32'hfafafaf;
	RegWrite=1'b1;
	#100;
	Write_register=5'd4;
	Read_register1=5'd2;
	Read_register2=5'd3;
	Write_data=32'haddfa;
	RegWrite=1'b1;
	#100;
	Write_register=5'd3;
	Read_register1=5'd3;
	Read_register2=5'd4;
	Write_data=32'habda;
	RegWrite=1'b1;
	#100;
end	
endmodule