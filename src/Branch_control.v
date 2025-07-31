module Branch_control (
	input [1:0]Branch,//bne beq
	input Zero,
	output OUT
);
	assign OUT = (Branch[0] & Zero)| (Branch[1] & ~Zero);
endmodule