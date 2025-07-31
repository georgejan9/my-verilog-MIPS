module extend_unit (
	input [15:0] IN,
	input Sign,
	output reg [31:0] OUT
);
	always @ (*)
	begin
	if (Sign)
		OUT = {{16{IN[15]}},IN};
	else
		OUT = {{16{1'b0}},IN};
	end
	
endmodule