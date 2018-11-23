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
	wire[14:0] debug_pc;
	wire[15:0] debug_inst;
	wire[15:0] debug_outM;
	wire[15:0] debug_addressM;
	wire debug_writeM;

	// コンピュータ本体
	Computer computer(
		.clk(clk),
		.reset(0),
		.debug_pc(debug_pc),
		.debug_inst(debug_inst),
		.debug_addressM(debug_addressM),
		.debug_outM(debug_outM),
		.debug_writeM(debug_writeM)
	);

	reg[15:0] count = 0;
	always @(posedge clk) begin
		if (debug_writeM == 1'b1) begin
			count <= debug_outM;
		end
	end

	// DE0の7セグLEDへCPUからのoutMを出力する
	HexSegDec hsd0(count[3:0], hled0);
	HexSegDec hsd1(count[7:4], hled1);
	HexSegDec hsd2(count[11:8], hled2);
	HexSegDec hsd3(count[15:12], hled3);

	assign led = 0;
endmodule
