module PC (
	input clk,
	input [31:0] IN,
	output reg [31:0] OUT
);
	initial 
	OUT=0;
	always @ (posedge clk)
		OUT=IN;
endmodule