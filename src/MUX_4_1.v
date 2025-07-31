module MUX_4_1 #(parameter N = 32)(
	input [N-1:0] A,B,C,D,
	input [1:0]sel,
	output reg [N-1:0] Z
);
always @ (*)
begin
	case (sel)
	2'b00:Z=A;
	2'b01:Z=B;
	2'b10:Z=C;
	2'b11:Z=D;
	default:Z=A;
	endcase
end
endmodule