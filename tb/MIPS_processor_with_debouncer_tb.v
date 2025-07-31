`timescale 1ns/1ps
module MIPS_processor_with_debouncer_tb();
	reg i_button=0,clk_50M=0;
	parameter clk_prd=1000000000;
	always # (clk_prd/2) i_button=~i_button;
	
	parameter clk_50M_prd=20;
	always # (clk_50M_prd/2) clk_50M=~clk_50M;	
	reg rst;
	wire negative,Zero,Cout,overflow,Branch_port;
	wire [4:0] ALUOUT_port;
	wire [1:0] jump_port;
MIPS_processor_with_debouncer DUT(
	.rst(rst),
	.clk_50M(clk_50M),
	.i_button(i_button),
	.negative(negative),
	.Zero(Zero),
	.Cout(Cout),
	.overflow(overflow),
	.Branch_port(Branch_port),
	.ALUOUT_port(ALUOUT_port),
	.jump_port(jump_port)
);
initial
begin
	rst=1;
	#1000
	rst=0;
end
always @(posedge i_button) begin
    $display("Time=%0t | jump_port=%b, Branch_port=%b,ALUOUT_port=%d",
    $time, jump_port, Branch_port, ALUOUT_port);
  end
endmodule