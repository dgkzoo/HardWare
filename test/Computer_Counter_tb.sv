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
			$display("%d", debug_outM);
		end
	end

	initial begin
		$display("start test");

		#99999999
		$display("success!");
		$stop;
	end

endmodule
