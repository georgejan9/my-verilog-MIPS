module shift_left_2_26_28 (
	input [25:0] IN,
	output [27:0] OUT
);
	assign OUT = {IN,2'b00};
endmodule