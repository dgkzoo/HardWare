`timescale 1ns/1ns

// テストベンチ
// Computer
module Computer_tb();
	reg clk = 0;
	reg reset = 0;
	wire[14:0] debug_pc;
	wire[15:0] debug_inst;
	wire[15:0] debug_inM;

	parameter RATE = 10;

	always #(RATE/2) clk = ~clk;	// Clock Generation

	Computer computer(
		.clk(clk),
		.reset(reset),
		.debug_pc(debug_pc),
		.debug_inst(debug_inst),
		.debug_inM(debug_inM)
		);

	initial begin
		$display("start test");

		#(RATE)
		if(debug_pc !=  1) $display("#1 debug_pc ng");
		if(debug_inst != 16'b0000000000000010) $display("#1 debug_inst ng");

		#(RATE)
		if(debug_pc != 2) $display("#2 debug_pc ng");
		if(debug_inst != 16'b1110110000010000) $display("#2 debug_inst ng");

		#(RATE)
		if(debug_pc != 3) $display("#3 debug_pc ng");
		if(debug_inst != 16'b0000000000000011) $display("#3 debug_inst ng");

		#(RATE)
		if(debug_pc != 4) $display("#4 debug_pc ng");
		if(debug_inst != 16'b1110000010010000) $display("#4 debug_inst ng");

		#(RATE)
		if(debug_pc != 5) $display("#5 debug_pc ng");
		if(debug_inst != 16'b0000000000000000) $display("#5 debug_inst ng");

		#(RATE)
		if(debug_pc != 6) $display("#6 debug_pc ng");
		if(debug_inst != 16'b1110001100001000) $display("#6 debug_inst ng");

		#(RATE)
		if(debug_pc != 7) $display("#7 debug_pc ng");
		if(debug_inst != 16'b0000000000000110) $display("#7 debug_inst ng");

		#(RATE)
		if(debug_pc != 8) $display("#8 debug_pc ng");
		if(debug_inst != 16'b1110000000000111) $display("#8 debug_inst ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
