// テストベンチ
// マルチプレクサ
module Mux_tb();
	reg clk;
	reg a;
	reg b;
	reg sel;
	wire out;

	always #1 clk = !clk;

	Mux mux(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);

	initial begin
		$display("start test");

		#100
		a <= 0; b <= 0; sel <= 0;
		#110
		if (out != 0) $display("#110 ng");

		#200
		a <= 0; b <= 0; sel <= 1;
		#210
		if (out != 0) $display("#210 ng");

		#300
		a <= 0; b <= 1; sel <= 0;
		#310
		if (out != 0) $display("#310 ng");

		#400
		a <= 0; b <= 1; sel <= 1;
		#410
		if (out != 1) $display("#410 ng");

		#500
		a <= 1; b <= 0; sel <= 0;
		#510
		if (out != 1) $display("#510 ng");

		#600
		a <= 1; b <= 0; sel <= 1;
		#610
		if (out != 0) $display("#610 ng");

		#700
		a <= 1; b <= 1; sel <= 0;
		#710
		if (out != 1) $display("#710 ng");

		#800
		a <= 1; b <= 1; sel <= 1;
		#810
		if (out != 1) $display("#810 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
