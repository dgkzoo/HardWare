`timescale 1ns/1ns

// テストベンチ
// Computer
module Computer_tb();
	reg clk = 0;
	reg reset = 0;
	wire[14:0] debug_pc;
	wire[15:0] debug_inst;
	wire[15:0] debug_outM;

	parameter RATE = 10;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	Computer computer(
		.clk(clk),
		.reset(reset),
		.debug_pc(debug_pc),
		.debug_inst(debug_inst),
		.debug_outM(debug_outM)
		);

	initial begin
		$display("start test");

		// テストintruction
		// // Add.hack
		// 0: InstructionRom = 16'b0000000000000010;	// @2
		// 1: InstructionRom = 16'b1110110000010000;	// D=A
		// 2: InstructionRom = 16'b0000000000000011;	// @3
		// 3: InstructionRom = 16'b1110000010010000;	// D=D+A
		// 4: InstructionRom = 16'b0000000000000000;	// @0
		// 5: InstructionRom = 16'b1110001100001000;	// M=D
		// 6: InstructionRom = 16'b0000000000000110;	// @6
		// 7: InstructionRom = 16'b1110000000000111;	// JMP

		#(RATE)
		// @2
		if(debug_pc !=  1) $display("#1 debug_pc ng");
		if(debug_inst != 16'b0000000000000010) $display("#1 debug_inst ng");

		#(RATE)
		// D=A
		if(debug_pc != 2) $display("#2 debug_pc ng");
		if(debug_inst != 16'b1110110000010000) $display("#2 debug_inst ng");

		#(RATE)
		// @3
		if(debug_pc != 3) $display("#3 debug_pc ng");
		if(debug_inst != 16'b0000000000000011) $display("#3 debug_inst ng");

		#(RATE)
		// D=D+A
		if(debug_pc != 4) $display("#4 debug_pc ng");
		if(debug_inst != 16'b1110000010010000) $display("#4 debug_inst ng");

		#(RATE)
		// @0
		if(debug_pc != 5) $display("#5 debug_pc ng");
		if(debug_inst != 16'b0000000000000000) $display("#5 debug_inst ng");

		#(RATE)
		// M=D
		if(debug_pc != 6) $display("#6 debug_pc ng");
		if(debug_inst != 16'b1110001100001000) $display("#6 debug_inst ng");
		if(debug_outM != 5) $display("#6 debug_outM ng");

		#(RATE)
		// @6
		if(debug_pc != 7) $display("#7 debug_pc ng");
		if(debug_inst != 16'b0000000000000110) $display("#7 debug_inst ng");

		#(RATE)
		// JMP
		if(debug_pc != 8) $display("#8 debug_pc ng");
		if(debug_inst != 16'b1110000000000111) $display("#8 debug_inst ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
