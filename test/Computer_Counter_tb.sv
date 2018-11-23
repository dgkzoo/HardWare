`timescale 1ns/1ns

// テストベンチ
// Computer
// Counter
module Computer_Counter_tb();
	reg clk = 0;
	reg reset = 0;
	wire[15:0] debug_pc;
	wire[15:0] debug_inst;
	wire[15:0] debug_outM;
	wire[15:0] debug_addressM;
	wire debug_writeM;

	parameter RATE = 2;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	Computer computer(
		.clk(clk),
		.reset(reset),
		.debug_pc(debug_pc),
		.debug_inst(debug_inst),
		.debug_addressM(debug_addressM),
		.debug_outM(debug_outM),
		.debug_writeM(debug_writeM)
	);

	always @(posedge clk) begin
		if (debug_writeM == 1) begin
			if(debug_outM != 1) $display("#1 debug_outM ng");
		end
		// if (debug_pc == 15'd50001) begin
		// 	if(debug_outM != 1) $display("#1 debug_outM ng");
		// end
		// if (debug_pc == 15'd50002) begin
		// 	if(debug_outM != 1) $display("#1 debug_outM ng");
		// end
		// if (debug_pc == 15'd50003) begin
		// 	if(debug_outM != 1) $display("#1 debug_outM ng");
		// end
		// if (debug_pc == 15'd100000) begin
		// 	if(debug_outM != 2) $display("#2 debug_outM ng");
		// end
	end

	initial begin
		$display("start test");

		// テストintruction Computer.svのInstructionRomに記載する内容
		/*
		0: InstructionRom = 16'b0_000_0000_0000_0000;	// @0
		1: InstructionRom = 16'b111_0_110000_010_000;	// D=A :to D
		50000: InstructionRom = 16'b111_0_011111_111_111;	// D+1 :to AMD
		50001: InstructionRom = 16'b0_000_0000_0000_0001;	// @1
		50002: InstructionRom = 16'b111_0_101010_000_111;	// 0;JMP 
		*/

		#99999999
		$display("success!");
		$stop;
	end

endmodule
