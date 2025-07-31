module concatenation_unit (
	input [27:0] IN,
	input [31:28] PC_in,
	output [31:0] JumpAddress
);
	assign JumpAddress={PC_in,IN};
endmodule