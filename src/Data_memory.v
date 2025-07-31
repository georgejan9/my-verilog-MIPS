module Data_memory (
	input clk,MemWrite,
	input [31:2] Address,
	input [31:0]Write_data,
	input [1:0] sel,byte_addr,
	output reg [31:0] Read_data
);
	reg [31:0] mem [127:0];
	always @ (posedge clk)
	begin
	if (MemWrite)
		begin
		case (sel)
		2'b00:mem [Address]=Write_data;//sw
		2'b01:
		begin
		case (byte_addr [1])
		1'b0:mem [Address][31:16]=Write_data[15:0];//sh
		1'b1:mem [Address][15:0]=Write_data[15:0];//sh
		default : ;
		endcase
		end
		2'b10:
		begin
		case (byte_addr)/////////////////////////
		2'b00:mem [Address][31:24]=Write_data[7:0];//sb
		2'b01:mem [Address][23:16]=Write_data[7:0];//sb
		2'b10:mem [Address][15:8]=Write_data[7:0];//sb
		2'b11:mem [Address][7:0]=Write_data[7:0];//sb
		endcase
		end
		2'b11://sbit
		begin
		case (byte_addr)/////////////////////////
		2'b00:mem [Address][24]=Write_data[0];//sbit
		2'b01:mem [Address][16]=Write_data[0];//sbit
		2'b10:mem [Address][8]=Write_data[0];//sbit
		2'b11:mem [Address][0]=Write_data[0];//sbit
		endcase
		end
		default :;
/*		case (sel)
		2'b00:mem [Address]<=Write_data;//sw
		2'b01:mem [Address]<={{16{Write_data[15]}},Write_data[15:0]};//sh
		2'b10:mem [Address]<={{24{Write_data[7]}},Write_data[7:0]};//sb
		2'b11:mem [Address]<={{31{Write_data[0]}},Write_data[0]};//sbit
		default :;*/ 
		endcase
	end
	else;
	end
	always @ (*)
	begin
		case (sel)
		2'b00:Read_data=mem[Address];//lw
		2'b01:
		begin
		case (byte_addr [1])
		1'b0:Read_data={{16{mem[Address][31]}},mem[Address][31:16]};//lh
		1'b1:Read_data={{16{mem[Address][15]}},mem[Address][15:0]};//lh
		default : ;
		endcase
		end
		2'b10:
		begin
		case (byte_addr)/////////////////////////
		2'b00:Read_data={{24{mem[Address][31]}},mem[Address][31:24]};//lb
		2'b01:Read_data={{24{mem[Address][23]}},mem[Address][23:16]};//lb
		2'b10:Read_data={{24{mem[Address][15]}},mem[Address][15:8]};//lb
		2'b11:Read_data={{24{mem[Address][7]}},mem[Address][7:0]};//lb
		endcase
		end
		2'b11:
		begin
		case (byte_addr)/////////////////////////
		2'b00:Read_data={{31{mem[Address][31]}},mem[Address][24]};//lbit
		2'b01:Read_data={{31{mem[Address][23]}},mem[Address][16]};//lbit
		2'b10:Read_data={{31{mem[Address][15]}},mem[Address][8]};//lbit
		2'b11:Read_data={{31{mem[Address][7]}},mem[Address][0]};//lbit
		endcase
		end
		default :; 
		endcase
	
/*		case (sel)
		2'b00:Read_data<=mem[Address];//lw
		2'b01:Read_data<={{16{mem[Address][15]}},mem[Address][15:0]};//lh
		2'b10:Read_data<={{24{mem[Address][7]}},mem[Address][7:0]};//lb
		2'b11:Read_data<={{31{mem[Address][0]}},mem[Address][0]};//lbit
		default :; 
		endcase  */
	end
	initial
	begin
	mem [0]<=32'h0af00005;
	mem [1]<=32'h0ba00007;
	mem [2]<=32'h0ca0000C;	
/*
	mem [0]<={32'h00000005};
	mem [1]<={32'h00000007};
	mem [2]<={32'h0000000C};
*/	
	end
endmodule