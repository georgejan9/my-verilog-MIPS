module Instruction_memory (
	input [31:2] ReadAddress,WriteAddress,
	input writeINS,clk,
	input [31:0] writeDataINS,
	output reg [31:0] Instruction
);
/*	parameter R_OPcode=6'd0,addi=6'd8,andi=6'd12,
	beq=6'd4,bne=6'd5,j=6'd2,jal=6'd3,lui=6'd15,
	lw=6'd35,ori=6'd13,slti=6'd10,sw=6'd43,xori=6'd14;
	parameter addf=6'd32,andf=6'd36,jrf=6'd8,norf=6'd39,
	orf=6'd37,sllf=6'd0,sltf=6'd42,sraf=6'd3,srlf=6'd2,
	subf=6'd34,xorf=6'd38;
*/	
	reg [31:0] mem [127:0];
	always @ (posedge clk)
	begin
		if (writeINS)
			mem[WriteAddress]<=writeDataINS;
		else;
	end
	always @ (*)
	Instruction<=mem[ReadAddress];
	initial
	begin
	mem[0]<=32'h8c080000;//lw $t0, 0($0)          # lw
	mem[1]<=32'h21090005;//addi $t1, $t0, 5       # addi
	mem[2]<=32'h00095080;//sll $t2, $t1, 2        # sll
	mem[3]<=32'h3c0b1000;//lui $t3, 0x1000        # lui
	mem[4]<=32'h016a6026;//xor $t4, $t3, $t2      # xor
	mem[5]<=32'h800d0004;//lb $t5, 4($0)          # lb
	mem[6]<=32'h840e0006;//lh $t6, 6($0)          # lh
	mem[7]<=32'h01ae782a;//slt $t7, $t5, $t6      # slt
	mem[8]<=32'h01aec024;//and $t8, $t5, $t6      # and
	mem[9]<=32'h29b9000a;//slti $t9, $t5, 10      # slti
	mem[10]<=32'h31b000ff;//andi $s0, $t5, 0xFF    # andi
	mem[11]<=32'h000d8883;//sra $s1, $t5, 2        # sra
	mem[12]<=32'h11ae0006;//beq $t5, $t6, label1   # beq
	mem[13]<=32'h01ae9027;//nor $s2, $t5, $t6      # nor
	mem[14]<=32'h000e98c2;//srl $s3, $t6, 3        # srl
	mem[15]<=32'h15e00005;//bne $t7, $0, label2    # bne
	mem[16]<=32'h01aea025;//or $s4, $t5, $t6       # or
	mem[17]<=32'h01cda822;//sub $s5, $t6, $t5      # sub
	mem[18]<=32'h08000017;//j label3               # j
	mem[19]<=32'h20160001;//addi $s6, $0, 1    # addi (example)
	mem[20]<=32'h08000018;//j label4            # j
	mem[21]<=32'h20160002;//addi $s6, $0, 2    # addi (example)
	mem[22]<=32'h08000018;//j label4            # j
	mem[23]<=32'h20160003;//addi $s6, $0, 3    # addi (example)
	mem[24]<=32'h35b70055;//ori $s7, $t5, 0x55     # ori
	mem[25]<=32'hac170008;//sw $s7, 8($0)          # sw
	mem[26]<=32'h0c00001e;//jal subroutine          # jal
	mem[27]<=32'ha00d000a;//sb $t5, 10($0)         # sb
	mem[28]<=32'ha40e000c;//sh $t6, 12($0)         # sh
	mem[29]<=32'h39b000ff;//xori $s0, $t5, 0xFF    # xori
	mem[30]<=32'h02118020;//add $s0, $s0, $s1  # add
	mem[31]<=32'h03e00008;//jr $ra              # jr
/*	
	mem[0]<={32'h20080000};
	mem[1]<={32'h20090005};
	mem[2]<={32'h292a0004};
	mem[3]<={32'h3c080003};


	mem[0]<={32'h8c080000};//LW $t0 0x0000 $zero
	mem[1]<={32'h8c090004};//LW $t1 0x0004 $zero
	mem[2]<={32'h01095020};//ADD $t2 $t0 $t1
	mem[3]<={32'h01285822};//SUB $t3 $t1 $t0
	mem[4]<={32'h01096024};//AND $t4 $t0 $t1
	mem[5]<={32'h01096825};//OR $t5 $t0 $t1
	mem[6]<={32'h01097026};//XOR $t6 $t0 $t1
	mem[7]<={32'h00087840};//sll $t7 $t0 $0x1
	mem[8]<={32'h0009c042};//srl $t8 $t1 $0x1
	mem[9]<={32'h0109c82a};//SLT $t9 $t0 $t1
	mem[10]<={32'h21100003};//ADDI $s0 $t0 0x0003
	mem[11]<={32'h31110003};//andi $s1 $t0 0x3
	mem[12]<={32'h35120008};//ori $s2 $t0 0x8
	mem[13]<={32'h39130009};//xori $s3 $t0 0x9
	mem[14]<={32'h3C140000};//lui $s4 0x0
	mem[15]<={32'h11090001};//beq $t0 $t1 skip
	mem[16]<={32'h15090001};//bne $t0 $t1 func
	mem[17]<={32'h0109A820};//add $s5 $t0 $t1
	mem[18]<={32'h0c000014};//jal save_result
	mem[19]<={32'h08000016};//j exit
	mem[20]<={32'hAC0A0008};//sw $t2 0x8 $zero
	mem[21]<={32'h03e00008};//jr $ra
*/	
	
	
	
	
	
	
	
	
	
/*	
	mem[0]<={lw,5'd16,5'd17,5'd18,5'd0,addf};
	mem[1]<={lw,5'd16,5'd17,5'd18,5'd0,andf};
	mem[2]<={lw,5'd16,5'd17,5'd18,5'd0,jrf};
	mem[3]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,norf};
	
	
	mem[0]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,addf};
	mem[1]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,andf};
	mem[2]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,jrf};
	mem[3]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,norf};
	mem[4]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,orf};
	mem[5]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,sllf};
	mem[6]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,sltf};
	mem[7]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,sraf};
	mem[8]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,srlf};
	mem[9]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,subf};
	mem[10]<={R_OPcode,5'd16,5'd17,5'd18,5'd0,xorf};//
	mem[11]<={addi,};
	mem[12]<={andi,};
	mem[13]<={beq,};
	mem[14]<={bne,};
	mem[15]<={j,};
	mem[16]<={jal,};
	mem[17]<={lui,};
	mem[18]<={lw,};/////
	mem[19]<={ori,};
	mem[20]<={slti,};
	mem[21]<={sw,};
	mem[22]<={xori,};
*/
	end
endmodule