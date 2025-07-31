module Shift_lui_unit #(parameter n=32) (
	input [n-1:0] A,
	input signed [n-1:0] B,
	input [10:6] Shamt,
	input [1:0] sel,
	output reg signed [n-1:0] OUT
);
	always @ (*)
	begin 
		case (sel)
		2'b00:OUT ={B[15:0],{16{1'b0}}};
		2'b01:OUT =B<<Shamt;
		2'b10:OUT =B>>Shamt;
		2'b11:OUT =B>>>Shamt;
		default:OUT ={B[15:0],{16{1'b0}}};
		endcase
	end

endmodule