module shift_left_2_32_32 (
	input [31:0] IN,
	output [31:0] OUT
);
	assign OUT = {IN[29:0],2'b00};
endmodule