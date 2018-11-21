// Top Level
module HardWare(
	input clk,
	input [2:0] btn,
	input [9:0] sw,
	output [9:0] led,
	output [7:0] hled0,
	output [7:0] hled1,
	output [7:0] hled2,
	output [7:0] hled3
);

	Computer computer(
		.clk(clk),
		.reset(0)
	);
	
endmodule
