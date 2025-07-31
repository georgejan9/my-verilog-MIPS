module Logic_unit #(parameter n = 32) (
	input [n-1:0] A,B,
	input [1:0] sel,
	output reg [n-1:0] OUT
);
	always @(*)
	begin
		case (sel)
			2'b00:OUT = A & B;
			2'b01:OUT = A | B;
			2'b10:OUT = ~(A | B);
			2'b11:OUT = A ^ B;
			default:OUT = A & B;
		endcase
	end
endmodule