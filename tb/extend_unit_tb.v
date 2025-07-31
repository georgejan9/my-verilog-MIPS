`timescale 1ns/1ps
module extend_unit_tb ();
	reg [15:0] IN;
	reg Sign;
	wire [31:0] OUT;
extend_unit DUT(
	.IN(IN),
	.Sign(Sign),
	.OUT(OUT)
);
initial
begin
	Sign=1'b0;
	IN=16'd2616;
	#10;
	IN=16'hffff;
	#10;
	IN=16'd2616;
	#10;
	IN=16'd2616;
	#10;
	Sign=1'b1;
	#10;
	IN=16'hffab;
	#10;
	IN=16'hffff;
	#10;
	IN=16'habc;
	#10;
	IN=16'hbc;
	#10;
end
endmodule