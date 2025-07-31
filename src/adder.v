module adder #(parameter n=32) (
	input [n-1:0] A,B,
	output [n-1:0] OUT
);
RCA #(.n(n)) ADDER (
	.A(A),
	.B(B),
	.Cin(1'b0),
	.Cout(),
	.overflow(),
	.LessThan(),
	.S(OUT)
);
endmodule