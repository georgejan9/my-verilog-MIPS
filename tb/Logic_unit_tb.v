`timescale 1ns/1ps
module Logic_unit_tb ();
	parameter n = 32;
	reg [n-1:0] A,B;
	reg [1:0] sel;
	wire [n-1:0] OUT;
Logic_unit #(.n(n)) DUT (
	.A(A),
	.B(B),
	.sel(sel),
	.OUT(OUT)
);
	initial
	begin
	A=51;
	B=486;
	sel=2'b00;
	#10;
	A=51;
	B=486;
	sel=2'b01;
	#10;
	A=51;
	B=486;
	sel=2'b10;
	#10;
	A=51;
	B=486;
	sel=2'b11;
	#10;
	A=4152;
	B=1553;
	sel=2'b00;
	#10;
	A=4152;
	B=1553;
	sel=2'b01;
	#10;
	A=4152;
	B=1553;
	sel=2'b10;
	#10;
	A=4152;
	B=1553;
	sel=2'b11;
	#10;
	end

endmodule