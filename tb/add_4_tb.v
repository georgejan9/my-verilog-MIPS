`timescale 1ns/1ps
module add_4_tb ();
	parameter n=32;
	reg [n-1:0] PC;
	wire [n-1:0] PC_4;
add_4 #(.n(n)) DUT (
	.PC(PC),
	.PC_4(PC_4)
);
initial
begin
	PC=32'd4542;
	#10;
	PC=32'd4253;
	#10;
	PC=32'd785;
	#10;
	PC=32'd1023;
	#10;
	PC=32'd759;
	#10;
	PC=32'd42566;
	#10;
	PC=32'd425;
	#10;
	PC=32'd5698;
	#10;
end
endmodule