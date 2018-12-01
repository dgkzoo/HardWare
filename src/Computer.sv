/**
 * # コンピュータ
 * CPUとプログラムROM、RAMを持つ
 *
 * ## author
 * dgkzoo
 */
`default_nettype none
module Computer(
	input wire clk,						// clk
	input wire reset,					// reset
	output wire[14:0] debug_pc,			// デバッグ用・PC
	output wire[15:0] debug_inst,		// デバッグ用・inst
	output wire[14:0] debug_addressM,	// デバッグ用・addressM
	output wire[15:0] debug_outM,		// デバッグ用・outM
	output wire debug_writeM			// デバッグ用・writeM
	);

	reg[15:0] inst;
	wire[15:0] outM, inM;
	wire[14:0] pc;
	wire[14:0] addressM;
	wire writeM;

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
				// Dレジスタを約25,000クロックに1回インクリメント
				// インクリメントDレジスタの値はメモリへの出力値とする
				0: InstructionRom = 16'b0_000_0000_0000_0000;			// @0
				1: InstructionRom = 16'b111_0_110000_010_000;			// D=A :to _D_
				2: InstructionRom = 16'b111_0_011111_011_000;			// D+1 :to _DM
				31250: InstructionRom = 16'b0_000_0000_0000_0010;		// @2
				31251: InstructionRom = 16'b111_0_101010_000_111;		// 0;JMP 
				default : InstructionRom = 16'b0_000_0000_0000_0000;	// NOP(@0)
			endcase
		end
	endfunction

	// for debug
	assign debug_pc = pc;
	assign debug_inst = inst;
	assign debug_addressM = addressM;
	assign debug_outM = outM;
	assign debug_writeM = writeM;
endmodule
