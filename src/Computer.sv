/**
 * # コンピュータ
 * CPUとプログラムROM、RAMを持つ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Computer(
	input wire clk,					// clk
	input wire reset,				// reset
	output wire[14:0] debug_pc,		// デバッグ用・PC
	output wire[15:0] debug_inst,	// デバッグ用・inst
	output wire[14:0] addressM,		// メモリアドレス
	output wire[15:0] outM,			// メモリ出力値
	output wire writeM				// メモリwrite enable
	);

	reg[15:0] inst;
//	wire[15:0] outM, inM;
	wire[15:0] inM;
	wire[14:0] pc;
//	wire[14:0] addressM;
//	wire writeM;

	// プログラムカウンタが指す命令をROMから取得する
	always @(posedge clk) begin
		inst <= InstructionRom(pc);
	end

	CPU cpu(
		.clk(clk),
		.inM(inM),
		.inst(inst),
		.reset(reset),
		.outM(outM),
		.writeM(writeM),
		.addressM(addressM),
		.pc(pc));

	RAM16K ram16k(
		.clk(clk),
		.in(outM),
		.address(addressM),
		.load(writeM),
		.out(inM));

	// 命令ROM
	function [15:0] InstructionRom;
		input [15:0] addr;
		begin
			case (addr)
				/*
				// Add.hack
				// 5=2+3 を計算する
				0: InstructionRom = 16'b0000000000000010;	// @2
				1: InstructionRom = 16'b1110110000010000;	// D=A
				2: InstructionRom = 16'b0000000000000011;	// @3
				3: InstructionRom = 16'b1110000010010000;	// D=D+A
				4: InstructionRom = 16'b0000000000000000;	// @0
				5: InstructionRom = 16'b1110001100001000;	// M=D
				6: InstructionRom = 16'b0000000000000110;	// @6
				7: InstructionRom = 16'b1110000000000111;	// 0;JMP
				*/

				// カウンタ
				// Dレジスタを約31,250クロックに1回インクリメント
				// インクリメントDレジスタの値はメモリへの出力値とする
				// 0: InstructionRom = 16'b0_000_0000_0000_0000;			// @0
				// 1: InstructionRom = 16'b111_0_110000_010_000;			// D=A :to _D_
				// 2: InstructionRom = 16'b111_0_011111_011_000;			// D+1 :to _DM
				// 31250: InstructionRom = 16'b0_000_0000_0000_0010;		// @2
				// 31251: InstructionRom = 16'b111_0_101010_000_111;		// 0;JMP 
				// default : InstructionRom = 16'b0_000_0000_0000_0000;	// NOP(@0)

				// Rect
				// 0: InstructionRom = 16'b0_000_0000_0001_0000;	// @16
				// 1: InstructionRom = 16'b111_1_110000_010_000;	// D=M
				// 2: InstructionRom = 16'b0_000_0000_0001_0000;	// @counter
				// 3: InstructionRom = 16'b111_0_001100_001_000;	// M=D
				// 4: InstructionRom = 16'b0_100_0000_0000_0000;	// @SCREEN 16384
				// 5: InstructionRom = 16'b111_0_110000_011_000;	// DM=A
				// 6: InstructionRom = 16'b0_000_0000_0001_0001;	// @address
				// 7: InstructionRom = 16'b111_0_001100_001_000;	// M=D
				// 8: InstructionRom = 16'b0_000_0000_0001_0001;	// @address
				// 9: InstructionRom = 16'b111_1_110000_100_000;	// A=M
				// 10: InstructionRom = 16'b111_0_111010_001_000;	// M=-1
				// 11: InstructionRom = 16'b0_000_0000_0001_0001;	// @address
				// 12: InstructionRom = 16'b111_1_110000_010_000;	// D=M
				// 13: InstructionRom = 16'b0000001010000000;	// @640
				// 14: InstructionRom = 16'b111_0_000010_010_000;	// D=D+A
				// 15: InstructionRom = 16'b0_000_0000_0001_0001;	// @address
				// 16: InstructionRom = 16'b111_0_001100_001_000;	// M=D
				// 17: InstructionRom = 16'b0_000_0000_0001_0000;	// @counter
				// 18: InstructionRom = 16'b111_1_110010_011_000;	// MD=M-1
				// 19: InstructionRom = 16'b0_000_0000_0000_1010;	// @LOOP
				// 20: InstructionRom = 16'b111_0_001100_000_001;	// D;JGT
				// 21: InstructionRom = 16'b0_000_0000_0001_0101;	// @INFINITE_LOOP
				// 22: InstructionRom = 16'b111_0_101010_000_111;	// 0;JMP
				// default : InstructionRom = 16'b0_000_0000_0000_0000;	// NOP(@0)

				// rect 縦20
				0: InstructionRom = 16'b0000000000010100; //@20
				1: InstructionRom = 16'b1110110000010000; //D=A
				2: InstructionRom = 16'b0000000000010000; //@counter_v
				3: InstructionRom = 16'b1110001100001000; //M=D
				4: InstructionRom = 16'b0100000000000000; //@SCREEN
				5: InstructionRom = 16'b1110110000010000; //D=A
				6: InstructionRom = 16'b0000000000010001; //@address
				7: InstructionRom = 16'b1110001100001000; //M=D
				8: InstructionRom = 16'b0000000100000000; //@256
				9: InstructionRom = 16'b1110110000010000; //D=A
				10: InstructionRom = 16'b0000000000010010; //@counter_h
				11: InstructionRom = 16'b1110001100001000; //M=D
				12: InstructionRom = 16'b0000000000000111; //@7
				13: InstructionRom = 16'b1110110000010000; //D=A
				14: InstructionRom = 16'b0000000000010001; //@address
				15: InstructionRom = 16'b1111110000100000; //A=M
				16: InstructionRom = 16'b1110001100001000; //M=D
				17: InstructionRom = 16'b0000000000010001; //@address
				18: InstructionRom = 16'b1111110000010000; //D=M
				19: InstructionRom = 16'b0000000000000001; //@1
				20: InstructionRom = 16'b1110000010010000; //D=D+A
				21: InstructionRom = 16'b0000000000010001; //@address
				22: InstructionRom = 16'b1110001100001000; //M=D
				23: InstructionRom = 16'b0000000000010010; //@counter_h
				24: InstructionRom = 16'b1111110010011000; //MD=M-1
				25: InstructionRom = 16'b0000000000001100; //@LOOP_H
				26: InstructionRom = 16'b1110001100000001; //D;JGT
				27: InstructionRom = 16'b0000000000010000; //@counter_v
				28: InstructionRom = 16'b1111110010011000; //MD=M-1
				29: InstructionRom = 16'b0000000000001000; //@LOOP_V
				30: InstructionRom = 16'b1110001100000001; //D;JGT
				31: InstructionRom = 16'b0000000000011111; //@INFINITE_LOOP
				32: InstructionRom = 16'b1110101010000111; //0;JMP
				default : InstructionRom = 16'b0_000_0000_0000_0000;	// NOP(@0)

			endcase
		end
	endfunction

	// for debug
	assign debug_pc = pc;
	assign debug_inst = inst;
endmodule
