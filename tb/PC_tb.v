`timescale 1ns/1ps
module PC_tb ();
	reg clk=0;
	reg [31:0] IN;
	wire [31:0] OUT;
	parameter clk_prd=100;
	always # (clk_prd/2)clk=~clk;
PC DUT(
	.clk(clk),
	.IN(IN),
	.OUT(OUT)
);
initial
begin
	IN=32'd4535;
	#70;
	IN=32'd7811;
	#100;
	IN=32'd4277;
	#100;
	IN=32'd1535;
	#100;
	IN=32'd5343;
	#100;
	IN=32'd83434;
	#100;
end
endmodule