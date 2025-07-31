`timescale 1ns/1ps
module Arithmetic_unit_tb ();
	parameter n=32;
	reg [n-1:0] A,B;
	reg add_n,add_slt;
	wire Cout,overflow;
	wire [n-1:0] OUT;
Arithmetic_unit #(.n(n)) DUT (
	.A(A),
	.B(B),
	.add_n(add_n),
	.add_slt(add_slt),
	.Cout(Cout),
	.overflow(overflow),
	.OUT(OUT)
);
	initial
	begin
	A=32'd59;
	B=32'd77;
	add_n=1'b0;
	add_slt=1'b0;
	#10;
	A=32'd528;
	B=32'd456;
	add_n=1'b0;
	add_slt=1'b0;
	#10;
	A=32'd528;
	B=32'd456;
	add_n=1'b1;
	add_slt=1'b0;
	#10;
	A=32'd528;
	B=32'd456;
	add_n=1'b1;
	add_slt=1'b1;
	#10;
	A=32'd105;
	B=32'd552;
	add_n=1'b1;
	add_slt=1'b1;
	#10;
	end
endmodule