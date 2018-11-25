// テストベンチ
// デマルチプレクサ
module DMux_tb();
	reg clk;
	reg in;
	reg sel;
	reg a;
	reg b;

	parameter RATE = 2;

	always #1 clk = !clk;

	DMux dmux(
		.in(in),
		.sel(sel),
		.a(a),
		.b(b)
	);

	initial begin
		$display("start test");
		clk <= 1;

		#(RATE)
		in <= 1'b0; sel <= 0;
		#(RATE)
		if (a != 1'b0 && b != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b0; sel <= 1;
		#(RATE)
		if (a != 1'b0 && b != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 0;
		#(RATE)
		if (a != 1'b1 && b != 1'b0) $display("#1 ng");

		#(RATE)
		in <= 1'b1; sel <= 1;
		#(RATE)
		if (a != 1'b0 && b != 1'b1) $display("#1 ng");

		#99999
		$display("success!");
		$stop;
	end

endmodule
