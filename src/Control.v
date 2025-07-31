module Control (
	input [31:26]OP_code,
	input [5:0]Function_field,
	output reg [1:0] RegDst_2,MemtoReg_2,Branch_2,Jump_2,SL_sel,
	output reg ALUSrc,RegWrite,MemRead,MemWrite,Sign,
	output reg [2:0] ALUOP	
);
	always @ (*)
	begin
		case (OP_code)
		///////////////
			6'd0:begin //jr
				if (Function_field==6'd8)
					begin
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'bxx;
						Jump_2=2'b10;
						ALUSrc=1'bx;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'bxxx;	
						SL_sel=2'bx;
					end
				else if (Function_field==6'd20)
				begin//Lwr
						RegDst_2=2'b01;
						MemtoReg_2=2'b01;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b0;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'b000;	
						SL_sel=2'b00;				
				end
				else
					begin
						RegDst_2=2'b01;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b0;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'b111;
						SL_sel=2'bx;
					end
			end
		//////////////////
			6'd2:begin  //j
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'bxx;
						Jump_2=2'b01;
						ALUSrc=1'bx;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'bxxx;	
						SL_sel=2'bx;						
					end
		//////////////
			6'd3:begin  //jal
						RegDst_2=2'b10;
						MemtoReg_2=2'b10;
						Branch_2=2'bxx;
						Jump_2=2'b01;
						ALUSrc=1'bx;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'bxxx;	
						SL_sel=2'bx;						
					end
		//////////////
			6'd4:begin  //beq
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b01;
						Jump_2=2'b00;
						ALUSrc=1'b0;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b001;	
						SL_sel=2'bx;						
					end
		//////////////
			6'd5:begin  //bne
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b10;
						Jump_2=2'b00;
						ALUSrc=1'b0;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b001;
						SL_sel=2'bx;						
					end
		//////////////
			6'd8:begin  //addi
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;	
						SL_sel=2'bx;						
					end
		//////////////
			6'd10:begin  //slti
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b101;
						SL_sel=2'bx;						
					end
		//////////////
			6'd12:begin  //andi
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b0;
						ALUOP=3'b010;
						SL_sel=2'bx;	
					end
		//////////////
			6'd13:begin  //ori
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b0;
						ALUOP=3'b011;
						SL_sel=2'bx;						
					end
		//////////////
			6'd14:begin  //xori
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b0;
						ALUOP=3'b100;	
						SL_sel=2'bx;						
					end
		//////////////
			6'd15:begin  //Lui
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'b110;
						SL_sel=2'bx;						
					end
		//////////////
			6'd35:begin  //LW
						RegDst_2=2'b00;
						MemtoReg_2=2'b01;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;	
						SL_sel=2'b00;					
					end
		//////////////
			6'd43:begin  //SW
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b1;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b00;						
					end
		//////////////
		
		
		
		
		//////////////
			6'd33:begin  //LH
						RegDst_2=2'b00;
						MemtoReg_2=2'b01;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;	
						SL_sel=2'b01;					
					end
		//////////////
			6'd41:begin  //SH
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b1;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b01;						
					end
		//////////////
			6'd32:begin  //LB
						RegDst_2=2'b00;
						MemtoReg_2=2'b01;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;	
						SL_sel=2'b10;					
					end
		//////////////
			6'd40:begin  //SB
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b1;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b10;						
					end
		//////////////

////////////////////////////////////////////////////////
		//////////////
			6'd52:begin  //jalm
						RegDst_2=2'b10;
						MemtoReg_2=2'b10;
						Branch_2=2'bxx;
						Jump_2=2'b11;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b00;						
					end
		//////////////
		//////////////
			6'd53:begin  //jalr
						RegDst_2=2'b01;
						MemtoReg_2=2'b10;
						Branch_2=2'bxx;
						Jump_2=2'b10;
						ALUSrc=1'bx;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'bx;
						ALUOP=3'bxxx;
						SL_sel=2'bxx;						
					end
		//////////////
		//////////////
			6'd54:begin  //jm
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'bxx;
						Jump_2=2'b11;
						ALUSrc=1'b1;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b00;						
					end
		//////////////
		//////////////
			6'd51:begin  //subi
						RegDst_2=2'b00;
						MemtoReg_2=2'b00;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b001;	
						SL_sel=2'bx;						
					end
		//////////////
		//////////////
			6'd49:begin  //Lbit
						RegDst_2=2'b00;
						MemtoReg_2=2'b01;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b1;
						MemRead=1'bx;///0
						MemWrite=1'b0;
						Sign=1'b1;
						ALUOP=3'b000;	
						SL_sel=2'b11;					
					end
		//////////////
			6'd50:begin  //Sbit
						RegDst_2=2'bxx;
						MemtoReg_2=2'bxx;
						Branch_2=2'b00;
						Jump_2=2'b00;
						ALUSrc=1'b1;
						RegWrite=1'b0;
						MemRead=1'bx;///0
						MemWrite=1'b1;
						Sign=1'b1;
						ALUOP=3'b000;
						SL_sel=2'b11;						
					end
		//////////////

			default:	begin
					RegDst_2=2'bxx;
					MemtoReg_2=2'bxx;
					Branch_2=2'bxx;
					Jump_2=2'bxx;
					ALUSrc=1'bx;
					RegWrite=1'bx;
					MemRead=1'bx;///
					MemWrite=1'bx;
					Sign=1'bx;
					ALUOP=3'bxxx;	
					SL_sel=2'bx;
				end
		endcase
	end

endmodule