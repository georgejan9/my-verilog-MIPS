`timescale 1ns/1ps
module MIPS_processor_tb();
	reg clk=0;
	wire negative,Zero,Cout,overflow;
	parameter clk_prd=1000000000;
	always # (clk_prd/2) clk=~clk;
	
MIPS_processor DUT (
	.clk(clk),
	.negative(negative),
	.Zero(Zero),
	.Cout(Cout),
	.overflow(overflow)
);
/*always @(posedge clk) begin
    $display("Time=%0t | Jump_2=%b, branch=%b,ALU_result=%d",
      $time, Jump_2, PCSrc, ALU_result);
  end*/
endmodule