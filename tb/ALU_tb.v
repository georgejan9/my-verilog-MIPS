`timescale 1ns/1ps
module ALU_tb ();
	parameter n=32;
	reg [3:0] sel;
	reg [n-1:0] A,B;
	reg [10:6] Shamt;
	wire [n-1:0] OUT;
	wire negative,Zero,Cout,overflow;
ALU #(.n(n))DUT(
	.sel(sel),
	.A(A),
	.B(B),
	.Shamt(Shamt),
	.OUT(OUT),
	.negative(negative),
	.Zero(Zero),
	.Cout(Cout),
	.overflow(overflow)
);
initial 
begin
	A=32'd59;
	B=32'd77;
	sel=4'b00x0;
	#10;
	A=32'd528;
	B=32'd456;
	sel=4'b00x0;
	#10;
	A=32'd528;
	B=32'd456;
	sel=4'b10x0;
	#10;
	A=32'd528;
	B=32'd456;
	sel=4'b11x0;
	#10;
	A=32'd105;
	B=32'd552;
	sel=4'b11x0;
	#10;
	//
	A=4152;
	B=1553;
	sel=4'b0001;
	#10;
	A=4152;
	B=1553;
	sel=4'b0101;
	#10;
	A=4152;
	B=1553;
	sel=4'b1001;
	#10;
	A=4152;
	B=1553;
	sel=4'b1101;
	#10;
	//
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=4'b0011;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=4'b0111;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=4'b1011;
	#10;
	A=32'hffaa;
	B=32'hbbcc;
	Shamt=5'd6;
	sel=4'b1111;
	#10;
	A=32'hffaa;
	B=$signed (32'hffffbbcc);
	Shamt=5'd6;
	sel=4'b1111;
	#10;
	A=32'h80000000;
	B=32'h80000000;
	sel=4'b00x0;
	#10;
	A=32'hffffffff;
	B=32'hffffffff;
	sel=4'b10x0;
	#10;
end
endmodule