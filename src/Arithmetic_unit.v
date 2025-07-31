module Arithmetic_unit #(parameter n = 32)(
	input [n-1:0] A,B,
	input add_n,add_slt,
	output Cout,overflow,
	output [n-1:0] OUT
);
	wire [n-1:0] B_xored,S;
	wire LessThan;
	generate
	genvar k;
		for(k=0;k<n;k=k+1) 
		begin:Xored
			assign B_xored[k]=B[k]^add_n;
		end
	endgenerate

	RCA #(.n(n))RCA(
	.A(A),
	.B(B_xored),
	.Cin(add_n),
	.Cout(Cout),
	.overflow(overflow),
	.LessThan(LessThan),
	.S(S)
	);
/////////////////////////////////////////////
wire [n-1:0] slt = {{n-1{1'b0}},LessThan};
assign OUT=add_slt?slt:S;

endmodule