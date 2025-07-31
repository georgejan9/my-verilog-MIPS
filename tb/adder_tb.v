`timescale 1ns/1ps
module adder_tb ();
	parameter n=32;
	reg [n-1:0] A,B;
	wire [n-1:0] OUT;
adder #(.n(n)) DUT (
	.A(A),
	.B(B),
	.OUT(OUT)
);
initial
begin
	A=32'd4542;
	B=32'd5482;
	#10;
	A=32'd4253;
	B=32'd415;
	#10;
	A=32'd785;
	B=32'd5985;
	#10;
	A=32'd1023;
	B=32'd248;
	#10;
	A=32'd759;
	B=32'd7458;
	#10;
	A=32'd42566;
	B=32'd15211;
	#10;
	A=32'd425;
	B=32'd258;
	#10;
	A=32'd5698;
	B=32'd7958;
	#10;
end
endmodule