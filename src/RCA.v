module RCA #(parameter n=32)(
	input [n-1:0] A,B,
	input Cin,
	output Cout,overflow,LessThan,
	output [n-1:0] S
);

	wire [n:0] C;
	assign C[0]=Cin;
	assign Cout=C[n];
	assign overflow = C[n]^C[n-1];
	assign LessThan = S[n-1]^overflow;
	generate 
		genvar k;
		for (k=0;k<n;k=k+1)
		begin : FA 
			FA FA(
					.A(A[k]),
					.B(B[k]),
					.Cin(C[k]),
					.Cout(C[k+1]),
					.S(S[k])
					);
		end
	endgenerate

endmodule