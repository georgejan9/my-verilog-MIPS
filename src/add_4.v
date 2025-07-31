module add_4 #(parameter n=32) (
	input [n-1:0] PC,
	output [n-1:0] PC_4
);
RCA #(.n(n)) ADDER (
	.A(PC),
	.B(32'd4),
	.Cin(1'b0),
	.Cout(),
	.overflow(),
	.LessThan(),
	.S(PC_4)
);
endmodule