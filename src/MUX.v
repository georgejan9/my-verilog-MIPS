module MUX #(parameter N = 32)(
	input [N-1:0] A,B,
	input sel,
	output [N-1:0] Z
);
	assign Z=sel?B:A;
endmodule