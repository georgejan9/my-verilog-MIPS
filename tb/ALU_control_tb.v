`timescale 1ns/1ps
module ALU_control_tb ();
	reg [2:0]ALUOP;
	reg [5:0]Funct;
	wire [3:0]ALU_sel;
	
ALU_control DUT(
	.ALUOP(ALUOP),
	.Funct(Funct),
	.ALU_sel(ALU_sel)
);

initial 
begin
	ALUOP=3'b000;
	Funct=6'bx;
	#10;
	ALUOP=3'b001;
	Funct=6'bx;
	#10;
	ALUOP=3'b010;
	Funct=6'bx;
	#10;
	ALUOP=3'b011;
	Funct=6'bx;
	#10;
	ALUOP=3'b100;
	Funct=6'bx;
	#10;
	ALUOP=3'b101;
	Funct=6'bx;
	#10;
	ALUOP=3'b110;
	Funct=6'bx;
	#10;
	ALUOP=3'b111;
	Funct=6'bx;
	#10;
	ALUOP=3'b111;
	Funct=6'd0;
	#10;
	ALUOP=3'b111;
	Funct=6'd2;
	#10;
	ALUOP=3'b111;
	Funct=6'd3;
	#10;
	ALUOP=3'b111;
	Funct=6'd32;
	#10;
	ALUOP=3'b111;
	Funct=6'd34;
	#10;
	ALUOP=3'b111;
	Funct=6'd36;
	#10;
	ALUOP=3'b111;
	Funct=6'd37;
	#10;
	ALUOP=3'b111;
	Funct=6'd38;
	#10;
	ALUOP=3'b111;
	Funct=6'd39;
	#10;
	ALUOP=3'b111;
	Funct=6'd42;
	#10;
end
endmodule 