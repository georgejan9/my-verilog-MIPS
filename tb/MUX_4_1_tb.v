`timescale 1ns/1ps
module MUX_4_1_tb();
	parameter N = 32;
	reg [N-1:0] A,B,C,D;
	reg [1:0]sel;
	wire [N-1:0] Z;
MUX_4_1 #(.N(N))DUT(
	.A(A),
	.B(B),
	.C(C),
	.D(D),
	.sel(sel),
	.Z(Z)
);
initial
begin
	A=32'd4526;
	B=32'd5659;
	C=32'd745;
	D=32'd2156;
	sel=2'b00;
	#10;
	sel=2'b01;
	#10;
	sel=2'b10;
	#10;
	sel=2'b11;
	#10;
	A=32'd4548;
	B=32'd1568;
	C=32'd78515;
	D=32'd1558;
	sel=2'b00;
	#10;
	sel=2'b01;
	#10;
	sel=2'b10;
	#10;
	sel=2'b11;
	#10;
end
endmodule