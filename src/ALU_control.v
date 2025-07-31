module ALU_control (
	input [2:0] ALUOP,
	input [5:0]	Funct,
	output reg[3:0]ALU_sel
);
	always @ (*)
	begin
		case (ALUOP)
		3'b000:ALU_sel=4'b00x0;//add
		3'b001:ALU_sel=4'b10x0;//sub
		3'b010:ALU_sel=4'b0001;//and
		3'b011:ALU_sel=4'b0101;//or
		3'b100:ALU_sel=4'b1101;//xor
		3'b101:ALU_sel=4'b11x0;//slt
		3'b110:ALU_sel=4'b0011;//lui
		3'b111://function feild
		begin
			case (Funct)
			6'd0:ALU_sel=4'b0111;//sll
			6'd2:ALU_sel=4'b1011;//srl
			6'd3:ALU_sel=4'b1111;//sra
			6'd32:ALU_sel=4'b00x0;//add
			6'd34:ALU_sel=4'b10x0;//sub
			6'd36:ALU_sel=4'b0001;//and
			6'd37:ALU_sel=4'b0101;//or
			6'd38:ALU_sel=4'b1101;//xor
			6'd39:ALU_sel=4'b1001;//nor
			6'd42:ALU_sel=4'b11x0;//slt
			default :ALU_sel=4'bxxxx;
			endcase
		end
		default :ALU_sel=4'bxxxx;
		endcase
	end
endmodule











