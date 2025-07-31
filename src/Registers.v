module Registers (
	input [4:0]Read_register1,Read_register2,
	input [4:0]Write_register,
	output [31:0]Read_data1,Read_data2,
	input [31:0] Write_data,
	input clk,RegWrite
	);
	reg [31:0] register [31:0];
		assign Read_data1= register [Read_register1];
		assign Read_data2= register [Read_register2];
	initial
	register [0]=0;
	always @ (posedge clk)
	begin
	if (RegWrite)
		register [Write_register]<=Write_data;
	else;
	end
endmodule