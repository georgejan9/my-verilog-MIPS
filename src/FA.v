module FA (
	input A,B,Cin,
	output Cout,S
);
	assign Cout = (A&Cin)|(B&Cin)|(A&B);
	assign S = A^B^Cin;
endmodule