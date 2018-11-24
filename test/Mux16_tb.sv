// テストベンチ
// マルチプレクサ16
module Mux16_tb();
	reg clk = 0;
	reg[15:0] a;
	reg[15:0] b;
	reg sel;
	reg[15:0] out;

	parameter RATE = 1;

	always #1 clk = !clk;

	Mux16 mux16(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);

	initial begin
		$display("start test");
		clk <= 1;


		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; sel <= 0;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#1 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0000000000000000; sel <= 1;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#2 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0001001000110100; sel <= 0;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#3 ng");

		#(RATE)
		a <= 16'b0000000000000000; b <= 16'b0001001000110100; sel <= 1;
		#(RATE)
		if (out != 16'b0001001000110100) $display("#4 ng");

		#(RATE)
		a <= 16'b1001100001110110; b <= 16'b0000000000000000; sel <= 0;
		#(RATE)
		if (out != 16'b1001100001110110) $display("#5 ng");

		#(RATE)
		a <= 16'b1001100001110110; b <= 16'b0000000000000000; sel <= 1;
		#(RATE)
		if (out != 16'b0000000000000000) $display("#6 ng");

		#(RATE)
		a <= 16'b1010101010101010; b <= 16'b0101010101010101; sel <= 0;
		#(RATE)
		if (out != 16'b1010101010101010) $display("#7 ng");

		#(RATE)
		a <= 16'b1010101010101010; b <= 16'b0101010101010101; sel <= 1;
		#(RATE)
		if (out != 16'b0101010101010101) $display("#8 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
