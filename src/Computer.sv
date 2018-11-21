// Computer
module Computer(
	input clk,					// clk
	input reset,				// reset
	output[14:0] debug_pc,		// デバッグ用・PC
	output[15:0] debug_inst,	// デバッグ用・inst
	output[15:0] debug_outM		// デバッグ用・outM
	);

	reg[15:0] inst;
	wire[15:0] outM, inM;
	wire[14:0] pc, addressM;
	wire writeM;

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

	RAM4K ram4k(
		.clk(clk),
		.in(outM),
		.address(addressM),
		.load(writeM),
		.out(inM));

	// 命令COM
	function [15:0] InstructionRom;
		input [31:0] addr;
		begin
			case (addr)
				// Add.hack
				0: InstructionRom = 16'b0000000000000010;	// @2
				1: InstructionRom = 16'b1110110000010000;	// D=A
				2: InstructionRom = 16'b0000000000000011;	// @3
				3: InstructionRom = 16'b1110000010010000;	// D=D+A
				4: InstructionRom = 16'b0000000000000000;	// @0
				5: InstructionRom = 16'b1110001100001000;	// M=D
				6: InstructionRom = 16'b0000000000000110;	// @6
				7: InstructionRom = 16'b1110000000000111;	// JMP

				default : InstructionRom = 16'b0000000000000000;
			endcase
		end
	endfunction

	// for debug
	assign debug_pc = pc;
	assign debug_inst = inst;
	assign debug_outM = outM;

endmodule
