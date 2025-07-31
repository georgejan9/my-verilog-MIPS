`timescale 1ns/1ps
module Shift_lui_unit_tb();
	parameter n=32; 
	reg [n-1:0] A;
	reg signed [n-1:0] B;
	reg [10:6] Shamt;
	reg [1:0] sel;
	wire signed [n-1:0] OUT;
Shift_lui_unit #(.n(n)) DUT (
	.A(A),
	.B(B),
	.Shamt(Shamt),
	.sel(sel),
	.OUT(OUT)
);
	initial
	begin
	A=32'hfab;
	B=32'habc;
	Shamt=5'd6;
	sel=2'b00;
	#10;
	A=32'hfab;
	B=32'habc;
	Shamt=5'd6;
	sel=2'b01;
	#10;
	A=32'hfab;
	B=32'habc;
	Shamt=5'd6;
	sel=2'b10;
	#10;
	A=32'hfab;
	B=32'habc;
	Shamt=5'd6;
	sel=2'b11;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=2'b00;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=2'b01;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=2'b10;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=2'b11;
	#10;
	A=32'hffaa;
	B=32'hffffbbcc;
	Shamt=5'd6;
	sel=2'b11;
	#10;
	end
endmodule