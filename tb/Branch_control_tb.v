`timescale 1ns/1ps
module Branch_control_tb ();
	reg [1:0]Branch;//bne beq
	reg Zero;
	wire OUT;
Branch_control DUT (
	.Branch(Branch),//bne beq
	.Zero(Zero),
	.OUT(OUT)
);
initial
begin
	Branch=2'b00;
	Zero=1'b0;
	#10;
	Branch=2'b00;
	Zero=1'b1;
	#10;
	Branch=2'b01;
	Zero=1'b0;
	#10;
	Branch=2'b01;
	Zero=1'b1;
	#10;
	Branch=2'b10;
	Zero=1'b0;
	#10;
	Branch=2'b10;
	Zero=1'b1;
	#10;
end
endmodule