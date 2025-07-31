`timescale 1ns/1ps
module shift_left_2_32_32_tb ();
	reg [31:0] IN;
	wire [31:0] OUT;
shift_left_2_32_32 DUT (
	.IN(IN),
	.OUT(OUT)
);
initial
begin
	IN=32'd1556;
	#10;
	IN=32'd1518;
	#10;
	IN=32'd7856;
	#10;
	IN=32'd5962;
	#10;
	IN=32'd4896;
	#10;
	IN=32'd7598;
	#10;
	IN=32'd4568;
	#10;
	IN=32'd7851;
	#10;
	IN=32'd8748;
	#10;
	IN=32'd4896;
	#10;
end
endmodule