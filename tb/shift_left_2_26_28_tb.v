`timescale 1ns/1ps
module shift_left_2_26_28_tb ();
	reg [25:0] IN;
	wire [27:0] OUT;
shift_left_2_26_28 DUT (
	.IN(IN),
	.OUT(OUT)
);
initial
begin
	IN=26'd1556;
	#10;
	IN=26'd1518;
	#10;
	IN=26'd7856;
	#10;
	IN=26'd5962;
	#10;
	IN=26'd4896;
	#10;
	IN=26'd7598;
	#10;
	IN=26'd4568;
	#10;
	IN=26'd7851;
	#10;
	IN=26'd8748;
	#10;
	IN=26'd4896;
	#10;
end
endmodule