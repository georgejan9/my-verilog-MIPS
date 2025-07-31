module ALU #(parameter n=32)(
	input [3:0] sel,
	input [n-1:0] A,B,
	input [10:6] Shamt,
	output [n-1:0] OUT,
	output negative,Zero,Cout,overflow
);
wire [n-1:0] Arithmetic_OUT,Logic_OUT,Shift_lui_OUT,Logic_shift;
///////////////////////////////////////
Arithmetic_unit #(.n(n))Arithmetic_unit(
	.A(A),
	.B(B),
	.add_n(sel[3]),
	.add_slt(sel[2]),
	.Cout(Cout),
	.overflow(overflow),
	.OUT(Arithmetic_OUT)
);
//////////////////////////////////////
Logic_unit #(.n(n)) Logic_unit (
	.A(A),
	.B(B),
	.sel(sel[3:2]),
	.OUT(Logic_OUT)
);
//////////////////////////////////////
Shift_lui_unit #(.n(n)) Shift_lui_unit (
	.A(A),
	.B(B),
	.Shamt(Shamt),
	.sel(sel[3:2]),
	.OUT(Shift_lui_OUT)
);
	assign Logic_shift = sel [1]?Shift_lui_OUT:Logic_OUT;
	assign OUT = sel[0]?Logic_shift:Arithmetic_OUT;
	assign negative=OUT[n-1];
	assign Zero=~(|OUT);
endmodule