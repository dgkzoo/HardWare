// テストベンチ
// Mux4Way16
module Mux4Way16_tb();
	reg clk = 0;
	reg[15:0] a, b, c, d;
	reg[1:0] sel;
	reg[15:0] out;

	parameter RATE = 1;

	always #1 clk = !clk;

	Mux4Way16 mux4Way16(
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.sel(sel),
		.out(out)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; c <= 16'b0000000000000000; d <= 16'b0000000000000000; sel <= 2'b00;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; c <= 16'b0000000000000000; d <= 16'b0000000000000000; sel <= 2'b01;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; c <= 16'b0000000000000000; d <= 16'b0000000000000000; sel <= 2'b10;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; c <= 16'b0000000000000000; d <= 16'b0000000000000000; sel <= 2'b11;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0001001000110100; b <= 16'b1001100001110110; c <= 16'b1010101010101010; d <= 16'b0101010101010101; sel <= 2'b00;
		#(RATE)
		if (out != 16'b0001001000110100) $display("#1 ng");

		#(RATE)
		a <= 16'b0001001000110100; b <= 16'b1001100001110110; c <= 16'b1010101010101010; d <= 16'b0101010101010101; sel <= 2'b01;
		#(RATE)
		if (out != 16'b1001100001110110) $display("#1 ng");

		#(RATE)
		a <= 16'b0001001000110100; b <= 16'b1001100001110110; c <= 16'b1010101010101010; d <= 16'b0101010101010101; sel <= 2'b10;
		#(RATE)
		if (out != 16'b1010101010101010) $display("#1 ng");

		#(RATE)
		a <= 16'b0001001000110100; b <= 16'b1001100001110110; c <= 16'b1010101010101010; d <= 16'b0101010101010101; sel <= 2'b11;
		#(RATE)
		if (out != 16'b0101010101010101) $display("#1 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
